'use strict'

describe 'Service: OffensiveStatsService', () ->

  # load the service's module
  beforeEach module 'sabermetricsApp'

  # instantiate service
  beforeEach inject (OffensiveStatsService) ->
    @hitterBoxScore =
      #Hank Aaron's stats
      ab: 12364
      hits: 3771
      doubles: 624
      triples: 98
      bb: 1402
      pa: 13941
      hr: 755
      tb: 6856
      hbp: 32
      sh: 21
      sf: 121
      interference: 1
      so: 1383
      sb: 240
      cs: 73

    @OffensiveStatsService = new OffensiveStatsService(@hitterBoxScore)

  xit 'adjustedProduction', ->
    #requires league average statistics

  it 'batting average', ->
    expect(@OffensiveStatsService.battingAverage()).toBe 0.305

  it 'base on balls percentage', ->
    expect(@OffensiveStatsService.bbPercentage()).toBe .101

  it 'homerun ratio', ->
    expect(@OffensiveStatsService.hrRatio()).toBe .061

  it 'isolated power', ->
    expect(@OffensiveStatsService.isolatedPower()).toBe .250

  it 'on base percentage', ->
    expect(@OffensiveStatsService.onBasePercentage()).toBe .374

  it 'slugging average', ->
    expect(@OffensiveStatsService.sluggingPercentage()).toBe .555

  it 'on base plus slugging', ->
    expect(@OffensiveStatsService.onBasePlusSlugging()).toBe .929

  it 'plate appearances', ->
    expect(@OffensiveStatsService.plateAppearances()).toBe @hitterBoxScore.pa

  it 'runs created', ->
    expect(@OffensiveStatsService.runsCreated()).toBe 2564

  it 'outs', ->
    expect(@OffensiveStatsService.outs()).toBe 8666

  it 'runs created per 25', ->
    expect(@OffensiveStatsService.runsCreatedPer25()).toBe 7.397

  it 'strikeout ratio', ->
    expect(@OffensiveStatsService.strikeoutRatio()).toBe .112

  it 'stolen base attempts', ->
    expect(@OffensiveStatsService.stolenBaseAttempts()).toBe 313

  it 'stolen base percentage', ->
    expect(@OffensiveStatsService.stolenBasePercentage()).toBe .767

  it 'stolen base runs', ->
    expect(@OffensiveStatsService.stolenBaseRuns()).toBe 28.2

  it 'total base percentage', ->
    expect(@OffensiveStatsService.totalBasePercentage()).toBe .377

  it 'total bases', ->
    expect(@OffensiveStatsService.totalBases()).toBe 6856

