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

#import "FN.h"
#import "FNExample.h"
#import "FNTableViewController.h"
#import "FNExampleTableViewCell.h"
#import "FNExamplesTableViewController.h"

@interface FNExamplesTableViewController ()
@property (strong, nonatomic) NSArray *examples;
@end

@implementation FNExamplesTableViewController

- (FNExample *)fnMoneyExample
{
    return [[FNExample alloc]
            initWithName:@"FNMoney"
            summary:@"No Abbreviation"
            list:@[
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStyleNoSign],

                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStyleTriangleUpDown],

                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStyleNoSign],
                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStyleDefault],
                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStylePlusMinus],
                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStyleTriangleUpDown]
                   ]
            ];
}

- (FNExample *)fnMoneyExampleAbbreviated
{
    return [[FNExample alloc]
            initWithName:@"FNMoney"
            summary:@"Using Abbreviation"
            list:@[
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.1) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.1) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.12) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.12) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.123) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.123) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-0.1234) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(0.12345) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(1.12) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-1.12) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(10.1234) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-10.1234) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(12.44) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-12.44) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(103.123) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-103.123) signStyle:FNSignStyleNoSign abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(132.1) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-132.1) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(2312.1356) signStyle:FNSignStyleTriangleUpDown abbreviates:YES],

                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStyleNoSign abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStyleDefault abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStylePlusMinus abbreviates:YES],
                   [[FNMoney alloc] initWithNumber:@(-2312.1356) signStyle:FNSignStyleTriangleUpDown abbreviates:YES]
                   ]
            ];
}

- (FNExample *)fnPercentageExample
{
    return [[FNExample alloc]
            initWithName:@"FNPercentage"
            summary:@"No Abbreviation"
            list:@[
                   [[FNPercentage alloc] initWithNumber:@(0.001) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.001) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.001) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.001) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.001) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.001) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.001) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.001) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(0.0012) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.0012) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.0012) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.0012) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.0012) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.0012) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.0012) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.0012) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(0.00123) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.00123) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.00123) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.00123) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.00123) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.00123) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.00123) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.00123) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.001234) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.001234) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.001234) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.001234) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(0.0012345) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.0012345) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.0012345) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.0012345) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(0.0112) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.0112) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.0112) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.0112) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.0112) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.0112) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.0112) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.0112) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(0.10001234) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.10001234) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.10001234) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.10001234) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.10001234) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.10001234) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.10001234) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.10001234) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(0.1244) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(0.1244) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(0.1244) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(0.1244) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-0.1244) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-0.1244) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-0.1244) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-0.1244) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(1.03123) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(1.03123) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(1.03123) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(1.03123) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-1.03123) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-1.03123) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-1.03123) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-1.03123) signStyle:FNSignStyleNoSign],

                   [[FNPercentage alloc] initWithNumber:@(1.321) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(1.321) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(1.321) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(1.321) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-1.321) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-1.321) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-1.321) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-1.321) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(23.121356) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(23.121356) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(23.121356) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(23.121356) signStyle:FNSignStyleTriangleUpDown],

                   [[FNPercentage alloc] initWithNumber:@(-23.121356) signStyle:FNSignStyleNoSign],
                   [[FNPercentage alloc] initWithNumber:@(-23.121356) signStyle:FNSignStyleDefault],
                   [[FNPercentage alloc] initWithNumber:@(-23.121356) signStyle:FNSignStylePlusMinus],
                   [[FNPercentage alloc] initWithNumber:@(-23.121356) signStyle:FNSignStyleTriangleUpDown]
                   ]
            ];
}

- (FNExample *)fnQuantityExample
{
    return [[FNExample alloc]
            initWithName:@"FNQuantity"
            summary:@"No Abbreviation"
            list:@[
                   [[FNQuantity alloc] initWithNumber:@(1242312)],
                   [[FNQuantity alloc] initWithNumber:@(2312)],
                   [[FNQuantity alloc] initWithNumber:@(132)],
                   [[FNQuantity alloc] initWithNumber:@(84)],
                   [[FNQuantity alloc] initWithNumber:@(18)],
                   [[FNQuantity alloc] initWithNumber:@(1)],
                   [[FNQuantity alloc] initWithNumber:@(0)]
                   ]
            ];
}

- (FNExample *)fnQuantityExampleAbbreviated
{
    return [[FNExample alloc]
            initWithName:@"FNQuantity"
            summary:@"Using Abbreviation"
            list:@[
                   [[FNQuantity alloc] initWithNumber:@(900000000000000) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(39451242312) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(1242312) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(2312) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(132) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(84) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(18) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(1) abbreviates:YES],
                   [[FNQuantity alloc] initWithNumber:@(0) abbreviates:YES]
                   ]
            ];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushExample"]) {
        FNTableViewController *vc = segue.destinationViewController;
        vc.example = sender;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.examples = @[
                      self.fnQuantityExample,
                      self.fnQuantityExampleAbbreviated,
                      self.fnPercentageExample,
                      self.fnMoneyExample,
                      self.fnMoneyExampleAbbreviated
                      ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.examples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FNExampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FNExampleTableViewCell" forIndexPath:indexPath];
    cell.example = self.examples[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushExample" sender:self.examples[indexPath.row]];
}

@end
