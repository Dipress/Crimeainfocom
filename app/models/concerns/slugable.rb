module Slugable
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true

    def to_param
      "#{id}-#{slug}".parameterize
    end

  end 
end