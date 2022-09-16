import express from 'express'
const router = express.Router();

import { 
	forgotPassword, 
	login
} from '../../controllers/User/AuthControllers.js'
import { admin } from "../../middleware/auth.js";

router.route("/login").post(login);
router.route("/forgotPassword/:id").post(admin,forgotPassword);

export default router;