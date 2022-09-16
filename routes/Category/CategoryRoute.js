import express from 'express'
const router = express.Router();
import { admin } from "../../middleware/auth.js";

import { 
	getAllCategory,
	createCategory,
	getIndividualCategory,
	updateCategory,
	deleteCategory
} from '../../controllers/Category/CategoryController.js'

router.route("/").post(admin,createCategory).get(admin,getAllCategory);
router.route("/:id").delete(admin,deleteCategory).patch(admin,updateCategory).get(admin,getIndividualCategory);

export default router
