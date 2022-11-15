# frozen_string_literal: true

namespace :users do
  desc 'import users from csv file'
  task :import, [:file_path] => [:environment] do |_task, args|
    Users::ImportService.new(args[:file_path]).execute
  end
end
