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
      bb: 1402
      pa: 13941
      hr: 755
      tb: 6856

    @OffensiveStatsService = new OffensiveStatsService(@hitterBoxScore)

  it 'calculates batting average', ->
    expect(@OffensiveStatsService.battingAverage()).toBe 0.305

  it 'calculates base on balls percentage', ->
    expect(@OffensiveStatsService.bbPercentage()).toBe .101

  it 'calculates homerun ratio', ->
    expect(@OffensiveStatsService.hrRatio()).toBe .061

  it 'cacluates isolated power', ->
    expect(@OffensiveStatsService.isolatedPower()).toBe .250

