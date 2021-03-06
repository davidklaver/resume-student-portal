class StudentsController < ApplicationController

	def show
		@student = Unirest.get("http://localhost:3001/api/v1/students/#{current_user.id}").body
		p @student
		render 'show.html.erb'
	end

	def new
		
	end

	def create
		student = Student.find_by(username: params[:username], password: params[:password])
	    if student

	      session[:student_id] = student.id
	      flash[:success] = 'Successfully logged in!'
	      redirect_to "/students/#{current_user.id}"
	    else
	      flash[:warning] = 'Invalid email or password!'
	      redirect_to '/login'
	    end
	end

	def edit
		@student = Unirest.get("http://localhost:3001/api/v1/students/#{current_user.id}").body
		render 'edit.html.erb'
	end

	def update
        Unirest.patch(
            "http://localhost:3001/api/v1/students/#{current_user.id}",
            headers:{ "Accept" => "application/json" },
     			parameters:{
	          first_name: params[:first_name],
	          last_name: params[:last_name],
	          email: params[:email],
	          linkedin_url: params[:linkedin_url],
	          twitter_handle: params[:twitter_handle],
	          personal_website_url: params[:personal_website_url],
	          online_resume_url: params[:online_resume_url],
	          github_url: params[:github_url],
	          photo: params[:photo],
	          phone_number: params[:phone_number],
	          bio: params[:bio]
         }
       )

        Unirest.patch(
            "http://localhost:3001/api/v1/capstones/#{current_user.id}",
            headers:{ "Accept" => "application/json" },
     parameters:{
         name: params[:capstones_name],
         description: params[:description],
         url: params[:url],
         screenshot: params[:screenshot] 
     
         }
       )
        Unirest.patch(
            "http://localhost:3001/api/v1/education/#{current_user.id}",
            headers:{ "Accept" => "application/json" },
     parameters:{
         start_date: params[:education_start_date],
         end_date: params[:education_end_date],
         degree: params[:degree],
         university_name: params[:university_name],
         details: params[:education_details]
  
     
         }
       )
        Unirest.patch(
            "http://localhost:3001/api/v1/experiences/#{current_user.id}",
            headers:{ "Accept" => "application/json" },
     parameters:{
         start_date: params[:experiences_start_date],
         end_date: params[:experiences_end_date],
         job_title: params[:job_title],
         company_name: params[:company_name],
         details: params[:experience_details]
  
         }
       )
        Unirest.patch(
            "http://localhost:3001/api/v1/skills/#{current_user.id}",
            headers:{ "Accept" => "application/json" },
     parameters:{
         skill: params[:skill],
  
         }
       )
        redirect_to "/students/#{current_user.id}"
    end

	def destroy
		session[:user_id] = nil
	    flash[:success] = 'Successfully logged out!'
		redirect_to '/login'
	end
end
