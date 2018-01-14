class Problem < ActiveRecord::Base
  has_many :submissions
  has_many :problem_in_contests
  belongs_to :user
  #do_not_validate_attachment_file_type :solution_file
  #do_not_validate_attachment_file_type :test_file
  validates :title, :timeLimit, :sourceLimit, :problem_statement, presence: true
  has_attached_file :solution_file,
  :url => "/system/:attachment/:id/:basename.:extension",
  :path => ":rails_root/public/system/:attachment/:id/:id.:extension"
  validates_attachment :solution_file, :presence => true, :content_type => {:content_type => "text/plain", :message => "Please upload a text file"}, :size => {:less_than => 50000.bytes, :message=>"File size should be lesser than 50000 bytes"}
  has_attached_file :test_file,
  :url => "/system/:attachment/:id/:basename.:extension",
  :path => ":rails_root/public/system/:attachment/:id/:id.:extension"
  validates_attachment :test_file, :presence => true, :content_type => {:content_type => "text/plain", :message => "Please upload a text file"}, :size => {:less_than => 50000.bytes, :message=>"File size should be lesser than 50000 bytes"}
end

