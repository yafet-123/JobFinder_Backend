import jwt from "jsonwebtoken";

const admin = async (req, res, next) => {
  // check header
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith("Bearer")) {
    throw Error("Authentication invalid");
  }
  const token = authHeader.split(" ")[1];
  return next()
};


export {admin};