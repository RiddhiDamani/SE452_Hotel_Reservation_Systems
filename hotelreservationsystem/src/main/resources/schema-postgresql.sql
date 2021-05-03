DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS RESERVATIONS;
DROP TABLE IF EXISTS ROOMS;
DROP TABLE IF EXISTS ROOM_TYPES;
DROP TABLE IF EXISTS HOTELS; 
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS USERS;

create table USERS (
  -- ID = UserID
  ID int generated by default as identity not null,
  USERNAME varchar(255) not null,
  PASSWORD_HASH varchar(255) not null,
  FIRST_NAME varchar(255) not null,
  MIDDLE_NAME varchar(255),
  LAST_NAME varchar(255) not null,
  EMAIL varchar(255) not null,
  primary key (ID),
  unique (USERNAME)
);

create table LOCATIONS (
  -- ID = LocationID
  ID int generated by default as identity not null,
  LOCATION_NAME varchar(255) not null,
  primary key (ID)
);

create table HOTELS (
  -- ID = HotelID
  ID int generated by default as identity not null,
  HOTEL_NAME varchar(255),
  LOCATION_ID int not null,
  POSTAL_CODE int not null,
  primary key (ID),
  foreign key (LOCATION_ID)
  references LOCATIONS (ID)
);

create table ROOM_TYPES (
  -- ID = RoomTypeID
  ID int generated by default as identity not null,
  ROOM_TYPE_STR varchar(255) not null,
  primary key (ID)
);

create table ROOMS (
  -- ID = RoomID for a specific hotel's room type  
  ID int generated by default as identity not null,
  ROOM_TYPE_ID int not null,
  HOTEL_ID int not null,
  GUESTS int not null,
  COST_PER_NIGHT int not null,  
  primary key (ID),
  foreign key (HOTEL_ID)
  references HOTELS (ID),
  foreign key (ROOM_TYPE_ID)
  references ROOM_TYPES (ID)
);

create table RESERVATIONS(
    ID int GENERATED ALWAYS AS IDENTITY,
    START_DT date not null,
    END_DT date not null, 
    USER_ID int not null,
    ROOM_ID int not null,
    PRIMARY KEY (ID),
    FOREIGN KEY(USER_ID) REFERENCES USERS(ID),
    FOREIGN KEY(ROOM_ID) REFERENCES ROOMS(ID));

create table PAYMENT (
  ID int generated by default as identity not null,
  USER_ID int not null,
  CARD_TYPE varchar(50) not null,
  CARD_HOLDER_NAME varchar(100) not null,
  CARD_NUMBER int not null,
  CVV int not null,
  primary key (ID),
  foreign key (USER_ID)
  references USERS (ID)
);
