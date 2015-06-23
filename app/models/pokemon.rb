class Pokemon < ActiveRecord::Base
  validates :species_id, presence: true
  validates :level, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 100}
  belongs_to :user
  belongs_to :species
  belongs_to :nature

  default_scope -> { order('id ASC') }

  def nickname
    if species != nil
      super.presence || species.name
    else
      super
    end
  end

  def species_name
    species.name
  end

  def evs=(new_evs)
    super(new_evs.transform_values(&:to_i))
  end

  def national_id
    species.national_id
  end

  def nature_name
    nature.name
  end
end
