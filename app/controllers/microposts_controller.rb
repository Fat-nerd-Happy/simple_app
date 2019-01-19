class MicropostsController < ApplicationController
  
  def new
     @micropost = Micropost.new
  end

  def create
    if current_user.nil?
      redirect_to new_micropost_path
    end
    
    @micropost = Micropost.new(micropost_params)
    current_user.micropost = @micropost
    if @micropost.save
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :institute, :age, :gender, :name, :picture)
    end
end
