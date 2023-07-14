
exports.handler = async event => {
  console.log(`Mi numero par es: ${event.number}`);
  return {number: event.number}
};
