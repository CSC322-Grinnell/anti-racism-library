# anti-racism-library
ARL Team:
Milica Cvrkota, Anushka Kulshereshtha, Prajita Niraula, Lanea Rohan, and Rudy Vega
Client:
Nicole Eikmeier

Resources:
Devise Gem - Flexible Gem for authentication purposes (logging in, admin authorization, email confirmations, etc.)

-------
Purpose
-------

The Grinnell Computer Science department has always valued diversity and inclusion within its department. In recent years, they have renewed their 
goals and made inclusion and equity in computing one of their top priorities. This project hopes to extend the department’s efforts to that end by 
introducing a resource that enables individuals to educate themselves on issues surrounding anti-racism. 

The Anti Racism Library would be a web-app that curates resources on anti-racism and cultural awareness. The goal is to have a tool that can be used
in and outside of classes, with a searchable list of resources, based on keywords and relevance. This project will serve as a starting point for the 
Computer Science Department to provide anti-racism resources that will be available for Grinnell faculty, staff and students.

---------------
Getting Started
---------------

To get started with the app, clone the repo and then install the needed gems:

$ bundle install --without production
Next, migrate the database:


$ rails db:migrate
Finally, run the test suite to verify that everything is working correctly:


$ rails test
If the test suite passes, you'll be ready to run the app in a local server:


$ rails server


Once the server is launched, the home page will load and there will be a menu on the top as well as a search bar and login/signup buttons. The 
navigation menu at the top may be used to access any desired page. The home page should have the previously stated login/signup buttons as well as a 
search bar. The resources page will have a list of resources included that will allow users to open the resource and view the description.


-----
Links
-----

Link to prototype:
https://www.figma.com/proto/63UaNaHNfHPjV2CtdIQXbN/Anti-Racism-Library?node-id=23%3A77&scaling=min-zoom

Link to Figma working page:
https://www.figma.com/file/63UaNaHNfHPjV2CtdIQXbN/Anti-Racism-Library?node-id=0%3A1

Link to Heroku app:
https://blooming-tundra-07025.herokuapp.com/

Link to Devise Wiki:
https://github.com/heartcombo/devise/wiki