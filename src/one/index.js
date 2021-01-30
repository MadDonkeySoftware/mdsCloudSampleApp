const delay = (timeout) => new Promise((resolve) => setTimeout(resolve, timeout));

const main = (input) => {
  return delay(2000).then(() => Object.assign({}, input, { one: 1 }));
}

module.exports = {
  main,
};
