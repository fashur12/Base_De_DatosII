db.ventas.aggregate([
  {
    $group: {
      _id: { mes: { $month: "$fecha" }, anio: { $year: "$fecha" }, producto: "$producto_id" },
      total_ventas: { $sum: 1 },
      nombre: { $first: "$nombre_producto" }
    }
  },
  {
    $group: {
      _id: { mes: "$_id.mes", anio: "$_id.anio" },
      productos: {
        $push: {
          producto: "$_id.producto",
          nombre: "$nombre",
          ventas: "$total_ventas"
        }
      }
    }
  },
  {
    $project: {
      mes: "$_id.mes",
      anio: "$_id.anio",
      producto_mas_vendido: {
        $arrayElemAt: [
          {
            $slice: [
              {
                $sortArray: {
                  input: "$productos",
                  sortBy: { ventas: -1 }
                }
              },
              1
            ]
          },
          0
        ]
      },
      _id: 0
    }
  }
]);