# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'dealerHand'
    .on 'finished', @gameOver, @
    @get 'playerHand'
    .on 'finished', @gameOver, @
    @on 'restartGame', @initialize, @

  gameOver: ->
    playerScore =
      @get 'playerHand'
      .scores()

    dealerScore =
      @get 'dealerHand'
      .scores()

    if playerScore > 21
      alert("You lost!")
    else if dealerScore > 21
      alert("You won!")
    else if playerScore > dealerScore
      alert("You won!")
    else if playerScore == dealerScore
      ("Draw")
    else
      alert("You lost")
    #debugger
    if confirm "Would you like to play again?"
      @trigger 'restartGame', @
    else
      @trigger 'dontPlayAgain', @

