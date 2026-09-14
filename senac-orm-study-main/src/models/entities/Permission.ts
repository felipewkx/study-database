import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  OneToMany,
  Index,
} from "typeorm";
import { RolePermission } from "./RolePermission";
import { RbacAuditLog } from "./RbacAuditLog";

/**
 * Entidade = mapeamento de uma tabela do banco de dados.
 *
 * Esta classe representa a tabela "usuarios".
 * Cada propriedade decorada com @Column vira uma coluna SQL.
 *
 * Crie novas entidades em src/models/entities/ seguindo este padrão.
 * Depois registre as rotas/controllers correspondentes.
 *
 * Documentação TypeORM: https://typeorm.io/entities
 */
@Entity("permissions")
@Index("idx_permissions_resource_action", ["resource", "action"])
export class Permission {
  @PrimaryGeneratedColumn("uuid")
  id!: string;

  @Column({ type: "varchar", length: 100, unique: true })
  name!: string;

  @Column({ type: "varchar", length: 50 })
  resource!: string;

  @Column({ type: "varchar", length: 50 })
  action!: string;

  @Column({ type: "text", nullable: true })
  description!: string | null;

  @CreateDateColumn({ name: "created_at" })
  createdAt!: Date;

  @OneToMany(
    () => RolePermission,
    (rolePermission) => rolePermission.permission,
  )
  rolePermissions!: RolePermission[];

  @OneToMany(() => RbacAuditLog, (log) => log.targetPermission)
  auditLogs!: RbacAuditLog[];
}
