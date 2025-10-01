from typing import Optional
import pandas as pd


def logger(val: str):
    print(f"hello world {val}")


logger("HELLOO")




class Input:


    def __init__(self, key: Optional[int]):
        self.key_val: int = key or 0

    def set_key(self, key: int):
        self.key_val = key

    def get_key(self) -> int:
        return self.key_val
