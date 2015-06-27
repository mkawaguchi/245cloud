class WelcomeController < ApplicationController
  def index
    #raise cookies['timecrowd'].inspect
    @dones = Workload.dones
    @musics_users = MusicsUser.limit(3).order('total desc')
    render layout: 'top'
    if current_user && current_user.playing?
      redirect_to current_user.workload
    end
    @musics_users = MusicsUser.limit(3).order('total desc')
  end

  def pitch
    render layout: 'top'
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end

