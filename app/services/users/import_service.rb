# frozen_string_literal: true

require 'csv'

module Users
  class ImportService
    def initialize(csv_file_path)
      @csv_file_path = csv_file_path
    end

    def execute
      CSV.foreach(csv_file_path, headers: true) do |row|
        create_record(row)
      end
    end

    private

    attr_reader :csv_file_path

    def create_record(row)
      user = User.new(row)
      if user.save
        puts "Successfully created user with id #{user.id}"
      else
        puts "Failed to create user with data #{row.to_h} with errors #{user.errors.full_messages.to_sentence}"
      end
    end
  end
end
