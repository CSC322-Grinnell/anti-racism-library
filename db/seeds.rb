# ------------------ Seed users ----------------------------

# Seed an admin:
##### email: admin@grinnell.edu
##### username: admin
##### password: admin_password
admin = User.new(email: "admin@grinnell.edu", username: "admin", password: "admin_password", admin:true)
admin.skip_confirmation!
admin.save!

# Seed a non-admin:
##### email: user@grinnell.edu
##### username: user
##### password: user_password
user = User.new(email: "user@grinnell.edu", username: "user", password: "user_password", admin:false)
user.skip_confirmation!
user.save!

# Two additional non-admin users
goats = User.new(email: "user2@grinnell.edu", username: "user2", password: "user2_password", admin:false)
goats.skip_confirmation!
goats.save!

articulate = User.new(email: "user3@grinnell.edu", username: "user3", password: "user3_password", admin:false)
articulate.skip_confirmation!
articulate.save!


# ------------------ Seed items ----------------------------

# Seed items:

Item.create(author: "Assata Shakur",
            title: "Assata",
            description: "A political autobiography about the justice system and Black activism in the ‘60s and ‘70s. Assata Shakur was a Civil rights activist and member of the Black Liberation Army and Black Panther Party. She was (without sufficient evidence) convicted of murder and later escaped prison to flee the country. ",
            url: "https://bookshop.org/books/assata-an-autobiography/9781556520747",
            category: "Book",
            user: user)
Item.create(author: "Ta-Nehisi Coates",
            title: "Between The World And Me",
            description: "In this #1 New York Times bestseller, Coates weaves personal narrative with reportage to explain racism in America—in history and as it exists today.",
            url: "https://bookshop.org/a/3433/9780812993547",
            category: "Book",
            user: user)
Item.create(author: "Mikki Kendall",
            title: "Hood Feminism",
            description: "A collection of critical essays that explores the modern-day feminist movement, its blind spots, and its failure to secure equality for all women.",
            url: "https://bookshop.org/a/3433/9780525560548",
            category: "Book",
            user: user)
Item.create(author: "Austin Channing Brown",
            title: "I’m Still Here",
            description: "This book is a powerful account of what it’s like growing up as a Black Christian woman in America. Channing Brown addresses some of today’s most pertinent topics—including the intersections of racial justice and religion.",
            url: "https://bookshop.org/a/3433/9781524760854",
            category: "Book",
            user: user)
Item.create(author: "Layla F. Saad",
            title: "Me and White Supremacy",
            description: "Saad has gifted the world an unparalleled resource for digging up the deepest and most disguised layers of white supremacy. This book is best experienced as a journey, and the chapters are presented in bite-size lessons so readers can sit with the content, allow for introspection, and engage in essential conversations with friends and family members.",
            url: "https://bookshop.org/a/3433/9781728209807",
            category: "Book",
            user: user)

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
    #i.user = user
    i.save
    
end

