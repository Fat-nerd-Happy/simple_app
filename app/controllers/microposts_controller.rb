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

  def edit
    @micropost = Micropost.new
    
    if current_user.nil?
      redirect_to new_micropost_path
    end
    
    @micropost = current_user.micropost
    
  end
  
  def update
  
    @micropost = current_user.micropost
    if  @micropost.update_attributes(micropost_params)
      current_user.micropost = @micropost
      redirect_to current_user
      #@users_five = Micropost.where(name: '冯笑').order(created_at: :desc)
      
    else
      redirect_to root_path
    end
    
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :institute, :age, :gender, :name, :picture)
    end
end
