const mdsSdk = require('@maddonkeysoftware/mds-cloud-sdk-node');

const main = (input, context) => {
  // TODO: If the user is running inside of MDS Cloud these should not need to be populated. This
  // feature is currently not yet implemented so update this example once this is fixed.
  mdsSdk.initialize({
    identityUrl: 'http://mds-identity:8888',
    userId: context.userId,
    password: context.password,
    account: context.account,
    allowSelfSignCert: context.allowSelfSignCert,
    qsUrl: 'http://mds-qs:8888',
  });

  const qsClient = mdsSdk.getQueueServiceClient();
  return qsClient.enqueueMessage(context.queueId, input);
}

module.exports = {
  main,
};