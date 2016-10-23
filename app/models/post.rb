require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence:true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, :inclusion => { :in => %w(Fiction Non-Fiction)}
  validate :clickbait?


  def clickbait?
    if self.title != nil
    output = self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top")|| self.title.include?("Guess")
  end
  errors.add(:title, "is not clickbait") if output == false
  end
end
