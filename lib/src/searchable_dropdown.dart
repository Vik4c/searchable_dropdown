import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchable_paginated_dropdown/src/extensions/context_extension.dart';
import 'package:searchable_paginated_dropdown/src/extensions/custom_global_key_extension.dart';

import 'package:searchable_paginated_dropdown/src/model/searchable_dropdown_menu_item.dart';
import 'package:searchable_paginated_dropdown/src/searchable_dropdown_controller.dart';
import 'package:searchable_paginated_dropdown/src/utils/custom_inkwell.dart';
import 'package:searchable_paginated_dropdown/src/utils/custom_search_bar.dart';

class NavigateDownIntent extends Intent {
  const NavigateDownIntent();
}

class NavigateUpIntent extends Intent {
  const NavigateUpIntent();
}

class SelectItemIntent extends Intent {
  const SelectItemIntent();
}

class SearchableDropdown<T> extends StatefulWidget {
  const SearchableDropdown({
    Key? key,
    SearchableDropdownController<T>? controller,
    Widget? hintText,
    Widget Function(Widget)? backgroundDecoration,
    String? searchHintText,
    Widget? noRecordText,
    double? dropDownMaxHeight,
    EdgeInsetsGeometry? margin,
    Widget? trailingIcon,
    Widget? trailingClearIcon,
    Widget? leadingIcon,
    void Function(T?)? onChanged,
    List<SearchableDropdownMenuItem<T>>? items,
    T? value,
    bool isEnabled = true,
    VoidCallback? disabledOnTap,
    VoidCallback? onDismissDropdown,
    VoidCallback? onShowDropdown,
    double? width,
    bool isDialogExpanded = true,
    bool hasTrailingClearIcon = true,
    double? dialogOffset,
    bool autofocusSearch = true,
    Widget? loadingWidget,
  }) : this._(
          key: key,
          hintText: hintText,
          controller: controller,
          backgroundDecoration: backgroundDecoration,
          searchHintText: searchHintText,
          noRecordText: noRecordText,
          dropDownMaxHeight: dropDownMaxHeight,
          margin: margin,
          trailingIcon: trailingIcon,
          trailingClearIcon: trailingClearIcon,
          leadingIcon: leadingIcon,
          onChanged: onChanged,
          items: items,
          initialValue: value,
          isEnabled: isEnabled,
          disabledOnTap: disabledOnTap,
          onDismissDropdown: onDismissDropdown,
          onShowDropdown: onShowDropdown,
          width: width,
          isDialogExpanded: isDialogExpanded,
          hasTrailingClearIcon: hasTrailingClearIcon,
          dialogOffset: dialogOffset,
          autofocusSearch: autofocusSearch,
          loadingWidget: loadingWidget,
        );

  const SearchableDropdown.paginated({
    required Future<List<SearchableDropdownMenuItem<T>>?> Function(
      int,
      String?,
    )?
        paginatedRequest,
    int? requestItemCount,
    Key? key,
    SearchableDropdownController<T>? controller,
    Widget? hintText,
    Widget Function(Widget)? backgroundDecoration,
    String? searchHintText,
    Widget? noRecordText,
    double? dropDownMaxHeight,
    EdgeInsetsGeometry? margin,
    Widget? trailingIcon,
    Widget? trailingClearIcon,
    Widget? leadingIcon,
    void Function(T?)? onChanged,
    bool isEnabled = true,
    VoidCallback? disabledOnTap,
    VoidCallback? onDismissDropdown,
    VoidCallback? onShowDropdown,
    Duration? changeCompletionDelay,
    double? width,
    bool isDialogExpanded = true,
    bool hasTrailingClearIcon = true,
    SearchableDropdownMenuItem<T>? initialValue,
    double? dialogOffset,
    bool autofocusSearch = true,
    Widget? loadingWidget,
  }) : this._(
          key: key,
          controller: controller,
          paginatedRequest: paginatedRequest,
          requestItemCount: requestItemCount,
          hintText: hintText,
          backgroundDecoration: backgroundDecoration,
          searchHintText: searchHintText,
          noRecordText: noRecordText,
          dropDownMaxHeight: dropDownMaxHeight,
          margin: margin,
          trailingIcon: trailingIcon,
          trailingClearIcon: trailingClearIcon,
          leadingIcon: leadingIcon,
          onChanged: onChanged,
          isEnabled: isEnabled,
          disabledOnTap: disabledOnTap,
          onDismissDropdown: onDismissDropdown,
          onShowDropdown: onShowDropdown,
          changeCompletionDelay: changeCompletionDelay,
          width: width,
          isDialogExpanded: isDialogExpanded,
          hasTrailingClearIcon: hasTrailingClearIcon,
          initialFutureValue: initialValue,
          dialogOffset: dialogOffset,
          autofocusSearch: autofocusSearch,
          loadingWidget: loadingWidget,
        );

