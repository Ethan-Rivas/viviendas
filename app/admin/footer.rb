module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"
        super :style => "text-align: center;"

        div do
          img(src:"http://www.ivey.yucatan.gob.mx/images/logo_sitio.jpg")
          form(action:"descargas.html") do
            input(type:"submit", value:"Descargas")
          end
        end
      end

    end
  end
end
