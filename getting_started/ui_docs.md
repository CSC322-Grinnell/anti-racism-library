#UI Documentation

This application UI is styled using Bootstrap 4 and custom styling. 

##Layout
An overall style is defined by application layout (app/views/layouts/application.html.erb). 
The navigation bar used in it is defined at (app/views/layouts/_navigation.html.erb).
The layouts for individual pages inherit this site-wide design, and get their individual components from their respective views.

Layouts for pages under the Item controller are under app/views/items. Of these, _new item_, _index_, and _edit_ are self-explanatory.
The _show_ page under items uses cards, that are created 3 to a row, for suggested items.

##Style
The custom style for the application is available at app/javascript/stylesheet/application.scss
The color scheme is defined using prepossesor variables at the top. We recommend using these to make future changes less cumbersome.

  $background-dark is currently set at the red Grinnell's official color scheme recommends. 
  $background-light is a lighter red to go with it.
  $dark is black
  $light is white
  
  All the components and class selectors are listed in alphabetic order and are standard css classes. Feel free to create custom selectors, especially for aligning.
  
  Some padding and sizes have been redefined for h1,h2,h5. 
  
  
  
  
