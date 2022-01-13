class ProjectController < ApplicationController

  before_action :initialize_session
  def index 
    @session_item_count = session[:item].count
    if session['container'] == nil
        session['container'] = params[:container_type]
    end
    

    if params[:item] != nil
      session[:item] << params[:item]
    end
    
    @session_item = session[:item]
    @session_container = session['container']

  end

  def showlist
    @Total_error = params[:error]
    @session_item = session[:item]
    @session_container = session['container']
  end

  def deal_with
    @Total_error = ContainerCheck.call(session['container'],session[:item])
    # session.delete(:item)
    #   session.delete('container')
    redirect_to project_showlist_path(:error => @Total_error)
  end

  def initialize_session
    session[:item] ||= []
    session['container'] 
  end

end
