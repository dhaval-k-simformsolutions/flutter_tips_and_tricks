import 'package:flutter/material.dart';

class UserDm {
  final String name;
  final int id;
  bool isSelected;

  UserDm({required this.name, required this.id, this.isSelected = false});
}

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<UserDm> users = [];
  List<UserDm> selectedUsers = [];

  @override
  void initState() {
    users.addAll([
      UserDm(name: 'Dhaval', id: 1),
      UserDm(name: 'Dhvanit', id: 2),
      UserDm(name: 'Sanket', id: 3),
      UserDm(name: 'Devarsh', id: 4),
      UserDm(name: 'Vatsal', id: 5),
      UserDm(name: 'Shweta', id: 6),
      UserDm(name: 'Mehul', id: 7),
      UserDm(name: 'Milap', id: 8),
      UserDm(name: 'Ankit', id: 9),
      UserDm(name: 'Parth', id: 10),
      UserDm(name: 'Ujas', id: 11),
      UserDm(name: 'Faiyaz', id: 12),
      UserDm(name: 'Happy', id: 13),
      UserDm(name: 'Swapnil', id: 14),
      UserDm(name: 'Janak', id: 15),
      UserDm(name: 'Manoj', id: 16),
      UserDm(name: 'Jaimin', id: 17),
      UserDm(name: 'Kavan', id: 18),
      UserDm(name: 'Aditya', id: 19),
      UserDm(name: 'Meet', id: 19),
    ]);
    updateSelectedUsers();
    super.initState();
  }

  updateSelectedUsers() {
    selectedUsers = users.where((element) => element.isSelected).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Participants'),
      ),
      body: selectedUsers.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 24),
                  child: Text(selectedUsers[index].name),
                ),
              ),
              itemCount: selectedUsers.length,
            )
          : const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('No Participants'),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectEmployee(allUsers: users),
            ),
          );
          if (result != null && result is List<UserDm>) {
            users = result;
            setState(() {
              updateSelectedUsers();
            });
          }
        },
      ),
    );
  }
}


/// Mark: Class Employee Selections
class SelectEmployee extends StatefulWidget {
  const SelectEmployee({Key? key, required this.allUsers}) : super(key: key);
  final List<UserDm> allUsers;

  @override
  State<SelectEmployee> createState() => _SelectEmployeeState();
}

class _SelectEmployeeState extends State<SelectEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Participants'),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(widget.allUsers),
                child: const Text(
                  'SAVE',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
        body: ListView.separated(
          separatorBuilder: (_, index) => const Divider(
            height: 0,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                widget.allUsers[index].isSelected =
                    !widget.allUsers[index].isSelected;
              });
            },
            child: Card(
              elevation: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.allUsers[index].name)),
                    widget.allUsers[index].isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.check_circle_outline,
                            color: Colors.grey,
                          )
                  ],
                ),
              ),
            ),
          ),
          itemCount: widget.allUsers.length,
        ));
  }
}
