'use strict'

describe 'Service: PitchingStatsService', () ->

  # load the service's module
  beforeEach module 'sabermetricsApp'

  # instantiate service
  beforeEach inject (PitchingStatsService) ->
    @pitcher =
      ip: 3824.0
      w: 254
      l: 186
      er: 1657
      hits: 3567
      bf: 16120
      bb: 1390
      hb: 58
      sh: 0
      sf: 0
      interference: 0

    @PitchingStatsService = new PitchingStatsService(@pitcher)

  xit 'Adjusted Pitching Runs', ->
    #(Innings Pitched divided by 9) x (League ERA - ERA)

  xit 'Earned Run Average Plus', ->
    #League ERA (divided by) ERA

  xit 'Game Score', ->
    #Start with 50 points. Add 1 point for each out recorded, (3 points per inning). Add 2 points for each inning completed after the 4th. Add 1 point for each strikeout. Subtract 2 points for each hit allowed. Subtract 4 points for each earned run allowed. Subtract 2 points for each unearned run allowed. Subtract 1 point for each walk.

  it 'ERA', ->
    expect(@PitchingStatsService.era()).toBe 3.90

  it 'decisions', ->
    expect(@PitchingStatsService.decisions()).toBe 440

  it 'opposing batting average', ->
    expect(@PitchingStatsService.oppAvg()).toBe .243

  it 'walks and hits per inning', ->
    expect(@PitchingStatsService.whip()).toBe 1.296

  it 'winning percentage', ->
    expect(@PitchingStatsService.winningPercentage()).toBe .577
