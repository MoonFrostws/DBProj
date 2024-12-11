const API_URL = 'http://localhost:8080/api/apartments/available';

// Fetch available apartments from the backend
async function fetchAvailableApartments() {
    console.log('Fetching available apartments...');
    try {
        const response = await fetch(API_URL);
        if (!response.ok) {
            throw new Error(`Failed to fetch: ${response.status} - ${response.statusText}`);
        }
        const apartments = await response.json();
        console.log('Received data:', apartments); // Log received data
        populateApartmentTable(apartments);
    } catch (error) {
        console.error('Error fetching available apartments:', error);
        alert('Failed to fetch available apartments. Please check the console for more details.');
    }
}

// Populate the table with apartment data
function populateApartmentTable(apartments) {
    const tableBody = document.getElementById('apartmentTableBody');
    tableBody.innerHTML = ''; // Clear existing table rows

    if (!apartments || apartments.length === 0) {
        const row = document.createElement('tr');
        row.innerHTML = `<td colspan="7" style="text-align: center;">No apartments available</td>`;
        tableBody.appendChild(row);
        return;
    }

    apartments.forEach(apartment => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${apartment.apartmentID}</td>
            <td>${apartment.buildingID}</td>
            <td>${apartment.buildingNumber || 'N/A'}</td>
            <td>${apartment.floorNumber || 'N/A'}</td>
            <td>${apartment.numberOfRooms || 'N/A'}</td>
            <td>${apartment.rent}</td>
            <td>${apartment.status}</td>
        `;
        tableBody.appendChild(row);
    });
}

// Trigger the fetch function when the page loads
document.addEventListener('DOMContentLoaded', fetchAvailableApartments);
