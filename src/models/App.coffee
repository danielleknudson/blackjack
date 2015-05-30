# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'dealerHand'
    .on 'finished', @checkWinner, @

  checkWinner: ->
    # if player hand is greater than dealers

    playerScore =
      @get 'playerHand'
      .scores()[0]

    dealerScore =
      @get 'dealerHand'
      .scores()[0]

    if playerScore > dealerScore
      alert("You won!")
    else if dealerScore > playerScore
      alert("You lost!")
    else if dealerScore == playerScore
      alert("Draw")

      # player won
    # else
      # dealer wins
      #


