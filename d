commit 672007bae525172f8c5d52edb371ff725d59cc7d (HEAD -> master, origin/master, 
origin/HEAD)
Author: joaodolobo <41696617+joaodolobo@users.noreply.github.com>
Date:   Tue Oct 22 13:37:49 2019 +0100

    primeira versao decente

diff --git a/.ipynb_checkpoints/Gini_coefficients-checkpoint.ipynb b/.ipynb_chec
kpoints/Gini_coefficients-checkpoint.ipynb
index ed41e77..39c4f0f 100644
--- a/.ipynb_checkpoints/Gini_coefficients-checkpoint.ipynb
+++ b/.ipynb_checkpoints/Gini_coefficients-checkpoint.ipynb
@@ -2,11 +2,262 @@
  "cells": [
   {
    "cell_type": "code",
-   "execution_count": 1,
+   "execution_count": 79,
    "metadata": {},
    "outputs": [],
    "source": [
-    "import numpy as np"
+    "import os\n",
+    "import numpy as np\n",
+    "import pandas as pd\n",
+    "import matplotlib as plt\n",
+    "import matplotlib.pyplot as plt"
+   ]
+  },
+  {
+   "cell_type": "code",
+   "execution_count": 10,
+   "metadata": {},
+   "outputs": [],
+   "source": [
+    "os.chdir('C:/Users/jan_lenovo/Documents/MEGA/03_Doutoramento/08_Apresenta�
�ões_publicações/E-Planning')"
+   ]
+  },
+  {
+   "cell_type": "code",
+   "execution_count": 18,
+   "metadata": {},
+   "outputs": [],
+   "source": [
+    "df_capacitated = pd.read_excel(\"Custos_por_algoritmos.xlsx\", sheet_name=
\"Capacitated_facility\", header=0,\\\n",
+    "             dtype= {'SubSection': str})"
+   ]
+  },
+  {
+   "cell_type": "code",
+   "execution_count": 51,
+   "metadata": {},
+   "outputs": [],
+   "source": [
+    "#df_capacitated[-1:]\n",
+    "df_capacitated = df_capacitated[:-1]"
+   ]
+  },
+  {
+   "cell_type": "code",
+   "execution_count": 136,
+   "metadata": {},
+   "outputs": [
+    {
+     "data": {
+      "text/html": [
+       "<div>\n",
+       "<style scoped>\n",
+       "    .dataframe tbody tr th:only-of-type {\n",
+       "        vertical-align: middle;\n",
+       "    }\n",
+       "\n",
+       "    .dataframe tbody tr th {\n",
+       "        vertical-align: top;\n",
+       "    }\n",
+       "\n",
+       "    .dataframe thead th {\n",
+       "        text-align: right;\n",
+       "    }\n",
+       "</style>\n",
+       "<table border=\"1\" class=\"dataframe\">\n",
+       "  <thead>\n",
+       "    <tr style=\"text-align: right;\">\n",
+       "      <th></th>\n",
+       "      <th>SubSection</th>\n",
+       "      <th>School</th>\n",
+       "      <th>Capacity</th>\n",
+       "      <th>Alunos_alocados</th>\n",
+       "      <th>Unnamed: 4</th>\n",
+       "      <th>Custo</th>\n",
+       "      <th>Dist</th>\n",
+       "      <th>per_alunos</th>\n",
+       "      <th>per_dist</th>\n",
+       "      <th>per_cum_pessoas</th>\n",
+       "      <th>per_cum_distancias</th>\n",
+       "    </tr>\n",
+       "  </thead>\n",
+       "  <tbody>\n",
+       "    <tr>\n",
+       "      <th>0</th>\n",
+       "      <td>1180600225</td>\n",
+       "      <td>1.180600e+09</td>\n",
+       "      <td>225.0</td>\n",
+       "      <td>1.745890</td>\n",
+       "      <td>NaN</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.001982</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.001982</td>\n",
+       "      <td>0.000000</td>\n",
+       "    </tr>\n",
+       "    <tr>\n",
+       "      <th>1</th>\n",
+       "      <td>1180700206</td>\n",
+       "      <td>1.180700e+09</td>\n",
+       "      <td>225.0</td>\n",
+       "      <td>1.163920</td>\n",
+       "      <td>NaN</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.001321</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.003303</td>\n",
+       "      <td>0.000000</td>\n",
+       "    </tr>\n",
+       "    <tr>\n",
+       "      <th>2</th>\n",
+       "      <td>1181000301</td>\n",
+       "      <td>1.181000e+09</td>\n",
+       "      <td>225.0</td>\n",
+       "      <td>0.775949</td>\n",
+       "      <td>NaN</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.000881</td>\n",
+       "      <td>0.000000</td>\n",
+       "      <td>0.004183</td>\n",
+       "      <td>0.000000</td>\n",
+       "    </tr>\n",
+       "    <tr>\n",
+       "      <th>3</th>\n",
+       "      <td>1181000123</td>\n",
+       "      <td>1.181000e+09</td>\n",
+       "      <td>225.0</td>\n",
+       "      <td>0.969936</td>\n",
+       "      <td>NaN</td>\n",
+       "      <td>322.990207</td>\n",
+       "      <td>0.498442</td>\n",
+       "      <td>0.001101</td>\n",
+       "      <td>0.000175</td>\n",
+       "      <td>0.005284</td>\n",
+       "      <td>0.000175</td>\n",
+       "    </tr>\n",
+       "    <tr>\n",
+       "      <th>4</th>\n",
+       "      <td>1180700304</td>\n",
+       "      <td>1.180700e+09</td>\n",
+       "      <td>225.0</td>\n",
+       "      <td>2.133860</td>\n",
+       "      <td>NaN</td>\n",
+       "      <td>352.930114</td>\n",
+       "      <td>0.544645</td>\n",
+       "      <td>0.002422</td>\n",
+       "      <td>0.000191</td>\n",
+       "      <td>0.007706</td>\n",
+       "      <td>0.000366</td>\n",
+       "    </tr>\n",
+       "  </tbody>\n",
+       "</table>\n",
+       "</div>"
+      ],
+      "text/plain": [
+       "   SubSection        School  Capacity  Alunos_alocados  Unnamed: 4  \\\
n",
+       "0  1180600225  1.180600e+09     225.0         1.745890         NaN   \n
",
+       "1  1180700206  1.180700e+09     225.0         1.163920         NaN   \n
",
+       "2  1181000301  1.181000e+09     225.0         0.775949         NaN   \n
",
+       "3  1181000123  1.181000e+09     225.0         0.969936         NaN   \n
",
+       "4  1180700304  1.180700e+09     225.0         2.133860         NaN   \n
",
+       "\n",
+       "       Custo       Dist  per_alunos  per_dist  per_cum_pessoas  \\\n",
+       "0    0.000000  0.000000    0.001982  0.000000         0.001982   \n",
+       "1    0.000000  0.000000    0.001321  0.000000         0.003303   \n",
+       "2    0.000000  0.000000    0.000881  0.000000         0.004183   \n",
+       "3  322.990207  0.498442    0.001101  0.000175         0.005284   \n",
+       "4  352.930114  0.544645    0.002422  0.000191         0.007706   \n",
+       "\n",
+       "   per_cum_distancias  \n",
+       "0            0.000000  \n",
+       "1            0.000000  \n",
+       "2            0.000000  \n",
+       "3            0.000175  \n",
+       "4            0.000366  "
+      ]
