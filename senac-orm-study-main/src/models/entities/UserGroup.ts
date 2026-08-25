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
@Entity("user_groups")
export class UserGroup {
  @PrimaryColumn({ name: "user_id", type: "char", length: 36 })
  userId!: string;

  @PrimaryColumn({ name: "group_id", type: "char", length: 36 })
  groupId!: string;

  @CreateDateColumn({ name: "joined_at" })
  joinedAt?: Date;
}
