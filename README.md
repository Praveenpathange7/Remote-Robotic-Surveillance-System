# Remote Robotic Surveillance System

A DBMS project for organizing information about surveillance robots, their operators, missions, equipment, and activity records. The database uses related tables to keep these records together and make them easier to search and summarize with SQL queries.

## Project Overview

Remote surveillance robots can be used to monitor places that may be difficult or unsafe for people to inspect directly. A surveillance operation can produce many kinds of information: which robot was used, who operated it, where and when it worked, what its sensors recorded, and whether it needed maintenance.

This project models that information in a relational database. It includes tables for operators, robots, missions, locations, controls, cameras, sensors, recordings, battery status, movements, communications, maintenance, failures, and reports.

The project is designed as a database exercise. It demonstrates relational table design, primary and foreign keys, and SQL queries for retrieving and summarizing project data.

## Project Objectives

- Store details about robots, operators, locations, and surveillance missions.
- Connect related records using primary and foreign keys.
- Record robot equipment, sensor readings, recordings, and movement details.
- Track battery status, communication logs, maintenance, and component failures.
- Store mission logs and reports.
- Use SQL queries to filter, sort, join, and summarize the stored data.


## Purpose of the Project

The purpose of the Remote Robotic Surveillance System database is to organize the information created during robot surveillance operations. It provides a structured way to store details about robots, operators, missions, locations, equipment, sensor readings, and maintenance.

Keeping these records in related tables makes it easier to find mission information, check robot condition, review sensor data, and track equipment problems. The project also demonstrates how a relational database and SQL queries can be used to manage and retrieve information for a real-world style system.

## Database Tables

The database contains the following tables:

| Table | Purpose |
|---|---|
| `Operators` | Stores operator details and role information. |
| `Robots` | Stores robot details, including model, status, and battery capacity. |
| `Controls` | Records control sessions linking operators and robots. |
| `Locations` | Stores locations monitored during missions. |
| `Missions` | Stores mission details and links robots, operators, and locations. |
| `Camera` | Stores camera details associated with robots. |
| `Camera_Settings` | Stores camera configuration and recording settings. |
| `Recordings` | Stores recording details associated with missions and cameras. |
| `Sensors` | Stores sensor details associated with robots. |
| `Sensor_Readings` | Stores readings collected by sensors during missions. |
| `Robot_Movements` | Stores robot movement details during missions. |
| `Battery_Status` | Records battery level and health information. |
| `Communication_Logs` | Stores robot communication status records. |
| `Mission_Logs` | Stores events recorded during missions. |
| `Robot_Status_History` | Keeps a history of robot status changes. |
| `Maintenance` | Stores robot maintenance records. |
| `Component_Failures` | Records component failure information. |
| `Mission_Reports` | Stores mission outcomes, incident counts, and summaries. |

## Relationships

The tables are connected through primary and foreign keys. For example:

- A mission can reference a robot, an operator, and a location.
- A control session can reference an operator and a robot.
- Sensors and cameras can be associated with robots.
- Sensor readings can reference sensors and missions.
- Recordings can reference cameras and missions.
- Maintenance and component failure records can reference robots.
- Mission logs and reports can reference missions.

See the ER diagram in the `diagrams/` folder for a visual view of the entities and their relationships.

## Repository Contents

```text
Remote-Robotic-Surveillance/
├── README.md
├── database/
│   └── Remote_Robotic_Surveillance_MySQL.sql
├── diagrams/
│   ├── Remote_Robotic_Surveillance_ER_Diagram.png
│   └── Remote_Robotic_Surveillance_Connected_Chen_ER_Diagram.png
├── documentation/
│   └── DBMS_Project_Report.pdf
└── queries/
    ├── Remote_Robotic_Surveillance_SQL_Queries_Formatted.txt
    └── Remote_Robotic_Surveillance_Queries_230_to_300.txt

## Requirements

- MySQL Server
- MySQL Workbench or another MySQL client

## How to Set Up the Database

1. Download or clone this repository.
2. Open the SQL script in MySQL Workbench or your preferred MySQL client.
3. Run database/Remote_Robotic_Surveillance_MySQL.sql.
4. Select the Remote_Robotic_Surveillance database and run queries from the queries/ folder.
Check the SQL script before running it to confirm whether it creates the database, tables, and sample records, and whether it expects a particular MySQL version.


## Future Updates

The project can be extended in the following ways:

- Add a simple application or web interface for entering and viewing records.
- Add user login and permissions for operators, supervisors, and administrators.
- Record robot location and status updates over time.
- Add alerts for low battery, communication loss, and overdue maintenance.
- Add reports and dashboard views for mission results, incidents, and robot usage.
- Add validation rules for values such as battery level, priority, and mission status.
- Connect the database to a robot simulator or, in a larger system, to live robot data.
- Improve the documentation with setup instructions, example outputs, and updated diagrams.
