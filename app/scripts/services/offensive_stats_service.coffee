'use strict'

angular.module('sabermetricsApp')
.factory 'OffensiveStatsService', ->
  # AngularJS will instantiate a singleton by calling "new" on this function
  class OffensiveStatsService

    constructor: (hitterBoxScore) ->
      @ab = hitterBoxScore.ab
      @hits = hitterBoxScore.hits
      @pa = hitterBoxScore.pa
      @bb = hitterBoxScore.bb
      @hr = hitterBoxScore.hr
      @tb = hitterBoxScore.tb

    battingAverage: ->
      @round @hits/@ab

    bbPercentage: ->
      @round @bb/@pa

    hrRatio: ->
      @round @hr/@ab

    isolatedPower: ->
      @round (@tb - @hits)/@ab

    round: (num) ->
      Math.round(num*1000)/1000
