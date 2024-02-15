module ApplicationHelper
    def show_img(path)
        File.open("app/assets/images/#{path}", "rb") do |file|
          raw file.read
        end
      end
end
