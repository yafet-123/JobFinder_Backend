import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { StatusCodes } from "http-status-codes";

const login = async (req, res, next) => {
	const { username, password } = req.body;

  	const user = await prisma.User.findUnique({
    	where: { 
    		UserName: username 
    	},
  	});
  	// get the username

  	if (!user) {
    	throw new Error(`No ${username} can be found`);
  	}

  	// if there is no user throw the error

  	const comparePassword = async function (candidatePassword) {
    	const isMatch = await bcrypt.compare(candidatePassword, user.Password);
    	return isMatch;
  	};
  	
  	const isPasswordCorrect = await comparePassword(password);
  	// it take the password from the user(first bcrypt it) and compare with incoming password

  	if (!isPasswordCorrect) {
    	throw new Error("Invalid Credentials");
  	}

  	// if the paswors is incorrect please through error
  	const createJWT = jwt.sign(
    	{ userId: user.user_id, user: user.UserName },
    	process.env.JWT_SECRET,
    	{
      		expiresIn: process.env.JWT_LIFETIME,
    	}
  	);
  	const token = createJWT;

  	res.status(StatusCodes.OK).json({
    	userId: user.user_id,
    	user: user.UserName,
    	token
  	});
};

const forgotPassword = async (req, res) => {
  	const { id } = req.params;
  	const { password } = req.body;

  	const data = await prisma.User.update({
    	where: { user_id: Number(id) },
    	data: {
      		Password: bcrypt.hashSync(password, 8),
    	},
  	});
  	res.json("Password Changed");
};

export { 
	login, 
	forgotPassword 
};
	