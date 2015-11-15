module SvgHelper
  
  # HOW TO USE
  # Use the following helper method. The class is optional.
  # <%= svg 'back', class: 'some-class' %>
  
  def svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename + ".svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    #css
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end
  
end  