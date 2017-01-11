class StudentsController < ApplicationController

	def new
		
	end

	def create
		student = Student.find_by(username: params[:username], password: params[:password])
	    if student

	      session[:student_id] = student.id
	      flash[:success] = 'Successfully logged in!'
	      redirect_to '/home'
	    else
	      flash[:warning] = 'Invalid email or password!'
	      redirect_to '/login'
	    end
	end


	def destroy
		session[:user_id] = nil
	    flash[:success] = 'Successfully logged out!'
		redirect_to '/login'
	end
end
