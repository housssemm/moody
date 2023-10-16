import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('history of tests'),
        centerTitle: true,
        elevation: 0,
      ),
        body: ListView.builder(
          itemCount: cardDataList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
                      ),
                      builder: (context) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cardDataList[index].mood,
                              style: TextStyle(fontSize: 19),
                            ),
                            Image.asset(cardDataList[index].imageAsset),
                            ElevatedButton(
                              child: const Text('close'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  title: Text(cardDataList[index].title),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/history.png'),
                  ),
                ),
              ),
            );
          },
        )

    );

          }







 }
class CardData {
  final String title;
  final String imageAsset;
  final String mood;

  CardData(this.title, this.imageAsset, this.mood);
}

List<CardData> cardDataList = [
  CardData('05/05/2023 17:39', 'images/sad.png',"deppresed"),
  CardData('05/05/2023 16:00', 'images/love.png',"not deppresed"),
  CardData('04/05/2023 15:40', 'images/love.png',"not deppresed"),
  CardData('04/05/2023 12:10', 'images/sad.png',"deppresed"),];
