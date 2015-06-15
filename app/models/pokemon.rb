class Pokemon < ActiveRecord::Base
  belongs_to :user

  def nickname
    super.presence || species
  end

  def evs=(new_evs)
    super(new_evs.transform_values(&:to_i))
  end
end
