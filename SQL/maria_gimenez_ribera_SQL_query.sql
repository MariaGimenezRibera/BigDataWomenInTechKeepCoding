select m.name_model, 
	   b.name_brand, 
	   comp.name_company, 
	   v.date_purchase, 
	   v.plate, 
	   c.name_color, 
	   v.total_km, 
	   ic.name_insurance_company, 
	   i.num_insurance
	from maria_gimenez_ribera.company as comp
	join maria_gimenez_ribera.brand as b on comp.id_company = b.id_company
	join maria_gimenez_ribera.model as m on b.id_brand = m.id_brand
	join maria_gimenez_ribera.vehicle as v on m.id_model = v.id_model
	join maria_gimenez_ribera.color as c on v.id_color = c.id_color
	join maria_gimenez_ribera.insurance_policy as i on i.id_vehicle = v.id_vehicle
	join maria_gimenez_ribera.insurance_company as ic on i.id_insurance_company = ic.id_insurance_company