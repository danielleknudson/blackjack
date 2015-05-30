class window.Hand extends Backbone.Collection
  model: Card

  initialize: (@array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @scores()[0] > 21
      alert("Game OVER")
    console.log(@scores())
      #game over... this means we do something... like clear score and reset deck


  #build stand function
  stand: ->
    console.log("is dealer: " + @isDealer)
    console.log(@scores())



    # check dealer's hand
    if @isDealer
      @array[0].flip()
      # if dealer's hand < 17
      while @scores()[0] < 17
        @hit()
        console.log(@scores()[0])

      # compare dealer and player hands
        # if player hand is greater than dealers
          # player won
        # else
          # dealer wins
          #
    @trigger 'finished', @

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]



