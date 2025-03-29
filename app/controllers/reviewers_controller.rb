class ReviewersController < ApplicationController

  def index
    if current_user.type == "Reviewer"
      @details = Detail.where(semester: current_user.sem).order(created_at: :desc).lazy
    else
      redirect_to root_path
    end
  end

  def approve
    detail = Detail.find(params[:id])
    puts "Detail asdjkhasdduhsad #{detail}"
    detail.update!(approve: true)
    detail.save
    puts "Detail updated #{detail.approve}"
    redirect_to request.referrer, notice: "Approved!!"
  end

end