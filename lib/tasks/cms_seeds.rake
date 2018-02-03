namespace :comfy do
  namespace :cms_seeds do
    desc "Import CMS Seed data into database (from: folder name, to: site identifier)"

    task :import, %i[from to] => [:environment] do |_t, args|
      from  = args[:from]
      to    = args[:to] || from

      puts "Importing CMS Seed data from Folder [#{from}] to Site [#{to}] ..."

      # changing so that logger is going straight to screen
      logger = ComfortableMexicanSofa.logger
      ComfortableMexicanSofa.logger = Logger.new(STDOUT)

      ComfortableMexicanSofa::Seeds::Importer.new(from, to).import!

      ComfortableMexicanSofa.logger = logger
    end

    desc "Export database data into CMS Seed files (from: site identifier, to: folder name)"
    task :export, %i[from to] => [:environment] do |_t, args|
      from  = args[:from]
      to    = args[:to] || from

      puts "Exporting CMS data from Site [#{from}] to Folder [#{to}] ..."

      # changing so that logger is going straight to screen
      logger = ComfortableMexicanSofa.logger
      ComfortableMexicanSofa.logger = Logger.new(STDOUT)

      ComfortableMexicanSofa::Seeds::Exporter.new(from, to).export!

      ComfortableMexicanSofa.logger = logger
    end
  end
end
