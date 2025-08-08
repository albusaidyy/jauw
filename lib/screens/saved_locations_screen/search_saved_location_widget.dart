import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/extensions.dart';

import '../../models/next_week_weather.dart';
import '../../provider/saved_list_provider.dart';

class SearchSavedLocatonWidget extends ConsumerStatefulWidget {
  const SearchSavedLocatonWidget({
    super.key,
    required this.query,
    required this.savedList,
  });
  final String query;
  final List<NextWeekWeather> savedList;

  @override
  ConsumerState<SearchSavedLocatonWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchSavedLocatonWidget> {
  bool isTapped = false;
  late FocusNode _focusNode;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearch = ref.watch(searchListBoolNotifierProvider);
    return AnimatedContainer(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
      height: isSearch ? 59 : 0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xFFAAA5A5)),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: _controller,
          onChanged: (value) {
            ref.read(searchQueryProvider.notifier).update((state) => value);
            ref
                .read(searchSavedListNotifierProvider.notifier)
                .onSearchSavedList(widget.savedList);
          },
          focusNode: _focusNode,
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          onEditingComplete: () {
            ref
                .read(searchSavedListNotifierProvider.notifier)
                .onSearchSavedList(widget.savedList);
          },
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white.addOpacity(0.80),
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: _focusNode.hasFocus
                ? GestureDetector(
                    onTap: () {
                      // Dismiss the keyboard
                      FocusScope.of(context).unfocus();
                      !_focusNode.hasFocus;
                      ref.invalidate(searchQueryProvider);
                      ref.invalidate(searchListBoolNotifierProvider);
                      _controller.text = '';
                    },
                    child: const Icon(
                      Icons.cancel_rounded,
                      color: Colors.white,
                    ),
                  )
                : Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      'assets/images/icon_search.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
            border: InputBorder.none,
            hintText: 'Enter Location',
            hintStyle: TextStyle(
              color: Colors.white.addOpacity(0.80),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
