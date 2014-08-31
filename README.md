# FormattedNumbers

![FormattedNumbers Screenshots](http://cl.ly/image/3U3B2V0c2x12/FN-Screenshots.png)

FormattedNumbers uses `NSNumberFormatter` to provide data types for formatted **money**, **percentage**, and **quantity**. These data types ensure consistent displays of decimal places given decimal place cutoffs. They also make sure attributes (colors, text alignment, font size, etc.) are applied when the formatted numbers are supposed to be shown as attributed string.

## Demo

To see a demo, clone this project and run it using XCode ([or you can checkout more screenshots here](http://cl.ly/3Y351K3I3n1O/FN-Screenshots.zip)).

## Usage

1. Copy all files under `FormattedNumbers/Code` to your project.
1. Import `FN.h`
    ```objc
    #import "FN.h"
    ```

1. Instantiate `FNMoney`, `FNPercentage`, or `FNQuantity`, then call `formattedString` or `formattedAttributedString` on the instance.
    ```objc
    // Money
    // prints USD 1,003
    FNMoney *formattedMoney = [[FNMoney alloc] initWithNumber:@(1002.923389)];
    self.label.text = formattedMoney.formattedString;
    self.attributedLabel.text = formattedMoney.formattedAttributedString;

    // Percentage
    // prints 0.1 %
    FNPercentage *formattedPercentage = [[FNPercentage alloc] initWithNumber:@(0.001)];
    self.label.text = formattedPercentage.formattedString;
    self.attributedLabel.text = formattedPercentage.formattedAttributedString;

    // Quantity
    // prints 1003
    FNQuantity *formattedQuantity = [[FNQuantity alloc] initWithNumber:@(1002.923389)];
    self.label.text = formattedQuantity.formattedString;
    self.attributedLabel.text = formattedQuantity.formattedAttributedString;
    ```

## Customization

### Rounding Cutoffs

The cutoffs can be set from the `roundingCutOffs` property, which is an array of number rounding cutoffs sorted by `minimumAbsoluteValue` descending. If they are not sorted that way, the cutoffs will not work as expected.

The default rounding cutoffs are as follows.

```
         number >= 1000 : no decimal places (decimal format: @"¤#,##0")
  100 <= number < 1000  : 1 decimal place (decimal format: @"¤#,##0.#")
   10 <= number < 100   : 2 decimal places (decimal format: @"¤#,##0.##")
    1 <= number < 10    : 3 decimal places (decimal format: @"¤#,##0.###")
    0 <= number < 1     : 4 decimal places (decimal format: @"¤#,##0.####")
```

Example of adjusting number rounding cutoffs:


```objc
FNMoney *formattedMoney = [[FNMoney alloc] initWithNumber:@(1002.923389)];

// Default cutoffs
formattedMoney.roundingCutOffs = @[
    [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:1000
                                  numberOfDecimalPlaces:0
                                          decimalFormat:@"¤#,##0"],
    [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:100
                                  numberOfDecimalPlaces:1
                                          decimalFormat:@"¤#,##0.#"],
    [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:10
                                  numberOfDecimalPlaces:2
                                          decimalFormat:@"¤#,##0.##"],
    [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:1
                                  numberOfDecimalPlaces:3
                                          decimalFormat:@"¤#,##0.###"],
    [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:0
                                  numberOfDecimalPlaces:4
                                          decimalFormat:@"¤#,##0.####"]
];
```

### Abbreviation Cutoffs

In order to make abbreviation work, `abbreviates` property has to be set to `YES`, and the cutoffs have to be provided. The cutoffs can be set from the `abbreviationCutOffs` property,  which is an array of number abbreviation cutoffs sorted by `minimumAbsoluteValue` descending. If they are not sorted that way, the cutoffs will not work as expected. The way to set the cutoffs is similar to adjusting number rounding cutoffs.

These abbreviation cutoffs can only be applied to `FNMoney` and `FNQuantity`. Abbreviation cutoffs is not supported yet on `FNPercentage`.

The default abbreviation cutoffs are as follows.

```
             number >= 1000000000: abbreviated with b (billion)
  1000000 <= number < 1000000000 : abbreviated with m (million)
     1000 <= number < 1000000    : abbreviated with k (kilo)
```

Example of adjusting number abbreviation cutoffs:

```objc
FNMoney *formattedMoney = [[FNMoney alloc] initWithNumber:@(1002.923389) abbreviates:YES];

// Default cutoffs
formattedMoney.abbreviationCutOffs = @[
    [[FNAbbreviationCutOff alloc] initWithMinimumAbsoluteValue:1000000000
                                                        symbol:NSLocalizedString(@"b", @"Number Formatter Abreviation Billion")],
    [[FNAbbreviationCutOff alloc] initWithMinimumAbsoluteValue:1000000
                                                        symbol:NSLocalizedString(@"m", @"Number Formatter Abreviation Million")],
    [[FNAbbreviationCutOff alloc] initWithMinimumAbsoluteValue:1000
                                                        symbol:NSLocalizedString(@"k", @"Number Formatter Abreviation Thousands")]
];
```

### Sign Styles

The formatted number's sign style can be set from the `signStyle` property. It is used to show number signs like plus or minus.

```objc
FNPercentage *formattedPercentage = [[FNPercentage alloc] initWithNumber:@(0.001)];

formattedPercentage.signStyle = FNSignStyleNoSign;

self.label.text = formattedPercentage.formattedString;
self.attributedLabel.text = formattedPercentage.formattedAttributedString;
```

Currently, there are 4 types of sign styles.

1. `FNSignStyleNoSign`<br/>Don't show any number sign regardless of whether the number is positive or negative. Example: `-10` will be displayed as `10`.
1. `FNSignStyleDefault`<br/>Show the number sign only if number is negative. Example: `10` will be displayed as `10`, `-10` will be displayed as `-10`
1. `FNSignStylePlusMinus`<br/>Always show the number sign. Example: `10` will be displayed as `+10`, `-10` will be displayed as `-10`
1. `FNSignStyleTriangleUpDown`<br/>Always show the number sign as triangle up (positive) or down (negative). Example: `10` will be displayed as `▲10`, `-10` will be displayed as `▼10`


### Highlight Styles

The formatted number's highlight style can be set from the `highlightStyle` property. It is used for determining location to give color to `formattedAttributedString`.

```objc
FNPercentage *formattedPercentage = [[FNPercentage alloc] initWithNumber:@(0.001)];

formattedPercentage.highlightStyle = FNHighlightStyleSignOnly;

self.attributedLabel.text = formattedPercentage.formattedAttributedString;
```

Currently, there are 3 types of highlight styles.

1. `FNHighlightStyleNoHighlight`<br/>Don't show any highlight on the number.
1. `FNHighlightStyleWholeText`<br/>Highlight the whole formatted number.
1. `FNHighlightStyleSignOnly`<br/>Highlight only the sign of the formatted number. The sign is determined by the `signStyle`.

### Text Colors for Positive, Negative, and Zero Numbers

These can be changed using `positiveColor`, `negativeColor`, and `neutralColor` properties. The defaults are as follows.

- `positiveColor`: `[UIColor greenColor]`
- `negativeColor`: `[UIColor redColor]`
- `neutralColor`: `[UIColor colorWithWhite:0.2 alpha:1]`

Example of adjusting the colors:

```objc
FNPercentage *formattedPercentage = [[FNPercentage alloc] initWithNumber:@(0.001)];

formattedPercentage.positiveColor = [UIColor redColor];
formattedPercentage.negativeColor = [UIColor blueColor];
formattedPercentage.neutralColor = [UIColor colorWithWhite:0.5 alpha:1];

self.attributedLabel.text = formattedPercentage.formattedAttributedString;
```

### Font and Text Alignment Adjustments for `formattedAttributedString`

These can be set on `textAlignment` and `font` properties. The defaults are as follows.

- `textAlignment`: `NSTextAlignmentLeft`
- `font`: `[UIFont systemFontOfSize:15]`

Example:

```
FNPercentage *formattedPercentage = [[FNPercentage alloc] initWithNumber:@(0.001)];

formattedPercentage.textAlignment = NSTextAlignmentRight;
formattedPercentage.font = [UIFont systemFontOfSize:16];

self.attributedLabel.text = formattedPercentage.formattedAttributedString;
```

### Currency Font and Display for `FNMoney`

These can be changed via `currencyFont` and `currencyDisplay` properties. The defaults are as follows.

- `currencyFont`: `[UIFont systemFontOfSize:15]`
- `currencyDisplay`: `USD`

Example:

```
FNMoney *formattedMoney = [[FNMoney alloc] initWithNumber:@(1002.923389)];

formattedMoney.currencyFont = [UIFont boldSystemFontOfSize:16];
formattedMoney.currencyDisplay = @"SGD";

self.label.text = formattedMoney.formattedString;
```

## Contributing

Feel free to submit bugs, suggestions, or contribution through [pull requests](https://github.com/catcyborg/FormattedNumbers/pulls).

## License

FormattedNumbers is released under the [MIT License](http://www.opensource.org/licenses/MIT).
