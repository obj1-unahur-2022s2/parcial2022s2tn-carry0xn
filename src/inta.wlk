object inta{
	const property parcelas = #{}
	
	method aniadirParcelas(parcela) {
		parcelas.add(parcela)
	}
	method promedioDePlantas() = self.cantidadPlantas() / parcelas.size()
	method cantidadPlantas() = parcelas.sum({p => p.cantidadPlantas()}) 
	
	method masAutosustentable() = parcelas.find({p => p.plantasAutosustentables().size() == self.mayorCantidadDePlantas()})
	
	method mayorCantidadDePlantas() = parcelas.max({p => p.plantasAutosustentables().size()})
	
	method parcelasIndustriales() = 
		parcelas.filter({p => p.esParcela() == "industrial"})
	
	method parcelasEcologicas() = 
		parcelas.filter({p => p.esParcela() == "ecologica"})
}