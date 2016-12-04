class PostsController < ApplicationController
  def index
    render locals: { posts: posts }
  end

  def show
    render locals: { post: Post.find(params[:id]) }
  end

  private

  def posts
    @blogs ||= Post.all.includes(:updater)
                   .order(created_at: :desc)
                   .page(params[:page])
  end
end
