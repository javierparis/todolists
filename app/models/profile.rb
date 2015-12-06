class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: ["male","female"]
  validate :one_name_mandatory
  validate :not_male_sue

  def one_name_mandatory
    if (first_name.blank? && last_name.blank?)
      errors.add(:first_name, "First name or Last name need to be populated")
    end
  end

  def not_male_sue
    if (gender == "male" && first_name == "Sue")
      errors.add(:first_name, "Gender is male and name is Sue")
    end
  end

  def self.get_all_profiles(min_birth_year, max_birth_year)
    Profile.where("birth_year BETWEEN ? and ?", "#{min_birth_year}", "#{max_birth_year}").ordered_by_birth_year.to_a
  end

  scope :ordered_by_birth_year, -> {order birth_year: :asc}

end
