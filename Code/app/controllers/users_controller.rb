class UsersController < ApplicationController
	def show
  		@user = User.find(params[:id])
  		@problemSolved= Submission.where('user_id=? and status="1"',params[:id] )
  		@problemSubmitted=Submission.where('user_id=?', params[:id])
  		@submission_status ={ "1"=>"Accepted","4"=>"Compile Err","3" => "RunTime error","2"=>"Wrong Answer","5" =>"TLE"}
	end
end
