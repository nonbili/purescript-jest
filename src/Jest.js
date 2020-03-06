// `void` is used here to suppress the Jest warning:
// > A "describe" callback must not return a value.
exports.describe = name => fn => () => describe(name, () => void fn());

exports.describeOnly = name => fn => () => describe.only(name, () => void fn());

exports.describeSkip = name => fn => () => describe.skip(name, () => void fn());

exports.test_ = name => fn => () => test(name, fn);

exports.testOnly_ = name => fn => () => test.only(name, fn);

exports.testSkip_ = name => fn => () => test.skip(name, fn);

exports.expectToEqual_ = received => expected => () =>
  expect(received).toEqual(expected);

exports.expectToNotEqual_ = received => expected => () =>
  expect(received).not.toEqual(expected);

exports.expectToBeClose_ = received => expected => () =>
  expect(received).toBeCloseTo(expected);

exports.expectToBeTrue_ = received => () => expect(received).toBe(true);

exports.expectToBeFalse_ = received => () => expect(received).toBe(false);
