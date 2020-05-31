#import "UIViewController+Loud.h"
@implementation UIViewController (Loud)
+(BOOL)viewDidLoadClimb:(NSInteger)Climb sender:(NSValue *)value {
    return Climb % 15 == 0;
}

@end
