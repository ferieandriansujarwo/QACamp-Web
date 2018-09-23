class Homepage < SitePrism::Page
    set_url '/'
  
    element :login_button, '#login_link'
    element :pencarian_populer, :xpath, '//*[text()="Pencarian Populer"]'
end

When("I want to visit Bukalapak Homepage") do
    @home = Homepage.new
    @home.load
end

Then("I will see button Login") do
    expect(@home.login_button).to have_text "Login"
end

Then("I will see Pencarian Populer section") do
    expect(@home.pencarian_populer).to have_text "Pencarian Populer"
end