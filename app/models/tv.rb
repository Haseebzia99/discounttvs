class Tv < ApplicationRecord
  has_many :transactions

  include PgSearch::Model
  pg_search_scope :search_by_name_and_year,
    against: [ :name, :year],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

