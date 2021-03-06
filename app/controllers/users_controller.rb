class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @micropost = @user.micropost

    institute = @micropost.institute
    case institute
      when  "0"
        @micropost.institute = "新疆理化技术研究所"
      when  "1"
        @micropost.institute = "计算技术研究所"
      when  "2"
        @micropost.institute = "软件研究所"
      when  "3"
        @micropost.institute = "网络中心"
      when  "4"
        @micropost.institute = "新疆天文台"
      when  "5"
        @micropost.institute = "新疆生态与地理研究所"
      when  "6"
        @micropost.institute = "西双版纳热带植物园"
      when  "7"
        @micropost.institute = "大连化学物理研究所"
      when  "8"
        @micropost.institute = "国家授时中心"
      when  "9"
        @micropost.institute = "青海盐湖研究所"
      when  "10"
        @micropost.institute = "海洋研究所"
      when  "11"
        @micropost.institute = "紫金山天文台"
      when  "12"
        @micropost.institute = "上海生命科学研究院"
    end
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      redirect_to new_micropost_path
    else
      render 'new'
    end
  end
  
  def list
   @users_five = Array.new
    if logged_in?
        users_five1 = User.all
        users_five1.each do |user|
          #if user.micropost.gender != current_user.micropost.gender && user.micropost.institute == current_user.micropost.institute 修改此处匹配条件可以按研究所匹配
          if user.micropost.gender != current_user.micropost.gender && (user.micropost.age.to_i-current_user.micropost.age.to_i).abs<6   #匹配年龄相差6岁以内的
             @users_five.push(user)
          end
        end
    else
        redirect_to login_path
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  
end
