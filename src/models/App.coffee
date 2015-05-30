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

  gameOver: ->
    playerScore =
      @get 'playerHand'
      .scores()[0]

    dealerScore =
      @get 'dealerHand'
      .scores()[0]

    if playerScore > dealerScore and playerScore <= 21
      alert("You won!")
    else if dealerScore > playerScore and dealerScore <= 21 || playerScore > 21
      alert("You lost!")
    else if dealerScore == playerScore and dealerScore <= 21 and playerScore <= 21
      alert("Draw")

    if confirm "Would you like to play again?"
      console.log(@get 'deck'
                  .reset() )
      # @set 'dealerHand',
      @trigger 'playAgain', @
    else
      @trigger 'dontPlayAgain', @

