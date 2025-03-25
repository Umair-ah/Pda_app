semesters = [
  "Semester I",
  "Semester II",
  "Semester III",
  "Semester IV",
  "Semester V",
  "Semester VI",
  "Semester VII",
  "Semester VIII"
]

(1..8).each do |i|
  Reviewer.create!(email: "semester#{i}@pda.com", password: "pda123", sem: semesters[i - 1])
end

Admin.create!(email: "admin@pda.com", password: "admin123")
