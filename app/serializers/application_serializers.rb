class ApplicationSerializers < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    default_url_options[:host] = 'api_wbooks'
end