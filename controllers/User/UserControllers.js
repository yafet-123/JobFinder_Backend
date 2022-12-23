import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import { StatusCodes } from "http-status-codes";

// get All user but does not include the password

const getAllUser = async(req,res)=>{
	const data = await prisma.User.findMany({orderBy: {user_id: 'asc'}});

	const AllData = data.map((data)=>({
			user_id:data.user_id,
			CreatedDate:data.CreatedDate,
			ModifiedDate:data.ModifiedDate,
			UserName:data.UserName
	}))
	res.json(AllData);
}


const register = async(req,res)=>{
	const {UserName , Password, email} = req.body;
	const data = await prisma.User.create({
		data:{
			UserName,
			email,
			Password:bcrypt.hashSync(Password, 8)	
		},
	});

	// take the username and password and save it , the password is bcrypt
  const token = jwt.sign(
    	{ userId: data.user_id, user: data.UserName },process.env.JWT_SECRET,
    		{expiresIn: process.env.JWT_LIFETIME,}
  );
  

  res.status(StatusCodes.CREATED).json({
    data: {
      userId: data.user_id,
    	user: data.UserName,
    },
    token,
  });
}

// get individual user

const getIndividualUser = async(req,res)=>{
	const {id } = req.params
	const data = await prisma.User.findUnique({
		where:{
			user_id:Number(id)
		},
	});
	res.json(data)
}

// update the user but only the username not the password for password only they have link
const updateUser = async(req,res)=>{
	const {id } = req.params
	const {UserName} = req.body
	const data = await prisma.User.update({
		where:{user_id:Number(id)},
		data:{
			UserName
		},
	});
	res.json(data)
}

// deleting the user
const deleteUser = async(req,res)=>{
	const {id} = req.params
	const data = await prisma.User.delete({
		where:{user_id:Number(id)},
	});
	res.json(data)
}

export {
	getAllUser,
	register,
	getIndividualUser,
	updateUser,
	deleteUser
}
