class PlaceOrder
  include Interactor::Organizer
  organize RentCreate, RentMailForCreation
end
