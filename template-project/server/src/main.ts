import { createConfig, createServer } from 'express-zod-api';
import { routing } from './routes';

const config = createConfig({
  server: {
    listen: process.env.PORT ? Number(process.env.PORT) : 3000,
  },
  cors: true,
  logger: { level: 'debug', color: true },
});

createServer(config, routing);
