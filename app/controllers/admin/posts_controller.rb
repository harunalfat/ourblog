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

    end

    def show
    end

    private

    def post
      @post ||= Post.new(
        title: params[:title],
        content: params[:content],
        updater: current_user
      )
    end

    def posts
      @blogs ||= Post.all.includes(:updater)
                     .order(created_at: :desc)
                     .page(params[:page])
    end
  end
end
