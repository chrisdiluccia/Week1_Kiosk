#import "CustomView.h"

@implementation CustomView


// This is a custom init need to be in the header
- (id)initWithFrame:(CGRect)frame placementNumber:(int)placementNum photo:(NSString *)fileName
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *photoView;
        photoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:fileName]];
        photoView.frame = CGRectMake(0, 0, frame.size.width * 0.8, frame.size.height * 0.8);
        // setting content mode will keep the aspect ratio of you image
        photoView.hidden = NO;
        
        [self addSubview:photoView];
        
        // Add a UILabel and set the text as "placementNum" 
        UILabel * placementLabel = [[UILabel alloc]initWithFrame:
                                CGRectMake(0, 0, frame.size.width * 0.3, frame.size.height * 0.3)];
        
        placementLabel.backgroundColor = [UIColor yellowColor];
        placementLabel.text = [NSString stringWithFormat: @"%i" , placementNum];
        placementLabel.textColor = [UIColor blackColor];
        
        [self addSubview:placementLabel];
        
    }
    return self;
}

@end
