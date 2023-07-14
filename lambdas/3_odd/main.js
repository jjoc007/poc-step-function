
exports.handler = async event => {
  console.log(`Mi numero impar es: ${event.number}`);
  return {number: event.number}
};
