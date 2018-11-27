//
//  FirstView.m
//  XibViewWithXibView
//
//  Created by zsm on 2018/11/25.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView

+ (UIView *)loadXibView{
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"FirstView" owner:self options:nil];
    return [nibView lastObject];
}
- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    UIView *placeholderView =  (UIView *)self;
    if (((UIView *)self).subviews.count > 0) {
        return  placeholderView;
    }
    UIView *realView = [[self class] loadXibView];
    
    
    realView.tag = placeholderView.tag;
    realView.frame = placeholderView.frame;
    realView.bounds = placeholderView.bounds;
    realView.hidden = placeholderView.hidden;
    realView.clipsToBounds = placeholderView.clipsToBounds;
    realView.autoresizingMask = placeholderView.autoresizingMask;
    realView.userInteractionEnabled = placeholderView.userInteractionEnabled;
    realView.translatesAutoresizingMaskIntoConstraints = placeholderView.translatesAutoresizingMaskIntoConstraints;
    
    
    // Copy autolayout constrains.
    if (placeholderView.constraints.count > 0) {
        
        // We only need to copy "self" constraints (like width/height constraints)
        // from placeholder to real view
        for (NSLayoutConstraint *constraint in placeholderView.constraints) {
            
            NSLayoutConstraint* newConstraint;
            
            // "Height" or "Width" constraint
            // "self" as its first item, no second item
            if (!constraint.secondItem) {
                newConstraint =
                [NSLayoutConstraint constraintWithItem:realView
                                             attribute:constraint.firstAttribute
                                             relatedBy:constraint.relation
                                                toItem:nil
                                             attribute:constraint.secondAttribute
                                            multiplier:constraint.multiplier
                                              constant:constraint.constant];
            }
            // "Aspect ratio" constraint
            // "self" as its first AND second item
            else if ([constraint.firstItem isEqual:constraint.secondItem]) {
                newConstraint =
                [NSLayoutConstraint constraintWithItem:realView
                                             attribute:constraint.firstAttribute
                                             relatedBy:constraint.relation
                                                toItem:realView
                                             attribute:constraint.secondAttribute
                                            multiplier:constraint.multiplier
                                              constant:constraint.constant];
            }
            
            // Copy properties to new constraint
            if (newConstraint) {
                newConstraint.shouldBeArchived = constraint.shouldBeArchived;
                newConstraint.priority = constraint.priority;
                if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f) {
                    newConstraint.identifier = constraint.identifier;
                }
                [realView addConstraint:newConstraint];
            }
        }
    }
    return realView;
}
@end
