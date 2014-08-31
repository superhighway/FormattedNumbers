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

@implementation FNPercentage

+ (NSNumberFormatter *)formatter
{
    static dispatch_once_t onceToken;
    static NSNumberFormatter *_formatter;
    dispatch_once(&onceToken, ^{
        _formatter = [[NSNumberFormatter alloc] init];
        _formatter.numberStyle = NSNumberFormatterPercentStyle;
        _formatter.locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
        _formatter.minimumFractionDigits = 0;
    });
    return _formatter;
}

- (id)init {
    self = [super init];
    if (self) {
        // formatter accepts fraction then convert it to percentage
        self.roundingCutOffs = @[
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:10 numberOfDecimalPlaces:0 decimalFormat:@"¤#,##0"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:1 numberOfDecimalPlaces:1 decimalFormat:@"¤#,##0.#"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:0.1 numberOfDecimalPlaces:2 decimalFormat:@"¤#,##0.##"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:0.01 numberOfDecimalPlaces:3 decimalFormat:@"¤#,##0.###"],
                                 [[FNRoundingCutOff alloc] initWithMinimumAbsoluteValue:0 numberOfDecimalPlaces:4 decimalFormat:@"¤#,##0.####"]
                                 ];
    }
    return self;
}

// Disable this for now
- (NSArray *)abbreviationCutOffForNumber:(double)number
{
    return nil;
}

@end
