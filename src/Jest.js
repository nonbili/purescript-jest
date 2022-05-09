// `void` is used here to suppress the Jest warning:
// > A "describe" callback must not return a value.
export const describe = name => fn => () => describe(name, () => void fn());

export const describeOnly = name => fn => () => describe.only(name, () => void fn());

export const describeSkip = name => fn => () => describe.skip(name, () => void fn());

export const test_ = name => fn => () => test(name, fn);

export const testOnly_ = name => fn => () => test.only(name, fn);

export const testSkip_ = name => fn => () => test.skip(name, fn);

export const expectToEqual_ = received => expected => () =>
  expect(received).toEqual(expected);

export const expectToNotEqual_ = received => expected => () =>
  expect(received).not.toEqual(expected);

export const expectToBeClose_ = received => expected => () =>
  expect(received).toBeCloseTo(expected);

export const expectToBeTrue_ = received => () => expect(received).toBe(true);

export const expectToBeFalse_ = received => () => expect(received).toBe(false);
