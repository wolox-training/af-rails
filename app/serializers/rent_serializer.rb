class RentSerializer < ActiveModel::Serializer
    attributes :user_id,:book_id, :start_date, :end_date
  end
