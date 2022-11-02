object inta{
	const property parcelas = #{}
	
	method aniadirParcelas(parcela) {
		parcelas.add(parcela)
	}
	method promedioDePlantas() = self.cantidadPlantas() / parcelas.size()
	method cantidadPlantas() = parcelas.sum({p => p.cantidadPlantas()}) 
	
	method masAutosustentable() = parcelas.max({p => p.plantasAutosustentables()})
	
	method parcelasIndustriales() = 
		parcelas.filter({p => p.esParcela() == "industrial"})
	
	method parcelasEcologicas() = 
		parcelas.filter({p => p.esParcela() == "ecologica"})
}