\set ON_ERROR_STOP true
\connect dcsa_openapi

BEGIN;

\copy dcsa_im_v3_0.carrier (carrier_name, smdg_code, nmfta_code) from '../referencedata.d/sample_carriers.csv' CSV HEADER
\copy dcsa_im_v3_0.country from '../referencedata.d/countrycodes.csv' CSV HEADER
\copy dcsa_im_v3_0.un_location from '../referencedata.d/unlocationcodes.csv' CSV HEADER
\copy dcsa_im_v3_0.facility (facility_name, un_location_code, facility_smdg_code) from '../referencedata.d/sample_facilities.csv' CSV HEADER

COMMIT;
