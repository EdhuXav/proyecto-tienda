/*
  Warnings:

  - The primary key for the `Producto` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `creadoEn` on the `Producto` table. All the data in the column will be lost.
  - You are about to drop the column `descripcion` on the `Producto` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Producto` table. All the data in the column will be lost.
  - You are about to drop the column `precio` on the `Producto` table. All the data in the column will be lost.
  - You are about to drop the column `stock` on the `Producto` table. All the data in the column will be lost.
  - The primary key for the `Usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `creadoEn` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `nombre` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `Usuario` table. All the data in the column will be lost.
  - You are about to drop the column `rol` on the `Usuario` table. All the data in the column will be lost.
  - The primary key for the `Venta` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Venta` table. All the data in the column will be lost.
  - You are about to drop the column `usuarioId` on the `Venta` table. All the data in the column will be lost.
  - You are about to alter the column `total` on the `Venta` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Decimal(10,2)`.
  - You are about to drop the `DetalleVenta` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[id_trabajador]` on the table `Usuario` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[username]` on the table `Usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_categoria` to the `Producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio_compra` to the `Producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `precio_venta` to the `Producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_trabajador` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password_hash` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_apertura` to the `Venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_sucursal` to the `Venta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_usuario` to the `Venta` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "DetalleVenta" DROP CONSTRAINT "DetalleVenta_productoId_fkey";

-- DropForeignKey
ALTER TABLE "DetalleVenta" DROP CONSTRAINT "DetalleVenta_ventaId_fkey";

-- DropForeignKey
ALTER TABLE "Venta" DROP CONSTRAINT "Venta_usuarioId_fkey";

-- DropIndex
DROP INDEX "Usuario_email_key";

-- AlterTable
ALTER TABLE "Producto" DROP CONSTRAINT "Producto_pkey",
DROP COLUMN "creadoEn",
DROP COLUMN "descripcion",
DROP COLUMN "id",
DROP COLUMN "precio",
DROP COLUMN "stock",
ADD COLUMN     "id_categoria" INTEGER NOT NULL,
ADD COLUMN     "id_producto" SERIAL NOT NULL,
ADD COLUMN     "precio_compra" DECIMAL(10,2) NOT NULL,
ADD COLUMN     "precio_venta" DECIMAL(10,2) NOT NULL,
ADD CONSTRAINT "Producto_pkey" PRIMARY KEY ("id_producto");

-- AlterTable
ALTER TABLE "Usuario" DROP CONSTRAINT "Usuario_pkey",
DROP COLUMN "creadoEn",
DROP COLUMN "email",
DROP COLUMN "id",
DROP COLUMN "nombre",
DROP COLUMN "password",
DROP COLUMN "rol",
ADD COLUMN     "activo" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "id_trabajador" INTEGER NOT NULL,
ADD COLUMN     "id_usuario" SERIAL NOT NULL,
ADD COLUMN     "password_hash" TEXT NOT NULL,
ADD COLUMN     "username" TEXT NOT NULL,
ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_usuario");

-- AlterTable
ALTER TABLE "Venta" DROP CONSTRAINT "Venta_pkey",
DROP COLUMN "id",
DROP COLUMN "usuarioId",
ADD COLUMN     "id_apertura" INTEGER NOT NULL,
ADD COLUMN     "id_cliente" INTEGER,
ADD COLUMN     "id_sucursal" INTEGER NOT NULL,
ADD COLUMN     "id_usuario" INTEGER NOT NULL,
ADD COLUMN     "id_venta" SERIAL NOT NULL,
ALTER COLUMN "total" SET DATA TYPE DECIMAL(10,2),
ADD CONSTRAINT "Venta_pkey" PRIMARY KEY ("id_venta");

-- DropTable
DROP TABLE "DetalleVenta";

-- CreateTable
CREATE TABLE "Persona" (
    "id_persona" SERIAL NOT NULL,
    "nombres" TEXT NOT NULL,
    "apellidos" TEXT,
    "tipo_documento" TEXT,
    "numero_documento" TEXT,
    "telefono" TEXT,
    "email" TEXT,
    "direccion" TEXT,
    "activo" BOOLEAN NOT NULL DEFAULT true,
    "fecha_creacion" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Persona_pkey" PRIMARY KEY ("id_persona")
);

-- CreateTable
CREATE TABLE "Trabajador" (
    "id_trabajador" SERIAL NOT NULL,
    "id_persona" INTEGER NOT NULL,
    "codigo_trabajador" TEXT,
    "cargo" TEXT,
    "fecha_contratacion" TIMESTAMP(3),
    "estado" TEXT NOT NULL DEFAULT 'ACTIVO',

    CONSTRAINT "Trabajador_pkey" PRIMARY KEY ("id_trabajador")
);

-- CreateTable
CREATE TABLE "Sucursal" (
    "id_sucursal" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT,
    "telefono" TEXT,
    "activo" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Sucursal_pkey" PRIMARY KEY ("id_sucursal")
);

-- CreateTable
CREATE TABLE "TrabajadorSucursal" (
    "id_trabajador" INTEGER NOT NULL,
    "id_sucursal" INTEGER NOT NULL,

    CONSTRAINT "TrabajadorSucursal_pkey" PRIMARY KEY ("id_trabajador","id_sucursal")
);

-- CreateTable
CREATE TABLE "Rol" (
    "id_rol" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Rol_pkey" PRIMARY KEY ("id_rol")
);

-- CreateTable
CREATE TABLE "Permiso" (
    "id_permiso" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "modulo" TEXT NOT NULL,

    CONSTRAINT "Permiso_pkey" PRIMARY KEY ("id_permiso")
);

-- CreateTable
CREATE TABLE "UsuarioRol" (
    "id_usuario" INTEGER NOT NULL,
    "id_rol" INTEGER NOT NULL,

    CONSTRAINT "UsuarioRol_pkey" PRIMARY KEY ("id_usuario","id_rol")
);

-- CreateTable
CREATE TABLE "RolPermiso" (
    "id_rol" INTEGER NOT NULL,
    "id_permiso" INTEGER NOT NULL,

    CONSTRAINT "RolPermiso_pkey" PRIMARY KEY ("id_rol","id_permiso")
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id_cliente" SERIAL NOT NULL,
    "id_persona" INTEGER NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("id_cliente")
);

-- CreateTable
CREATE TABLE "Proveedor" (
    "id_proveedor" SERIAL NOT NULL,
    "id_persona" INTEGER NOT NULL,
    "empresa" TEXT,

    CONSTRAINT "Proveedor_pkey" PRIMARY KEY ("id_proveedor")
);

-- CreateTable
CREATE TABLE "Categoria" (
    "id_categoria" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("id_categoria")
);

-- CreateTable
CREATE TABLE "Inventario" (
    "id_inventario" SERIAL NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "id_sucursal" INTEGER NOT NULL,
    "stock" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Inventario_pkey" PRIMARY KEY ("id_inventario")
);

-- CreateTable
CREATE TABLE "MovimientoInventario" (
    "id_movimiento" SERIAL NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "id_sucursal" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_usuario" INTEGER,

    CONSTRAINT "MovimientoInventario_pkey" PRIMARY KEY ("id_movimiento")
);

-- CreateTable
CREATE TABLE "Caja" (
    "id_caja" SERIAL NOT NULL,
    "id_sucursal" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Caja_pkey" PRIMARY KEY ("id_caja")
);

-- CreateTable
CREATE TABLE "AperturaCaja" (
    "id_apertura" SERIAL NOT NULL,
    "id_caja" INTEGER NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "monto_inicial" DECIMAL(10,2) NOT NULL,
    "fecha_apertura" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fecha_cierre" TIMESTAMP(3),
    "estado" TEXT NOT NULL,

    CONSTRAINT "AperturaCaja_pkey" PRIMARY KEY ("id_apertura")
);

-- CreateTable
CREATE TABLE "MetodoPago" (
    "id_metodo_pago" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "MetodoPago_pkey" PRIMARY KEY ("id_metodo_pago")
);

-- CreateTable
CREATE TABLE "VentaDetalle" (
    "id_detalle" SERIAL NOT NULL,
    "id_venta" INTEGER NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "precio" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "VentaDetalle_pkey" PRIMARY KEY ("id_detalle")
);

-- CreateTable
CREATE TABLE "VentaPago" (
    "id_pago" SERIAL NOT NULL,
    "id_venta" INTEGER NOT NULL,
    "id_metodo_pago" INTEGER NOT NULL,
    "monto" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "VentaPago_pkey" PRIMARY KEY ("id_pago")
);

-- CreateTable
CREATE TABLE "Auditoria" (
    "id_auditoria" SERIAL NOT NULL,
    "tabla" TEXT NOT NULL,
    "accion" TEXT NOT NULL,
    "id_registro" INTEGER,
    "datos_antes" JSONB,
    "datos_despues" JSONB,
    "fecha" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_usuario" INTEGER,

    CONSTRAINT "Auditoria_pkey" PRIMARY KEY ("id_auditoria")
);

-- CreateIndex
CREATE UNIQUE INDEX "Persona_numero_documento_key" ON "Persona"("numero_documento");

-- CreateIndex
CREATE UNIQUE INDEX "Trabajador_codigo_trabajador_key" ON "Trabajador"("codigo_trabajador");

-- CreateIndex
CREATE UNIQUE INDEX "Rol_nombre_key" ON "Rol"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Categoria_nombre_key" ON "Categoria"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Inventario_id_producto_id_sucursal_key" ON "Inventario"("id_producto", "id_sucursal");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_id_trabajador_key" ON "Usuario"("id_trabajador");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_username_key" ON "Usuario"("username");

-- AddForeignKey
ALTER TABLE "Trabajador" ADD CONSTRAINT "Trabajador_id_persona_fkey" FOREIGN KEY ("id_persona") REFERENCES "Persona"("id_persona") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrabajadorSucursal" ADD CONSTRAINT "TrabajadorSucursal_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrabajadorSucursal" ADD CONSTRAINT "TrabajadorSucursal_id_sucursal_fkey" FOREIGN KEY ("id_sucursal") REFERENCES "Sucursal"("id_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioRol" ADD CONSTRAINT "UsuarioRol_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioRol" ADD CONSTRAINT "UsuarioRol_id_rol_fkey" FOREIGN KEY ("id_rol") REFERENCES "Rol"("id_rol") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolPermiso" ADD CONSTRAINT "RolPermiso_id_rol_fkey" FOREIGN KEY ("id_rol") REFERENCES "Rol"("id_rol") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolPermiso" ADD CONSTRAINT "RolPermiso_id_permiso_fkey" FOREIGN KEY ("id_permiso") REFERENCES "Permiso"("id_permiso") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_id_persona_fkey" FOREIGN KEY ("id_persona") REFERENCES "Persona"("id_persona") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Proveedor" ADD CONSTRAINT "Proveedor_id_persona_fkey" FOREIGN KEY ("id_persona") REFERENCES "Persona"("id_persona") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Producto" ADD CONSTRAINT "Producto_id_categoria_fkey" FOREIGN KEY ("id_categoria") REFERENCES "Categoria"("id_categoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventario" ADD CONSTRAINT "Inventario_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventario" ADD CONSTRAINT "Inventario_id_sucursal_fkey" FOREIGN KEY ("id_sucursal") REFERENCES "Sucursal"("id_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovimientoInventario" ADD CONSTRAINT "MovimientoInventario_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovimientoInventario" ADD CONSTRAINT "MovimientoInventario_id_sucursal_fkey" FOREIGN KEY ("id_sucursal") REFERENCES "Sucursal"("id_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MovimientoInventario" ADD CONSTRAINT "MovimientoInventario_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Caja" ADD CONSTRAINT "Caja_id_sucursal_fkey" FOREIGN KEY ("id_sucursal") REFERENCES "Sucursal"("id_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AperturaCaja" ADD CONSTRAINT "AperturaCaja_id_caja_fkey" FOREIGN KEY ("id_caja") REFERENCES "Caja"("id_caja") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AperturaCaja" ADD CONSTRAINT "AperturaCaja_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id_cliente") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_sucursal_fkey" FOREIGN KEY ("id_sucursal") REFERENCES "Sucursal"("id_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_apertura_fkey" FOREIGN KEY ("id_apertura") REFERENCES "AperturaCaja"("id_apertura") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VentaDetalle" ADD CONSTRAINT "VentaDetalle_id_venta_fkey" FOREIGN KEY ("id_venta") REFERENCES "Venta"("id_venta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VentaDetalle" ADD CONSTRAINT "VentaDetalle_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VentaPago" ADD CONSTRAINT "VentaPago_id_venta_fkey" FOREIGN KEY ("id_venta") REFERENCES "Venta"("id_venta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VentaPago" ADD CONSTRAINT "VentaPago_id_metodo_pago_fkey" FOREIGN KEY ("id_metodo_pago") REFERENCES "MetodoPago"("id_metodo_pago") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Auditoria" ADD CONSTRAINT "Auditoria_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id_usuario") ON DELETE SET NULL ON UPDATE CASCADE;
