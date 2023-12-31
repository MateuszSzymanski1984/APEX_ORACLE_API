  CREATE TABLE "KLIENCI" 
   (
	"ID_KLIENTA" NUMBER DEFAULT "GEN_KLIENCI"."NEXTVAL" NOT NULL ENABLE, 
	"IMIE" VARCHAR2(30) NOT NULL ENABLE, 
	"NAZWISKO" VARCHAR2(30) NOT NULL ENABLE, 
	"PLEC" VARCHAR2(1) NOT NULL ENABLE, 
	"PESEL" NUMBER(11,0) NOT NULL ENABLE, 
	"TELEFON" NUMBER NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "PK_KLIENCI" PRIMARY KEY ("ID_KLIENTA")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UNQ1_KLINECI" UNIQUE ("IMIE", "NAZWISKO", "PESEL")
  USING INDEX  ENABLE, 
	 CONSTRAINT "CHECK1_KLIENCI" CHECK (plec = 'M' OR plec = 'K' ) ENABLE
   ) ;

  CREATE TABLE "KLIENCI_KARY" 
   (	"ID_KARY" NUMBER DEFAULT "GEN_KLIENCI_KARY"."NEXTVAL" NOT NULL ENABLE, 
	"ID_KLIENTA" NUMBER NOT NULL ENABLE, 
	"ID_KARY_INFO" NUMBER NOT NULL ENABLE, 
	"DATA_KARY" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	 CONSTRAINT "KLIENCI_KARY" PRIMARY KEY ("ID_KARY")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "KLIENCI_KARY_INFO" 
   (	"ID_KARY_INFO" NUMBER DEFAULT "GEN_KLIENCI_KARY_INFO"."NEXTVAL" NOT NULL ENABLE, 
	"NAZWA_KARY" VARCHAR2(60) NOT NULL ENABLE, 
	"OPIS_KARY" VARCHAR2(2000) NOT NULL ENABLE, 
	"KWOTA_KARY" NUMBER(15,0) NOT NULL ENABLE, 
	 CONSTRAINT "PK_ID_KARY_INFO" PRIMARY KEY ("ID_KARY_INFO")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UNQ1_KLIENCI_KARY_INFO" UNIQUE ("NAZWA_KARY")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PLATNOSCI" 
   (	"ID_PLATNOSCI" NUMBER DEFAULT "GEN_PLATNOSCI"."NEXTVAL" NOT NULL ENABLE, 
	"ID_REZERWACJI" NUMBER(15,0) NOT NULL ENABLE, 
	"STATUS_PLATNOSCI" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "PK_PLATNOSCI" PRIMARY KEY ("ID_PLATNOSCI")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UNQ1_PLATNOSCI" UNIQUE ("ID_REZERWACJI", "STATUS_PLATNOSCI")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "POKOJE" 
   (	"ID_POKOJU" NUMBER DEFAULT "GEN_POKOJE"."NEXTVAL" NOT NULL ENABLE, 
	"NR_POKOJU" NUMBER NOT NULL ENABLE, 
	"CENA" NUMBER NOT NULL ENABLE, 
	"ILOSC_LOZEK" NUMBER NOT NULL ENABLE, 
	"ILOSC_OSOB" NUMBER NOT NULL ENABLE, 
	"TYP_POKOJU" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_POKOJE" PRIMARY KEY ("ID_POKOJU")
  USING INDEX  ENABLE, 
	 CONSTRAINT "POKOJE_UNQ1" UNIQUE ("NR_POKOJU")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PRACOWNIK" 
   (	"ID_PRACOWNIKA" NUMBER DEFAULT "GEN_PRACOWNIK"."NEXTVAL" NOT NULL ENABLE, 
	"IMIE" VARCHAR2(40) NOT NULL ENABLE, 
	"NAZWISKO" VARCHAR2(40) NOT NULL ENABLE, 
	"LOGIN" VARCHAR2(40) NOT NULL ENABLE, 
	"HASLO" VARCHAR2(40) NOT NULL ENABLE, 
	"DATA_UTWORZENIA" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"STATUS" VARCHAR2(1) DEFAULT 'T' NOT NULL ENABLE, 
	 CONSTRAINT "PRACOWNIK_PK" PRIMARY KEY ("ID_PRACOWNIKA")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "REZERWACJE" 
   (	"ID_REZERWACJI" NUMBER(15,0) DEFAULT "GEN_REZERWACJE"."NEXTVAL" NOT NULL ENABLE, 
	"ID_KLIENTA" NUMBER(15,0) NOT NULL ENABLE, 
	"OD_KIEDY" DATE NOT NULL ENABLE, 
	"DO_KIEDY" DATE NOT NULL ENABLE, 
	"ID_POKOJU" NUMBER NOT NULL ENABLE, 
	"ID_PRACOWNIKA" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_REZERWACJE" PRIMARY KEY ("ID_REZERWACJI")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TYPY_POKOI" 
   (	"ID_TYPU_POKOJU" NUMBER(15,0) DEFAULT "GEN_TYPY_POKOI"."NEXTVAL" NOT NULL ENABLE, 
	"NAZWA_TYPU_POKOJU" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "TYPY_POKOI_PK" PRIMARY KEY ("ID_TYPU_POKOJU")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UNQ1_TYPY_POKOI" UNIQUE ("NAZWA_TYPU_POKOJU")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TYPY_USLUG" 
   (	"ID_TYPU_USLUGI" NUMBER DEFAULT "GEN_TYPY_USLUG"."NEXTVAL" NOT NULL ENABLE, 
	"NAZWA_TYPU_USLUGI" VARCHAR2(50) NOT NULL ENABLE, 
	"CENA" NUMBER(15,0) NOT NULL ENABLE, 
	"OPIS" VARCHAR2(2000) NOT NULL ENABLE, 
	 CONSTRAINT "PK_TYPY_USLUG" PRIMARY KEY ("ID_TYPU_USLUGI")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UNQ1_TYPY_USLUG" UNIQUE ("NAZWA_TYPU_USLUGI", "CENA")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "USLUGI" 
   (	"ID_USLUGI" NUMBER DEFAULT "GEN_USLUGI"."NEXTVAL" NOT NULL ENABLE, 
	"ID_KLIENTA" NUMBER(15,0) NOT NULL ENABLE, 
	"DATA_USLUGI" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"ID_TYPU_USLUGI" NUMBER, 
	 CONSTRAINT "PK_USLUGI" PRIMARY KEY ("ID_USLUGI")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "KLIENCI_KARY" ADD CONSTRAINT "KLIENCI_KARY_FK1" FOREIGN KEY ("ID_KLIENTA")
	  REFERENCES "KLIENCI" ("ID_KLIENTA") ENABLE;
  ALTER TABLE "KLIENCI_KARY" ADD CONSTRAINT "KLIENCI_KARY_INFO_FK2" FOREIGN KEY ("ID_KARY_INFO")
	  REFERENCES "KLIENCI_KARY_INFO" ("ID_KARY_INFO") ENABLE;

  ALTER TABLE "KLIENCI_KARY" ADD CONSTRAINT "KLIENCI_KARY_FK1" FOREIGN KEY ("ID_KLIENTA")
	  REFERENCES "KLIENCI" ("ID_KLIENTA") ENABLE;
  ALTER TABLE "KLIENCI_KARY" ADD CONSTRAINT "KLIENCI_KARY_INFO_FK2" FOREIGN KEY ("ID_KARY_INFO")
	  REFERENCES "KLIENCI_KARY_INFO" ("ID_KARY_INFO") ENABLE;

  ALTER TABLE "PLATNOSCI" ADD CONSTRAINT "PLATNOSCI" FOREIGN KEY ("ID_REZERWACJI")
	  REFERENCES "REZERWACJE" ("ID_REZERWACJI") ENABLE;

  ALTER TABLE "POKOJE" ADD CONSTRAINT "POKOJE_FK1" FOREIGN KEY ("TYP_POKOJU")
	  REFERENCES "TYPY_POKOI" ("ID_TYPU_POKOJU") ENABLE;

  ALTER TABLE "REZERWACJE" ADD CONSTRAINT "FK1_REZERWACJE" FOREIGN KEY ("ID_KLIENTA")
	  REFERENCES "KLIENCI" ("ID_KLIENTA") ENABLE;
  ALTER TABLE "REZERWACJE" ADD CONSTRAINT "REZERWACJE_FK2" FOREIGN KEY ("ID_POKOJU")
	  REFERENCES "POKOJE" ("ID_POKOJU") ENABLE;
  ALTER TABLE "REZERWACJE" ADD CONSTRAINT "REZERWACJE_FK3" FOREIGN KEY ("ID_PRACOWNIKA")
	  REFERENCES "PRACOWNIK" ("ID_PRACOWNIKA") ENABLE;

  ALTER TABLE "USLUGI" ADD CONSTRAINT "FK1_KLIENCI" FOREIGN KEY ("ID_KLIENTA")
	  REFERENCES "KLIENCI" ("ID_KLIENTA") ENABLE;
  ALTER TABLE "USLUGI" ADD CONSTRAINT "FK2_USLUGI" FOREIGN KEY ("ID_TYPU_USLUGI")
	  REFERENCES "TYPY_USLUG" ("ID_TYPU_USLUGI") ENABLE;






















































  CREATE INDEX "EBA_SAMPLE_MAP_AIRPORTS_SX" ON "EBA_SAMPLE_MAP_AIRPORTS" ("GEOMETRY") 
   INDEXTYPE IS "MDSYS"."SPATIAL_INDEX_V2"  PARAMETERS ('layer_gtype=POINT');

  CREATE INDEX "EBA_SAMPLE_MAP_SIMPLESTATES_SX" ON "EBA_SAMPLE_MAP_SIMPLE_STATES" ("GEOMETRY") 
   INDEXTYPE IS "MDSYS"."SPATIAL_INDEX_V2" ;

  CREATE INDEX "EBA_SAMPLE_MAP_STATES_SX" ON "EBA_SAMPLE_MAP_STATES" ("GEOMETRY") 
   INDEXTYPE IS "MDSYS"."SPATIAL_INDEX_V2" ;

  CREATE UNIQUE INDEX "KLIENCI_KARY" ON "KLIENCI_KARY" ("ID_KARY") 
  ;

  CREATE UNIQUE INDEX "PK_ID_KARY_INFO" ON "KLIENCI_KARY_INFO" ("ID_KARY_INFO") 
  ;

  CREATE UNIQUE INDEX "PK_KLIENCI" ON "KLIENCI" ("ID_KLIENTA") 
  ;

  CREATE UNIQUE INDEX "PK_PLATNOSCI" ON "PLATNOSCI" ("ID_PLATNOSCI") 
  ;

  CREATE UNIQUE INDEX "PK_POKOJE" ON "POKOJE" ("ID_POKOJU") 
  ;

  CREATE UNIQUE INDEX "PK_REZERWACJE" ON "REZERWACJE" ("ID_REZERWACJI") 
  ;

  CREATE UNIQUE INDEX "PK_TYPY_USLUG" ON "TYPY_USLUG" ("ID_TYPU_USLUGI") 
  ;

  CREATE UNIQUE INDEX "PK_USLUGI" ON "USLUGI" ("ID_USLUGI") 
  ;

  CREATE UNIQUE INDEX "POKOJE_UNQ1" ON "POKOJE" ("NR_POKOJU") 
  ;

  CREATE UNIQUE INDEX "PRACOWNIK_PK" ON "PRACOWNIK" ("ID_PRACOWNIKA") 
  ;

  CREATE UNIQUE INDEX "SYS_C00140931827" ON "EBA_SAMPLE_MAP_AIRPORTS" ("ID") 
  ;

  CREATE UNIQUE INDEX "SYS_C00140931829" ON "EBA_SAMPLE_MAP_STATES" ("ID") 
  ;

  CREATE UNIQUE INDEX "SYS_C00140931831" ON "EBA_SAMPLE_MAP_SIMPLE_STATES" ("ID") 
  ;

  CREATE UNIQUE INDEX "TYPY_POKOI_PK" ON "TYPY_POKOI" ("ID_TYPU_POKOJU") 
  ;

  CREATE UNIQUE INDEX "UNQ1_KLIENCI_KARY_INFO" ON "KLIENCI_KARY_INFO" ("NAZWA_KARY") 
  ;

  CREATE UNIQUE INDEX "UNQ1_KLINECI" ON "KLIENCI" ("IMIE", "NAZWISKO", "PESEL") 
  ;

  CREATE UNIQUE INDEX "UNQ1_PLATNOSCI" ON "PLATNOSCI" ("ID_REZERWACJI", "STATUS_PLATNOSCI") 
  ;

  CREATE UNIQUE INDEX "UNQ1_TYPY_POKOI" ON "TYPY_POKOI" ("NAZWA_TYPU_POKOJU") 
  ;

  CREATE UNIQUE INDEX "UNQ1_TYPY_USLUG" ON "TYPY_USLUG" ("NAZWA_TYPU_USLUGI", "CENA") 
  ;











































































create or replace procedure eba_sample_map_load_data(
    p_load_from          in varchar2,
    p_states_file_name   in varchar2,
    p_airports_file_name in varchar2,
    p_proxy_override     in varchar2 default null )
is
    l_states_json   blob;
    l_airports_json blob;
begin
    if p_load_from = 'FILE' then
        if p_states_file_name is not null then
            select blob_content
              into l_states_json
              from apex_application_temp_files
             where name = p_states_file_name;
        end if;
        if p_airports_file_name is not null then
            select blob_content
              into l_airports_json
              from apex_application_temp_files
             where name = p_airports_file_name;
        end if;
    else
        apex_web_service.set_request_headers(
            p_name_01  => 'User-Agent',
            p_value_01 => 'APEX' );
        l_states_json := apex_web_service.make_rest_request_b(
                             p_url            => 'https://raw.githubusercontent.com/oracle/apex/22.1/sample-apps/sample-maps/states-full.json',
                             p_http_method    => 'GET',
                             p_proxy_override => p_proxy_override );
        
        l_airports_json := apex_web_service.make_rest_request_b(
                               p_url            => 'https://raw.githubusercontent.com/oracle/apex/22.1/sample-apps/sample-maps/airports-full.json',
                               p_http_method    => 'GET',
                               p_proxy_override => p_proxy_override );
    end if;
    if l_states_json is not null then
        delete from eba_sample_map_states;
        delete from eba_sample_map_simple_states;
        insert into eba_sample_map_states (id, name, state_code, land_area, water_area, geometry )
        ( 
            select id, name, state_code, land_area, water_area, geometry
              from json_table(
                       l_states_json format json,
                       '$[*]'
                       columns (
                                 id          number             path '$.id',
                                 name        varchar2(255)      path '$.name',
                                 state_code  varchar2(255)      path '$.state_code',
                                 land_area   number             path '$.land_area',
                                 water_area  number             path '$.water_area',
                                 geometry    mdsys.sdo_geometry path '$.geometry' ) ) );
        insert into eba_sample_map_simple_states (id, name, state_code, land_area, water_area, geometry )
        ( select id, name, state_code, land_area, water_area, mdsys.sdo_util.simplify( geometry, 75 ) 
            from eba_sample_map_states);
    end if;
    if l_airports_json is not null then
        delete from eba_sample_map_airports;
        insert into eba_sample_map_airports (id, iata_code, airport_type, airport_name, city, state_name, activation_date, activation_date_dt, elevation, dist_city_to_airport, land_area_covered, commercial_ops, air_taxi_ops, geometry )
            (select rownum, iata_code, airport_type, airport_name, city, state_name, to_char(to_date(activation_date, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'), 'MON-RR'),to_date(activation_date, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'), elevation, dist_city_to_airport, land_area_covered, commercial_ops, air_taxi_ops, geometry
               from json_table(
                        l_airports_json format json,
                        '$[*]'
                        columns(
                                 iata_code             varchar2(255)      path '$.iata',
                                 airport_type          varchar2(255)      path '$.airport_type',
                                 airport_name          varchar2(255)      path '$.airport_name',
                                 city                  varchar2(255)      path '$.city',
                                 state_name            varchar2(255)      path '$.state_name',
                                 activation_date       varchar2(50)       path '$.act_date_dt',
                                 elevation             number             path '$.elevation',
                                 dist_city_to_airport  number             path '$.dist_city_to_airport',
                                 land_area_covered     number             path '$.land_area',
                                 commercial_ops        number             path '$.commercial_ops',
                                 air_taxi_ops          number             path '$.air_taxi_ops',
                                 geometry              sdo_geometry       path '$.geometry' ) ) );
    end if;
end;
/































   CREATE SEQUENCE  "GEN_KLIENCI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_KLIENCI_KARY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_KLIENCI_KARY_INFO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_PLATNOSCI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_POKOJE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_PRACOWNIK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_REZERWACJE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_TYPY_POKOI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_TYPY_USLUG"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "GEN_USLUGI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "MDRS_BA35CFE$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 100 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "MDRS_BA35D07$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 100 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "MDRS_BA35D0E$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 100 ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;














































































































  CREATE UNIQUE INDEX "KLIENCI_KARY" ON "KLIENCI_KARY" ("ID_KARY") 
  ;

  CREATE INDEX "EBA_SAMPLE_MAP_AIRPORTS_SX" ON "EBA_SAMPLE_MAP_AIRPORTS" ("GEOMETRY") 
   INDEXTYPE IS "MDSYS"."SPATIAL_INDEX_V2"  PARAMETERS ('layer_gtype=POINT');
  CREATE UNIQUE INDEX "SYS_C00140931827" ON "EBA_SAMPLE_MAP_AIRPORTS" ("ID") 
  ;
  CREATE UNIQUE INDEX "SYS_IL0195255507C00020$$" ON "EBA_SAMPLE_MAP_AIRPORTS" (
  ;
  CREATE UNIQUE INDEX "SYS_IL0195255507C00021$$" ON "EBA_SAMPLE_MAP_AIRPORTS" (
  ;

  CREATE INDEX "EBA_SAMPLE_MAP_SIMPLESTATES_SX" ON "EBA_SAMPLE_MAP_SIMPLE_STATES" ("GEOMETRY") 
   INDEXTYPE IS "MDSYS"."SPATIAL_INDEX_V2" ;
  CREATE UNIQUE INDEX "SYS_C00140931831" ON "EBA_SAMPLE_MAP_SIMPLE_STATES" ("ID") 
  ;
  CREATE UNIQUE INDEX "SYS_IL0195255544C00012$$" ON "EBA_SAMPLE_MAP_SIMPLE_STATES" (
  ;
  CREATE UNIQUE INDEX "SYS_IL0195255544C00013$$" ON "EBA_SAMPLE_MAP_SIMPLE_STATES" (
  ;

  CREATE INDEX "EBA_SAMPLE_MAP_STATES_SX" ON "EBA_SAMPLE_MAP_STATES" ("GEOMETRY") 
   INDEXTYPE IS "MDSYS"."SPATIAL_INDEX_V2" ;
  CREATE UNIQUE INDEX "SYS_C00140931829" ON "EBA_SAMPLE_MAP_STATES" ("ID") 
  ;
  CREATE UNIQUE INDEX "SYS_IL0195255538C00012$$" ON "EBA_SAMPLE_MAP_STATES" (
  ;
  CREATE UNIQUE INDEX "SYS_IL0195255538C00013$$" ON "EBA_SAMPLE_MAP_STATES" (
  ;

  CREATE UNIQUE INDEX "PK_KLIENCI" ON "KLIENCI" ("ID_KLIENTA") 
  ;
  CREATE UNIQUE INDEX "UNQ1_KLINECI" ON "KLIENCI" ("IMIE", "NAZWISKO", "PESEL") 
  ;

  CREATE UNIQUE INDEX "KLIENCI_KARY" ON "KLIENCI_KARY" ("ID_KARY") 
  ;

  CREATE UNIQUE INDEX "PK_ID_KARY_INFO" ON "KLIENCI_KARY_INFO" ("ID_KARY_INFO") 
  ;
  CREATE UNIQUE INDEX "UNQ1_KLIENCI_KARY_INFO" ON "KLIENCI_KARY_INFO" ("NAZWA_KARY") 
  ;

  CREATE UNIQUE INDEX "SYS_IL0195255551C00003$$" ON "MDRT_BA35CFE$" (
  ;

  CREATE UNIQUE INDEX "SYS_IL0195255560C00003$$" ON "MDRT_BA35D07$" (
  ;

  CREATE UNIQUE INDEX "SYS_IL0195255567C00003$$" ON "MDRT_BA35D0E$" (
  ;

  CREATE UNIQUE INDEX "PK_PLATNOSCI" ON "PLATNOSCI" ("ID_PLATNOSCI") 
  ;
  CREATE UNIQUE INDEX "UNQ1_PLATNOSCI" ON "PLATNOSCI" ("ID_REZERWACJI", "STATUS_PLATNOSCI") 
  ;

  CREATE UNIQUE INDEX "PK_POKOJE" ON "POKOJE" ("ID_POKOJU") 
  ;
  CREATE UNIQUE INDEX "POKOJE_UNQ1" ON "POKOJE" ("NR_POKOJU") 
  ;

  CREATE UNIQUE INDEX "PRACOWNIK_PK" ON "PRACOWNIK" ("ID_PRACOWNIKA") 
  ;

  CREATE UNIQUE INDEX "PK_REZERWACJE" ON "REZERWACJE" ("ID_REZERWACJI") 
  ;

  CREATE UNIQUE INDEX "TYPY_POKOI_PK" ON "TYPY_POKOI" ("ID_TYPU_POKOJU") 
  ;
  CREATE UNIQUE INDEX "UNQ1_TYPY_POKOI" ON "TYPY_POKOI" ("NAZWA_TYPU_POKOJU") 
  ;

  CREATE UNIQUE INDEX "PK_TYPY_USLUG" ON "TYPY_USLUG" ("ID_TYPU_USLUGI") 
  ;
  CREATE UNIQUE INDEX "UNQ1_TYPY_USLUG" ON "TYPY_USLUG" ("NAZWA_TYPU_USLUGI", "CENA") 
  ;

  CREATE UNIQUE INDEX "PK_USLUGI" ON "USLUGI" ("ID_USLUGI") 
  ;



























