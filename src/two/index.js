const main = (input, context) => {
  if (input && input.throwError === true) {
    throw new Error('Exception throw because input has attribute "throwError" with boolean value true.');
  }

  return Object.assign({}, input, { two: 2 }, context);
}

module.exports = {
  main,
};