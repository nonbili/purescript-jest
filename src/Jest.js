exports.test_ = function(name, fn) {
  test(name, function() {
    fn();
  });
};

exports.expectToEqual_ = function(Eq) {
  return function(received, expected) {
    expect(Eq.eq(received, expected)).toBeTruthy();
  };
};
