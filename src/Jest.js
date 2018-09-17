exports.describe_ = function(name, fn) {
  describe(name, function() {
    fn();
  });
};

exports.describeOnly_ = function(name, fn) {
  describe.only(name, function() {
    fn();
  });
};

exports.describeSkip_ = function(name, fn) {
  describe.skip(name, function() {
    fn();
  });
};

exports.test_ = function(name, fn) {
  test(name, function() {
    fn();
  });
};

exports.testOnly_ = function(name, fn) {
  test.only(name, function() {
    fn();
  });
};

exports.testSkip_ = function(name, fn) {
  test.skip(name, function() {
    fn();
  });
};

exports.expectToEqual_ = function(Eq) {
  return function(received, expected) {
    if (!Eq.eq(received)(expected)) {
      console.error("Expected: ", expected);
      console.error("Received: ", received);
    }
    expect(Eq.eq(received)(expected)).toBe(true);
  };
};

exports.expectToNotEqual_ = function(Eq) {
  return function(received, expected) {
    if (Eq.eq(received)(expected)) {
      console.error("Expected: ", expected);
      console.error("Received: ", received);
    }
    expect(Eq.eq(received)(expected)).toBe(false);
  };
};

exports.expectToBeClose_ = function(received, expected) {
  expect(received).toBeCloseTo(expected);
};

exports.expectToBeTrue_ = function(received) {
  expect(received).toBe(true);
};

exports.expectToBeFalse_ = function(received) {
  expect(received).toBe(false);
};
