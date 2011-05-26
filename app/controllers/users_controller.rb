class UsersController < ApplicationController
#faz a ação edit e update editar apenas o dados do usuario logado (ele nao consegue mais editar qualquer usuario pela id)
	before_filter :authenticate, :only => [:edit, :update]

	def new
		@user = User.new
	end


  def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to articles_path, :notice => 'User successfully added'
		else
			render :action => 'new'
		end
  end

	def edit
		@user = current_user
	end

		def update
			@user = current_user
		if @user.update_attributes(params[:user])
			redirect_to articles_path, :notice => 'Updated user information successfully.'
		else
			render :action => 'edit'
		end
		end
	end