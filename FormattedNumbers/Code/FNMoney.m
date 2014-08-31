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
#import "FNMoney.h"
#import "FNModel+Private.h"

@implementation FNMoney {
    NSString *_currencyDisplay;
}

+ (NSNumberFormatter *)formatter
{
    static dispatch_once_t onceToken;
    static NSNumberFormatter *_formatter;
    dispatch_once(&onceToken, ^{
        _formatter = [[NSNumberFormatter alloc] init];
        _formatter.numberStyle = NSNumberFormatterCurrencyStyle;
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
        self.currencyFont = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setCurrencyFont:(UIFont *)currencyFont
{
    if (!currencyFont) {
        currencyFont = [UIFont systemFontOfSize:15];
    }
    _currencyFont = currencyFont;
    _formattedAttributedString = nil;
}

- (void)setCurrencyDisplay:(NSString *)currencyDisplay
{
    _currencyDisplay = currencyDisplay;
    [self clearFormatting];
}

- (NSString *)currencyDisplayWithSpace
{
    if (self.currencyDisplay) {
        return [self.currencyDisplay stringByAppendingString:@" "];
    }
    return self.currencyDisplay;
}

- (NSString *)currencyDisplay
{
    if (_currencyDisplay) {
        return _currencyDisplay;
    }
    return @"USD";
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
    formatter.currencySymbol = [self currencyDisplayWithSpace];
    formatter.maximumFractionDigits = cutOff.numberOfDecimalPlaces;
    NSString *formatterFormat = [self.sign stringByAppendingString:cutOff.decimalFormat];
    formatter.positiveFormat = formatterFormat;
    formatter.negativeFormat = formatterFormat;

    // FIXME: Not sure how to make this work better...
    _formattedString = [[formatter stringFromNumber:@(fabs(numberAsDouble))] stringByAppendingString:suffix];
    return _formattedString;
}

- (void)addExtraAttributesToFormattedAttributedString:(NSMutableAttributedString *)attributedString forFormattedString:(NSString *)formattedString
{
    NSRange currencyRange = [formattedString rangeOfString:self.class.formatter.currencySymbol];
    if (currencyRange.length > 0) {
        [attributedString addAttributes:@{NSFontAttributeName: self.currencyFont} range:currencyRange];
    }
}

@end
