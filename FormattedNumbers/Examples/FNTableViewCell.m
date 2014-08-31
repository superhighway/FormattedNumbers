#import "FNMoney.h"
#import "FNTableViewCell.h"

@interface FNTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *unformattedLabel;
@property (weak, nonatomic) IBOutlet UILabel *formattedPlainLabel;
@property (weak, nonatomic) IBOutlet UILabel *formattedAttributedLabel;

@end

@implementation FNTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)bindWithFNModel:(FNModel *)model {
    self.unformattedLabel.text = model.number.stringValue;
    self.formattedPlainLabel.text = model.formattedString;

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"" attributes:@{}];

    model.highlightStyle = FNHighlightStyleNoHighlight;
    [attributedString appendAttributedString:model.formattedAttributedString];
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@" | "]];

    model.highlightStyle = FNHighlightStyleSignOnly;
    [attributedString appendAttributedString:model.formattedAttributedString];
    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@" | "]];

    model.highlightStyle = FNHighlightStyleWholeText;
    [attributedString appendAttributedString:model.formattedAttributedString];

    self.formattedAttributedLabel.attributedText = attributedString;
}

@end
