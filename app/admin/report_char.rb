ActiveAdmin.register_page "Reporte Tabla" do
  content do

    div id: "chart"
    
    script src: javascript_path('test.js'), type: "text/javascript"
  end
end
