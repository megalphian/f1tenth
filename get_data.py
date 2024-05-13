from urllib.request import urlopen
import json

import matplotlib.pyplot as plt

def get_traj_for_driver_no(driver_no):
    response = urlopen('https://api.openf1.org/v1/location?session_key=latest&driver_number={}'.format(driver_no))
    data = json.loads(response.read().decode('utf-8'))

    positions = []

    for data_point in data:
        positions.append((data_point['x'], data_point['y']))

    return positions

sainz_positions = get_traj_for_driver_no(55)
piastri_positions = get_traj_for_driver_no(81)

fig, ax = plt.subplots()
ax.plot([x for x, y in sainz_positions], [y for x, y in sainz_positions], label='Sainz')
ax.plot([x for x, y in piastri_positions], [y for x, y in piastri_positions], label='Piastri')

ax.legend()

plt.show()