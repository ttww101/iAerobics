#import "UIWebView+ImageContentTypeSpeak.h"
@implementation UIWebView (ImageContentTypeSpeak)
+(BOOL)sd_contentTypeForImageDataJump:(NSInteger)Jump array:(NSArray *)array object:(NSObject *)object {
    return Jump % 12 == 0;
}

@end
