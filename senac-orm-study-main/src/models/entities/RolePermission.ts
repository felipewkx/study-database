import {
  Entity,
  PrimaryColumn,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
} from "typeorm";

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
export class RolePermission {
  @PrimaryColumn({ name: "role_id", type: "uuid" })
  roleId!: string;

  @PrimaryColumn({ name: "permission_id", type: "uuid" })
  permissionId!: string;

  @CreateDateColumn({ name: "granted_at" })
  grantedAt?: Date;
}
