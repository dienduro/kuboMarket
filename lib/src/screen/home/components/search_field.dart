import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) => print(value),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Buscar",
              suffixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
