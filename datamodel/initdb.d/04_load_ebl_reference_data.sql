-- Assumes the PSQL client
\set ON_ERROR_STOP true
\connect dcsa_openapi

-- Use a transaction so a bug will not leave tainted / incomplete data.
BEGIN;

\copy dcsa_ebl_v1_0.facility_type from '../referencedata.d/facilitytypes.csv' CSV HEADER
\copy dcsa_ebl_v1_0.seal_source from '../referencedata.d/sealsourcecodes.csv' CSV HEADER
\copy dcsa_ebl_v1_0.seal_type from '../referencedata.d/sealtypecodes.csv' CSV HEADER
\copy dcsa_ebl_v1_0.shipment_location_type from '../referencedata.d/shipmentlocationtypes.csv' CSV HEADER
\copy dcsa_ebl_v1_0.party_function from '../referencedata.d/partyfunctioncodes.csv' CSV HEADER

COMMIT;