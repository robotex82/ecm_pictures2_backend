class WebcamInput < SimpleForm::Inputs::Base
  def input
    multiple = input_options.delete(:multiple)
    if multiple
      template.render partial: 'inputs/webcam_multiple', locals: { f: @builder, attribute_name: attribute_name, input_options: input_options, input_html_options: input_html_options }
    else
      template.render partial: 'inputs/webcam', locals: { f: @builder, attribute_name: attribute_name, input_options: input_options, input_html_options: input_html_options }
    end
  end
end