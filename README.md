📱 **Flutter REST API Integration App**
This is a simple Flutter application that fetches and displays data from a REST API using HTTP requests. It is designed to help beginners understand how to work with APIs in Flutter using http, FutureBuilder, and custom model classes.

🚀 **Features**
Fetches data from JSONPlaceholder API
Parses JSON into Dart model objects
Displays data in a scrollable ListView
Uses FutureBuilder for async UI updates
Clean and readable code structure

🧑‍💻 **Technologies Used**
Flutter (SDK)
Dart
HTTP package
JSONPlaceholder API for dummy data

📁 **Project Structure**
lib/
├── Models/
│   └── posts_api.dart        # Model class for the post data
├── home_screen.dart          # Main screen with API fetching logic
└── main.dart                 # App entry point

🔧**How It Works**
1. API Used
This app fetches data from:
🌐 https://jsonplaceholder.typicode.com/posts

**2. Data Model**
class PostsModel {
  final num userId;
  final num id;
  final String title;
  final String body;

  PostsModel({required this.userId, required this.id, required this.title, required this.body});

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


**3. API Call with http**

Future<List<PostsModel>> getPostApi() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    for (Map<String, dynamic> i in data) {
      postList.add(PostsModel.fromJson(i));
    }
    return postList;
  } else {
    return [];
  }
}
**4. Showing Data with FutureBuilder**
FutureBuilder(
  future: getPostApi(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return Text('Loading...');
    } else {
      return ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(postList[index].title),
              subtitle: Text(postList[index].body),
            ),
          );
        },
      );
    }
  },
)

🤝 **Contributing**
Feel free to fork this repo and suggest improvements or add new features.

📬 **Contact**
If you have any questions or want to connect:
LinkedIn: https://www.linkedin.com/in/hashim-shahid-flutter-dev/
Email: shahidhashim@gmail.com
