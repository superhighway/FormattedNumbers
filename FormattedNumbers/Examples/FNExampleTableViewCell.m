#import "FNExample.h"
#import "FNExampleTableViewCell.h"

@interface FNExampleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end

@implementation FNExampleTableViewCell

- (void)setExample:(FNExample *)example
{
    _example = example;
    self.headingLabel.text = example.name;
    self.summaryLabel.text = example.summary;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

@end
