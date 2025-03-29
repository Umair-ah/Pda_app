class Detail < ApplicationRecord
  has_one_attached :excel_file

  before_save do
    if self.excel_file.attached?
      ext = '.' + self.excel_file.blob.filename.extension
      self.excel_file.blob.update(filename: "#{Time.current.to_i}_#{self.faculty_name}_#{self.academic_year}_#{self.semester}_#{self.section}_#{self.subject_code}" + ext)
    end
  end

end
