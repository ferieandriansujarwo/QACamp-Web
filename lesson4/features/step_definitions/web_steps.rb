When("I want to visit Bukalapak Homepage") do
    @home = Homepage.new
    @home.load
end

Then("I will see button Login") do
    expect(@home).to have_login_button
end

Then("I will see Pencarian Populer section") do
    expect(@home).to have_pencarian_populer
end