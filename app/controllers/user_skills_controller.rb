class UserSkillsController < ApplicationController
  before_action :find_user_skill, only: :destroy
  
  def new
    @skills = Skill.all
  end

  def create
    if current_user.update(skills_params)
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @user_skill.destroy
    redirect_to current_user
  end

  private

  def find_user_skill
    @user_skill = UserSkill.find(params[:id])
  end

  def skills_params
    params.require(:user).permit(skill_ids: [])
  end
end
