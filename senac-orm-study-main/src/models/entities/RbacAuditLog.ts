import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
} from "typeorm";
import { User } from "./User";
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
@Entity("rbac_audit_logs")
export class RbacAuditLog {
  @PrimaryGeneratedColumn("uuid")
  id!: string;

  @Column({ name: "user_id", type: "uuid", nullable: true })
  userId!: string | null;

  @Column({ name: "action_type", type: "varchar", length: 50 })
  actionType!: string;

  @Column({ name: "target_user_id", type: "uuid", nullable: true })
  targetUserId!: string | null;

  @Column({ name: "target_role_id", type: "uuid", nullable: true })
  targetRoleId!: string | null;

  @Column({ name: "target_permission_id", type: "uuid", nullable: true })
  targetPermissionId!: string | null;

  @Column({ name: "ip_address", type: "varchar", length: 45, nullable: true })
  ipAddress!: string | null;

  @CreateDateColumn({ name: "created_at" })
  createdAt!: Date;

  @ManyToOne(() => User, (user) => user.auditLogs, {
    onDelete: "SET NULL",
    nullable: true,
  })
  @JoinColumn({ name: "user_id" })
  user!: User | null;

  @ManyToOne(() => User, (user) => user.targetAuditLogs, {
    onDelete: "SET NULL",
    nullable: true,
  })
  @JoinColumn({ name: "target_user_id" })
  targetUser!: User | null;

  @ManyToOne(() => Role, {
    onDelete: "SET NULL",
    nullable: true,
  })
  @JoinColumn({ name: "target_role_id" })
  targetRole!: Role | null;

  @ManyToOne(() => Permission, {
    onDelete: "SET NULL",
    nullable: true,
  })
  @JoinColumn({ name: "target_permission_id" })
  targetPermission!: Permission | null;
}
