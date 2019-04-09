exports.describe_ = function(name, fn) {
  describe(name, fn);
};

exports.describeOnly_ = function(name, fn) {
  describe.only(name, fn);
};

exports.describeSkip_ = function(name, fn) {
  describe.skip(name, fn);
};

exports.test_ = function(name, fn) {
  test(name, fn);
};

exports.testOnly_ = function(name, fn) {
  test.only(name, fn);
};

exports.testSkip_ = function(name, fn) {
  test.skip(name, fn);
};

exports.expectToEqual_ = function() {
  return function(received, expected) {
    expect(received).toEqual(expected);
  };
};

exports.expectToNotEqual_ = function() {
  return function(received, expected) {
    expect(received).not.toEqual(expected);
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
