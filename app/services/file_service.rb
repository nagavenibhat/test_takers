class FileService

  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def supported_type?
    true if @file.content_type.in?(['text/csv', 'application/json'])
  end

  def data_array
    if @file.content_type == 'text/csv'
      format_csv_data
    elsif @file.content_type == 'application/json'
      format_json_data
    else
      Rails.logger.info "data format is not implemented for file type: #{@file.content_type}"
      []
    end
  end

  def format_csv_data
    csv = CSV.new(@file.read, :headers => true, :header_converters => :symbol)
    csv.to_a.map {|row| row.to_hash }
  end

  def format_json_data
    JSON.parse(@file.read)
  end
end