class Pokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :species

  def nickname
    if species != nil
      super.presence || species.name
    end
  end

  def evs=(new_evs)
    super(new_evs.transform_values(&:to_i))
  end
end
