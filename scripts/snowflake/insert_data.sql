
-- Insert data into hub_plant table
INSERT INTO hub_plant (plant_nk, plant)
SELECT DISTINCT ds.plant, ds.plant
FROM DIRECT_SPEND ds
LEFT JOIN hub_plant hp ON ds.plant = hp.plant_nk
WHERE hp.plant_nk IS NULL;

-- Insert data into hub_vendor table
INSERT INTO hub_vendor (vendor_nk, vendor)
SELECT DISTINCT ds.vendor, ds.vendor
FROM DIRECT_SPEND ds
LEFT JOIN hub_vendor hv ON ds.vendor = hv.vendor_nk
WHERE hv.vendor_nk IS NULL;

-- Insert data into hub_material table
INSERT INTO hub_material (material_nk, material)
SELECT DISTINCT ds.material, ds.material
FROM DIRECT_SPEND ds
LEFT JOIN hub_material hm ON ds.material = hm.material_nk
WHERE hm.material_nk IS NULL;

-- Insert data into sat_po_trans table
INSERT INTO sat_po_trans (plant_fk, vendor_fk, material_fk, POnumber, lineitem, date, unit, price, currency, doc_type, payment_type)
SELECT 
    hp.plant_pk,  -- Foreign key from hub_plant
    hv.vendor_pk, -- Foreign key from hub_vendor
    hm.material_pk, -- Foreign key from hub_material
    ds.POnumber,
    ds.lineitem,
    ds.date,
    ds.unit,
    ds.price,
    ds.currency,
    ds.doc_type,
    ds.payment_type
FROM DIRECT_SPEND ds
JOIN hub_plant hp ON ds.plant = hp.plant_nk
JOIN hub_vendor hv ON ds.vendor = hv.vendor_nk
JOIN hub_material hm ON ds.material = hm.material_nk;
