class Species < ActiveRecord::Base
  has_many :pokemon
  belongs_to :effort_value

  scope :evs_given, -> { where.not(effort_value_id: nil) }

  scope :a_h, -> { where("name SIMILAR TO ?", "[a-h]%") }
  scope :i_r, -> { where("name SIMILAR TO ?", "[i-r]%") }
  scope :s_z, -> { where("name SIMILAR TO ?", "[s-z]%") }
end
