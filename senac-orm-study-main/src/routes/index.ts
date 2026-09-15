import { Router } from "express";
import userRoutes from "./user.routes";

const routes = Router();

routes.get("/health", (_req, res) => {
  res.json({
    success: true,
    data: {
      status: "ok",
      message: "API senac-orm em execução",
    },
  });
});

routes.use("/users", userRoutes);

export default routes;
