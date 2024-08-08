import 'package:flutter/material.dart';
import 'package:user_data/model/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserData user;
  final VoidCallback onTap;

  const UserListItem({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.email,
                    size: 16, color: Color.fromARGB(255, 129, 125, 125)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    user.email,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 100, 98, 98)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
