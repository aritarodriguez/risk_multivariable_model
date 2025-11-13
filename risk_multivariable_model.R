########################################
# 1. LIBRERÍAS
########################################

if (!require("readxl")) install.packages("readxl")
if (!require("dplyr"))  install.packages("dplyr")
if (!require("GGally")) install.packages("GGally")

library(readxl)
library(dplyr)
library(GGally)

########################################
# 2. LEER EL DATASET
########################################

df <- read_excel("C:/Users/User/Desktop/Certificado Data Science/Excel data sets/fin_cars_1000.xlsx")

# Opcional: ver estructura
str(df)
head(df)

# Nombres de las variables (para que los tengas claros):
# riesgo (VARIABLE DEPENDIENTE)
# tasa_interes
# morosidad
# clientes
# ingreso_promedio
# plazo_meses
# monto_promedio
# costo_operativo

########################################
# 3. DEPURACIÓN Y LIMPIEZA
########################################

# Eliminar duplicados
df <- df %>% distinct()

# Eliminar registros con valores en blanco (NA) en alguna variable
df <- df %>%
  filter(if_all(everything(), ~ !is.na(.)))

# Si quieres, puedes renombrar a "datos" como en el ejemplo del profe
datos <- df

########################################
# 4. ANÁLISIS MULTIVARIABLE (GGPAIRS)
########################################

ggpairs(
  datos,
  lower = list(continuous = "smooth"),
  diag  = list(continuous = "bar"),
  axisLabels = "none"
)

########################################
# 5. MODELO CON FULL VARIABLES
#    Resultado = riesgo
########################################

modelo_full <- lm(
  riesgo ~ tasa_interes + morosidad + clientes +
    ingreso_promedio + plazo_meses +
    monto_promedio + costo_operativo,
  data = datos
)

summary(modelo_full)

# Intervalos de confianza del modelo completo (opcional)
confint(modelo_full)

########################################
# 6. MODELO CON VARIABLES SIGNIFICATIVAS
########################################
# (Este paso depende de los p-values del summary)

# Después de ver summary(modelo_full),
# elige las variables con p-value más bajo (idealmente < 0.05).
# Ejemplo de cómo podría verse (AJÚSTALO según tus resultados):

mejor_modelo <- lm(
  riesgo ~ morosidad + plazo_meses,  # <-- cámbialo según las variables significativas
  data = datos
)

summary(mejor_modelo)
confint(mejor_modelo)

########################################
# 7. MODELO SECUNDARIO (OPCIONAL)
########################################
# Igual que en el ejemplo del profe, puedes probar
# otro subconjunto de variables para comparar.

modelo_secundario <- lm(
  riesgo ~ tasa_interes + costo_operativo,
  data = datos
)

summary(modelo_secundario)
summary(modelo_full)
