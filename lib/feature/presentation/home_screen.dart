import 'package:flutter/material.dart';
import 'package:weatherapp/feature/data/weather_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: const SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              children: <Widget>[
                const Text("Search Weather",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70)),
                const Text(
                  "Instantly",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: cityController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'search',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintText: 'search...',
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white70, style: BorderStyle.solid),
                    ),
                    // borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      WeatherRepo()
                          .getWeather(cityController.text.trim())
                          .then((value) {
                        print("here");
                        // WeatherResponseModel weatherResponseModel =
                        //     WeatherResponseModel.fromJson(value);

                        // ShowWeather
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ShowWeather(
                        //             cityName: cityController.text.trim(),
                        //             weatherResponseModel: weatherResponseModel,
                        //           )),
                        // );
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple)),
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          )
        ]);
  }
}
