import {
  Entity,
  PrimaryColumn,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
} from "typeorm";
import { Group } from "./Group";
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
@Entity("group_roles")
export class GroupRole {
  @PrimaryColumn({ name: "group_id", type: "uuid" })
  groupId!: string;

  @PrimaryColumn({ name: "role_id", type: "uuid" })
  roleId!: string;

  @CreateDateColumn({ name: "granted_at" })
  grantedAt!: Date;

  @ManyToOne(() => Group, (group) => group.groupRoles, { onDelete: "CASCADE" })
  @JoinColumn({ name: "group_id" })
  group!: Group;

  @ManyToOne(() => Role, (role) => role.groupRoles, { onDelete: "CASCADE" })
  @JoinColumn({ name: "role_id" })
  role!: Role;
}
