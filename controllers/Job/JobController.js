import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
import moment from "moment";


const getAllJob = async(req,res)=>{
	const data = await prisma.Job.findMany({
		orderBy: {
			job_id:"asc"
		},
		include:{
			User:{
				select:{
					UserName:true
				}
			}
		} 
	})

	const Alldata = data.map((data)=>({
		job_id:data.job_id,
		CompanyName:data.CompanyName,
		Image:data.Image,
		JobsType:data.JobsType,
		Location:data.Location,
		CareerLevel:data.CareerLevel,
		EmploymentType:data.EmploymentType,
		Salary:data.Salary,
		JobsDescreption:data.JobsDescreption,
		JobsRequirement:data.JobsRequirement,
		DeadLine:data.DeadLine,
		Apply:data.Apply,
		user:data.User.UserName,
		CreatedDate:data.CreatedDate,
		ModifiedDate:data.ModifiedDate
	}))
	const reverse = Alldata.reverse();
	res.json(reverse)
}

const getIndividualjob = async(req,res)=>{
	const {id} = req.params
	const data = await prisma.Job.findUnique({
		where:{
			job_id: Number(id),

		},
		include:{
			User:{
				select:{
					UserName:true,
				},
			},
			Category:true
		},

	});
	const onedata = {
		job_id:data.job_id,
		CompanyName:data.CompanyName,
		Image:data.Image,
		JobsType:data.JobsType,
		Location:data.Location,
		CareerLevel:data.CareerLevel,
		EmploymentType:data.EmploymentType,
		Salary:data.Salary,
		JobsDescreption:data.JobsDescreption,
		JobsRequirement:data.JobsRequirement,
		DeadLine:data.DeadLine,
		Apply:data.Apply,
		// user:data.User.UserName,
		CategoryName:data.Category.CategoryName,
		CreatedDate:data.CreatedDate,
		ModifiedDate:data.ModifiedDate
	}
	console.log(data)
	res.json(onedata)
}

const createJob = async(req,res)=>{
	// it get the file from req it is not from res.body
	const { 
		CompanyName,
		JobsType,
		Location,
		CareerLevel,
		EmploymentType,
		Salary,
		JobsDescreption,
		JobsRequirement,
		DeadLine,
		Apply,
		user_id,
		categoryId
	} = req.body
	
	const categoryIds = categoryId.map(str => {
  		return Number(str);
	});
	
	const createNewJob = {
		CompanyName,
		JobsType,
		Location,
		CareerLevel,
		EmploymentType,
		Salary,
		JobsDescreption,
		JobsRequirement,
		DeadLine,
		Apply,
		user_id,
		categoryId
	}

	

	const Jobdata = await prisma.Job.create({
		data:{
			CompanyName,
			JobsType,
			Location,
			CareerLevel,
			EmploymentType,
			Salary,
			JobsDescreption,
			JobsRequirement,
			DeadLine,
			Apply,
			user_id:Number(user_id),
			Category:{
				update:{
					category_id:{
						in:categoryIds
					}
				}
			}
		}
	});

	// for (let j = 0; j < categoryId.length; j++) {
	// 	console.log(j)
	// 	const jobcategorydata = await prisma.Job.update({
	// 		where:{job_id:Number(Jobdata.job_id)},
	// 		data:{

	// 			Category: { 
	// 				set: 
	// 					[
	// 						{ category_id: arrOfCategoryIdNumber },
	// 					] 
	// 			},
	// 		}
	// 	})
	// }

	res.json("done")
}

const updateJob = async(req,res)=>{
	const {id} = req.params
	const { 
		CompanyName,
		JobsType,
		Location,
		CareerLevel,
		EmploymentType,
		Salary,
		JobsDescreption,
		JobsRequirement,
		DeadLine,
		Apply,
		category_id
	} = req.body
	const Jobdata = await prisma.Job.update({
		where:{job_id:Number(id)},
		data:{
			CompanyName,
			Image:req.file.path,
			JobsType,
			Location,
			CareerLevel,
			EmploymentType,
			Salary,
			JobsDescreption,
			JobsRequirement,
			DeadLine:moment(DeadLine).format(),
			Apply,
		},
	});
	
	res.json(Jobdata)
}

const deleteJob = async(req,res)=>{
	const {id} = req.params;
	const data = await prisma.Job.delete({
		where:{
			job_id:Number(id)
		},
	});
	res.json(data)
}


export {
	getAllJob,
	getIndividualjob,
	createJob,
	updateJob,
	deleteJob,
}
