class Quote < ApplicationRecord 
  has_many :line_item_dates, dependent: :destroy

  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # Here the HTML is delivered via WebSocket this time instead of in response to an AJAX request!  
  # Three in one callback.
  # Transforming our application into a real-time one only took two lines of code, thanks to Turbo.
  broadcasts_to -> (quote) { [quote.company, "quotes"] }, inserts_by: :prepend  
end
