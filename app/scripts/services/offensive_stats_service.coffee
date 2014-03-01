'use strict'

angular.module('sabermetricsApp')
.factory 'OffensiveStatsService', ->
  # AngularJS will instantiate a singleton by calling "new" on this function
  class OffensiveStatsService

    constructor: (hitter) ->
      @ab = hitter.ab
      @hits = hitter.hits
      @doubles = hitter.doubles
      @triples = hitter.triples
      @pa = hitter.pa
      @bb = hitter.bb
      @hr = hitter.hr
      @tb = hitter.tb
      @hbp = hitter.hbp
      @sh = hitter.sh
      @sf = hitter.sf
      @interference = hitter.interference
      @so = hitter.so
      @sb = hitter.sb
      @cs = hitter.cs

    battingAverage: ->
      @round @hits/@ab

    bbPercentage: ->
      @round @bb/@pa

    hrRatio: ->
      @round @hr/@ab

    isolatedPower: ->
      @round (@tb - @hits)/@ab

    onBasePercentage: ->
      @round (@hits + @bb + @hbp)/(@ab + @bb + @hbp + @sf)

    sluggingPercentage: ->
      @round (@totalBases())/@ab

    onBasePlusSlugging: ->
      @round (@onBasePercentage() + @sluggingPercentage())

    plateAppearances: ->
      @ab + @bb + @hbp + @sh + @sf + @interference

    runsCreated: ->
      Math.round(@onBasePercentage() * @tb)

    runsCreatedPer25: ->
      @round (@runsCreated()/@outs())*25

    strikeoutRatio: ->
      @round (@so/@ab)

    stolenBasePercentage: ->
      @round (@sb/@stolenBaseAttempts())

    totalBasePercentage: ->
      @round (@hits + @bb + @hbp)/(@ab + @bb + @hbp)

    totalBases: ->
      @singles() + 2*@doubles + 3*@triples + 4*@hr

    stolenBaseRuns: ->
      @round 0.3*@sb - 0.6*@cs

    singles: ->
      @hits - @doubles - @triples - @hr

    outs: ->
      @ab - @hits + @cs

    stolenBaseAttempts: ->
      @cs + @sb

