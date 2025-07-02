db.ventas.aggregate([
  { $match: { valoracion: { $exists: true } } },
  {
    $group: {
      _id: "$producto_id",
      nombre: { $first: "$nombre_producto" },
      promedio_valoracion: { $avg: "$valoracion" },
      cantidad_valoraciones: { $sum: 1 }
    }
  },
  { $match: { cantidad_valoraciones: { $gte: 2 } } },
  { $sort: { promedio_valoracion: -1 } }
]);