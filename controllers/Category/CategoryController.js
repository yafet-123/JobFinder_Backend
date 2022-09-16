import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const getAllCategory = async(req,res)=>{
	const data = await prisma.Category.findMany({orderBy : {category_id:'asc'}})
	res.json(data)
}

const createCategory = async(req,res)=>{
	const {CategoryName , user_id} = req.body;
	const data = await prisma.Category.create({
		data:{
			CategoryName,
			user_id
		},
	});
	res.json(data)
}

const getIndividualCategory = async(req,res)=>{
	const {id} = req.params;
	const data = await prisma.Category.findUnique({
		where:{
			category_id : Number(id)
		},
	});
	res.json(data)
}

const updateCategory = async(req,res)=>{
	const {id} = req.params
	const {CategoryName} = req.body

	const data = await prisma.Category.update({
		where:{category_id:Number(id)},
		data:{
			CategoryName
		},
	});
	res.json(data)
}

const deleteCategory = async(req,res)=>{
	const {id} = req.params
	const data = await prisma.Category.delete({
		where:{category_id:Number(id)},
	});
	res.json(data)
}

export{
	getAllCategory,
	createCategory,
	getIndividualCategory,
	updateCategory,
	deleteCategory	
}