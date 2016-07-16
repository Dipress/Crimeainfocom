module Tailable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_tail(params)
      q = [params[:tail].to_s, params[:format].to_s].select(&:present?).join('.')

      find_by_slug(q)
    end
  end
end
