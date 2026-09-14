import {
  Entity,
  PrimaryColumn,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  Index,
} from "typeorm";
import { User } from "./User";
import { Group } from "./Group";

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
@Index("idx_user_groups_user_id", ["userId"])
export class UserGroup {
  @PrimaryColumn({ name: "user_id", type: "uuid" })
  userId!: string;

  @PrimaryColumn({ name: "group_id", type: "uuid" })
  groupId!: string;

  @CreateDateColumn({ name: "joined_at" })
  joinedAt!: Date;

  @ManyToOne(() => User, (user) => user.userGroups, { onDelete: "CASCADE" })
  @JoinColumn({ name: "user_id" })
  user!: User;

  @ManyToOne(() => Group, (group) => group.userGroups, { onDelete: "CASCADE" })
  @JoinColumn({ name: "group_id" })
  group!: Group;
}
