When("I want to visit Bukalapak Homepage") do
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to "https://www.bukalapak.com"
end

Then("I will see button Login") do
    element = @driver.find_element(id: 'login_link')
    expect(element.text).to eq "Login"
end