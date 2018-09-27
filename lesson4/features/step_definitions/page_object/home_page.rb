class Homepage < SitePrism::Page
    set_url '/'
  
    element :login_button, '#login_link'
    element :pencarian_populer, :xpath, '//*[text()="Pencarian Populer"]'
end