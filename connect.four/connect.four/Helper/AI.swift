//
//  AI.swift
//  connect.four
//
//  Created by Cuong Nguyen Quoc on 21/08/2022.
//

import Foundation

func randomMode(hole: [Hole]) -> (Int, Int) {
    var col = Int.random(in: 0...6)
    while (hole[col] != .blank) {
        col = Int.random(in: 0...6)
    }
    var blankNum = 0
    while (hole[col] == .blank && col+7 <= 41 && hole[col+7] == .blank) {
        blankNum += 1
        col += 7
    }
    return (blankNum, col)
}

func aiEasyMode(hole: [Hole]) -> (Int, Int) {
    // check "|"
    for row in 0...2 {
        for col in 0...6 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+7] != .blank
                && hole[7*row+col+7] == hole[7*row+col+14]
                && hole[7*row+col+14] == hole[7*row+col+21]) {
                return (row, col)
            }
        }
    }
    // check "\" and drop at left
    for row in 0...2 {
        for col in 0...3 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+7] != .blank
                && hole[7*row+col+8] != .blank
                && hole[7*row+col+8] == hole[7*row+col+16]
                && hole[7*row+col+16] == hole[7*row+col+24]) {
                return (row, col)
            }
        }
    }
    // check "\" and drop at right
    for row in 0...2 {
        for col in 0...3 {
            if (hole[7*row+col] != .blank
                && hole[7*row+col] == hole[7*row+col+8]
                && hole[7*row+col+8] == hole[7*row+col+16]
                && hole[7*row+col+24] == .blank) {
                if(7*row+col+31<=41 && hole[7*row+col+31] != .blank) {
                    return (row, col)
                } else if(7*row+col+31>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "/" and drop at left
    for row in 0...2 {
        for col in 3...6 {
            if (hole[7*row+col] != .blank
                && hole[7*row+col] == hole[7*row+col+6]
                && hole[7*row+col+6] == hole[7*row+col+12]
                && hole[7*row+col+18] == .blank) {
                if(7*row+col+25<=41 && hole[7*row+col+25] != .blank) {
                    return (row, col)
                } else if(7*row+col+25>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "/" and drop at right
    for row in 0...2 {
        for col in 3...6 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+6] != .blank
                && hole[7*row+col+7] != .blank
                && hole[7*row+col+6] == hole[7*row+col+12]
                && hole[7*row+col+12] == hole[7*row+col+18]) {
                return (row, col)
            }
        }
    }
    var col = Int.random(in: 0...6)
    while (hole[col] != .blank) {
        col = Int.random(in: 0...6)
    }
    var blankNum = 0
    while (hole[col] == .blank && col+7 <= 41 && hole[col+7] == .blank) {
        blankNum += 1
        col += 7
    }
    return (blankNum, col)
}

func aiHardMode(hole: [Hole]) -> (Int, Int) {
    // check "|"
    for row in 0...2 {
        for col in 0...6 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+7] != .blank
                && hole[7*row+col+7] == hole[7*row+col+14]
                && hole[7*row+col+14] == hole[7*row+col+21]) {
                return (row, col)
            }
        }
    }
    // check "\" and drop at left
    for row in 0...2 {
        for col in 0...3 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+7] != .blank
                && hole[7*row+col+8] != .blank
                && hole[7*row+col+8] == hole[7*row+col+16]
                && hole[7*row+col+16] == hole[7*row+col+24]) {
                return (row, col)
            }
        }
    }
    // check "\" and drop at right
    for row in 0...2 {
        for col in 0...3 {
            if (hole[7*row+col] != .blank
                && hole[7*row+col] == hole[7*row+col+8]
                && hole[7*row+col+8] == hole[7*row+col+16]
                && hole[7*row+col+24] == .blank) {
                if(7*row+col+31<=41 && hole[7*row+col+31] != .blank) {
                    return (row, col)
                } else if(7*row+col+31>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "/" and drop at left
    for row in 0...2 {
        for col in 3...6 {
            if (hole[7*row+col] != .blank
                && hole[7*row+col] == hole[7*row+col+6]
                && hole[7*row+col+6] == hole[7*row+col+12]
                && hole[7*row+col+18] == .blank) {
                if(7*row+col+25<=41 && hole[7*row+col+25] != .blank) {
                    return (row, col)
                } else if(7*row+col+25>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "/" and drop at right
    for row in 0...2 {
        for col in 3...6 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+6] != .blank
                && hole[7*row+col+7] != .blank
                && hole[7*row+col+6] == hole[7*row+col+12]
                && hole[7*row+col+12] == hole[7*row+col+18]) {
                return (row, col)
            }
        }
    }
    // check "-" and drop at left to win
    for row in 0...5 {
        for col in 0...3 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+1] == .ai
                && hole[7*row+col+1] == hole[7*row+col+2]
                && hole[7*row+col+2] == hole[7*row+col+3]) {
                if(7*row+col+7<=41 && hole[7*row+col+7] != .blank) {
                    return (row, col)
                } else if(7*row+col+7>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "-" and drop at right to win
    for row in 0...5 {
        for col in 3...6 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col-1] == .ai
                && hole[7*row+col-1] == hole[7*row+col-2]
                && hole[7*row+col-2] == hole[7*row+col-3]) {
                if(7*row+col+7<=41 && hole[7*row+col+7] != .blank) {
                    return (row, col)
                } else if(7*row+col+7>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "-" and drop at left to prevent user win
    for row in 0...5 {
        for col in 0...4 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col+1] == .user
                && hole[7*row+col+1] == hole[7*row+col+2]) {
                if(7*row+col+7<=41 && hole[7*row+col+7] != .blank) {
                    return (row, col)
                } else if(7*row+col+7>41) {
                    return (row, col)
                }
            }
        }
    }
    // check "-" and drop at right to prevent user win
    for row in 0...5 {
        for col in 2...6 {
            if (hole[7*row+col] == .blank
                && hole[7*row+col-1] == .user
                && hole[7*row+col-1] == hole[7*row+col-2]) {
                if(7*row+col+7<=41 && hole[7*row+col+7] != .blank) {
                    return (row, col)
                } else if(7*row+col+7>41) {
                    return (row, col)
                }
            }
        }
    }
    
    var col = Int.random(in: 0...6)
    while (hole[col] != .blank) {
        col = Int.random(in: 0...6)
    }
    var blankNum = 0
    while (hole[col] == .blank && col+7 <= 41 && hole[col+7] == .blank) {
        blankNum += 1
        col += 7
    }
    return (blankNum, col)
}


func aiLogic(hole: [Hole], level: Level) -> (Int, Int) {
    if (level == .hard){
        return aiHardMode(hole: hole)
    }
    if (level == .easy){
        return aiEasyMode(hole: hole)
    }
    return randomMode(hole: hole)
}

