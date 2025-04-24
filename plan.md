# Plan for Gugel Conversion to Bento-style

## Introduction & goals
- Define purpose: convert existing Gugel app to Bento.me–style profiles
- Success criteria: adopt Bento.me UI/UX while fully retaining current features
- Preserve functionality and branding: users, groups, QR codes, short links, search, analytics, static pages
- Layouts may be updated to match new design

## Conversion scope & retained features
- Retain existing features:
  - Users (authentication, profiles)
  - Groups (membership, permissions)
  - QR codes generation & management
  - Short Links creation & redirection
  - Search & analytics dashboards
- Preserve static pages content; update layouts if needed
- Maintain branding: "gugel" (colors, logo, naming)
- Integrate UI/UX design considerations below to match Bento.me style

## Tech stack
- Ruby on Rails 8
- PostgreSQL database
- Tailwind CSS + Flowbite components
- Stimulus JS for interactive UI
- ActiveStorage with AWS S3 compatibility

## Data models & relationships
- User: has_one Profile, has_many Links
- Profile: belongs_to User, has fields like bio, avatar
- Link: belongs_to User, attributes: title, url, position
- Analytics: tracks clicks per Link

## High-level architecture
- MVC separation: controllers, models, views
- JSON API endpoints for search & analytics
- Stimulus controllers for front-end behavior

## UI/UX design considerations
- Mobile-first responsive layout
- Match Bento.me profile layout:
  - Header with avatar centred at top
  - Circular avatar with concise bio below
  - Vertical list of link buttons with uniform width
- Typography & spacing consistency:
  - Sans-serif font, appropriate font sizes
  - Generous whitespace between elements
- Link cards styling:
  - Full-width buttons, rounded corners
  - Subtle border and box-shadow
  - Hover state: slight scale-up & background change
  - Active state: pressed styling
  - Responsive resizing:
    - Full-width buttons with a set max-width, centered via margins
    - Edge-to-edge on mobile with gutters, constrained on larger viewports
    - Text wrapping and auto-height with a minimum height
    - Consistent vertical spacing (`space-y`) across breakpoints
    - Specific breakpoints (sm, md, lg) for container max-width and padding
- Drag-and-drop reordering:
  - Handle icon on each link
  - Smooth dragging animations
  - Persist order via AJAX
- Click animations & analytics:
  - Ripple or fade effect on click
  - Non-blocking click tracking
- Responsive breakpoints:
  - Single-column on mobile, centred content
  - Tablet/desktop centred with max-width
- Inline edit modes:
  - In-place editing for bio & links
  - Toggle save/cancel buttons
- Accessibility enhancements:
  - Logical keyboard focus order
  - ARIA labels on interactive elements
- Accessibility: ARIA attributes, keyboard navigation

## Milestones & timeline
- [] Project setup & basic models
- [] Authentication & profile page
- [] Link CRUD UI/UX
- [] Search & analytics features
- [] Testing, optimization & deployment

## Testing strategy
- RSpec for unit tests (models, controllers)
- System tests for end-to-end user flows
- Stimulus JS unit tests for interactive components

## Deployment
- Host on Render or AWS (Elastic Beanstalk)
- CI/CD via GitHub Actions
- Configure ActiveStorage with S3 for production