  const SearchableDropdown.future({
    required Future<List<SearchableDropdownMenuItem<T>>?> Function()?
        futureRequest,
    Key? key,
    SearchableDropdownController<T>? controller,
    Widget? hintText,
    Widget Function(Widget)? backgroundDecoration,
    String? searchHintText,
    Widget? noRecordText,
    double? dropDownMaxHeight,
    EdgeInsetsGeometry? margin,
    Widget? trailingIcon,
    Widget? trailingClearIcon,
    Widget? leadingIcon,
    void Function(T?)? onChanged,
    bool isEnabled = true,
    VoidCallback? disabledOnTap,
    VoidCallback? onDismissDropdown,
    VoidCallback? onShowDropdown,
    Duration? changeCompletionDelay,
    double? width,
    bool isDialogExpanded = true,
    bool hasTrailingClearIcon = true,
    SearchableDropdownMenuItem<T>? initialValue,
    double? dialogOffset,
    bool autofocusSearch = true,
    Widget? loadingWidget,
  }) : this._(
          futureRequest: futureRequest,
          key: key,
          controller: controller,
          hintText: hintText,
          backgroundDecoration: backgroundDecoration,
          searchHintText: searchHintText,
          noRecordText: noRecordText,
          dropDownMaxHeight: dropDownMaxHeight,
          margin: margin,
          trailingIcon: trailingIcon,
          trailingClearIcon: trailingClearIcon,
          leadingIcon: leadingIcon,
          onChanged: onChanged,
          isEnabled: isEnabled,
          disabledOnTap: disabledOnTap,
          onDismissDropdown: onDismissDropdown,
          onShowDropdown: onShowDropdown,
          changeCompletionDelay: changeCompletionDelay,
          width: width,
          isDialogExpanded: isDialogExpanded,
          hasTrailingClearIcon: hasTrailingClearIcon,
          initialFutureValue: initialValue,
          dialogOffset: dialogOffset,
          autofocusSearch: autofocusSearch,
          loadingWidget: loadingWidget,
        );

  const SearchableDropdown._({
    super.key,
    this.controller,
    this.hintText,
    this.backgroundDecoration,
    this.searchHintText,
    this.noRecordText,
    this.dropDownMaxHeight,
    this.margin,
    this.trailingIcon,
    this.trailingClearIcon,
    this.leadingIcon,
    this.onChanged,
    this.items,
    this.initialValue,
    this.initialFutureValue,
    this.isEnabled = true,
    this.disabledOnTap,
    this.onDismissDropdown,
    this.onShowDropdown,
    this.futureRequest,
    this.paginatedRequest,
    this.requestItemCount,
    this.changeCompletionDelay,
    this.width,
    this.isDialogExpanded = true,
    this.hasTrailingClearIcon = true,
    this.dialogOffset,
    this.autofocusSearch = true,
    this.loadingWidget,
  });

  //Is dropdown enabled
  final bool isEnabled;

  //If its true dialog will be expanded all width of screen, otherwise dialog will be same size of dropdown.
  final bool isDialogExpanded;

  /// Activates clear icon trailing.
  final bool hasTrailingClearIcon;

  /// Height of dropdown's dialog, default: context.deviceHeight*0.3.
  final double? dropDownMaxHeight;

  final double? width;

  /// Dialog offset from dropdown.
  final double? dialogOffset;

  /// Delay of dropdown's search callback after typing complete.
  final Duration? changeCompletionDelay;

  /// Dropdowns margin padding with other widgets.
  final EdgeInsetsGeometry? margin;

  /// Future service which is returns DropdownMenuItem list.
  final Future<List<SearchableDropdownMenuItem<T>>?> Function()? futureRequest;

  /// Paginated request service which is returns DropdownMenuItem list.
  final Future<List<SearchableDropdownMenuItem<T>>?> Function(
    int page,
    String? searchKey,
  )? paginatedRequest;

  /// Paginated request item count which returns in one page, this value is using for knowledge about isDropdown has more item or not.
  final int? requestItemCount;

  /// Dropdown items.
  final List<SearchableDropdownMenuItem<T>>? items;

  final SearchableDropdownController<T>? controller;

  //Initial value of future and paginated dropdown
  final SearchableDropdownMenuItem<T>? initialFutureValue;

  /// SearchBar hint text.
  final String? searchHintText;
  //Initial value of dropdown
  final T? initialValue;

  //Triggers this function if dropdown pressed while disabled
  final VoidCallback? disabledOnTap;

  //Triggers this function on dropdown dismissed
  final VoidCallback? onDismissDropdown;

  //Triggers this function on dropdown open
  final VoidCallback? onShowDropdown;

  /// Returns selected Item.
  final void Function(T? value)? onChanged;

  /// Hint text shown when the dropdown is empty.
  final Widget? hintText;

  /// Shows if there is no record found.
  final Widget? noRecordText;

