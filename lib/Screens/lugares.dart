import 'package:flutter/material.dart';
class Lugares extends StatelessWidget {
  const Lugares({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                      hintText: "¿A dónde te gustaría ir?",
                    );
                  },
                  suggestionsBuilder: (BuildContext context, SearchController controller) {
                    return List<Widget>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          /*setState(() {
                            controller.closeView(item);
                          });*/
                        },
                      );
                    });
                  },
                ),
                SizedBox(height: 10), // Agrega un espacio entre SearchAnchor y el ListView
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Lugares que no debes perderte"),
                              SizedBox(width: 10),
                              Image.asset("assets/construccion-de-casas.png", width: 30, height: 30),
                            ],
                          ),
                        ),
                      ),
                      //SizedBox(height: 10), // Agrega un espacio entre los elementos del ListView
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Dónde comer"),
                              SizedBox(width: 10),
                              Image.asset("assets/refresco-de-hamburguesa.png", height: 30, width: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
