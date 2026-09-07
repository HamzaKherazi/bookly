import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class SearchBarWithBorder extends StatefulWidget {
  const SearchBarWithBorder({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  State<SearchBarWithBorder> createState() => _SearchBarWithBorderState();
}

class _SearchBarWithBorderState extends State<SearchBarWithBorder> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: widget.onChanged,
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search for books...',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 22),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.clear();
              widget.onChanged?.call('');

              // widget.onChanged?.call('');
            },
            icon: const Icon(Icons.clear, color: kPrimaryColor, size: 20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }
}
