db.ventas.aggregate([
  {
    $group: {
      _id: "$cliente_id",
      total_gastado: { $sum: "$precio" },
      numero_compras: { $sum: 1 },
      productos: { $push: "$producto_id" },
      categorias: { $push: "$categoria" },
      primera_compra: { $min: "$fecha" },
      ultima_compra: { $max: "$fecha" }
    }
  },
  {
    $project: {
      total_gastado: 1,
      numero_compras: 1,
      producto_favorito: {
        $first: {
          $sortArray: {
            input: {
              $map: {
                input: { $setUnion: ["$productos"] },
                as: "prod",
                in: {
                  k: "$$prod",
                  v: {
                    $size: {
                      $filter: {
                        input: "$productos",
                        cond: { $eq: ["$$this", "$$prod"] }
                      }
                    }
                  }
                }
              }
            },
            sortBy: { v: -1 }
          }
        }
      },
      categoria_preferida: {
        $first: {
          $sortArray: {
            input: {
              $map: {
                input: { $setUnion: ["$categorias"] },
                as: "cat",
                in: {
                  k: "$$cat",
                  v: {
                    $size: {
                      $filter: {
                        input: "$categorias",
                        cond: { $eq: ["$$this", "$$cat"] }
                      }
                    }
                  }
                }
              }
            },
            sortBy: { v: -1 }
          }
        }
      },
      primera_compra: 1,
      ultima_compra: 1
    }
  }
]);