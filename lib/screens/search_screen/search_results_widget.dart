import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jauw/models/search_location_model.dart';
import 'package:jauw/utils/extensions.dart';

import '../../provider/search_location_provider.dart';
import '../../utils/constants.dart';

class SearchResultsWidget extends ConsumerWidget {
  const SearchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.watch(searchLocationProvider);

    return switch (searchProvider) {
      AsyncData(:final value) =>
        value == null
            ? const SizedBox()
            : value.locations.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'No results',
                    style: kBoldFont.copyWith(fontSize: 18),
                  ),
                ],
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.locations.length,
                itemBuilder: (context, index) {
                  final location = value.locations[index];
                  return SearchResultItem(
                    location: location,
                  );
                },
              ),

      // ignore: unused_local_variable
      AsyncError(:final error) => Text(
        'Oops, something unexpected happened',
        style: kBoldFont.copyWith(fontSize: 18),
      ),
      AsyncLoading() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Searching...',
            style: kBoldFont.copyWith(fontSize: 18),
          ),
        ],
      ),
      _ => const SizedBox(),
    };
  }
}

class SearchResultItem extends ConsumerStatefulWidget {
  const SearchResultItem({
    super.key,
    required this.location,
  });

  final SLocation location;

  @override
  ConsumerState<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends ConsumerState<SearchResultItem> {
  bool isLoading = false;

  Future<void> addItemToList(List<int> savedList) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    savedList.add(widget.location.id);
    ref.read(searchListProvider.notifier).update((state) => savedList);
    ref.invalidate(fetchSavedListProvider);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final savedList = ref.watch(searchListProvider);

    return ListTile(
      title: Text(
        widget.location.name,
        style: kMediumFont.copyWith(
          fontSize: 18,
          shadows: [
            const Shadow(
              color: Color(0x3E000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
      subtitle: Text(
        '${widget.location.region}${widget.location.region.isNotEmpty ? ', ' : ''}${widget.location.country}',
        style: kLightFont.copyWith(
          fontSize: 15,
          color: Colors.white.addOpacity(0.8),
          shadows: [
            const Shadow(
              color: Color(0x3E000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
      trailing:
          savedList.contains(
            widget.location.id,
          ) //check if the id is present in or saved list
          ? Icon(
              Icons.check,
              color: Colors.white.addOpacity(0.8),
              size: 18,
            )
          : !isLoading
          ? GestureDetector(
              onTap: () {
                addItemToList(savedList);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
            )
          : const SizedBox(
              width: 18,
              height: 18,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                ),
              ),
            ),
    );
  }
}
