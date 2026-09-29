# Module 68 — Database Design and Normalization

## System

Generic request queue used for database-design practice.

## Entities

### Requesters

Stores information about people who submit requests.

* `requester_id` — Primary Key
* `name`
* `email`
* `phone`

### Employees

Stores information about employees who handle requests.

* `employee_id` — Primary Key
* `name`
* `email`
* `phone`

### Statuses

Stores the allowed request statuses.

* `status_id` — Primary Key
* `status_name`

Example status values:

* Pending
* In Progress
* Completed

### Requests

Stores each submitted request.

* `request_id` — Primary Key
* `request_type`
* `requester_id` — Foreign Key to `requesters.requester_id`
* `assigned_employee_id` — Foreign Key to `employees.employee_id`
* `priority`
* `status_id` — Foreign Key to `statuses.status_id`
* `submitted_at`

## ER Diagram

```text
REQUESTERS
----------
PK requester_id
   name
   email
   phone
       |
       | 1
       |
       | many
       v
REQUESTS
--------
PK request_id
   request_type
FK requester_id
FK assigned_employee_id
   priority
FK status_id
   submitted_at
       ^
       | many
       |
       | 1
EMPLOYEES
---------
PK employee_id
   name
   email
   phone


STATUSES
--------
PK status_id
   status_name
       |
       | 1
       |
       | many
       v
REQUESTS
```

## Relationships

* One requester can submit many requests.
* Each request belongs to one requester.
* One employee can be assigned many requests.
* Each request is assigned to one employee.
* One status can apply to many requests.
* Each request has one current status.

## Normalization Decisions

The schema separates requesters, employees, statuses, and requests so that information is not unnecessarily duplicated.

Requester details are stored only in `requesters`.

Employee details are stored only in `employees`.

Status names are stored only in `statuses`.

The `requests` table references those tables with foreign keys rather than repeating names, emails, phone numbers, or status text.

This reduces update, insert, and delete anomalies.

## Denormalization Decision

The schema starts normalized.

For example, `employee_name` is not duplicated in the `requests` table because it can be retrieved through the `assigned_employee_id` relationship.

If the application later handles a very large amount of data and a proven read-performance problem exists, deliberate denormalization could be considered.

## Primary Key Decision

Each main entity uses a surrogate ID as its primary key:

* `requester_id`
* `employee_id`
* `request_id`
* `status_id`

These identifiers remain stable even if business information such as a person's name, email, or phone number changes.

## Index Decision

No unnecessary indexes are added initially because the practice dataset is small.

Primary keys are indexed by the database.

If the request table becomes large and employees frequently search for all requests assigned to them, `assigned_employee_id` would be a strong candidate for an additional index.

Indexes should be added based on real query patterns because they improve reads but add storage and write overhead.

## Tradeoff Summary

The design favors normalization, consistency, and maintainability over premature read optimization.

The schema can later be denormalized or indexed differently if actual application usage shows that the additional complexity is justified.
