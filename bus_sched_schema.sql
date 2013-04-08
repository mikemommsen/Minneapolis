begin transaction;

create table agency (
  agency_id text primary key,
  agency_name text,
  agency_url text,
  agency_timezone text,
  agency_lang text
);

create table stops (
  stop_id text primary key,
  stop_name text,
  stop_desc text,
  stop_lat float,
  stop_lon float,
  stop_street text,
  stop_city text,
  stop_region text,
  stop_postcode text,
  stop_country text,
  zone_id text,
  wheelchair_boarding int,
  stop_url text
);
select addgeometrycolumn("stops", "geometry", 4326, "POINT", 2);
select createspatialindex("stops","geometry");

create table routes (
  route_id int primary key,
  agency_id text,
  route_short_name int,
  route_long_name text,
  route_desc text,
  route_type int,
  route_url text,
  foreign key (agency_id) references agency (agency_id)
);

create table trips (
  route_id int,
  service_id text,
  trip_id int text,
  trip_headsign text,
  block_id int,
  shape_id int,
  wheelchair_accessible int,
  primary key (route_id, service_id, trip_id),
  foreign key (route_id) references routes(route_id),
  foreign key (shape_id) references shapes(shape_id),
  foreign key (trip_id) references trips(trip_id),
  foreign key (service_id) references calender(service_id)
);

create table stop_times (
  trip_id text,
  arrival_time,
  departure_time,
  stop_id,
  stop_sequence,
  pickup_type,
  drop_off_type,
  primary key (trip_id, stop_id),
  foreign key (trip_id) references trips(trip_id),
  foreign key (stop_id) references stops(stop_id)
);

create table calendar (
  service_id text primary key,
  monday int,
  tuesday int,
  wednesday int,
  thursday int,
  friday int,
  saturday int,
  sunday int,
  start_date date,
  end_date date
);

create table calendar_dates (
  service_id text,
  exception_date date,
  exception_type int,
  foreign key (service_id) references calender(service_id)
);

create table shapes (
  shape_id int,
  shape_pt_lat float,
  shape_pt_lon float,
  shape_pt_sequence int,
  primary key (shape_id, shape_pt_sequence)
);
select addgeometrycolumn("shapes", "geometry", 4326, "POINT", "XY");
select createspatialindex("shapes", "geometry");

commit;
