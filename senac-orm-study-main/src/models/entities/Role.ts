import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToMany,
  UpdateDateColumn,
  CreateDateColumn,
} from "typeorm";
import { UserRole } from "./UserRole";
import { GroupRole } from "./GroupRole";
import { RolePermission } from "./RolePermission";

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
@Entity("roles")
export class Role {
  @PrimaryGeneratedColumn("uuid")
  id!: string;

  @Column({ type: "varchar", length: 50, unique: true })
  name!: string;

  @Column({ type: "text", nullable: true })
  description!: string | null;

  @Column({ type: "boolean", name: "is_system", default: false })
  isSystem!: boolean;

  @CreateDateColumn({ name: "created_at" })
  createdAt!: Date;

  @UpdateDateColumn({ name: "updated_at" })
  updatedAt!: Date;

  @OneToMany(() => GroupRole, (groupRole) => groupRole.role)
  groupRoles!: GroupRole[];

  @OneToMany(() => UserRole, (userRole) => userRole.role)
  userRoles!: UserRole[];

  @OneToMany(() => RolePermission, (rolePermission) => rolePermission.role)
  rolePermissions!: RolePermission[];
}
