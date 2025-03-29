require 'caxlsx'
class AdminsController < ApplicationController

  def index
    @details = Detail.where(approve: true)
  end

  def export
    d = Detail.find(params[:id])

    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(name: "Details") do |sheet|
      # Header row
      sheet.add_row ["Faculty Name", "Semester", "Section", "Academic Year", "Subject Code", "Target", "Threshold",
                     "CO1", "CO2", "CO3", "CO4", "CO5", "SEE CO1-CO5",
                     "PO1", "PO2", "PO3", "PO4", "PO5", "PO6", "PO7", "PO8", "PO9", "PO10", "PO11", "PO12",
                     "PSO1", "PSO2", "PSO3", "Approved"]

      # Data rows
     
      sheet.add_row [d.faculty_name, d.semester, d.section, d.academic_year, d.subject_code, d.target, d.threshold,
                      d.co1, d.co2, d.co3, d.co4, d.co5, d.see_co1_co5,
                      d.po1, d.po2, d.po3, d.po4, d.po5, d.po6, d.po7, d.po8, d.po9, d.po10, d.po11, d.po12,
                      d.pso1, d.pso2, d.pso3, d.approve ? "Yes" : "No"]
     
    end

    # Generate unique filename with timestamp
    filename = Rails.root.join("public", "exports", "details_#{Time.now.strftime('%Y%m%d_%H%M%S')}.xlsx")

    # Create directory if not exists
    FileUtils.mkdir_p(File.dirname(filename))

    # Save the file
    p.serialize(filename.to_s)

    # Provide file download link
    #redirect_to "/exports/#{filename.basename}", notice: "Excel file generated successfully!"
    send_file filename, type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", disposition: "attachment"
  end

  def export_all
    details = Detail.all
  
    p = Axlsx::Package.new
    wb = p.workbook
  
    wb.add_worksheet(name: "Details") do |sheet|
      # Header row
      sheet.add_row ["Faculty Name", "Semester", "Section", "Academic Year", "Subject Code", "Target", "Threshold",
                     "CO1", "CO2", "CO3", "CO4", "CO5", "SEE CO1-CO5",
                     "PO1", "PO2", "PO3", "PO4", "PO5", "PO6", "PO7", "PO8", "PO9", "PO10", "PO11", "PO12",
                     "PSO1", "PSO2", "PSO3", "Approved"]
  
      # Data rows for all details
      details.each do |d|
        sheet.add_row [d.faculty_name, d.semester, d.section, d.academic_year, d.subject_code, d.target, d.threshold,
                       d.co1, d.co2, d.co3, d.co4, d.co5, d.see_co1_co5,
                       d.po1, d.po2, d.po3, d.po4, d.po5, d.po6, d.po7, d.po8, d.po9, d.po10, d.po11, d.po12,
                       d.pso1, d.pso2, d.pso3, d.approve ? "Yes" : "No"]
      end
    end
  
    # Define filename
    filename = Rails.root.join("public", "exports", "all_details.xlsx")
  
    # Ensure directory exists
    FileUtils.mkdir_p(File.dirname(filename))
  
    # Save the file
    p.serialize(filename.to_s)
  
    # Send the file to the user for download
    send_file filename, type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", disposition: "attachment"
  end

end