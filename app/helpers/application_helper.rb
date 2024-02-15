module ApplicationHelper
    def show_img(path, options = [])
        File.open("app/assets/images/#{path}", "rb") do |file|
          raw file.read
        end
      end
end
