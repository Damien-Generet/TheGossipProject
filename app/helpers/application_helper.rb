module ApplicationHelper
    def show_img(path)
        File.open("app/assets/images/#{path}", "rb") do |file|
          raw file.read
        end
      end
      def image_tag(path)
        File.open("app/assets/images/#{path}") do |file|
          raw file.read
        end
      end

end
