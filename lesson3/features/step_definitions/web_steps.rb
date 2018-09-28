When("I want to visit Bukalapak Homepage") do
    visit '/'
end

Then("I will see button Login") do
    login_text = find('#login_link').text
    expect(login_text).to eq "Login"
end

Then("I will see Pencarian Populer section") do
    sleep 3
    expect(page).to have_xpath("//*[text()='Pencarian Populer']")
end