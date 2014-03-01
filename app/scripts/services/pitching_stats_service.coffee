'use strict'

angular.module('sabermetricsApp')
.factory 'PitchingStatsService', ->
    # AngularJS will instantiate a singleton by calling "new" on this function

  class PitchingStatsService
    constructor: (pitcher) ->
      @ip = pitcher.ip
      @w = pitcher.w
      @l = pitcher.l
      @er = pitcher.er
      @hits = pitcher.hits
      @bf = pitcher.bf
      @bb = pitcher.bb
      @hb = pitcher.hb
      @sh = pitcher.sh
      @sf = pitcher.sf
      @interference = pitcher.interference

    era: ->
      @round @er*9/@ip

    oppAvg: ->
      @round @hits/(@bf - @bb - @hb - @sh - @sf - @interference)

    decisions: ->
      @w + @l

    whip: ->
      @round (@hits + @bb)/@ip

    winningPercentage: ->
      @round @w/@decisions()

    round: (num) ->
      Math.round(num*1000)/1000
