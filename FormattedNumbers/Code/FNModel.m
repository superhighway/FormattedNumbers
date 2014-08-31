/*
 The MIT License (MIT)

 Copyright (c) 2014 Cat Cyborg

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

// https://github.com/catcyborg/FormattedNumbers

#import "FC.h"
#import "FNPercentage.h"
#import "FNModel+Private.h"



@implementation FNModel

+ (NSNumberFormatter *)formatter
{
    static dispatch_once_t onceToken;
    static NSNumberFormatter *_formatter;
    dispatch_once(&onceToken, ^{
        _formatter = [[NSNumberFormatter alloc] init];
        _formatter.numberStyle = NSNumberFormatterDecimalStyle;
        _formatter.locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
        _formatter.minimumFractionDigits = 0;
        _formatter.notANumberSymbol = @"";
    });
    return _formatter;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.abbreviates = NO;
        self.roundingCutOffs = @[
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:1000 numberOfDecimalPlaces:0 decimalFormat:@"¤#,##0"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:100 numberOfDecimalPlaces:1 decimalFormat:@"¤#,##0.#"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:10 numberOfDecimalPlaces:2 decimalFormat:@"¤#,##0.##"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:1 numberOfDecimalPlaces:3 decimalFormat:@"¤#,##0.###"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:0 numberOfDecimalPlaces:4 decimalFormat:@"¤#,##0.####"]
                                 ];

        self.neutralSign = @"";
        self.neutralColor = [UIColor colorWithWhite:0.2 alpha:1];
        self.positiveColor = [UIColor greenColor];
        self.negativeColor = [UIColor redColor];

        self.textAlignment = NSTextAlignmentLeft;
        self.font = [UIFont systemFontOfSize:15];

        self.signStyle = FNSignStylePlusMinus;
        self.abbreviationCutOffs = @[
                                     [FNAbbreviationCutOff billionsAbbreviation],
                                     [FNAbbreviationCutOff millionsAbbreviation],
                                     [FNAbbreviationCutOff thousandsAbbreviation],
                                     ];
    }
    return self;
}

- (id)initWithNumber:(NSNumber *)number
{
    self = [self init];
    if (self) {
        self.number = number;
    }
    return self;
}

- (id)initWithNumber:(NSNumber *)number
         abbreviates:(BOOL)abbreviates
{
    self = [self initWithNumber:number];
    if (self) {
        self.abbreviates = abbreviates;
    }
    return self;
}

- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
{
    self = [self initWithNumber:number];
    if (self) {
        self.signStyle = signStyle;
    }
    return self;
}

- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
         abbreviates:(BOOL)abbreviates
{
    self = [self initWithNumber:number
                      signStyle:signStyle];
    if (self) {
        self.abbreviates = abbreviates;
    }
    return self;
}

- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
       higlightStyle:(FNHighlightStyle)highlightStyle
{
    self = [self initWithNumber:number signStyle:signStyle];
    if (self) {
        self.highlightStyle = highlightStyle;
    }
    return self;
}

- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
       higlightStyle:(FNHighlightStyle)highlightStyle
         abbreviates:(BOOL)abbreviates
{
    self = [self initWithNumber:number
                      signStyle:signStyle
                  higlightStyle:highlightStyle];
    if (self) {
        self.abbreviates = abbreviates;
    }
    return self;
}

- (double)signIndicatorValue
{
    return self.number.doubleValue;
}

- (UIColor *)textColor
{
    double num = self.signIndicatorValue;
    if (num > 0) {
        return self.positiveColor;
    } else if (num < 0) {
        return self.negativeColor;
    }
    return self.neutralColor;
}

- (NSString *)sign
{
    double num = self.signIndicatorValue;
    if (num > 0) {
        return self.positiveSign;
    } else if (num < 0) {
        return self.negativeSign;
    }
    return self.neutralSign;
}

- (NSString *)spacedSign
{
    NSString *sign = self.sign;
    if (!sign || sign.length == 0) {
        return @"";
    }
    return [self.sign stringByAppendingString:@" "];
}

- (void)setAbbreviates:(BOOL)abbreviates
{
    _abbreviates = abbreviates;
    [self clearFormatting];
}

- (void)setNumber:(NSNumber *)number
{
    _number = number;
    [self clearFormatting];
}

- (void)setPositiveColor:(UIColor *)positiveColor
{
    _positiveColor = positiveColor;
    _formattedAttributedString = nil;
}

- (void)setNegativeColor:(UIColor *)negativeColor
{
    _negativeColor = negativeColor;
    _formattedAttributedString = nil;
}

- (void)setNeutralColor:(UIColor *)neutralColor
{
    _neutralColor = neutralColor;
    _formattedAttributedString = nil;
}

- (void)setRoundingCutOffs:(NSArray *)roundingCutOffs
{
    _roundingCutOffs = roundingCutOffs;
    [self clearFormatting];
}

- (void)setHighlightStyle:(FNHighlightStyle)highlightStyle
{
    _highlightStyle = highlightStyle;
    [self clearFormatting];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textAlignment = textAlignment;
    _formattedAttributedString = nil;
}

- (void)setFont:(UIFont *)font
{
    if (!font) {
        font = [UIFont systemFontOfSize:15];
    }
    _font = font;
    _formattedAttributedString = nil;
}

- (void)setSignStyle:(FNSignStyle)signStyle
{
    _signStyle = signStyle;
    [self clearFormatting];
    switch (signStyle) {
        case FNSignStyleNoSign: {
            self.positiveSign = @"";
            self.negativeSign = @"";
            break;
        }
        case FNSignStylePlusMinus: {
            self.positiveSign = @"+";
            self.negativeSign = @"-";
            break;
        }
        case FNSignStyleDefault: {
            self.positiveSign = @"";
            self.negativeSign = @"-";
            break;
        }
        case FNSignStyleTriangleUpDown: {
            self.positiveSign = @"▲";
            self.negativeSign = @"▼";
            break;
        }

        default:
            break;
    }
}

- (void)clearFormatting
{
    _formattedAttributedString = nil;
    _formattedString = nil;
}

- (NSArray *)roundingCutOffForNumber:(double)number
{
    double absolute = fabs(number);
    // assume cutoffs are sorted descending
    for (FNRoundingCutOff *cutOff in self.roundingCutOffs) {
        if (absolute >= cutOff.minimumAbsoluteValue) {
            return @[@(number/cutOff.minimumAbsoluteValue), cutOff];
        }
    }
    return nil;
}

- (NSArray *)abbreviationCutOffForNumber:(double)number
{
    double absolute = fabs(number);
    // assume cutoffs are sorted descending
    for (FNAbbreviationCutOff *cutOff in self.abbreviationCutOffs) {
        if (absolute >= cutOff.minimumAbsoluteValue) {
            return @[@(number/cutOff.minimumAbsoluteValue), cutOff];
        }
    }
    return nil;
}

- (NSString *)formattedString
{
    if (_formattedString) {
        return _formattedString;
    }

    if (!self.number) {
        _formattedString = NSLocalizedString(@"N/A", nil);
        return _formattedString;
    }

    double numberAsDouble = self.number.doubleValue;
    NSString *suffix = @"";
    if (self.abbreviates) {
        NSArray *abbreviation = [self abbreviationCutOffForNumber:numberAsDouble];
        if (abbreviation) {
            numberAsDouble = [abbreviation.firstObject doubleValue];
            suffix = [abbreviation.lastObject symbol];
        }
    }

    FNRoundingCutOff *cutOff = [[self roundingCutOffForNumber:numberAsDouble] lastObject];
    NSNumberFormatter *formatter = self.class.formatter;
    formatter.maximumFractionDigits = cutOff.numberOfDecimalPlaces;
    NSString *sign = self.spacedSign;
    formatter.positivePrefix = sign;
    formatter.negativePrefix = sign;

    // FIXME: Not sure how to make this work better...
    _formattedString = [[formatter stringFromNumber:@(fabs(numberAsDouble))] stringByAppendingString:suffix];
    return _formattedString;
}

- (NSAttributedString *)attributedSign
{
    double num = self.signIndicatorValue;
    if (num > 0) {
        return [[NSAttributedString alloc] initWithString:self.positiveSign
                                               attributes:@{NSForegroundColorAttributeName: self.positiveColor}];
    } else if (num < 0) {
        return [[NSAttributedString alloc] initWithString:self.negativeSign
                                               attributes:@{NSForegroundColorAttributeName: self.negativeColor}];
    }
    return [[NSAttributedString alloc] initWithString:self.neutralSign
                                           attributes:@{NSForegroundColorAttributeName: self.neutralColor}];
}

- (NSAttributedString *)formattedAttributedString
{
    if (_formattedAttributedString) {
        return _formattedAttributedString;
    }

    if (!self.number) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentRight;
        _formattedAttributedString = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"N/A", nil) attributes:@{
                                                                                                                            NSParagraphStyleAttributeName: paragraphStyle,
                                                                                                                            NSFontAttributeName: self.font,
                                                                                                                            NSForegroundColorAttributeName: self.neutralColor
                                                                                                                            }];
        return _formattedAttributedString;
    }

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = self.textAlignment;
    NSMutableDictionary *wholeTextAttributes = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                                 NSFontAttributeName: self.font,
                                                                                                 NSParagraphStyleAttributeName: paragraphStyle                            }];
    NSMutableDictionary *signAttributes = [[NSMutableDictionary alloc] init];
    switch (self.highlightStyle) {
        case FNHighlightStyleNoHighlight:
            wholeTextAttributes[NSForegroundColorAttributeName] = self.neutralColor;
            break;
        case FNHighlightStyleSignOnly:
            signAttributes[NSForegroundColorAttributeName] = self.textColor;
            wholeTextAttributes[NSForegroundColorAttributeName] = self.neutralColor;
            break;
        case FNHighlightStyleWholeText:
            wholeTextAttributes[NSForegroundColorAttributeName] = self.textColor;
            break;
        default:
            break;
    }

    NSString *formattedString = self.formattedString;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:formattedString
                                                                                         attributes:wholeTextAttributes];
    if (signAttributes.count > 0) {
        NSRange signRange = [formattedString rangeOfString:self.sign];
        if (signRange.length > 0) {
            [attributedString addAttributes:signAttributes range:signRange];
        }
    }

    [self addExtraAttributesToFormattedAttributedString:attributedString forFormattedString:formattedString];

    _formattedAttributedString = attributedString;
    return _formattedAttributedString;
}

- (void)addExtraAttributesToFormattedAttributedString:(NSMutableAttributedString *)attributedString forFormattedString:(NSString *)formattedString
{
}

@end
