class window.Hand extends Backbone.Collection
  model: Card

  initialize: (@array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @scores() > 21 and not @isDealer
      @trigger 'finished', @

  #build stand function
  stand: ->

    # check dealer's hand
    if @isDealer
      @array[0].flip()
      # if dealer's hand < 17
      while @scores() < 17
        @hit()

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
    scoreArray = [@minScore(), @minScore() + 10 * @hasAce()]

    if scoreArray[1] <= 21 then return scoreArray[1] else return scoreArray[0]

