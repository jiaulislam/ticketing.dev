# ticketing.dev

A microservices-based ticketing platform built with Node.js, TypeScript, Prisma, and Kubernetes. This project demonstrates scalable service architecture, shared code, and modern DevOps practices.

## Project Structure

- **auth.ticketing.dev/**: Authentication service (user signup, login, JWT, Prisma ORM)
- **ticket.ticketing.dev/**: Ticket service (ticket list, create, Prisma ORM)
- **order.ticketing.dev/**: Ticket service (order list, create, Prisma ORM)
- **client.ticketing.dev/**: Frontend client (React or Next.js, not shown in detail here)
- **common.ticketing.dev/**: Shared TypeScript package for errors, events, and middlewares
- **infra/**: Kubernetes manifests for deployment and ingress
- **skaffold.yaml**: Skaffold config for local development and deployment

## Features

- Modular microservices architecture
- Centralized error handling and event contracts
- User authentication and session management
- Prisma ORM for database access
- TypeScript for type safety
- Dockerized services for portability
- Kubernetes for orchestration and scaling

## Getting Started

1. **Install dependencies**

   ```bash
   cd auth.ticketing.dev && npm install
   cd ../common.ticketing.dev && npm install
   # Repeat for other services
   ```

2. **Set up environment variables**
   - Configure your `.env` files for each service (e.g., database URLs)
3. **Run locally with Skaffold**

   ```bash
   skaffold dev
   ```

4. **Access services**
   - Auth service: [http://localhost:4000](http://localhost:4000)
   - Ticket service: [http://localhost:4001](http://localhost:4001)
   - Order service: [http://localhost:4002](http://localhost:4002)
   - Client service: [http://localhost:3000](http://localhost:3000)

## Development

- Use TypeScript for all services and shared code
- Use Prisma for database migrations and access
- Shared code is published from `common.ticketing.dev` and imported in other services
- Use Docker and Kubernetes for local and production deployments

## License

[MIT](./LICENSE)
