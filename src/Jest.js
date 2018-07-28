exports.test_ = function(name, fn) {
  test(name, function() {
    fn();
  });
};

exports.expectToBe_ = function(eq) {
  return function(received, expected) {
    expect(received).toBe(expected);
  };
};