  /// Dropdown trailing icon.
  final Widget? trailingIcon;

  /// Dropdown trailing clear icon.
  final Widget? trailingClearIcon;

  /// Dropdown trailing icon.
  final Widget? leadingIcon;

  /// Widget shown when data is being loaded.
  final Widget? loadingWidget;
  
  /// Background decoration of dropdown, i.e. with this you can wrap dropdown with Card.
  final Widget Function(Widget child)? backgroundDecoration;

  /// Autofocus search bar when dropdown is opened.
  final bool autofocusSearch;

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  late final SearchableDropdownController<T> dropdownController;

  @override
  void initState() {
    super.initState(); 
    dropdownController = widget.controller ??
        SearchableDropdownController<T>(
          initialItem: widget.initialFutureValue, 
          loadingWidget: widget.loadingWidget, 
        );

    dropdownController
      ..paginatedRequest = widget.paginatedRequest
      ..futureRequest = widget.futureRequest
      ..requestItemCount = widget.requestItemCount ?? 0
      ..items = widget.items
      ..searchedItems.value = widget.items;
    if (widget.initialFutureValue != null) {
      dropdownController.selectedItem.value = widget.initialFutureValue;
    }
    for (final element in widget.items ?? <SearchableDropdownMenuItem<T>>[]) {
      if (element.value == widget.initialValue) {
        dropdownController.selectedItem.value = element;
        return;
      }
    }

    if (dropdownController.paginatedRequest == null) {
      if (widget.futureRequest != null) {
        dropdownController.getItemsWithFutureRequest();
      }
    } else {
      dropdownController.getItemsWithPaginatedRequest(
          page: 1, key: null, isNewSearch: true);
    }
  }

  @override
  void didUpdateWidget(covariant SearchableDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.controller != null) {
      oldWidget.controller?.dispose(); 
      dropdownController = SearchableDropdownController<T>(
        initialItem: widget.initialFutureValue,
        loadingWidget: widget.loadingWidget,
      );
      dropdownController
        ..paginatedRequest = widget.paginatedRequest
        ..futureRequest = widget.futureRequest
        ..requestItemCount = widget.requestItemCount ?? 0
        ..items = widget.items
        ..searchedItems.value = widget.items;

    } else if (widget.controller != null &&
        widget.controller != oldWidget.controller) {
      if (oldWidget.controller == null) {
        oldWidget.controller?.dispose();
      }
      dropdownController = widget.controller!;
    }
    dropdownController.paginatedRequest = widget.paginatedRequest;
    dropdownController.futureRequest = widget.futureRequest;
    dropdownController.requestItemCount = widget.requestItemCount ?? 0;
    dropdownController.items = widget.items;
    dropdownController.searchedItems.value = widget.items;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      dropdownController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = _DropDown(
      controller: dropdownController,
      isEnabled: widget.isEnabled,
      disabledOnTap: widget.disabledOnTap,
      onDismissDropdown: widget.onDismissDropdown,
      onShowDropdown: widget.onShowDropdown,
      dropDownMaxHeight: widget.dropDownMaxHeight,
      futureRequest: widget.futureRequest,
      hintText: widget.hintText,
      leadingIcon: widget.leadingIcon,
      margin: widget.margin,
      noRecordText: widget.noRecordText,
      onChanged: widget.onChanged,
      paginatedRequest: widget.paginatedRequest,
      searchHintText: widget.searchHintText,
      trailingIcon: widget.trailingIcon,
      trailingClearIcon: widget.trailingClearIcon,
      changeCompletionDelay: widget.changeCompletionDelay,
      isDialogExpanded: widget.isDialogExpanded,
      hasTrailingClearIcon: widget.hasTrailingClearIcon,
      dialogOffset: widget.dialogOffset ?? 0,
      autofocusSearch: widget.autofocusSearch,
    );

    return SizedBox(
      key: dropdownController.key,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child:
          widget.backgroundDecoration?.call(dropdownWidget) ?? dropdownWidget,
    );
  }
}

class _DropDown<T> extends StatelessWidget {
  const _DropDown({
    required this.controller,
    required this.isEnabled,
    required this.isDialogExpanded,
    required this.dialogOffset,
    this.leadingIcon,
    this.trailingIcon,
    this.trailingClearIcon,
    this.disabledOnTap,
    this.onDismissDropdown,
    this.onShowDropdown,
    this.margin,
    this.hintText,
    this.dropDownMaxHeight,
    this.futureRequest,
    this.paginatedRequest,
    this.noRecordText,
    this.onChanged,
    this.searchHintText,
    this.changeCompletionDelay,
    this.hasTrailingClearIcon = true,
    this.autofocusSearch = true,
  });

