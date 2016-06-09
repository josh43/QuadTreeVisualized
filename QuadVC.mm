//
//  QuadVC.m
//  QuadTreePlusPlus
//
//  Created by joshua on 6/8/16.
//  Copyright © 2016 joshua. All rights reserved.
//

#import "QuadVC.h"

//
//  QuadVC.m
//  Push
//
//  Created by joshua on 6/8/16.
//  Copyright © 2016 joshua. All rights reserved.
//


#include "QuadTree.hpp"
@interface QuadVC ()

@end
QuadTree * quadTree;

@implementation QuadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    
    
    // WEEE TOOK WAY LESS TIME THEN PREVIOUSLY THOUGH
    [self testQuadTree];
    //[self doTest];
}


-(void) testQuadTree{
    struct Square sq = {0,0,400};
    struct QuadTree * head = createQuadNode(sq);
    struct QuadPoint first = {150,150}; // make it right down the middle
    // so when it splits it splits the most
    struct QuadPoint second = {55,39};
    struct QuadPoint third = {180,170};
    struct QuadPoint outOf = {480,370};
    struct QuadPoint fith = {200,200};
    struct QuadPoint six = {190,188};
    insert(head,first);
    insert(head,second);
    insert(head,second);
    
    insert(head,third);
    insert(head,outOf);
    insert(head,fith);
    insert(head,six);
    
    [self drawQuadTree:head];
    
}
int numMainRects = 0;
-(void) drawQuadTree:(struct QuadTree *) tree{
    
    UIColor * blue = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    UIColor * red = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    
    printf("Num main rects  drawn :%d \n",numMainRects++);
    UIView * toAdd = [self getQuadTreeRect:tree->mySquare];
    [self.view addSubview:toAdd];
    
    for(int i = 0; i < 4; i ++){
        // add rect
        
        if(tree->children[i] != NULL){
            [self drawQuadTree:tree->children[i]];
            // draw it
        }else{
            // draw the point it has
            struct QuadPoint qPoint = tree->data;
            if(qPoint.x != SENTINEL){
                UIView * point = [self getPointAtLocation:qPoint.x withWhy:qPoint.y andColor:red];
                [self.view addSubview:point];
            }
            
        }
    }
    
    
}
-(void)doTest{
    
    int startX = 30; int startY = 30;
    int width = 300;
    struct Square s = {startX,startY,width};
    UIView * blueRect = [self getRectAtLocation:startX withWhy:startY andWidth:width  andColor:[UIColor colorWithRed:.1 green:.1 blue:1 alpha:1]];
    
    
    [self.view addSubview:blueRect];
    
    UIColor * green = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    UIColor * red = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    
    srand(5);
    
    for(int i = 0; i < 500; i ++){
        
        
        struct QuadPoint point = {rand() % (int)self.view.bounds.size.width,
            rand() % (int)self.view.bounds.size.height};
        
        if(contains(&s,&point)){
            UIView * pointToAdd = [self getPointAtLocation:point.x withWhy:point.y andColor:green];
            [self.view addSubview:pointToAdd];
        }else{
            UIView * pointToAdd = [self getPointAtLocation:point.x withWhy:point.y andColor:red];
            [self.view addSubview:pointToAdd];
        }
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIView *) getQuadTreeRect:(struct Square) s{
    // blue c olor
    UIView  * v1 = [self getRectAtLocation:s.upperLeft.x withWhy:s.upperLeft.y andWidth:s.width andColor:[UIColor colorWithRed:.1 green:.1 blue:1 alpha:1]];
    
    v1.layer.borderColor = [UIColor blackColor].CGColor;
    v1.layer.borderWidth = 2.0f;
    
    return v1;
}
-(UIView *) getRectAtLocation:(int) x
                      withWhy:(int)y
                     andWidth:(int) width
                     andColor:(UIColor *) color{
    
    
    UIView* v1 = [[UIView alloc] initWithFrame:CGRectMake(x, y,width,width)];
    v1.backgroundColor = color;
    
    
    return v1;
}
-(UIView *) getPointAtLocation:(int) x
                       withWhy:(int)y
                      andColor:(UIColor *) color{
    
    // points will be small rect squares
    UIView* v1 = [[UIView alloc] initWithFrame:CGRectMake(x, y,5,5)];
    v1.backgroundColor = color;
    
    
    return v1;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
