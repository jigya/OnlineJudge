require 'fileutils' 

class Submission < ActiveRecord::Base
  after_save :save_file
  after_update :save_file
  belongs_to :user
  belongs_to :problem
  belongs_to :contest

  validates :languageUsed, presence: true, inclusion: {in: [".cpp", ".java", ".py", ".c"]}
  validates :submissionFile, presence: true
  validate :contest_has_ended

  protected
    def save_file
      directory=Rails.root.join("public","system","submissions")
      path=File.join(directory, Problem.find_by(id: self.problem_id).title ,self.id.to_s + self.languageUsed )
      dirname = File.dirname(path) 
      unless File.directory?(dirname) 
        FileUtils.mkdir_p(dirname) 
      end
      File.open(path, 'wb') do |file|
          file.write(self.submissionFile)
      end
      update_column(:submissionFile, path)
    end

    def contest_has_ended
      if(Contest.find_by(id: self.contest_id).endDateTime<DateTime.now)
        errors.add(:contest_id,"Contest has ended. Please choose a current contest or practice")
      end
    end
end
