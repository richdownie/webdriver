class Display < Thor
  desc "list", "sample"
  def features
    Dir["../features/*.feature"].each do |source|
      puts "#{File.basename(source)}"
    end
  end
end