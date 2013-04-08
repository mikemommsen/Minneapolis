
begin;
create table agency (
  agency_id primary key text,
  agency_name text,
  agency_url text,
  agency_timezone text,
  agency_lang text
);
create table stops (
  stop_id primary key text,
  stop_name text,
  stop_desc text,
  stop_lat float,
  stop_lon float,
  stop_street text,
  stop_city text,
  stop_region ,
  stop_postcode,
  stop_country,
  zone_id,
  wheelchair_boarding int,
  stop_url text
);
create table routes (
  route_id,
  agency_id,
  route_short_name,
  route_long_name,
  route_desc,
  route_type,
  route_url
);
create table trips (
  route_id,
  service_id,
  trip_id,
  trip_headsign,
  block_id,
  shape_id,
  wheelchair_accessible
);
create table stop_times (
  trip_id,
  arrival_time,
  departure_time,
  stop_id,
  stop_sequence,
  pickup_type,
  drop_off_type
);
create table calendar (
  service_id,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  start_date,
  end_date
);
create table calendar_dates (
  service_id,
  date,
  exception_type
);
create table shapes (
  shape_id,
  shape_pt_lat,
  shape_pt_lon,
  shape_pt_sequence
);
commit;
