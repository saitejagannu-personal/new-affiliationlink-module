import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_project/subscription_details_screen.dart';

class SubscriptionScreen extends StatelessWidget {

  List<String> moviesList =["RRR", "Julai", "Oye", "jalsa", "Mirchi"];
  List<String> moviesImageList =[
    "https://www.ashokkarania.com/wp-content/uploads/2022/05/rrr-trailer-hindi-movie.jpg",
    "https://images.jdmagicbox.com/comp/jd_social/news/2018jul10/image-28448-qcpj21oe0d.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJXfpeW8NlrR_xAfVO_y4Gg6iM0OB2WkOz1g&s", 
    "https://images.jdmagicbox.com/comp/jd_social/news/2018jul13/image-51257-hzk52rzllu.jpg",
    "https://i.indiglamour.com/photogallery/telugu/movies/2013/Feb25/Mirchi/normal/Mirchi_xx_123rs.jpg"];

  SubscriptionScreen({super.key});

  @override
  Widget build(
    BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: moviesList.length,
        itemBuilder: (context, index) {
        // return Text(moviesList[index]);
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=> SubscriptionDetailsScreen(
                title: moviesList[index],
                description: moviesList[index],
                image: moviesImageList[index],
              )));
            },
            title: Text(moviesList[index]),
            subtitle: Text("Click on this to get the movie"),
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(moviesImageList[index]),
            ),
            trailing: Icon(Icons.add),
          ),
        );
      },)
    );
  }
}