class Quote < ApplicationRecord 
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  
  # Here the HTML is delivered via WebSocket this time instead of in response to an AJAX request!  
  # Three in one callback.
  # Transforming our application into a real-time one only took two lines of code, thanks to Turbo Rails.
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend  
end
