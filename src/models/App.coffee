# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'dealerHand'
    .on 'finished', @gameOver, @

  gameOver: ->
    console.log("asdf")
    console.log('playerHand: ', @get 'playerHand')

