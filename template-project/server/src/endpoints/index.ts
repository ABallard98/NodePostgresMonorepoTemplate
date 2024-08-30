import { z } from 'zod';
import { defaultEndpointsFactory } from 'express-zod-api';

export const helloWorldEndpoint = defaultEndpointsFactory.build({
  method: 'get',
  input: z.object({}),
  output: z.object({
    message: z.string(),
  }),
  handler: async ({ input, options, logger }) => {
    return {
      message: 'hello world',
    };
  },
});
