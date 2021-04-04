import pandas as pd
import numpy as np

df = pd.DataFrame(    
    data = np.random.randint(
        0, 10, (6,4)
    ),
    columns = ["h1", "h2", "h3,", "h4"]
)

print(df)