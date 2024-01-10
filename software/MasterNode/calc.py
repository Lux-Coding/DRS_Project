import numpy as np
from scipy.optimize import minimize

# Constants
SPEED_OF_SOUND = 343  # Speed of sound in air in m/s

def triangulate_sound_source(mic_positions, arrival_times):
    """
    Triangulate the position of a sound source given the positions of microphones and the arrival times of the sound at each microphone.

    :param mic_positions: A list of tuples (x, y, z) representing the positions of the microphones.
    :param arrival_times: A list of timestamps (in seconds) when each microphone receives the sound.
    :return: Estimated position of the sound source (x, y, z).
    """

    # Reference microphone (first microphone)
    ref_pos = mic_positions[0]
    ref_time = arrival_times[0]

    # Function to minimize (sum of squared differences between actual and calculated distances)
    def objective_function(source_pos):
        x, y, z = source_pos
        errors = []

        for (mx, my, mz), t in zip(mic_positions, arrival_times):
            measured_dist = SPEED_OF_SOUND * (t - ref_time)
            calculated_dist = np.sqrt((x - mx)**2 + (y - my)**2 + (z - mz)**2)
            errors.append((measured_dist - calculated_dist)**2)

        return sum(errors)

    # Initial guess for the source's position
    initial_guess = np.mean(mic_positions, axis=0)

    # Minimize the objective function
    result = minimize(objective_function, initial_guess, method='L-BFGS-B')

    return result.x if result.success else None

# 0,707 ; 6,18
# 1,5811 ; 
# 2,12
# 1,5811
timestamp = 56765
# Example usage
mic_positions = [(0, 0, 0), (2, 0, 0), (0, 2, 0), (2, 2, 0)]  # Positions of four microphones
arrival_times = [timestamp+(1.5811/SPEED_OF_SOUND) , timestamp+(0.707/SPEED_OF_SOUND),timestamp+ (1.5811/SPEED_OF_SOUND),timestamp+ (2.12/SPEED_OF_SOUND)]  # Arrival times at each microphone in seconds

estimated_source_position = triangulate_sound_source(mic_positions, arrival_times)
print("Estimated Source Position:", estimated_source_position)