  final bool isEnabled;
  final bool isDialogExpanded;
  final bool hasTrailingClearIcon;
  final double? dropDownMaxHeight;
  final double dialogOffset;
  final Duration? changeCompletionDelay;
  final EdgeInsetsGeometry? margin;
  final Future<List<SearchableDropdownMenuItem<T>>?> Function()? futureRequest;
  final Future<List<SearchableDropdownMenuItem<T>>?> Function(
    int page,
    String? searchKey,
  )? paginatedRequest;
  final SearchableDropdownController<T> controller;
  final String? searchHintText;
  final VoidCallback? disabledOnTap;
  final VoidCallback? onDismissDropdown;
  final VoidCallback? onShowDropdown;
  final void Function(T? value)? onChanged;
  final Widget? trailingIcon;
  final Widget? trailingClearIcon;
  final Widget? leadingIcon;
  final Widget? hintText;
  final Widget? noRecordText;
  final bool autofocusSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isEnabled) {
          showDropdownDialog(context, controller, dialogOffset: dialogOffset);
        } else {
          disabledOnTap?.call();
        }
      },
      child: Padding(
        padding: margin ?? const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (leadingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: leadingIcon,
                    ),
                  Flexible(
                    child: _DropDownText(
                      controller: controller,
                      hintText: hintText,
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: controller.selectedItem,
              builder: (context, value, child) {
                if (value == null || !hasTrailingClearIcon) {
                  return trailingIcon ??
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      );
                }
                return CustomInkwell(
                  padding: EdgeInsets.zero,
                  onTap: () {
                    controller.selectedItem.value = null;
                    onChanged?.call(null);
                  },
                  child: trailingClearIcon ??
                      const Icon(
                        Icons.clear,
                        size: 24,
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void showDropdownDialog(
    BuildContext context,
    SearchableDropdownController<T> controller, {
    /// Dialog offset from dropdown.
    required double dialogOffset,
  }) {
    var isReversed = false;
    final deviceHeight = context.deviceHeight;
    final dropdownGlobalPointBounds = controller.key.globalPaintBounds;
    final alertDialogMaxHeight = dropDownMaxHeight ?? deviceHeight * 0.35;

    final dropdownPositionFromBottom = dropdownGlobalPointBounds != null
        ? deviceHeight - dropdownGlobalPointBounds.bottom
        : null;
    var dialogPositionFromBottom = dropdownPositionFromBottom != null
        ? dropdownPositionFromBottom - alertDialogMaxHeight
        : null;
    if (dialogPositionFromBottom != null) {
      //If dialog couldn't fit the screen, reverse it
      if (dialogPositionFromBottom <= 0) {
        isReversed = true;
        final dropdownHeight = dropdownGlobalPointBounds?.height ?? 54;
        dialogPositionFromBottom +=
            alertDialogMaxHeight + dropdownHeight - dialogOffset;
      } else {
        dialogPositionFromBottom -= dialogOffset;
      }
    }
    if (controller.items == null) {
      if (paginatedRequest != null) {
        controller.getItemsWithPaginatedRequest(page: 1, isNewSearch: true);
      }
      if (futureRequest != null) controller.getItemsWithFutureRequest();
    } else {
      controller.searchedItems.value = controller.items;
    }
    //Call needs to be outside showDialog in case it has setState
    onShowDropdown?.call();
    //Show the dialog
    showDialog<void>(
      context: context,
      builder: (context) {
        var reCalculatePosition = dialogPositionFromBottom;
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        //If keyboard pushes the dialog, recalculate the dialog's position.
        if (reCalculatePosition != null &&
            reCalculatePosition <= keyboardHeight) {
          reCalculatePosition =
              (keyboardHeight - reCalculatePosition) + reCalculatePosition;
        }
        return Padding(
          padding: EdgeInsets.only(
            bottom: reCalculatePosition ?? 0,
            left: isDialogExpanded ? 16 : dropdownGlobalPointBounds?.left ?? 0,
            right: isDialogExpanded ? 16 : 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: isDialogExpanded
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: alertDialogMaxHeight,
                width:
                    isDialogExpanded ? null : dropdownGlobalPointBounds?.width,
                child: _DropDownCard(
                  controller: controller,
                  isReversed: isReversed,
                  noRecordText: noRecordText,
                  onChanged: onChanged,
                  paginatedRequest: paginatedRequest,
                  searchHintText: searchHintText,
                  changeCompletionDelay: changeCompletionDelay,
                  autofocusSearch: autofocusSearch,
                ),
              ),
            ],
          ),
        );
      },
      barrierColor: Colors.transparent,
    ).then(((_) => onDismissDropdown?.call()));
  }
}

class _DropDownCard<T> extends StatefulWidget { // Changed to StatefulWidget
  const _DropDownCard({
    required this.controller,
    required this.isReversed,
    this.searchHintText,
    this.paginatedRequest,
    this.onChanged,
    this.noRecordText,
    this.changeCompletionDelay,
    this.autofocusSearch = true,
    // Key? key, // Removed key from constructor if not needed explicitly here
  }) /*: super(key: key)*/; // Pass key if needed

  final bool isReversed;
  final Duration? changeCompletionDelay;
  final Future<List<SearchableDropdownMenuItem<T>>?> Function(
    int page,
    String? searchKey,
  )? paginatedRequest;
  final SearchableDropdownController<T> controller;
  final String? searchHintText;
  final void Function(T? value)? onChanged;
  final Widget? noRecordText;
  final bool autofocusSearch;

  @override
  State<_DropDownCard<T>> createState() => _DropDownCardState<T>(); // Create State
}

class _DropDownCardState<T> extends State<_DropDownCard<T>> { // State class
  final FocusNode _cardFocusNode = FocusNode(); // FocusNode for the card/list area
  final ValueNotifier<int> _highlightedIndex = ValueNotifier<int>(-1); // Track highlighted item index
  // Keep track of the list view's scroll controller to ensure visibility
  final ScrollController _scrollController = ScrollController();
  // Store item count to manage index boundaries
  int _currentItemCount = 0;
  // Define item height for scrolling calculation (adjust if your items have variable height)
  static const double _listItemHeight = 35.0; // Example height, adjust as needed

  @override
  void initState() {
    super.initState();
    // Listen to list changes to reset highlight if list becomes empty/null
     final listListenable = widget.paginatedRequest != null
        ? widget.controller.paginatedItemList
        : widget.controller.searchedItems;
    listListenable.addListener(_updateItemCount);
    _updateItemCount(); // Initial count
  }

  void _updateItemCount(){
     final listListenable = widget.paginatedRequest != null
        ? widget.controller.paginatedItemList
        : widget.controller.searchedItems;
     final list = listListenable.value;
     final newCount = list?.length ?? 0;
     if(newCount != _currentItemCount){
        setState(() {
           _currentItemCount = newCount;
        });
         // Reset highlight if list changes significantly (e.g., search)
        // _highlightedIndex.value = -1;
     }
  }

  @override
  void dispose() {
    // Remove listener
    final listListenable = widget.paginatedRequest != null
        ? widget.controller.paginatedItemList
        : widget.controller.searchedItems;
    listListenable.removeListener(_updateItemCount);

    _cardFocusNode.dispose();
    _highlightedIndex.dispose();
    _scrollController.dispose(); // Dispose ScrollController
    super.dispose();
  }

  // --- Action Implementations ---
  void _handleNavigateDown() {
    if (_currentItemCount == 0) return;
    _highlightedIndex.value = (_highlightedIndex.value + 1) % _currentItemCount;
    _ensureVisible(_highlightedIndex.value);
  }

  void _handleNavigateUp() {
    if (_currentItemCount == 0) return;
    _highlightedIndex.value = (_highlightedIndex.value - 1 + _currentItemCount) % _currentItemCount;
     _ensureVisible(_highlightedIndex.value);
  }

  void _handleSelectItem() {
    if (_highlightedIndex.value < 0 || _highlightedIndex.value >= _currentItemCount) return;

    final list = widget.paginatedRequest != null
        ? widget.controller.paginatedItemList.value
        : widget.controller.searchedItems.value;

    if (list != null && _highlightedIndex.value < list.length) {
      final item = list[_highlightedIndex.value];
      widget.controller.selectedItem.value = item;
      widget.onChanged?.call(item.value);
      Navigator.pop(context); // Close the dialog
      item.onTap?.call();
    }
  }

  // --- Scroll Helper ---
  void _ensureVisible(int index) {
    if (!_scrollController.hasClients || index < 0) return;

    final targetOffset = index * _listItemHeight; // Approximate offset
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
  // --- End Scroll Helper ---

  @override
  Widget build(BuildContext context) {
    // --- Actions Map ---
    final Map<Type, Action<Intent>> actions = {
      NavigateDownIntent: CallbackAction<NavigateDownIntent>(onInvoke: (_) => _handleNavigateDown()),
      NavigateUpIntent: CallbackAction<NavigateUpIntent>(onInvoke: (_) => _handleNavigateUp()),
      SelectItemIntent: CallbackAction<SelectItemIntent>(onInvoke: (_) => _handleSelectItem()),
      // Also handle ActivateIntent (usually Enter/Space on web/desktop)
      ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) => _handleSelectItem()),
    };

    // --- Shortcuts Map ---
    final Map<ShortcutActivator, Intent> shortcuts = {
      const SingleActivator(LogicalKeyboardKey.arrowDown): const NavigateDownIntent(),
      const SingleActivator(LogicalKeyboardKey.arrowUp): const NavigateUpIntent(),
      const SingleActivator(LogicalKeyboardKey.enter): const SelectItemIntent(),
      const SingleActivator(LogicalKeyboardKey.numpadEnter): const SelectItemIntent(),
      const SingleActivator(LogicalKeyboardKey.space): const SelectItemIntent(), // Optional: select with space
    };

    return FocusableActionDetector( // Wrap with FocusableActionDetector
      focusNode: _cardFocusNode,
      autofocus: false, // Search bar handles autofocus based on widget.autofocusSearch
      actions: actions,
      shortcuts: shortcuts,
      child: Column(
        mainAxisAlignment:
            widget.isReversed ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection:
                      widget.isReversed ? VerticalDirection.up : VerticalDirection.down,
                  children: [
                    // Pass the card's focus node and actions to the search bar wrapper
                    _DropDownSearchBarWrapper(
                        controller: widget.controller,
                        searchHintText: widget.searchHintText,
                        changeCompletionDelay: widget.changeCompletionDelay,
                        autofocus: widget.autofocusSearch,
                        parentFocusNode: _cardFocusNode, // Pass focus node
                        parentActions: actions,          // Pass actions
                    ),
                    Flexible(
                      child: ValueListenableBuilder<int>( // Listen for highlight changes
                        valueListenable: _highlightedIndex,
                        builder: (context, highlightedIndexValue, _) {
                          return _DropDownListView(
                            dropdownController: widget.controller,
                            paginatedRequest: widget.paginatedRequest,
                            isReversed: widget.isReversed,
                            noRecordText: widget.noRecordText,
                            onChanged: widget.onChanged,
                            highlightedIndex: highlightedIndexValue, // Pass highlight index
                            scrollController: _scrollController, // Pass scroll controller
                            onItemTap: (item) { // Add callback for direct tap selection
                                widget.controller.selectedItem.value = item as SearchableDropdownMenuItem<T>?;
                                widget.onChanged?.call(item.value as T?);
                                Navigator.pop(context);
                                item.onTap?.call();
                            }
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DropDownText<T> extends StatelessWidget {
  const _DropDownText({
    required this.controller,
    this.hintText,
  });

  final SearchableDropdownController<T> controller;
  final Widget? hintText;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.selectedItem,
      builder: (context, SearchableDropdownMenuItem<T>? selectedItem, child) =>
          selectedItem?.child ??
          (selectedItem?.label != null
              ? Text(
                  selectedItem!.label,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                )
              : hintText) ??
          const SizedBox.shrink(),
    );
  }
}

class _DropDownSearchBarWrapper<T> extends StatefulWidget {
  const _DropDownSearchBarWrapper({
    required this.controller,
    this.searchHintText,
    this.changeCompletionDelay,
    this.autofocus = false,
    required this.parentFocusNode, // Receive parent focus node
    required this.parentActions,   // Receive parent actions map
    Key? key,
  }) : super(key: key);

  final SearchableDropdownController<T> controller;
  final String? searchHintText;
  final Duration? changeCompletionDelay;
  final bool autofocus;
  final FocusNode parentFocusNode;
  final Map<Type, Action<Intent>> parentActions;

  @override
  State<_DropDownSearchBarWrapper<T>> createState() => _DropDownSearchBarWrapperState<T>();
}

class _DropDownSearchBarWrapperState<T> extends State<_DropDownSearchBarWrapper<T>> {
  final FocusNode _searchFocusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.autofocus) {
       WidgetsBinding.instance.addPostFrameCallback((_) {
         // Check if context is still mounted before requesting focus
         if(mounted) {
            FocusScope.of(context).requestFocus(_searchFocusNode);
         }
       });
    }
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  // --- Debounced Search Logic ---
   void _onSearchChanged(String value) {
      _debounce?.cancel();
      _debounce = Timer(widget.changeCompletionDelay ?? const Duration(milliseconds: 200), () {
          if (!mounted) return; // Check if mounted before proceeding

          widget.controller.searchText = value;
          // Clear highlight when search text changes
          (widget.parentFocusNode.context?.findAncestorStateOfType<_DropDownCardState<T>>())?._highlightedIndex.value = -1;

          if (widget.controller.items != null) {
            widget.controller.fillSearchedList(value);
          } else if (widget.controller.paginatedRequest != null){
             widget.controller.getItemsWithPaginatedRequest(
              key: value.isEmpty ? null : value,
              page: 1,
              isNewSearch: true,
            );
          } else if (widget.controller.futureRequest != null && value.isNotEmpty) {
              // Optional: If using futureRequest, maybe filter results locally?
              // Or refetch if futureRequest can take a search key?
              // For now, we assume futureRequest fetches all and fillSearchedList filters.
              widget.controller.fillSearchedList(value);
          } else if (widget.controller.futureRequest != null && value.isEmpty) {
              // Reset future list if search is cleared
              widget.controller.fillSearchedList(null);
          }
      });
   }

  // --- Key Event Handling ---
  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) { // Process only key down events
        Action<Intent>? action;
        Intent? intent;

        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            intent = const NavigateDownIntent();
            action = widget.parentActions[NavigateDownIntent];
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            intent = const NavigateUpIntent();
            action = widget.parentActions[NavigateUpIntent];
        } else if (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.numpadEnter) {
             intent = const SelectItemIntent();
             action = widget.parentActions[SelectItemIntent];
        }
        // Add Space handling if desired for selection
        // else if (event.logicalKey == LogicalKeyboardKey.space) {
        //      intent = const SelectItemIntent();
        //      action = widget.parentActions[SelectItemIntent];
        // }

        if (action != null && intent != null) {
             // Check if context is available before invoking action
            if(widget.parentFocusNode.context != null) {
                Actions.invoke(widget.parentFocusNode.context!, intent);
                return KeyEventResult.handled; // We handled the key event
            }
        }
    }
    return KeyEventResult.ignored; // Let the TextField handle other keys
  }
  // --- End Key Event Handling ---

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Focus( // Wrap search bar with Focus to intercept keys
          // focusNode: _searchFocusNode, // Use the dedicated search focus node
          onKeyEvent: _handleKeyEvent, // Use the key handler
          child: CustomSearchBar( // Your existing CustomSearchBar
            // No FocusNode passed here - managed by the outer Focus widget
            // controller: SearchController(), // Or however CustomSearchBar gets text
            // onChanged: _onSearchChanged, // Use onChanged for debouncing
            // onChangeComplete: null, // Remove direct onChangeComplete if using onChanged
            focusNode: _searchFocusNode, 
            onChangeComplete: _onSearchChanged,
            hintText: widget.searchHintText ?? 'Search',
            isOutlined: true,
            leadingIcon: const Icon(Icons.search, size: 24),
            // Ensure CustomSearchBar has a way to get/set text if not using TextEditingController
            // If CustomSearchBar uses TextEditingController, manage it here.
          ),
        ),
    );
  }
}

class _DropDownSearchBar<T> extends StatefulWidget {
  const _DropDownSearchBar({
    required this.controller,
    this.searchHintText,
    this.changeCompletionDelay,
    this.autofocus = true, // NEW: Added parameter
  });

  final Duration? changeCompletionDelay;
  final SearchableDropdownController<T> controller;
  final String? searchHintText;
  final bool autofocus; // NEW: Autofocus property

  @override
  State<_DropDownSearchBar<T>> createState() => _DropDownSearchBarState<T>();
}

class _DropDownSearchBarState<T> extends State<_DropDownSearchBar<T>> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if (widget.autofocus) {
      // Focus after the dialog is fully built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_focusNode.hasFocus) return;
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomSearchBar(
        focusNode: _focusNode, // Pass focus node
        changeCompletionDelay:
            widget.changeCompletionDelay ?? const Duration(milliseconds: 200),
        hintText: widget.searchHintText ?? 'Search',
        isOutlined: true,
        leadingIcon: const Icon(Icons.search, size: 24),
        onChangeComplete: (value) {
          widget.controller.searchText = value;
          if (widget.controller.items != null) {
            widget.controller.fillSearchedList(value);
            return;
          }
          widget.controller.getItemsWithPaginatedRequest(
            key: value == '' ? null : value,
            page: 1,
            isNewSearch: true,
          );
        },
      ),
    );
  }
}

