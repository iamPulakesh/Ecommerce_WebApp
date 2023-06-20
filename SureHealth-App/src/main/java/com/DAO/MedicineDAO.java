package com.DAO;

import java.util.List;

import com.entity.MedsDtls;

public interface MedicineDAO {
	

	public boolean addMedicines(MedsDtls m);
	
	public List<MedsDtls> getAllMeds();
	
	public List<MedsDtls> viewMeds();
	
	public MedsDtls getMedsById(int id);
	
	public boolean updateEditMeds(MedsDtls m);
	
	public boolean deleteMeds(int id);
	
	public List<MedsDtls> viewAllMeds();
	
	public List<MedsDtls> getMedsBySearch(String ch);
}
