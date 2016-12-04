module Admin
  class PostsController < AdminController
    before_action :authenticate

    def index
      render locals: { posts: posts }
    end

    def new
      render locals: { post: Post.new }
    end

    def create
      if post.valid?
        post.save
        flash[:success] = I18n.t('success.add_post_success')
        redirect_to admin_posts_path
      else
        flash[:error] = post.error
        render locals: { post: post }
      end
    end

    def edit
      render locals: { post: Post.find(params[:id]) }
    end

    def update
      if find_post
        find_post.assign_attributes(
          title: params[:title],
          content: params[:content],
          updater: current_user
        )
        if find_post.valid?
          find_post.save
          flash[:success] = I18n.t('success.update_post_success')
          redirect_to admin_posts_path
        else
          flash[:error] = post.error
          render locals: { post: find_post }
        end
      end
    end

    def destroy
      Post.find(params[:id]).delete
      flash[:success] = I18n.t('success.delete_post_success')
      redirect_to admin_posts_path
    end

    private

    def post
      @post ||= Post.new(
        title: params[:title],
        content: params[:content],
        updater: current_user
      )
    end

    def find_post
      @find_post ||= Post.find(params[:id])
    end

    def posts
      @blogs ||= Post.all.includes(:updater)
                     .order(created_at: :desc)
                     .page(params[:page])
    end
  end
end
