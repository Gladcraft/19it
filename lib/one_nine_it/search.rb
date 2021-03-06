module OneNineIt
  module Search
    extend self

    def search(files, changes, options={})
      matches = []
      glob_files(files).each do |file|
        file_string = File.read(file)
        changes.each do |change|
          matchdata = file_string.match(change.parse_sidekick)
          matchdata.to_a.each_with_index do |m, i|
            offset = matchdata.begin(i)
            lines = file_string[0..offset].split($/)
            # count = file_string[0..offset].match(/\n/m).to_a.size
            matches << Match.new(:file=>file, :text=>m, :line_number=>lines.size, :column_number=>lines.last.size, :change=>change)
          end
        end
      end
      matches
    end

    def glob_files(files)
      globs = files.map {|e| File.directory?(e) ? "#{e}/**/*" : e }
      Dir.glob(globs).flatten.select {|e| File.file? e }
    end
  end
end

