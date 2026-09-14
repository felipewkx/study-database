import {
  Entity,
  PrimaryColumn,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  Index,
} from "typeorm";
import { Permission } from "./Permission";
import { Role } from "./Role";

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
@Entity("role_permissions")
@Index("idx_role_permissions_role_id", ["roleId"])
export class RolePermission {
  @PrimaryColumn({ name: "role_id", type: "uuid" })
  roleId!: string;

  @PrimaryColumn({ name: "permission_id", type: "uuid" })
  permissionId!: string;

  @CreateDateColumn({ name: "granted_at" })
  grantedAt!: Date;

  @ManyToOne(() => Role, (role) => role.rolePermissions, {
    onDelete: "CASCADE",
  })
  @JoinColumn({ name: "role_id" })
  role!: Role;

  @ManyToOne(() => Permission, (permission) => permission.rolePermissions, {
    onDelete: "CASCADE",
  })
  @JoinColumn({ name: "permission_id" })
  permission!: Permission;
}
