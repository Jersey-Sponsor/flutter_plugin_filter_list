library filter_list;

import 'package:filter_list/src/state/filter_state.dart';
import 'package:filter_list/src/state/provider.dart';
import 'package:filter_list/src/theme/theme.dart';
import 'package:filter_list/src/widget/choice_list.dart';
import 'package:filter_list/src/widget/control_button_bar.dart';
import 'package:filter_list/src/widget/header.dart';
import 'package:flutter/material.dart';

part 'filter_list_widget.dart';

/// The [FilterListDialog.display] is a [Dialog] with some filter utilities and callbacks which helps in single/multiple selection from list of data.
///
/// {@template arguments}
/// The [listData] should be list of dynamic data which neeeds to filter.
///
/// The [selectedListData] should be sublist of [listData]. The list passed to [selectedListData] should available in [listData].
///
/// The [choiceChipLabel] is a callback which required [String] value in return. It used this value to display text on choice chip.
///
/// The [validateSelectedItem] used to identifies weather a item is selecte or not.
///
/// [onItemSearch] filter the list on the basis of search field text. It expose search api to permform search operation accoding to requirement.
/// When text change in search text field then return a list of element which contains specific text. if no element found then it should return empty list.
///
///
/// The [choiceChipBuilder] is a builder to design custom choice chip.
///
///
/// The [onApplyButtonClick] is a callback which return list of all selected items on apply button click.  if no item is selected then it will return empty list.
/// {@endtemplate}
/// The [useSafeArea] argument is used to indicate if the dialog should only display in 'safe' areas of the screen not used by the operating system (see [SafeArea] for more details). It is true by default, which means the dialog will not overlap operating system areas. If it is set to false the dialog will only be constrained by the screen size. It can not be null.
///
/// The [useRootNavigator] argument is used to determine whether to push the dialog to the [Navigator] furthest from or nearest to the given context. By default, useRootNavigator is true and the dialog route created by this method is pushed to the root navigator. It can not be null.
///
/// The [routeSettings] argument is passed to [showGeneralDialog], see [RouteSettings] for details.
///
/// The [insetPadding] is the amount of padding added to [MediaQueryData.viewInsets] on the outside of the dialog.
/// This defines the minimum space between the screen's edges and the dialog.
///
/// Defaults to EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0).
///
/// ### This example shows how to use [FilterListDialog]
///
///  ``` dart
/// void _openFilterDialog() async {
///    await FilterListDialog.display<String>(context,
///        listData: ["One", "Two", "Three", "Four","five","Six","Seven","Eight","Nine","Ten"],
///        selectedListData: ["One", "Three", "Four","Eight","Nine"],
///        choiceChipLabel: (item) {
///          return item;
///        },
///        validateSelectedItem: (list, val) {
///          return list!.contains(val);
///        },
///        onItemSearch: (list, text) {
///          if (list!.any((element) =>
///              element.toLowerCase().contains(text.toLowerCase()))) {
///            /// return list which contains text matches
///            return list
///                .where((element) =>
///                    element.toLowerCase().contains(text.toLowerCase()))
///                .toList();
///          }
///          return [];
///        },
///        height: 480,
///        borderRadius: 20,
///        headlineText: "Select Count",
///        searchFieldHintText: "Search Here",
///        onApplyButtonClick: (list) {
///          if (list != null) {
///            setState(() {
///             var selectedList = List.from(list);
///            });
///            Navigator.pop(context);
///          }
///        });
///  }
/// ```
/// {@macro control_buttons}

class FilterListDialog {
  static Future display<T extends Object>(
    context, {

    /// Filter theme
    FilterListThemeData? themeData,

    /// Pass list containing all data which neeeds to filter.
    required List<T> listData,

    /// pass selected list of object
    /// every object on selecteListData should be present in list data.
    List<T>? selectedListData,

    /// Display text on choice chip.
    required LabelDelegate<T> choiceChipLabel,

    /// identifies weather a item is selecte or not.
    required ValidateSelectedItem<T> validateSelectedItem,

    /// The `validateRemoveItem` identifies if a item should be remove or not and returns the list filtered.
    ValidateRemoveItem<T>? validateRemoveItem,

    /// filter list on the basis of search field text.
    /// When text change in search text field then return list containing that text value.
    ///
    ///Check if list has value which matches to text.
    required SearchPredict<T> onItemSearch,

    /// Return list of all selected items
    required OnApplyButtonClick<T> onApplyButtonClick,

    /// Height of the dialog
    double? height,

    /// Width of the dialog
    double? width,

    /// Border radius of dialog.
    double borderRadius = 20,

    /// Headline text to be display as header of dialog.
    String? headlineText,

    /// Used to hide selected text count.
    bool hideSelectedTextCount = false,

    /// Used to hide search field.
    bool hideSearchField = false,

    /// Used to hide close icon.
    bool hideCloseIcon = false,

    /// Widget to close the dialog.
    ///
    /// If widget is not provided then default close icon will be used.
    final Widget? headerCloseIcon,

    /// Used to hide header.
    bool hideheader = false,

    /// The `barrierDismissible` argument is used to indicate whether tapping on the barrier will dismiss the dialog.
    ///
    ///  It is true by default and can not be null.
    bool barrierDismissible = true,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,

    /// if `enableOnlySingleSelection` is true then it disabled the multiple selection.
    /// and enabled the single selection model.
    ///
    /// Defautl value is [false]
    bool enableOnlySingleSelection = false,

    /// Background color of dialog box.
    Color backgroundColor = Colors.white,

    /// Apply Button Label
    String? applyButtonText = 'Apply',

    /// Reset Button Label
    String? resetButtonText = 'Reset',

    /// All Button Label
    String? allButtonText = 'All',

    /// Selected items count text
    String? selectedItemsText = 'selected items',

    /// The amount of padding added to [MediaQueryData.viewInsets] on the outside of the dialog.
    /// This defines the minimum space between the screen's edges and the dialog.
    ///
    /// Defaults to EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0).
    EdgeInsets? insetPadding =
        const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),

    /// The `choiceChipBuilder` is a builder to design custom choice chip.
    ChoiceChipBuilder? choiceChipBuilder,

    /// {@macro control_buttons}
    List<ContolButtonType>? controlButtons,
  }) async {
    if (height == null) {
      height = MediaQuery.of(context).size.height * .5;
    }
    if (width == null) {
      width = MediaQuery.of(context).size.width;
    }
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: insetPadding,
          child: Container(
            height: height,
            width: width,
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(themeData?.borderRadius ?? 20),
              ),
              child: FilterListWidget(
                themeData: themeData,
                listData: listData,
                choiceChipLabel: choiceChipLabel,
                hideHeader: hideheader,
                headlineText: headlineText,
                onItemSearch: onItemSearch,
                backgroundColor: backgroundColor,
                selectedListData: selectedListData,
                onApplyButtonClick: onApplyButtonClick,
                validateSelectedItem: validateSelectedItem,
                hideSelectedTextCount: hideSelectedTextCount,
                hideCloseIcon: hideCloseIcon,
                headerCloseIcon: headerCloseIcon,
                hideSearchField: hideSearchField,
                choiceChipBuilder: choiceChipBuilder,
                enableOnlySingleSelection: enableOnlySingleSelection,
                selectedItemsText: selectedItemsText,
                applyButtonText: applyButtonText,
                resetButtonText: resetButtonText,
                allButtonText: allButtonText,
                validateRemoveItem: validateRemoveItem,
                controlButtons: controlButtons ??
                    [ContolButtonType.All, ContolButtonType.Reset],
              ),
            ),
          ),
        );
      },
    );
  }
}
