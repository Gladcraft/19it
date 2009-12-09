module OneNineIt
  module Search
    extend self

    def search(files, changes, options={})
      matches = []
      files.each do |file|
        file_string = File.read(file)
        changes.each do |change|
          matchdata = file_string.match(change.parse_sidekick)
          matchdata.to_a.each_with_index do |m, i|
            offset = matchdata.begin(i)
            count = file_string[0..offset].split($/).size
            # count = file_string[0..offset].match(/\n/m).to_a.size
            matches << Match.new(:file=>file, :text=>m, :line_number=>count, :change=>change)
          end
        end
      end
      matches
    end

  end
end