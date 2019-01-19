class MicropostsController < ApplicationController
  
  def new
     @micropost = Micropost.new
  end

  def create
    @micropost = current_user.micropost.build(micropost_params)
    if @micropost.save
      redirect_to root_url
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
