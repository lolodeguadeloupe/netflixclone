import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notnetflix2/models/movie.dart';
import 'package:notnetflix2/models/person.dart';
import 'package:notnetflix2/repositories/data_repository.dart';
import 'package:notnetflix2/ui/widgets/action_button.dart';
import 'package:notnetflix2/ui/widgets/casting_card.dart';
import 'package:notnetflix2/ui/widgets/galerie_card.dart';
import 'package:notnetflix2/ui/widgets/movie_info.dart';
import 'package:notnetflix2/ui/widgets/my_video_player.dart';
import 'package:notnetflix2/utils/constant.dart';
import 'package:provider/provider.dart';

import '../widgets/movie_card.dart';
import '../widgets/movie_category.dart';

class MovieDetailsPersonPage extends StatefulWidget {
  final Person person;
  const MovieDetailsPersonPage({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  _MovieDetailsPersonPageState createState() => _MovieDetailsPersonPageState();
}

class _MovieDetailsPersonPageState extends State<MovieDetailsPersonPage> {
  List<Movie> listMovies = [];

  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    // recupère une liste de films
    List<Movie> _movielist = await dataProvider.getPopularMoviesByPerson(person: widget.person);
    setState(() {
      listMovies = _movielist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
        body: listMovies.isEmpty ? Center(child: CircularProgressIndicator(),)
        :
        ListView(
          children: [
            Center(
              child: CastingCard(person: widget.person,),
            ),
            SizedBox(height: 30,),
            MovieCategory(
              imageHeight: 320,
              imageWidth: 220,
              label: 'Connu pour les films suivants',
              movieList: listMovies,
              callback: getMovieData,
            )
          ],
        )
    );
  }
}
