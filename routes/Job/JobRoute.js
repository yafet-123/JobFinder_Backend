import express from 'express'
const router = express.Router()
import {
	getAllJob,
	getIndividualjob,
	createJob,
	updateJob,
	deleteJob,
	getAllJobCategocry,
	createJobCategory,
	updateJobCategory
} from '../../controllers/Job/JobController.js'
import { admin } from "../../middleware/auth.js";
import multer from 'multer';

const upload = multer({dest:"upload"})
// initalizethe multer and the destination will be upload folder 
// upload is the middleware that we put in any place when you save this
// upload folder will be created and when we send file it store the file there and it give it random name

router.route("/").post(upload.single('file'),admin,createJob).get(getAllJob);
router.route("/:id").delete(admin,deleteJob).patch(upload.single('file'),admin,updateJob).get(getIndividualjob);
router.route("/category").post(admin,createJobCategory).get(getAllJobCategocry);
router.route("/category/:id").patch(admin,updateJobCategory)

export default router