class _DropDownListView<T> extends StatefulWidget {
  const _DropDownListView({
    required this.dropdownController,
    required this.isReversed,
    required this.highlightedIndex, // New: highlighted index
    required this.scrollController, // New: scroll controller
    required this.onItemTap,        // New: callback for tap
    this.paginatedRequest,
    this.noRecordText,
    this.onChanged, // Keep onChanged for compatibility if needed, but prefer onItemTap
    Key? key,
  }) : super(key: key);

  final bool isReversed;
  final Future<List<SearchableDropdownMenuItem<T>>?> Function(
    int page,
    String? searchKey,
  )? paginatedRequest;
  final SearchableDropdownController<T> dropdownController;
  final void Function(T? value)? onChanged; // Can likely be removed if using onItemTap
  final Widget? noRecordText;
  final int highlightedIndex;
  final ScrollController scrollController;
  final Function(SearchableDropdownMenuItem<T> item) onItemTap;

  @override
  State<_DropDownListView<T>> createState() => _DropDownListViewState<T>();
}

class _DropDownListViewState<T> extends State<_DropDownListView<T>> {
  // ScrollController is now managed by _DropDownCardState and passed in
  // ScrollController scrollController = ScrollController();
  Timer? timer; // For pagination throttling

  // Pagination Listener
  void scrollControllerListener({
    double sensitivity = 150.0,
    Duration throttleDuration = const Duration(milliseconds: 400),
  }) {
    // Only attach listener if paginated request exists
    if (widget.paginatedRequest == null) return;

    if (timer != null && timer!.isActive) return; // Check if timer is active

    timer = Timer(throttleDuration, () => timer = null);

    final position = widget.scrollController.position;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;
    final dropdownController = widget.dropdownController;
    final searchText = dropdownController.searchText;

    // Check if near the end and if the dropdown is NOT reversed
    // Or check if near the start and the dropdown IS reversed (for future implementation if needed)
    if (!widget.isReversed && maxScroll - currentScroll <= sensitivity) {
        // Check status before fetching more to prevent concurrent requests
       if (dropdownController.status.value != SearchableDropdownStatus.busy) {
           dropdownController.getItemsWithPaginatedRequest(
             page: dropdownController.page,
             key: searchText.isEmpty ? null : searchText,
           );
       }
    }
     // Optional: Add logic for reversed pagination if needed
     // else if (widget.isReversed && currentScroll <= sensitivity) { ... }
  }

