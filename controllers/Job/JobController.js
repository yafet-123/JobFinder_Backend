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
			job_id: Number(id)
		},
		include:{
			User:{
				select:{
					UserName:true
				},
			},
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
		user:data.User.UserName,
		CreatedDate:data.CreatedDate,
		ModifiedDate:data.ModifiedDate
	}
	res.json(onedata)
}

const createJob = async(req,res)=>{
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
		user_id
	} = req.body
	const Jobdata = await prisma.Job.create({
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
			user_id:Number(user_id)
		},
	});

	
	res.json(Jobdata)
}

const createJobCategory = async(req,res)=>{
	const {user_id, category_id, job_id} = req.body
	const jobcategory = await prisma.JobCategory.create({
		data:{
			user_id : Number(user_id),
			category_id : Number(category_id),
			job_id : Number(job_id)
		}
	})

	res.json(jobcategory)
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

const updateJobCategory = async(req,res)=>{
	const {id} = req.params
	const {job_id, category_id} = req.body
	const jobcategory = await prisma.JobCategory.update({
		where:{
			job_id:Number(job_id),
			category_id : Number(id)
		},
		data:{
			category_id : Number(category_id),
		}
	})

	res.json(jobcategory)
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

const getAllJobCategocry = async(req,res)=>{
	const data = await prisma.JobCategory.findMany({
		orderBy:{
			user_id:"asc",
		},
		include:{
			User:{
				select:{
					UserName:true,
				},
			},
			Category:{
				select:{
					CategoryName:true,
				},
			},
			Job:{
				select:{
					CompanyName:true,
					JobsType:true,
				},
			},
		},
	});

	const AllJobdata = data.map((data)=>({
		user:data.User.UserName,
		companyName:data.Job.CompanyName,
		jobsType:data.Job.JobsType,
		category:data.Category.CategoryName
	}))
	const reverse1 = AllJobdata.reverse();
	res.json(reverse1)
}

export {
	getAllJob,
	getIndividualjob,
	createJob,
	updateJob,
	deleteJob,
	getAllJobCategocry,
	createJobCategory,
	updateJobCategory
}