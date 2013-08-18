class PostsController < ApplicationController

	http_basic_authenticate_with name: "user", password: "secret",
		except: [:index, :show]

	# new action
	def new
		@post = Post.new
	end
	
	# use the Post model to save the data in the database
	def create
		# initializes the Rails model with strong_parameters
		@post = Post.new(params[:post].permit(:title, :text, :author))
		# saves the model in the database
		if @post.save
			# redirect the user to the show action
			redirect_to @post
		else
			# show the new post form to user
			render 'new'
		end
	end
	
	# show action
	def show
		@post = Post.find(params[:id])
	end
	
	# index action
	def index
		@posts = Post.all
	end	
	
	def edit
		@post = Post.find(params[:id])
	end
	
	# edit action
	def update
		@post = Post.find(params[:id])
		
		if @post.update(params[:post].permit(:title, :text, :author))
			redirect_to @post
		else
			render 'edit'
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end
	
	# private here prevents an attacker from setting the model's 
	# attributes by manipulating the hash passed to the model
	private
		def post_params
			params.require(:post).permit(:title, :text, :author)
		end
end
