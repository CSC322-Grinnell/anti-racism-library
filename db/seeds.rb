# Seeds for All Resources page (code in app/views/items/index.html.erb)

# Seed items: 
=begin
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
Item.create(author: "Assata Shakur", 
            title: "Assata", 
            description: "A political autobiography about the justice system and Black activism in the ‘60s and ‘70s. Assata Shakur was a Civil rights activist and member of the Black Liberation Army and Black Panther Party. She was (without sufficient evidence) convicted of murder and later escaped prison to flee the country. ",
            url: "https://bookshop.org/books/assata-an-autobiography/9781556520747", 
            category: "Book")
Item.create(author: "Ta-Nehisi Coates", 
            title: "Between The World And Me", 
            description: "In this #1 New York Times bestseller, Coates weaves personal narrative with reportage to explain racism in America—in history and as it exists today.",
            url: "https://bookshop.org/a/3433/9780812993547", 
            category: "Book")
Item.create(author: "Mikki Kendall", 
            title: "Hood Feminism", 
            description: "A collection of critical essays that explores the modern-day feminist movement, its blind spots, and its failure to secure equality for all women.",
            url: "https://bookshop.org/a/3433/9780525560548", 
            category: "Book")
Item.create(author: "Austin Channing Brown", 
            title: "I’m Still Here", 
            description: "This book is a powerful account of what it’s like growing up as a Black Christian woman in America. Channing Brown addresses some of today’s most pertinent topics—including the intersections of racial justice and religion.",
            url: "https://bookshop.org/a/3433/9781524760854", 
            category: "Book")
Item.create(author: "Layla F. Saad", 
            title: "Me and White Supremacy", 
            description: "Saad has gifted the world an unparalleled resource for digging up the deepest and most disguised layers of white supremacy. This book is best experienced as a journey, and the chapters are presented in bite-size lessons so readers can sit with the content, allow for introspection, and engage in essential conversations with friends and family members.",
            url: "https://bookshop.org/a/3433/9781728209807", 
            category: "Book")
=end
            
#65 add extra resources from resources.csv
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'resources.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')

csv.each do |row|
    i = Item.new
    i.title = row['title']
    i.author = row['author']
    i.description = row['description']
    i.category = row['category']
    i.url = row['url']
    i.save
    
end

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

# Two additional non-admin users
User.create(email: "goats@grinnell.edu", username: "goats", password: "goats_password", admin:false)

User.create(email: "articulate@grinnell.edu", username: "articulate", password: "articulate_password", admin:false)