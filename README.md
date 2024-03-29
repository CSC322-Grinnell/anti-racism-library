# anti-racism-library

ARL Team 1:
Milica Cvrkota, Anushka Kulshereshtha, Prajita Niraula, Lanea Rohan, and Rudy Vega

ARL Team 2:
Adam Mao, Charun Upara, Christa Cochran, Haakon Larsen, Quang Duc, and Tran Le

ARL Team 3:
Aleph Aseffa, Benjamin Mikek, Kody Harrison, Noah Burgess, Ryuta Kure

ARL Team 4:
Amisha Pershad, Jung Won Lee, Peter Xiangdong, Felipe Monteforte Ferreira, and Alex Lavery

Client:
Nicole Eikmeier

Resources:
Devise Gem - Flexible Gem for authentication purposes

-------
Purpose
-------

The Grinnell Computer Science department has always valued diversity and inclusion within its department. In recent years, they have renewed their 
goals and made inclusion and equity in computing one of their top priorities. This project hopes to extend the department’s efforts to that end by 
introducing a resource that enables individuals to educate themselves on issues surrounding anti-racism. 

The Anti Racism Library would be a web app that curates resources on anti-racism and cultural awareness. 
The goal is to have a tool that can be used
in and outside of classes, with a searchable list of resources, based on keywords and relevance. This project will serve as a starting point for the 
Computer Science Department to provide anti-racism resources that will be available for Grinnell faculty, staff and students.

---------------
Getting Started
---------------

To get started with the app, clone the repo and then install the needed gems:

$ bundle install --without production

Next, migrate the database:

$ rails db:migrate

Then make sure you seed the database: 

$ rails db:seed

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

Link to Figma mockup:
https://www.figma.com/file/N1mnW7dft8cuZtPbbdI7rk/Anti-racism-site-mockup

Link to Devise Wiki:
https://github.com/heartcombo/devise/wiki

Link to Heroku website:
https://anti-racism-library.herokuapp.com/

Notes: 

For some reason, the preview on cloud9 is different from the deployed site on Heroku. 
We were unable to figure out what the reason behind this was. 
