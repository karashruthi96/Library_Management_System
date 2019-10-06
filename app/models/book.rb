class Book < ApplicationRecord
  belongs_to :Library

  def self.search_title(search)
    where("b_title LIKE ?", "%#{search}%")
  end

  def self.search_author(search)
    where("b_author LIKE ?", "%#{search}%")
  end

  def self.search_sub(search)
    where("b_subject LIKE ?", "%#{search}%")
  end

  def self.search_pub(search)
    where("b_pub LIKE ?", "%#{search}%")
  end


