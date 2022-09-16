import express from 'express'
const router = express.Router();

import { 
	getAllUser, 
	register, 
	getIndividualUser,
	updateUser,
	deleteUser,
} from '../../controllers/User/UserControllers.js'
import { admin } from "../../middleware/auth.js";

router.route("/").post(admin,register).get(admin,getAllUser);
router.route("/:id").delete(admin,deleteUser).patch(admin,updateUser).get(admin,getIndividualUser);

export default router;