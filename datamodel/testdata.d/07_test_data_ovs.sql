\set ON_ERROR_STOP true
\connect dcsa_openapi

BEGIN;

CREATE TEMP TABLE tmp_carrier AS SELECT * FROM dcsa_im_v3_0.carrier LIMIT 0;
ALTER TABLE tmp_carrier DROP COLUMN id;

\copy tmp_carrier from '../referencedata.d/sample_carriers.csv' CSV HEADER

INSERT INTO dcsa_im_v3_0.carrier (carrier_name, smdg_code, nmfta_code)
SELECT carrier_name, smdg_code, nmfta_code FROM tmp_carrier;

\copy dcsa_im_v3_0.country from '../referencedata.d/countrycodes.csv' CSV HEADER
\copy dcsa_im_v3_0.un_location from '../referencedata.d/unlocationcodes.csv' CSV HEADER

COMMIT;