  @override
  void initState() {
    super.initState();
    // Use the passed-in scrollController
    if (widget.paginatedRequest != null) {
      widget.scrollController.addListener(scrollControllerListener);
    }
  }

  @override
  void didUpdateWidget(covariant _DropDownListView<T> oldWidget) {
      super.didUpdateWidget(oldWidget);
      // If pagination capability changes, update listener
      if (widget.paginatedRequest != null && oldWidget.paginatedRequest == null) {
          widget.scrollController.addListener(scrollControllerListener);
      } else if (widget.paginatedRequest == null && oldWidget.paginatedRequest != null) {
          widget.scrollController.removeListener(scrollControllerListener);
      }
  }

  @override
  void dispose() {
    // Listener is removed in didUpdateWidget or here if controller is disposed externally
    // Only remove if it was added
     if (widget.paginatedRequest != null) {
       // Check if controller still has clients before removing listener
       if (widget.scrollController.hasClients){
            widget.scrollController.removeListener(scrollControllerListener);
       }
     }
     timer?.cancel();
    // Don't dispose the scrollController here, it's owned by _DropDownCardState
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine which list to listen to
    final listListenable = widget.paginatedRequest != null
        ? widget.dropdownController.paginatedItemList
        : widget.dropdownController.searchedItems;

    return ValueListenableBuilder<List<SearchableDropdownMenuItem<T>>?>(
      valueListenable: listListenable,
      builder: ( context, itemList, child,) {
        if (itemList == null && widget.dropdownController.status.value == SearchableDropdownStatus.busy) {
          return Center(child: widget.dropdownController.loadingWidget ?? const CircularProgressIndicator.adaptive());
        }
        if (itemList == null || itemList.isEmpty) {         
          // Check if it was a future request that just hasn't loaded yet
           if (widget.dropdownController.futureRequest != null && itemList == null) {
              return Center(child: widget.dropdownController.loadingWidget ?? const CircularProgressIndicator.adaptive());
           }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: widget.noRecordText ?? const Text('No results found'), // Changed default text
          );
        }

        return Scrollbar(
          thumbVisibility: true,
          controller: widget.scrollController,
          child: ListView.builder(
            controller: widget.scrollController,
            padding: listViewPadding(isReversed: widget.isReversed, isPaginated: widget.paginatedRequest != null), // Pass pagination flag
            itemCount: itemList.length + (widget.paginatedRequest != null ? 1: 0), // Add 1 for loading indicator only if paginated
            shrinkWrap: true,
            reverse: widget.isReversed,
            itemBuilder: (context, index) {
              // Loading indicator logic (only for paginated)
              if (widget.paginatedRequest != null && index == itemList.length) {
                  return ValueListenableBuilder<SearchableDropdownStatus>(
                      valueListenable: widget.dropdownController.status,
                      builder: (context, state, child) {
                       // Use the provided loadingWidget if available for ongoing pagination
                          return (state == SearchableDropdownStatus.busy && itemList.isNotEmpty)
                              ? Center(
                                  child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: widget.dropdownController.loadingWidget ?? CircularProgressIndicator.adaptive(),
                                ))
                              : const SizedBox.shrink();
                      },
                  );
              }

              // Item rendering logic
              final item = itemList.elementAt(index);
              final bool isHighlighted = index == widget.highlightedIndex;

              return Material( // Wrap with Material for inkwell splash and background
                    color: isHighlighted
                        ? Theme.of(context).focusColor // Use theme's focus color for highlight
                        : Colors.transparent,
                    child: CustomInkwell( // Your existing InkWell
                      onTap: () => widget.onItemTap(item), // Use the new callback
                      child: item.child,
                    ),
                );
            },
          ),
        );
      },
    );
  }

    // Updated padding calculation
   EdgeInsets listViewPadding({required bool isReversed, required bool isPaginated}) {
      // Only add padding for the loading indicator space if paginated
      final itemHeight = isPaginated ? _DropDownCardState._listItemHeight : 0.0;
      return EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: isReversed ? 0 : itemHeight,
        top: isReversed ? itemHeight : 0,
      );
   }

}