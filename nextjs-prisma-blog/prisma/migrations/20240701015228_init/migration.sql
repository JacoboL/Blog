-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Obra" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titulo" TEXT NOT NULL,
    "autorId" INTEGER NOT NULL,
    "estreno" DATETIME NOT NULL,
    "descripcion" TEXT,
    CONSTRAINT "Obra_autorId_fkey" FOREIGN KEY ("autorId") REFERENCES "Autor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Obra" ("autorId", "descripcion", "estreno", "id", "titulo") SELECT "autorId", "descripcion", "estreno", "id", "titulo" FROM "Obra";
DROP TABLE "Obra";
ALTER TABLE "new_Obra" RENAME TO "Obra";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
