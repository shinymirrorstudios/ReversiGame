//
//  GameBoardTests.swift
//  ReversiGame
//
//  Created by Steve Zutaut on 8/21/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import XCTest

class GameBoardTests: XCTestCase {
  
  var _board : GameBoard! = nil
  var _reversiBoard : ReversiBoard! = nil
  
  override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
    _board = GameBoard()
  }
    
  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
  }

  func test_setAndGetCellState_setValidCell_celStateChanged() {
    _board.setCellState(BoardCellState.WhitePiece, forColumn:4, andRow:5);
    let retrievedState : BoardCellState = _board.cellStateAtColumn(4, andRow: 5)
    XCTAssertEqual(BoardCellState.WhitePiece, retrievedState, "The cell should be white!")
    //XCTAssert(true, "Pass")
  }
  
  func test_setBlackAndWhitePiece_clearCells_cellsCleared() {
    _board.setCellState(BoardCellState.BlackPiece, forColumn:4, andRow:5);
    _board.setCellState(BoardCellState.WhitePiece, forColumn:5, andRow:4);
    _board.clearBoard();
    let retrievedStateBlack : BoardCellState = _board.cellStateAtColumn(4, andRow: 5)
    let retrievedStateWhite : BoardCellState = _board.cellStateAtColumn(5, andRow: 4)
    XCTAssertEqual(BoardCellState.Empty, retrievedStateBlack, "The cell should be empty!")
    XCTAssertEqual(BoardCellState.Empty, retrievedStateWhite, "The cell should be empty!")
    //XCTAssert(true, "Pass")
  }

  func test_setBlackAndWhitePieces_countCellsWithState_correctCount() {
    _board.setCellState(BoardCellState.BlackPiece, forColumn:4, andRow:5)
    _board.setCellState(BoardCellState.BlackPiece, forColumn:3, andRow:5)
    _board.setCellState(BoardCellState.BlackPiece, forColumn:2, andRow:5)
    _board.setCellState(BoardCellState.WhitePiece, forColumn:5, andRow:4)
    _board.setCellState(BoardCellState.WhitePiece, forColumn:5, andRow:3)
    _board.setCellState(BoardCellState.WhitePiece, forColumn:5, andRow:2)
    _board.setCellState(BoardCellState.WhitePiece, forColumn:5, andRow:1)
    let retrievedCountBlack = _board.countCellsWithState(BoardCellState.BlackPiece)
    let retrievedCountWhite = _board.countCellsWithState(BoardCellState.WhitePiece)
    let retrievedCountEmpty = _board.countCellsWithState(BoardCellState.Empty)
    XCTAssertEqual(3, retrievedCountBlack, "The number of black cells should be 3!")
    XCTAssertEqual(4, retrievedCountWhite, "The number of white cells should be 4!")
    XCTAssertEqual(57, retrievedCountEmpty, "The number of empty cells should be 57!")
    //XCTAssert(true, "Pass")
  }
  
  //    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
