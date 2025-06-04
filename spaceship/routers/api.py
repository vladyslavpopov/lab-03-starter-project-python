from fastapi import APIRouter
import numpy as np  

router = APIRouter()

@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}

@router.get('/matrix-multiply')
def matrix_multiply() -> dict:
    matrix_a = np.random.randint(0, 10, size=(10, 10)).tolist()
    matrix_b = np.random.randint(0, 10, size=(10, 10)).tolist()

    product = (np.array(matrix_a) @ np.array(matrix_b)).tolist()

    return {
        'matrix_a': matrix_a,
        'matrix_b': matrix_b,
        'product': product
    }
