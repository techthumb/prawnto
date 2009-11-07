module Prawnto
  module TemplateHandlers
    class Base < ::ActionView::TemplateHandler
      include ::ActionView::TemplateHandlers::Compilable
      
      def compile(template)
        "_prawnto_compile_setup;" +
        "pdf = Prawn::Document.new(@prawnto_options[:prawn]);" + 
        "#{template.source}\n" +
        "pdf.render_file @prawnto_options[:save_copy_to_disk] if @prawnto_options.has_key?(:save_copy_to_disk) \n" +
        "pdf.render;"
      end
    end
  end
end