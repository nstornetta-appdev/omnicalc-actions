class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url")
    }
    
    client = Algorithmia.client(ENV.fetch("ALGORITHMIA_KEY"))
    algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')

    @original_image_url = params.fetch("image_url")
    @colorized_image_url = algo.pipe(@original_image_url).result

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize_templates/colorize.html.erb")
  end

  def colorize_form
    render("colorize_templates/colorize_form.html.erb")
  end
end
