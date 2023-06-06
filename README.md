# The DMV
## Upgrading our testing.


# Using Stubs

Remember this project from 3 years... I mean 3 weeks ago? 

Recall we were making a LIVE API call in the `dmv_data_service.rb` file. 

If we look in the spec file `vehicle_factory_spec.rb`, we can see in the setup that we are calling on the methods from `dmv_data_service` that result in live network calls, every time we run our tests.

Why might this be bad? 
* Slooooooooow test times especially as the test suite grows and the data sets grow. We're just calling on two states worth of data here, what if we were calling on all 50 states? This would be really slow.
* API have limits with how many times you can hit them. Hitting an API too many times can result in fees or lockout.


If we think about this from a testing perspective, we cannot control the data that comes from the API so we don't need to test their data. We want to test that the methods we wrote in our own code base work properly with the assumed input of the API data. 

So how can we write our tests using assumed data? Enter Mocks!

Open `vehicle_factory_spec.rb`. In the test setup (before block), see if you can add a mock that tells the test that when `.wa_ev_registrations` is called on a `dmv_service`, it should return our data located in `wa_data`.

Now do the same for the `@ny_registrations` data. 


# Using a Mock
Look again at the `vehicle_factory_spec.rb`, in the before(:each) block where we are initializing a new `DmvDataService` object. 

Is it necessary that we actually instantiate this object? 

How would we update this code to use a mock or double instead for the `DmvDataService` object?

Does this code still pass? 
What advantages does this provide? What drawbacks? 