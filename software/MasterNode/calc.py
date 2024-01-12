from scipy.optimize import minimize
import numpy

def calculate_time_differences(timestamps):
    """
    Calculate the time differences between a list of timestamps in nanoseconds.

    :param timestamps: A list of timestamps in 64-bit nanoseconds format.
    :return: A list of time differences in seconds, relative to the lowest timestamp.
    """
    min_timestamp = min(timestamps)

    timestamps = [(ts - min_timestamp) for ts in timestamps] 
    #print(timestamps)
    # Convert nanosecond timestamps to seconds
    timestamps_in_seconds = [(ts / 1000000) for ts in timestamps]

    # Find the lowest timestamp
   

    # Calculate differences from the lowest timestamp
    #time_differences = [ts - min_timestamp for ts in timestamps_in_seconds]

    return timestamps_in_seconds


def tdoa_solve(delays_to_stations, stations_coordinates):
    # inspired by https://www.ece.ucf.edu/seniordesign/sp2019su2019/g04/Docs/CONFERENCEPAPER.pdf
    def error(x, c, d):
        value = sum([(numpy.linalg.norm(x - c[i]) - numpy.linalg.norm(x - c[0]) - 331.3 * (d[i] - d[0])) ** 2 for i in range(1, len(d))])
#         print((x, value))
        return value
    x0 = numpy.array([1,1])
    return minimize(error, x0, args=(stations_coordinates, delays_to_stations), method='Nelder-Mead').x

if __name__ == "__main__":
    stations = list(numpy.array([[0,0], [0,2], [2,0], [2,2]])) # the four sensors must be non-planar otherwise it won't be able to solve for the third dimension.
    delays_to_stations_list = [
      
        [1672527601004600, 1672527601002000, 1672527601006100, 1672527601004600],# 0.75,0.75,0
    ]
    delays_to_stations_list2 = [
        [ 0.004607047873205681,0.002060334444016747,  0.006181003332050241, 0.0046070478732056812],  # 0.5,0.5,0.5
    ]
    for delays_to_stations in delays_to_stations_list:
        print(calculate_time_differences(delays_to_stations))
        print(tdoa_solve(calculate_time_differences(delays_to_stations) , stations))
    for delays_to_stations in delays_to_stations_list2:
        print(delays_to_stations)
        print(tdoa_solve(delays_to_stations , stations))