import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_new_project/api/models/movie_model.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});
  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  List<MovieModel> movieList = [];
  Future<void> getData() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
       headers: {"Accept": "application/json"},
      );
      if (response.statusCode == 200) {
        final List<dynamic> moviesData = jsonDecode(response.body);
        setState(() {
          movieList = moviesData.map((e) => MovieModel.fromJSON(e)).toList();
        });
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"), backgroundColor: Colors.teal),
      body: movieList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (ctx, index) {
                final movie = movieList[index];
                return ListTile(
                  title: Text(movie.name),
                  subtitle: Text(movie.email),
                  trailing: Text(movie.username),
                );
              },
            ),
    );
  }
}
