class ImageTagController < ApplicationController
  def image_tag
    input = {
      image: params.fetch("image_url")
    }
    
    client = Algorithmia.client(ENV.fetch("ALGORITHMIA_KEY"))
    algo = client.algo("deeplearning/IllustrationTagger/0.4.0")
    
    @original_image_url = params.fetch("image_url")
    @tag_hashes = algo.pipe(@original_image_url).result['general']

    render("image_tag_templates/image_tag.html.erb")
  end

  def image_tag_form
    render("image_tag_templates/image_tag_form.html.erb")
  end
end
