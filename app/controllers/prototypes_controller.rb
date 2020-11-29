class PrototypesController < ApplicationController
 before_action :set_prototype, only: [:edit, :show]
 before_action :authenticate_user!, except: [:index, :show]
 
 
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
   if @prototype.save
      redirect_to root_path
    else
      render :new
   end  
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
     prototype = Prototype.find(params[:id])
     unless current_user == prototype.user
      redirect_to root_path 
    end
   if prototype.update(prototype_params)
     redirect_to prototype_path, method: :show
    else
      render :edit
   end
  end

  def destroy
        prototype = Prototype.find(params[:id])
        unless current_user == prototype.user
          redirect_to root_path 
        end
    if prototype.destroy
      redirect_to root_path
    else
        redirect_to root_path
    end
  end



private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end

