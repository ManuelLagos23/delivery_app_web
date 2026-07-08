-- CreateTable
CREATE TABLE "UsuarioSistema" (
    "id" SERIAL NOT NULL,
    "nombre_usuario_sistema" TEXT NOT NULL,
    "apellido_usuario_sistema" TEXT NOT NULL,
    "correo_usuario_sistema" TEXT NOT NULL,
    "telefono_usuario_sistema" TEXT NOT NULL,
    "contrasena_usuario_sistema" TEXT NOT NULL,
    "estado_usuario_sistema" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UsuarioSistema_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id" SERIAL NOT NULL,
    "nombre_cliente" TEXT NOT NULL,
    "apellido_cliente" TEXT NOT NULL,
    "telefono_cliente" TEXT NOT NULL,
    "correo_cliente" TEXT NOT NULL,
    "identidad_cliente" TEXT NOT NULL,
    "foto_identidad_cliente" TEXT,
    "estado_cliente" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Direccion" (
    "id" SERIAL NOT NULL,
    "id_cliente" INTEGER NOT NULL,
    "departamento_direccion" TEXT NOT NULL,
    "municipio_direccion" TEXT NOT NULL,
    "barrio_direccion" TEXT NOT NULL,
    "referencia_direccion" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Direccion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Empresa" (
    "id" SERIAL NOT NULL,
    "nombre_empresa" TEXT NOT NULL,
    "ubicacion_empresa" TEXT NOT NULL,
    "responsable_empresa" TEXT NOT NULL,
    "telefono_empresa_uno" TEXT NOT NULL,
    "telefono_encargado_dos" TEXT NOT NULL,
    "correo_empresa" TEXT NOT NULL,
    "foto_empresa" TEXT,
    "rubro_empresa" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Empresa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductoEmpresa" (
    "id" SERIAL NOT NULL,
    "id_empresa" INTEGER NOT NULL,
    "nombre_producto" TEXT NOT NULL,
    "descripcion_producto" TEXT NOT NULL,
    "foto_producto" TEXT,
    "disponible_producto" BOOLEAN NOT NULL,
    "precio_producto" DECIMAL(10,2) NOT NULL,
    "descuento_producto" DECIMAL(10,2),
    "tamano_producto" TEXT,
    "precio_tamano_producto" DECIMAL(10,2),
    "complementos_producto" TEXT,
    "precio_complemento_producto" DECIMAL(10,2),
    "tipo_producto" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductoEmpresa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsuarioEmpresa" (
    "id" SERIAL NOT NULL,
    "id_empresa" INTEGER NOT NULL,
    "nombre_usuario_empresa" TEXT NOT NULL,
    "correo_usuario_empresa" TEXT NOT NULL,
    "contrasena_usuario_empresa" TEXT NOT NULL,
    "estado_usuario_empresa" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UsuarioEmpresa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Motorista" (
    "id" SERIAL NOT NULL,
    "nombre_motorista" TEXT NOT NULL,
    "apellido_motorista" TEXT NOT NULL,
    "identidad_motorista" TEXT NOT NULL,
    "direccion_motorista" TEXT NOT NULL,
    "telefono_motorista" TEXT NOT NULL,
    "correo_motorista" TEXT NOT NULL,
    "foto_motorista" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Motorista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MotoristaVehiculo" (
    "id" SERIAL NOT NULL,
    "id_motorista" INTEGER NOT NULL,
    "color_motorista_vehiculo" TEXT NOT NULL,
    "placa_motorista_vehiculo" TEXT NOT NULL,
    "tipo_motorista_vehiculo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MotoristaVehiculo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsuarioMotorista" (
    "id" SERIAL NOT NULL,
    "id_motorista" INTEGER NOT NULL,
    "nombre_motorista" TEXT NOT NULL,
    "correo_usuario_motorista" TEXT NOT NULL,
    "contrasena_usuario_motorista" TEXT NOT NULL,
    "estado_usuario_motorista" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UsuarioMotorista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pedido" (
    "id" SERIAL NOT NULL,
    "id_cliente" INTEGER NOT NULL,
    "id_empresa" INTEGER NOT NULL,
    "id_direccion" INTEGER NOT NULL,
    "id_motorista" INTEGER NOT NULL,
    "id_vehiculo_motorista" INTEGER NOT NULL,
    "precio_total_producto_pedido" DECIMAL(10,2) NOT NULL,
    "tipo_entrega_pedido" TEXT NOT NULL,
    "metodo_pago_pedido" TEXT NOT NULL,
    "fecha_pedido" TIMESTAMP(3) NOT NULL,
    "hora_pedido" TEXT NOT NULL,
    "estado_pedido" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pedido_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PedidoDetalle" (
    "id" SERIAL NOT NULL,
    "id_pedidos" INTEGER NOT NULL,
    "id_producto_empresa" INTEGER NOT NULL,
    "precio_producto" DECIMAL(10,2) NOT NULL,
    "precio_tamano_producto" DECIMAL(10,2),
    "precio_complemento_producto" DECIMAL(10,2),
    "nota_producto" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PedidoDetalle_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UsuarioSistema_correo_usuario_sistema_key" ON "UsuarioSistema"("correo_usuario_sistema");

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_correo_cliente_key" ON "Cliente"("correo_cliente");

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_correo_empresa_key" ON "Empresa"("correo_empresa");

-- CreateIndex
CREATE UNIQUE INDEX "UsuarioEmpresa_correo_usuario_empresa_key" ON "UsuarioEmpresa"("correo_usuario_empresa");

-- CreateIndex
CREATE UNIQUE INDEX "Motorista_correo_motorista_key" ON "Motorista"("correo_motorista");

-- CreateIndex
CREATE UNIQUE INDEX "MotoristaVehiculo_placa_motorista_vehiculo_key" ON "MotoristaVehiculo"("placa_motorista_vehiculo");

-- CreateIndex
CREATE UNIQUE INDEX "UsuarioMotorista_correo_usuario_motorista_key" ON "UsuarioMotorista"("correo_usuario_motorista");

-- AddForeignKey
ALTER TABLE "Direccion" ADD CONSTRAINT "Direccion_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductoEmpresa" ADD CONSTRAINT "ProductoEmpresa_id_empresa_fkey" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioEmpresa" ADD CONSTRAINT "UsuarioEmpresa_id_empresa_fkey" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MotoristaVehiculo" ADD CONSTRAINT "MotoristaVehiculo_id_motorista_fkey" FOREIGN KEY ("id_motorista") REFERENCES "Motorista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioMotorista" ADD CONSTRAINT "UsuarioMotorista_id_motorista_fkey" FOREIGN KEY ("id_motorista") REFERENCES "Motorista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_empresa_fkey" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_direccion_fkey" FOREIGN KEY ("id_direccion") REFERENCES "Direccion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_motorista_fkey" FOREIGN KEY ("id_motorista") REFERENCES "Motorista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pedido" ADD CONSTRAINT "Pedido_id_vehiculo_motorista_fkey" FOREIGN KEY ("id_vehiculo_motorista") REFERENCES "MotoristaVehiculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PedidoDetalle" ADD CONSTRAINT "PedidoDetalle_id_pedidos_fkey" FOREIGN KEY ("id_pedidos") REFERENCES "Pedido"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PedidoDetalle" ADD CONSTRAINT "PedidoDetalle_id_producto_empresa_fkey" FOREIGN KEY ("id_producto_empresa") REFERENCES "ProductoEmpresa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
