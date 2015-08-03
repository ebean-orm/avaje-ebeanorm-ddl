create table o_address (
  id                            bigserial not null,
  line1                         varchar(100),
  line2                         varchar(100),
  city                          varchar(100),
  country_code                  varchar(2),
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint pk_o_address primary key (id)
);

create table blob_holder (
  id                            bigserial not null,
  text_content                  text,
  binary_content                bytea,
  file_content                  bytea,
  version                       bigint not null,
  constraint pk_blob_holder primary key (id)
);

create table car_accessory (
  id                            bigserial not null,
  name                          varchar(255),
  car_id                        bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint pk_car_accessory primary key (id)
);

create table be_contact (
  id                            bigserial not null,
  first_name                    varchar(50),
  last_name                     varchar(50),
  email                         varchar(200),
  phone                         varchar(20),
  customer_id                   bigint not null,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint pk_be_contact primary key (id)
);

create table contact_note (
  id                            bigserial not null,
  contact_id                    bigint not null,
  title                         varchar(255),
  note                          text,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint pk_contact_note primary key (id)
);

create table o_country (
  code                          varchar(2) not null,
  name                          varchar(60),
  constraint pk_o_country primary key (code)
);

create table be_customer (
  id                            bigserial not null,
  inactive                      boolean,
  name                          varchar(100),
  registered                    timestamp,
  comments                      varchar(1000),
  billing_address_id            bigint,
  shipping_address_id           bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint uq_be_customer_name unique (name),
  constraint pk_be_customer primary key (id)
);

create table document (
  id                            bigserial not null,
  title                         varchar(255),
  author                        varchar(255),
  content                       json,
  version                       bigint not null,
  constraint pk_document primary key (id)
);

create table mrole (
  id                            serial not null,
  role_name                     varchar(255),
  constraint pk_mrole primary key (id)
);

create table mrole_muser (
  mrole_id                      integer not null,
  muser_id                      integer not null,
  constraint pk_mrole_muser primary key (mrole_id,muser_id)
);

create table muser (
  id                            serial not null,
  user_name                     varchar(255),
  user_type_id                  integer,
  constraint pk_muser primary key (id)
);

create table muser_type (
  id                            serial not null,
  name                          varchar(255),
  constraint pk_muser_type primary key (id)
);

create table o_booking (
  id                            bigserial not null,
  booking_date                  date,
  invoice_id                    bigint,
  constraint uq_o_booking_invoice_id unique (invoice_id),
  constraint pk_o_booking primary key (id)
);

create table o_invoice (
  id                            bigserial not null,
  invoice_date                  date,
  constraint pk_o_invoice primary key (id)
);

create table o_order (
  id                            bigserial not null,
  status                        varchar(1),
  order_date                    date,
  ship_date                     date,
  customer_id                   bigint,
  shipping_address_id           bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint ck_o_order_status check (status in ('N','C','A','S')),
  constraint pk_o_order primary key (id)
);

create table o_order_detail (
  id                            bigserial not null,
  order_id                      bigint,
  order_qty                     integer,
  ship_qty                      integer,
  unit_price                    float,
  product_id                    bigint,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint pk_o_order_detail primary key (id)
);

create table o_product (
  id                            bigserial not null,
  sku                           varchar(20),
  name                          varchar(255),
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  constraint pk_o_product primary key (id)
);

create table truck_ref (
  id                            serial not null,
  something                     varchar(255),
  constraint pk_truck_ref primary key (id)
);

create table vehicle (
  dtype                         varchar(3) not null,
  id                            bigserial not null,
  license_number                varchar(255),
  registration_date             timestamp,
  version                       bigint not null,
  when_created                  timestamp not null,
  when_modified                 timestamp not null,
  truck_ref_id                  integer,
  capacity                      float,
  driver                        varchar(255),
  car_ref_id                    integer,
  constraint pk_vehicle primary key (id)
);
