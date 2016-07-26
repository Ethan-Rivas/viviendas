module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"
        super :style => "text-align: center;"

        div do
          img(src:"http://www.ivey.yucatan.gob.mx/images/logo_sitio.jpg")
          h3 do
            link_to('Descargas','/descargas.html')
          end
        end
      end

    end
  end
end
