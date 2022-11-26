import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config();
// dotenv that loads environment variables from a .env file into process.env 

// u can use const cors = require('cors')
// Allows restricted resources on a web page to be requested from 
// another domain outside the domain from which the first resource was served.
import http from 'http'
import bodyParser  from 'body-parser'
import express from 'express'
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
import "express-async-errors";
// this command is needed because if it is not found we will have error in the 
// code when we throw error like this thorw new Error("The error")

import morgan from 'morgan';
if (process.env.NODE_ENV !== "production") {
	app.use(morgan("dev"));
}
// if it is not in the production use morgan and morgan will console in to cmd the information is 
// request method get,post and other the url and the time take

app.use(cors({credentials:true}));
app.use(express.json())
// to use json form of data

const port = process.env.PORT || 5000

import notFoundMiddleware from "./middleware/not-found.js";
import errorHandlerMiddleware from "./middleware/error-handler.js";

import {
	user,
	category,
	job,
	auth
} from './routes/index.js'



const path = "/api/v1"

app.get("/api/v1", (req, res) => {
  res.json({ msg: "WELCOME TO Jobs SERVER 😊😂🤣❤️😍😒👌😘😁👍💕😆😍😘🥰😗😙🤩😶😐🤨😚☺️🙂🤩🤔😴😫😪🥱🤤😝😜😕🙃😝🤤🤑😲😒" });
});

app.use(path+"/user", user)
app.use(path+"/category", category)
app.use(path+"/job", job)
app.use(path+"/auth", auth)

app.use(notFoundMiddleware);
app.use(errorHandlerMiddleware);


app.listen(port,()=>{
	console.log(`Server is listening on port ${port}...`)
})


// if u deploy it in the server make sure to add the jwt secret and lifetime in the server 
// other wise it will through error to the server and to do that go to ur app then to z setting
// then u will find to add the secret key
