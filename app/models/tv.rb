class Tv < ApplicationRecord
  has_many :transactions
<<<<<<< HEAD

  include PgSearch::Model
  pg_search_scope :search_by_name_and_year,
    against: [ :name, :year],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
=======
>>>>>>> c836fa98ec667bcb2cb8d22f915f95e0f793d357

  include PgSearch::Model
  pg_search_scope :search_by_name_and_year,
  against: [ :name, :year ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
