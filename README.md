# gugel.my

## Setup: 

```bash
yarn
bin/rails db:create
bin/rails db:migrate
```

## Run

```bash
bin/dev
```

## Take control to your presence on the Internet

### Solving the problem of maintaining accounts on multiple platforms

#### Links

- Links are the fundamental of the internet.
- Every person who is on the internet should have a safe place they can call home.
- Social media platforms like Friendster, Facebook and Twitter initially was popular because of the impression that it has the potential to become that safe space. History has proven otherwise.
- Gugel.my wants to solve that problem for Malaysia.

#### Malaysia

- Malaysia is a very unique country.
- As digital citizens, we Malaysians are very quick adopters to new technologies (Read why Apple is opening it's store in Kuala Lumpur).
- 

## B2C SaaS Model

- As close to 100% paid user as possible
  - As low price as possible.
  - Lean operation


### Pricing Strategy

| Item                | Trial      | Basic    | Supporter               | Business   |
| ------------------- | ---------- | -------- | ----------------------- | ---------- |
| Price               | Free       | RM4/year | RM48/year or RM4/month  | RM48/year  |
| Account Maintenance | 30 days    | 1 year   | 1 Year or 30 days       | 1 year     |
| Features            | Restricted | Limited  | Essentials              | Expandable |
| Cost                | Minimal    | Minimal  | Bearable                | Expensive  |

## References

- https://learn.deanin.com/courses/build-a-linktree-on-rails


## IA

### User

- user has many links
- user can create groups, however group does not belong to a user
  - TODO: might need to add `creator_id` in group table
- user can be private or public

### Link

- link belongs to a user
- link belongs to a group

### Group

- group has may links
- group can have many users
  - users create and share / collaborate groups
  - TODO: this has not been built
- group can be private or public

