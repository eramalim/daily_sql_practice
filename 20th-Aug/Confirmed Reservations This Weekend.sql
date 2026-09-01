/*Problem Description:

A restaurant wants a list of every confirmed reservation for this weekend (September 14–15, 2024), 
so the host stand can prepare the seating chart ahead of time.*/

Select guest_name,
party_size, reservation_date
from reservations where status ='Confirmed' 
and reservation_date between '2024-09-14' and '2024-09-15'
order by reservation_date, guest_name
