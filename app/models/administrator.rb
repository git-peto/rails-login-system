class Administrator < ApplicationRecord
  validates :name, presence: true
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  after_initialize :set_default_password, unless: :persisted?

  has_secure_password

  acts_as_taggable_on :sections
  acts_as_taggable_on :roles

  def set_default_password
    self.password = '1234567890'
  end

  def self.search_by search_string
    self.where("LOWER(name) LIKE '%#{search_string}%'").order(:name)
  end

  def section?(section)
    section_list.include? section
  end

  def roles?(role)
    role_list.include? role
  end

  def status_caption
    if self.status_id == 0 then "Tidak Aktif" else "Aktif" end
  end

end
