# gugel.my

Welcome to **Gugel.my**, the ultimate link-in-bio platform designed with love for Malaysian customers! Think of us as your very own personalized link manager, much like Bitly, but tailored just for you. And guess what? We offer this amazing service as a paid, hosted solution so you can focus on what you do best.

## Table of Contents

- [gugel.my](#gugelmy)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Core Values](#core-values)
  - [Use Cases](#use-cases)
  - [B2C SaaS Model](#b2c-saas-model)
  - [Membership](#membership)
  - [Sign Up](#sign-up)
  - [Setup](#setup)
    - [Prerequisites](#prerequisites)
  - [Run](#run)
  - [TODO](#todo)

## Features

- **Customizable Bio Page:** Create a stunning bio page that showcases your links, social profiles, and websites.
- **Link Management:** Shorten, track, and manage your links effortlessly.
- **Analytics:** Gain valuable insights with our comprehensive link performance analytics.
- **Localization:** Fully localized for Malaysia, including support for Bahasa Malaysia.
- **Responsive Design:** Your bio page will look fantastic on any device, big or small.

## Core Values

At Gugel.my, we believe in:

- **Empowerment:** Giving you the tools to present yourself in the best light.
- **Innovation:** Continuously improving to provide you with the latest and greatest features.
- **Community:** Supporting and celebrating our Malaysian users.

## Use Cases

Gugel.my is perfect for:

- **Influencers:** Showcase all your social media links in one place.
- **Small Businesses:** Drive traffic to your website and online stores.
- **Freelancers:** Create a professional online presence.
- **Event Planners:** Share event details and ticket links seamlessly.

## B2C SaaS Model

- As close to 100% paid user as possible
  - As low price as possible.
  - Lean operation

## Membership

We offer competitive membership plans designed to fit your needs:

| Item                | Trial      | Basic       | Supporter                  | Business   |
| ------------------- | ---------- | ----------- | -------------------------- | ---------- |
| Price               | Free       | RM5.80/year | RM38/year or RM5.80/month  | RM88/year  |
| Account Maintenance | 30 days    | 1 year      | 1 Year or 30 days          | 1 year     |
| Features            | Restricted | Limited     | Essentials                 | Expandable |
| Cost                | Minimal    | Minimal     | Bearable                   | Affordable |

Check out our [pricing page](#) for detailed information.

## Sign Up

Ready to join the Gugel.my family? [Sign up](#) today and start managing your links like a pro!

## Setup

### Prerequisites

- Ruby (version 3.2.2)
- Rails (version 7.0.5)
- PostgreSQL

1. Clone the repository:
    ```sh
    git clone https://github.com/rudzainy/ranting.git
    cd ranting
    ```

2. Install dependencies:
    ```sh
    yarn
    bundle install
    ```

3. Set up the database:
    ```sh
    bin/rails db:create
    bin/rails db:migrate
    ```

## Run

Start the development server:
```sh
bin/dev
```

## Usage

Sign up for an account or log in if you already have one.
Create your bio page by adding links to your social media profiles and other websites.
Customize your bio page with a profile picture and a short bio.
Share the link to your bio page with others.

## TODO

### High Priority
- **Modal Component**: Fix modal closing behavior in links management page. Current issues:
  - Background dimming doesn't clear properly when closing
  - Inconsistent behavior between Turbo Frames and Flowbite modal
  - Need to implement proper integration between Turbo Frames, Stimulus, and Flowbite
  Files to check:
  - `app/views/layouts/_modal.html.erb`
  - `app/javascript/controllers/modal_controller.js`
  - `app/controllers/links_controller.rb`

## License

This project is licensed under the NasiForge License. See the LICENSE file for details.

## Contact

For any questions or suggestions, please contact us at support@gugel.my.

## References

Thank you for choosing Gugel.my, Malaysia's go-to link-in-bio platform!
