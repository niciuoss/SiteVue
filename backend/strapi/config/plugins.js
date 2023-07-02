
module.exports = ({ env }) => ({
  email: {
    config: {
      provider: 'sendmail',
      providerOptions: {
        devPort: 1025,
        devHost: 'localhost'
      },
      settings: {
        defaultFrom: 'telite@mail.com',
        defaultReplyTo: 'telite-reply@gmail.com',
      },
    },
  },
  'strapi-plugin-populate-deep': {
    config: {
      defaultDepth: 3
    }
  },
  'transformer': {
    enabled: true,
    config: {
      prefix: '/api/',
      responseTransforms: {
        removeAttributesKey: true,
        removeDataKey: true,
      }
    }
  },
});


