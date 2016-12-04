module Admin
  class RootController < AdminController
    before_action :authenticate

    def index
      redirect_to admin_posts_path
    end
  end
end
