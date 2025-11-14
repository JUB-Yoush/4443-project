import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class IconTextButton extends StatelessWidget {
  final String textString;
  final IconData icon;
  final VoidCallback onPressed;

  const IconTextButton({
    Key? key,
    required this.textString,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => print("object"),
          icon: const Icon(Icons.notification_add),
        ),
        Text("quick save"),
      ],
    );
  }
}

class ActiveGoal {
  final String title;
  final IconData icon;
  final int goalAmount;
  final int currentAmount;
  final DateTime endDate;

  ActiveGoal(
    this.title,
    this.icon,
    this.goalAmount,
    this.currentAmount,
    this.endDate,
  );
}

class ActiveGoalWidget extends StatelessWidget {
  final ActiveGoal activeGoal;

  const ActiveGoalWidget({super.key, required this.activeGoal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.notification_add),
            Column(
              children: [
                Text(activeGoal.title),
                Text(activeGoal.endDate.year.toString()),
              ],
            ),
            Text("Active"),
          ],
        ),
        Row(children: [Text("-------------------")]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(activeGoal.currentAmount.toString()),
            Text(activeGoal.goalAmount.toString()),
          ],
        ),
      ],
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Money App")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage("https://placecats.com/100/100"),
              ),
              Column(
                children: [
                  Text("good morning jimmithy"),
                  Text("let's check your progress"),
                ],
              ),
              IconButton(
                onPressed: () {
                  print("object");
                },
                icon: const Icon(Icons.notification_add),
              ),
              Column(children: []),
            ],
          ),
          Container(
            color: Color.fromRGBO(54, 199, 131, 1),
            child: Column(
              children: [
                Text("total saved"),
                Text("\$16,250.90"),
                Text("+ 12% from last month"),
              ],
            ),
          ),
          // 4 buttons under money number
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () => print("object"),
                    icon: const Icon(Icons.notification_add),
                  ),
                  Text("quick save"),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    onPressed: () => print("object"),
                    icon: const Icon(Icons.notification_add),
                  ),
                  Text("quick save"),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    onPressed: () => print("object"),
                    icon: const Icon(Icons.notification_add),
                  ),
                  Text("quick save"),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    onPressed: () => print("object"),
                    icon: const Icon(Icons.notification_add),
                  ),
                  Text("quick save"),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Active Goals"),
                  InkWell(
                    onTap: () {
                      print("we have anchor tag at home");
                    },
                    child: Text(
                      "see all >",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActiveGoalWidget(
                    activeGoal: ActiveGoal(
                      "bladfadfah",
                      Icons.no_accounts,
                      1000,
                      250,
                      DateTime(2077, 01, 01),
                    ),
                  ),
                  ActiveGoalWidget(
                    activeGoal: ActiveGoal(
                      "bladfadfah",
                      Icons.no_accounts,
                      1000,
                      250,
                      DateTime(2077, 01, 01),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
