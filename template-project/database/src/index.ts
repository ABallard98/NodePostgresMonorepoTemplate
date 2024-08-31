import { PrismaClient } from '../generated'

export * from '../generated';
export type TransactionClient = Parameters<
    Parameters<PrismaClient['$transaction']>[0]
>[0];