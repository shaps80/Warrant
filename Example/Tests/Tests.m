//
//  SPXDataValidatorsTests.m
//  SPXDataValidatorsTests
//
//  Created by Shaps Mohsenin on 11/16/2014.
//  Copyright (c) 2014 Shaps Mohsenin. All rights reserved.
//

SPEC_BEGIN(InitialTests)

describe(@"Email Validator", ^{
  it(@"Should pass", ^{
    [[theValue(2) should] equal:theValue(2)];
  });
});

SPEC_END
