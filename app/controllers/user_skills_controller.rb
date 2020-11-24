class UserSkillsController < ApplicationController

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
    # @user_skill.destroy

    # redirect_to current_user
  end

  private

  def find_user_skill

  end

  def skills_params
    params.require(:user).permit(skill_ids: [])
  end

end
