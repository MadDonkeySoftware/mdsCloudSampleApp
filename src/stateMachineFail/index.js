const mdsSdk = require('@maddonkeysoftware/mds-cloud-sdk-node');

const main = async (input, context) => {
  const qsClient = await mdsSdk.getQueueServiceClient();
  return qsClient.enqueueMessage(context.queueId, input);
}

module.exports = {
  main,
};