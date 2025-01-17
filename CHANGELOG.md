## [1.0.1] - 18 Jan 2022

- 🚨 Breaking change

  - Removed `selectedChipTextStyle` parameter
  - Removed `unselectedChipTextStyle` parameter
  - Removed `selectedTextBackgroundColor` parameter
  - Removed `unselectedTextbackGroundColor` parameter
  - Removed `hideHeaderText` parameter
  - Removed `closeIconColor` parameter
  - Removed `hideHeaderAreaShadow` parameter
  - Removed `headerTextColor` parameter
  - Removed `searchFieldBackgroundColor` parameter
  - Removed `searchFieldTextStyle` parameter
  - Removed `headerTextStyle` parameter
  - Removed `searchFieldHintText` parameter
  - Removed `applyButonTextBackgroundColor` parameter
  - Removed `buttonRadius` parameter
  - Removed `buttonSpacing` parameter
  - Removed `controlButtonTextStyle` parameter
  - Removed `applyButtonTextStyle` parameter
  - Removed `applyButtonText` parameter
  - Removed `wrapAlignment` parameter
  - Removed `wrapCrossAxisAlignment` parameter
  - Removed `wrapSpacing` parameter
  - Removed `borderRadius` parameter

  > Above removed parameters are moved to the newly created theme parameter 

  - Replace `ItemSearchDelegate<T>` with `SearchPredict<T>` method
- Added Theme
  - `FilterListTheme` for filter list widget theme
  - `ChoiceChipTheme` for choice chip theme.
  - `HeaderTheme` for Header widget theme
  - `ControlButtonBarTheme` for control button bar theme
  - `ControlButtonTheme` for control button theme
  - `FilterListDelegateTheme` for filter list delegate theme
  - `controlButtons` parameter to display/hide control buttons (All, Reset)
- Added `FilterListDelegate.show` delegate to search/filter data in new screen



## [1.0.0] 21 May 2021

- Improved visual customization. Including remove custom function.
- Added below arguments to improve the customization and make it translatable.
  - `allButtonText` = 'All',
  - `applyButtonText` = 'Apply',
  - `resetButtonText` = 'Reset',
  - `selectedItemsText` = 'selected item'
- Added `buttonRadius` button border radius argument.
- Added `controlContainerDecoration` action buttons box decoration argument.
- Added `buttonSpacing` button spacing argument.
- Added `validateRemoveItem` custom remove function that returns the selected list items filtered by the user conditions.
- Added `insetPadding` dialog padding argument.
- Added `wrapAlignment` argument to control the choice chips alignment in main axis.
- Added `wrapCrossAxisAlignment` argument to control choice chip within a run should be aligned relative to each other in the cross axis.
- Added `wrapSpacing` argument to control the space to place between choice chip in a run in the main axis.

## [0.0.9] - 01 Apr 2021

- Migrate to null safety.
- `label` is replaced with `choiceChipLabel`

## [0.0.8] - 28 Mar 2021

- Added `choiceChipBuilder` to build custom choice chip.
- Added `selectedChipTextStyle`,`unselectedChipTextStyle`,`controlButtonTextStyle`,`applyButtonTextStyle`,`headerTextStyle` and `searchFieldTextStyle` styles.
- Removed `applyButonTextColor`,`allResetButonColor`,`selectedTextColor`,`unselectedTextColor` colors properties.

## [0.0.7] - 20 Feb 2021

- Update readme.md

## [0.0.6] - 20 Feb 2021

- Convert filter list package to generic list filter package
- `allTextList` changed to `listData`
- `selectedTextList` changed to `selectedListData`
- `FilterListWidget` and `FilterListDialog` can filter any type if list
- Added `validateSelectedItem` callback to validate which item needs to be selected
- Added `onItemSearch` callback to expose search mechanism on user side to filter list.'

## [0.0.5] - 22 Sep 2020

- Add `FilterListWidget` widget.
- `FilterList.showFilterList` is renamed to `FilterListDialog.display`
- Add `onApplyButtonClick` callback to return selected text list from `FilterListDialog.display`.

## [0.0.4] - 05 Mar 2020

- Added pop-up Corner Radius property
- Added ripple effect on control button.

## [0.0.3] - 02 Mar 2020

- Added pop-up height

- Added pop-up width
- Added header hide parameter
- Added search field hide parameter
- Added cross icon hide parameter

## [0.0.2] - 02 Mar 2020

- Added filter pop-up theme customization

## [0.0.1] - 02 Mar 2020

- Filter list functionality added
- Return selected list of text
