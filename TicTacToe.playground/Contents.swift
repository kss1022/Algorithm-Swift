import Foundation



final class TicTakToe{
    
    static let BOARD_SIZE = 9
    
    
    
    static func getBestMoveIndex( board : [Player?] , player : Player) -> Int{
        assert (board.count == BOARD_SIZE);
        let opponent = ( player == .O) ? Player.X : Player.O
        
        let  move = getBestMoveRecursive(board: board, player: player, opponent: opponent, turn: player)
        return move.index
    }
    
    private static func getBestMoveRecursive(board : [Player?], player : Player , opponent : Player , turn : Player) -> Move{
        assert(board.count == BOARD_SIZE)
        
        
        //lose
        if hasWon(board: board, player: opponent){
            return Move(index: -1, score: -10)
        }
        
        //win
        if hasWon(board: board, player: player){
            return Move(index: -1, score: 10)
        }
        
        //draw
        let emptyIndexes = getEmptyIndex(board: board)
        if emptyIndexes.isEmpty{
            return Move(index: -1, score: 0)
        }
        
        
        
        var moves = [Move]()
        emptyIndexes.forEach { index in
            var newBoard = board
            
            newBoard[index] = turn
            
            let nextPlayer = (turn == player) ? opponent : player
            let score =  getBestMoveRecursive(board: newBoard, player: player, opponent: opponent, turn: nextPlayer)
            
            let move = Move(index: index, score: score.score)
            moves.append(move)
        }
        if turn == player{
            //최대값
            let max =  moves.max { $0.score < $1.score }
            return max!
        }
        
        //최소값
        let min =  moves.min { $0.score < $1.score }
        
        return min!
    }
    
    private static func getEmptyIndex(board : [Player?]) -> [Int]{
        assert (board.count == BOARD_SIZE)
        
        var indexes = [Int]()
        
        
        board.enumerated().forEach {
            if $0.element == nil{
                indexes.append($0.offset)
            }
        }
        
        
        return indexes
    }
    
    
    private static func hasWon( board : [Player?], player : Player) -> Bool{
        assert(board.count == BOARD_SIZE)
        
        // 0 1 2
        // 3 4 5
        // 6 7 8
        return ( board[0] == player && board[1] == player && board[2] == player ) ||
        ( board[3] == player && board[4] == player && board[5] == player ) ||
        ( board[6] == player && board[7] == player && board[8] == player ) ||
        ( board[0] == player && board[3] == player && board[6] == player ) ||
        ( board[1] == player && board[4] == player && board[7] == player ) ||
        ( board[2] == player && board[5] == player && board[8] == player ) ||
        ( board[0] == player && board[4] == player && board[8] == player ) ||
        ( board[2] == player && board[4] == player && board[6] == player )
    }
    
}



enum Player{
    case O
    case X
}

//win : 10 , lose : -10 , draw : 0
struct Move{
    let index : Int
    let score : Int
}




//let board : [Player?] = [
//    nil , nil , nil,
//    nil, nil , nil,
//    nil, nil, nil
//]
//let index = Tictaktoe.getBestMoveIndex(board: board, player: .X)
//
//print(index)

let board2  : [Player?] = [
    nil , .O , .X,
    .X, .O , .O,
    nil, nil, .X
]

let index2 = TicTakToe.getBestMoveIndex(board: board2, player: .X)
print(index2)


let board3 : [Player?] = [
    .O , nil, .X,
    .X , nil, .X,
    nil , .O , .O
]
let index3 = TicTakToe.getBestMoveIndex(board: board3, player: .X)
print(index3)

