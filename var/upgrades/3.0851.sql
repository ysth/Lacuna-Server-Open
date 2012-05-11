
create table supply_chain (
    id              int(11) not null auto_increment,
    planet_id       int(11) not null,
    building_id     int(11) not null,
    target_id       int(11) not null,
    resource_hour   bigint not null default 0,
    resource_type   varchar(32) not null,
    percent_transferred int(11) not null default 0,
    stalled         int(11) not null default 0,
    primary key (id),
    key rc_idx_planet_id (planet_id),
    key rc_idx_building_id (building_id),
    key rc_idx_target_id (target_id)
);

alter table waste_chain modify waste_hour bigint;

