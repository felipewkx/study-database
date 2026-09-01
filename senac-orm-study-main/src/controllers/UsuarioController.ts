import { Request, Response } from "express";
import { AppDataSource } from "../config/database";
import { User } from "../models/entities/User";
import { BaseController } from "./BaseController";

/**
 * Controller para a entidade User.
 * Demonstra o CRUD básico usando o repositório do TypeORM.
 */
export class UsuarioController extends BaseController {
  private get repository() {
    return AppDataSource.getRepository(User);
  }

  listar = this.handle(async (_req: Request, res: Response) => {
    const usuarios = await this.repository.find({
      order: { id: "ASC" },
    });
    this.ok(res, usuarios);
  });

  buscarPorId = this.handle(async (req: Request, res: Response) => {
    const id = String(req.params.id);

    if (!id) {
      this.badRequest(res, "ID inválido");
      return;
    }

    const usuario = await this.repository.findOneBy({ id });

    if (!usuario) {
      this.notFound(res, `Usuário ${id} não encontrado`);
      return;
    }

    this.ok(res, usuario);
  });

  criar = this.handle(async (req: Request, res: Response) => {
    const { username, email, passwordHash, isActive } = req.body;

    if (!username || !email || !passwordHash) {
      this.badRequest(res, "Campos obrigatórios: username, email, passwordHash");
      return;
    }

    const usuario = this.repository.create({
      username,
      email,
      passwordHash,
      isActive: isActive ?? true,
    });

    const salvo = await this.repository.save(usuario);
    this.created(res, salvo);
  });

  atualizar = this.handle(async (req: Request, res: Response) => {
    const id = String(req.params.id);

    if (!id) {
      this.badRequest(res, "ID inválido");
      return;
    }

    const usuario = await this.repository.findOneBy({ id });

    if (!usuario) {
      this.notFound(res, `Usuário ${id} não encontrado`);
      return;
    }

    const { username, email, passwordHash, isActive, lastLogin } = req.body;

    if (username !== undefined) usuario.username = username;
    if (email !== undefined) usuario.email = email;
    if (passwordHash !== undefined) usuario.passwordHash = passwordHash;
    if (isActive !== undefined) usuario.isActive = isActive;
    if (lastLogin !== undefined) usuario.lastLogin = lastLogin;

    const atualizado = await this.repository.save(usuario);
    this.ok(res, atualizado);
  });

  remover = this.handle(async (req: Request, res: Response) => {
    const id = String(req.params.id);

    if (!id) {
      this.badRequest(res, "ID inválido");
      return;
    }

    const usuario = await this.repository.findOneBy({ id });

    if (!usuario) {
      this.notFound(res, `Usuário ${id} não encontrado`);
      return;
    }

    await this.repository.remove(usuario);
    this.ok(res, { message: `Usuário ${id} removido` });
  });
}
