class UserSkillsController < ApplicationController
  before_action

  def new
    @skills = Skill.all
    @user_skill = UserSkill.new
  end

  def create
    @user_skill = UserSkill.new(skills_params)
  end

  def update
  end

  def destroy
    @user_skill.destroy

    redirect_to user_path(current_user)
  end

  private

  def find_user_skill

  end

  def skills_params
    params.require(:user_skills).permit(skill_id: [])
  end

end
