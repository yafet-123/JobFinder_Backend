import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
import moment from "moment";


// to get all the jobs
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

// to get individual job 
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
	console.log(data)
	res.json(onedata)
}

// to create or post jobs
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
	// for (let j = 0; j < categoryId.length; j++) {
	// 	{ 
	// 		JobCategory: { 
	// 			user_id : Number(user_id),
	// 	      	category_id : Number(category_id[j])
		      	
	// 	    }
	// 	}
  	// }
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
			JobCategory:{
				create: [

				]
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

	res.json(Jobdata)
}

// to update the job
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

// to delete the job 
const deleteJob = async(req,res)=>{
	const {id} = req.params;
	const data = await prisma.Job.delete({
		where:{
			job_id:Number(id)
		},
	});
	res.json(data)
}

// to create the job and category together
const createJobCategory = async(req,res)=>{
  	const {user_id, categoryId, job_id} = req.body
  	console.log(req.body)
  	for (let j = 0; j < categoryId.length; j++) {
	  	const jobcategory = await prisma.JobCategory.create({
		    data:{
		      user_id : Number(user_id),
		      category_id : Number(categoryId[j]),
		      job_id : Number(job_id)
		    }
	  	})
	}
	

  res.json("done")
}

// to get the indvidual the job and category relationship
const getIndvidualJobCategocry = async(req,res)=>{
	const {id} = req.params
	const data = await prisma.JobCategory.findMany({
		where:{
			job_id: Number(id),

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
	        },
	      }
    	},

	});
	console.log(data)
	const oneData = data.map((data)=>({
		JobsType : data.Job.CompanyName,
	   category:data.Category.CategoryName
  	}))
	res.json(oneData)
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
        },
      }
    },
  });

  console.log(data)

  const AllJobdata = data.map((data)=>({
   Creater:data.User.UserName,
   companyName:data.Job.CompanyName,
   jobsType:data.Job.JobsType,
   category:data.Category.CategoryName
  }))
  const reverse1 = AllJobdata.reverse();


  res.json(data)
}

const updateJobCategory = async(req,res)=>{
  const {id} = req.params
  const {job_id, category_id} = req.body
  const jobcategory = await prisma.JobCategory.update({
    where:{
      	job_category_id:Number(id)
    },
    data:{
      category_id : Number(category_id),
    }
  })

  res.json(jobcategory)
}

export {
	getAllJob,
	getIndividualjob,
	createJob,
	updateJob,
	deleteJob,
	getAllJobCategocry,
	createJobCategory,
	updateJobCategory,
	getIndvidualJobCategocry
}
