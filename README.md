# 🛍️ Avito Clone

A Ruby on Rails web application that replicates the popular Avito marketplace interface with full CRUD functionality for classified ads management.

## 📋 Overview

This project is a marketplace clone built with Ruby on Rails, featuring a clean and intuitive interface similar to Avito. Users can post, browse, edit, and manage classified advertisements across various categories.

## ✨ Features

- **Full CRUD Operations** - Create, Read, Update, Delete listings
- **User Authentication** - Secure user registration and login
- **Category Management** - Organize ads by categories (Electronics, Vehicles, Real Estate, etc.)
- **Search & Filters** - Advanced search with price, location, and category filters
- **Image Upload** - Multiple image support for listings
- **Responsive Design** - Mobile-friendly interface
- **User Dashboard** - Manage personal listings and profile

## 🛠️ Technologies Used

- **Backend:** Ruby on Rails 7+
- **Database:** SQLite3
- **Frontend:** HTML5, CSS3, Bootstrap
- **Authentication:** Devise gem
- **Image Processing:** Active Storage
- **Testing:** RSpec

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/avito-clone.git
   cd avito-clone
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the application**
   ```
   http://localhost:3000
   ```

## 📁 Project Structure

```
avito-clone/
├── app/
│   ├── controllers/
│   ├── models/
│   ├── views/
│   └── assets/
├── config/
├── db/
│   ├── migrate/
│   └── schema.rb
├── test/
└── Gemfile
```

## 🎯 Key Features

### Listings Management
- Create new classified ads with details, images, and pricing
- Edit and update existing listings
- Delete unwanted advertisements
- View detailed listing pages

### User System
- User registration and authentication
- Personal dashboard for managing listings
- Profile management

### Search & Browse
- Browse listings by categories
- Search functionality with keywords
- Filter by price range, location, and date

## 🔧 Configuration

The application uses SQLite3 as the default database. Configuration can be found in:
- `config/database.yml` - Database configuration
- `config/routes.rb` - Application routes
- `config/application.rb` - Application settings

## 🧪 Testing

Run the test suite:
```bash
bundle exec rspec
```

## 🚦 Usage

1. **Register/Login** - Create an account or login
2. **Post an Ad** - Click "Post Ad" and fill in the details
3. **Browse Listings** - Explore available items by category
4. **Search** - Use the search bar to find specific items
5. **Manage** - Edit or delete your listings from the dashboard

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- Akestaf Ahmed - Full Stack Developer

## 🔮 Future Enhancements

- [ ] Real-time messaging system
- [ ] Payment integration
- [ ] Advanced image gallery
- [ ] Location-based search with maps
- [ ] Email notifications
- [ ] Admin dashboard
- [ ] API development

## 📞 Support

For support, email ahmedakestaf@gmail.com or create an issue on GitHub.

---

⭐ **Star this repository if you found it helpful!**
