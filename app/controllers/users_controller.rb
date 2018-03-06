class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @next_races = @user.next_races
    @old_races = @user.old_races
  end



end
