## Description
This is a straightforward database design for managing tramway operations, station details, line information, and maintenance schedules. It offers a basic yet effective solution for organizing and tracking tramway system data in a MySQL database.
### Summary of the tables created:
- Arrondissement: Stores information about districts, including their number, area, and number of inhabitants.
- Station: Contains details about tramway stations, such as station number, name, and the district they belong to.
- Ligne: Represents tramway lines, including their ID, length, start date, number of passengers, and the starting and ending stations.
- Travaux: Records information about maintenance work, including the work ID, location, start date, and duration.
- Ligne_St_Trav: Links stations, tramway lines, and maintenance work, indicating which lines are affected by maintenance work at which stations.
