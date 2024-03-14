class Book < ApplicationRecord
  has_many :book_authors
  has_many :read_records
  belongs_to :user

  def save_with_author(authors)
    ActiveRecord::Base.transaction do
      self.save!
      self.authors = authors.uniq.reject(&:blank?).map { |name| Author.find_or_initialize_by(name: name.strip) } unless authors.nil?
    end
    true
    rescue StandardError
      false
  end
end
