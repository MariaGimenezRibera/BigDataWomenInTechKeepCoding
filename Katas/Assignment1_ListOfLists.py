def process_matrix(list):
    r = len(list)
    c = len(list[0])
    
    mat_res = []
    for i in range(r):
        r0 = [0]*(c)
        mat_res.append(r0)
    
    mat0 = []
    for i in range(r+2):
        r0 = [0]*(c+2)
        mat0.append(r0)
    
    for i in range(1, r+1):
        for j in range(1, c+1):
            mat0[i][j] =list[i-1][j-1]
            
    def value_out(i, j, pos = 5):
        return (mat0[i-1][j]+ mat0[i+1][j]+mat0[i][j]+mat0[i][j-1]+mat0[i][j+1])/pos
    #inside
    for i in range(2, r):
        for j in range(2, c):
            mat_res[i-1][j-1] = value_out(i,j,5)
    #corners
    for i in [r,1]:
        for j in [c,1]:
            mat_res[i-1][j-1] = value_out(i,j,3)
    #sides vertical
    for i in [r,1]:
        for j in range(2, c):
            mat_res[i-1][j-1] = value_out(i,j,4)
    #sides horizontal
    for i in range(2, r):
        for j in [c,1]:
            mat_res[i-1][j-1] = value_out(i,j,4)
    
    return mat_res
