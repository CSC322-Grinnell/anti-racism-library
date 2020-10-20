# Seeds for All Resources page (code in app/views/items/index.html.erb)

# Seed items: 
Item.create(author: "Francis Su", 
            title: "Mathematics for Human Flourishing", 
            description: "Su describes his relationship with an inmate, and the inamate's discovery of mathematics while in prison.", 
            url: "https://mathyawp.wordpress.com/2017/01/08/mathematics-for-human-flourishing/", 
            category: "Other")
Item.create(author: "Eric Anthony Grollman", 
            title: "Invisible Labor", 
            description: "Explotation of Faculty of Color in Service Duties", 
            url: "https://www.insidehighered.com/advice/2015/12/15/column-about-exploitation-minority-scholars-academe", 
            category: "Other")
Item.create(author: "Riegle-Crumb, King, & Irizarry", 
            title: "Does STEM Stand Out? Examining Racial/Ethnic Gaps in Persistence Across Postsecondary Fields", 
            description: "None", 
            url: "https://journals.sagepub.com/doi/pdf/10.3102/0013189X19831006", 
            category: "Journal")
Item.create(author: "Louise Archer Jennifier Dewitt Jonathan Osborne", 
            title: "Is Science for Us? Black Students’ and Parents’ Views of Science and Science Careers", 
            description: "None", 
            url: "https://onlinelibrary.wiley.com/doi/full/10.1002/sce.21146", 
            category: "Journal")
Item.create(author: "None", 
            title: "Science, Feminism, and Black Liberation: An Interview with Sam Anderson", 
            description: "The role of science in the struggle for Black liberation, and why it's critical for Black voices to shape fields that have excluded them.",
            url: "https://magazine.scienceforthepeople.org/vol23-1/science-feminism-and-black-liberation-an-interview-with-sam-anderson/", 
            category: "Journal")

# Seed an admin:
##### email: admin@grinnell.edu
##### username: admin
##### password: admin_password
User.create(email: "admin@grinnell.edu", username: "admin", password: "admin_password", admin:true)

# Seed a non-admin: 
##### email: user@grinnell.edu
##### username: user
##### password: userp_assword
User.create(email: "user@grinnell.edu", username: "user", password: "user_password", admin:false)

