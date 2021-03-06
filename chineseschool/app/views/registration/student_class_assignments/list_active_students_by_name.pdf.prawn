# encoding: utf-8

prawn_document(filename: 'tocs_active_students.pdf') do |pdf|
  pdf.font "#{Rails.root}/lib/data/fonts/ArialUnicode.ttf"

  header = [ 'Last Name', 'First Name', '姓名', '班級', '教室', '第三堂選修課' ]

  data = [ header ]
  @active_student_class_assignments.each do |student_class_assignment|
    row = []
    row << student_class_assignment.student.english_last_name
    row << student_class_assignment.student.english_first_name
    row << student_class_assignment.student.chinese_name
    row << student_class_assignment.school_class.short_name
    row << student_class_assignment.school_class.location
    if student_class_assignment.elective_class.nil?
      row << ''
    else
      row << "#{student_class_assignment.elective_class.location}  #{student_class_assignment.elective_class.chinese_name}"
    end
    data << row
  end

  pdf.table(data, header: true) do
    row(0).style(background_color: 'cccccc')
  end

  pdf.number_pages "#{PacificTimeDisplay.display_now_in_pacific}   Total Student Count: #{@active_student_class_assignments.size}",
    at: [pdf.bounds.left, 0], align: :left, page_filter: :all
  pdf.number_pages "#{@current_school_year.name} 學年度       Page <page>/<total>",
    at: [pdf.bounds.left, 0], align: :right, page_filter: :all
end
