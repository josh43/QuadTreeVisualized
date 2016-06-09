//
//  QuadVC.h
//  QuadTreePlusPlus
//
//  Created by joshua on 6/8/16.
//  Copyright © 2016 joshua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuadTree.hpp"
@interface QuadVC : UIViewController
-(void) drawQuadTree:(Algo::QuadTree *) tree;
-(UIView *) getQuadTreeRect:(Algo::Rect) s;
-(UIView *) getRectAtLocation:(int) x
                      withWhy:(int)y
                     andWidth:(int) width
                    andHeight:(int)height
                     andColor:(UIColor *) color;
-(UIView *) getPointAtLocation:(int) x
                       withWhy:(int)y
                      andColor:(UIColor *) color;
@end
