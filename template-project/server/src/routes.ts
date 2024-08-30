import { Routing } from 'express-zod-api';
import { helloWorldEndpoint } from './endpoints';

export const routing: Routing = {
  '': helloWorldEndpoint,
};
