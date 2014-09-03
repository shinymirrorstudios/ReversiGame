//
//  GameBoardTestsIbjC.m
//  ReversiGame
//
//  Created by Steve Zutaut on 8/21/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GameBoard.h"
#import "ReversiBoard.h"

@interface GameBoardTestsObjC : XCTestCase {
  GameBoard *_board;
  ReversiBoard *_reversiBoard;
}

@end

@implementation GameBoardTestsObjC


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  _board = [[GameBoard alloc] init];
  _reversiBoard = [[ReversiBoard alloc]  init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_setCellState_withInvalidCoords_exceptionThrown {
  XCTAssertThrowsSpecificNamed([_board setCellState:BoardCellStateBlackPiece forColumn:10 andRow:7],
                               NSException,
                               NSRangeException,
                               @"Out-of-bounds board set should raise an exception");
  //XCTAssert(true, "Pass")
}

- (void)test_getCellState_withInvalidCoords_exceptionThrown {
  XCTAssertThrowsSpecificNamed([_board cellStateAtColumn:7 andRow:-10],
                               NSException,
                               NSRangeException,
                               @"Out-of-bounds board access should raise an exception");
}

- (void)test_makeMove_inPreGameState_nothingHappens {
  [_reversiBoard setToPreGameState];
  XCTAssertNoThrowSpecificNamed([_reversiBoard makeMoveToColumn:3 andRow:3],
                               NSException,
                               NSRangeException,
                               @"Making a move in the pre-game state should do nothing");
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
