//
//  QueryVisualVC.m
//  QuadTreePlusPlus
//
//  Created by joshua on 6/8/16.
//  Copyright © 2016 joshua. All rights reserved.
//  This Query visualtion should only query what it absolutely needs too
//  thus you may see strange rectangles upon querying, but note that if their are no children
//  in a given quad tree node than it will not query it as expected

#import "QueryVisualVC.h"
#include "QuadTree.hpp"

@interface QueryVisualVC ()

@end

@implementation QueryVisualVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) testQuadTree{
    // it can handle rects as well aka 400,760
    struct Algo::Rect sq = {0,0,400,400};
    
    Algo::QuadTree * head = new Algo::QuadTree(sq);
    
    struct Algo::QuadPoint<Precision> first = {200,200}; // make it right down the middle
    
    // so when it splits it splits the most
    struct Algo::QuadPoint<Precision> second = {55,39};
    struct Algo::QuadPoint<Precision> third = {180,170};
    struct Algo::QuadPoint<Precision> outOf = {480,370};
    struct Algo::QuadPoint<Precision> fith = {200,200};
    struct Algo::QuadPoint<Precision> six = {190,188};
    struct Algo::QuadPoint<Precision> sev = {290,188};
    struct Algo::QuadPoint<Precision> eight = {125,388};
    struct Algo::QuadPoint<Precision> nine = {129,388};
    struct Algo::QuadPoint<Precision> ten = {129,398};
    head->insert(first);
    head->insert(second);
    head->insert(third);
    head->insert(outOf);
    head->insert(fith);
    head->insert(six);
    head->insert(sev);
    head->insert(eight);
    head->insert(nine);
    head->insert(ten);
 
    /*
    head->remove(first);
    head->remove(second);
    head->remove(third);
    head->remove(outOf);
    head->remove(fith);
    head->remove(six);
    head->remove(sev);
    head->remove(eight);
    head->remove(nine);
    head->remove(ten);
   */

    typedef Algo::QuadPoint<Precision> QPoint;
    std::vector<QPoint> pointList;
    std::vector<Algo::Rect> subQueries;
    Algo::Rect queryRange = {100,100,250,290};
    Algo::QuadQuery::queryWithKeptIntersections(head, queryRange, pointList,subQueries);
    for(int i = 0; i < pointList.size(); i++){
        pointList[i].printSelf();
    }
   
    
    [self drawQuadTree:head];
    [self addSubQueryVisuals:&subQueries withOriginal:queryRange];
    
}
-(void) addSubQueryVisuals:(std::vector<Algo::Rect> *) rectList
              withOriginal:(Algo::Rect) queryRange{
    
    
    for(int i = 0; i < rectList->size();i++){
        [self drawQueryRect:(*rectList)[i]];

    }
}
-(void) drawQueryRect:(Algo::Rect) queryRange{
    
    UIView * queryRect = [self getRectAtLocation:queryRange.upperLeft.x withWhy:queryRange.upperLeft.y andWidth:queryRange.width andHeight:queryRange.height andColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0]];
    queryRect.layer.borderColor = [UIColor greenColor].CGColor;
    queryRect.layer.borderWidth = 2.2f;
    [self.view addSubview:queryRect];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
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
