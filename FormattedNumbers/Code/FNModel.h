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

typedef NS_ENUM(NSInteger, FNSignStyle) {
    FNSignStyleNoSign = -1,
    FNSignStyleDefault,
    FNSignStylePlusMinus,
    FNSignStyleTriangleUpDown
};

typedef NS_ENUM(NSInteger, FNHighlightStyle) {
    FNHighlightStyleNoHighlight = -1,
    FNHighlightStyleWholeText,
    FNHighlightStyleSignOnly
};


@interface FNModel : NSObject
@property (strong, nonatomic) NSNumber *number;
@property (nonatomic) FNSignStyle signStyle;
@property (nonatomic) FNHighlightStyle highlightStyle;
@property (nonatomic) NSTextAlignment textAlignment;
@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) NSArray *roundingCutOffs;
@property (strong, nonatomic) NSArray *abbreviationCutOffs;

@property (nonatomic) BOOL abbreviates;

@property (strong, nonatomic) UIColor *positiveColor;
@property (strong, nonatomic) UIColor *negativeColor;
@property (strong, nonatomic) UIColor *neutralColor;

@property (nonatomic, readonly) NSString *formattedString;
@property (nonatomic, readonly) NSAttributedString *attributedSign;
@property (nonatomic, readonly) NSAttributedString *formattedAttributedString;

@property (nonatomic, readonly) NSString *sign;
@property (nonatomic, readonly) UIColor *textColor;

- (id)initWithNumber:(NSNumber *)number;
- (id)initWithNumber:(NSNumber *)number
         abbreviates:(BOOL)abbreviates;

- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle;
- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
         abbreviates:(BOOL)abbreviates;

- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
       higlightStyle:(FNHighlightStyle)highlightStyle;
- (id)initWithNumber:(NSNumber *)number
           signStyle:(FNSignStyle)signStyle
       higlightStyle:(FNHighlightStyle)highlightStyle
         abbreviates:(BOOL)abbreviates;

@end
