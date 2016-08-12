class StaticPagesController < ApplicationController
  load_and_authorize_resource
  before_action :find_static_page
  layout "blog", only: [:index]

  def index
    if @page.nil?
      render file: "#{Rails.root}/public/404", layout: false, status: :not_found
    end
  end

  private

  def find_static_page
    @page = StaticPage.find_by_tail(params) || find_by_old_link
  end

  def find_by_old_link
    link = OldLink.find_by_tail(params)

    if link.present?
      redirect_to "/#{link.static_page.slug}", status: 301
    end
  end
end
