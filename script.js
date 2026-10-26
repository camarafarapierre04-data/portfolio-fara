document.addEventListener("DOMContentLoaded", () => {

```
// Année automatique dans le pied de page
const yearElement = document.getElementById("current-year");

if (yearElement) {
    yearElement.textContent = new Date().getFullYear();
}

// Menu mobile
const menuToggle = document.getElementById("menu-toggle");
const navLinks = document.getElementById("nav-links");

if (menuToggle && navLinks) {
    menuToggle.addEventListener("click", () => {
        const isOpen = navLinks.classList.toggle("open");

        menuToggle.setAttribute("aria-expanded", String(isOpen));
        menuToggle.setAttribute(
            "aria-label",
            isOpen ? "Fermer le menu" : "Ouvrir le menu"
        );

        menuToggle.textContent = isOpen ? "✕" : "☰";
    });

    navLinks.querySelectorAll("a").forEach((link) => {
        link.addEventListener("click", () => {
            navLinks.classList.remove("open");
            menuToggle.setAttribute("aria-expanded", "false");
            menuToggle.setAttribute("aria-label", "Ouvrir le menu");
            menuToggle.textContent = "☰";
        });
    });
}

// Graphique de démonstration
// Les valeurs ci-dessous sont illustratives, et non des données réelles.
const chartCanvas = document.getElementById("overviewChart");

if (chartCanvas && typeof Chart !== "undefined") {
    new Chart(chartCanvas, {
        type: "line",

        data: {
            labels: [
                "Jan", "Fév", "Mar", "Avr",
                "Mai", "Juin", "Juil", "Août",
                "Sep", "Oct", "Nov", "Déc"
            ],

            datasets: [
                {
                    label: "Indicateur A",
                    data: [24, 31, 28, 42, 37, 51, 46, 58, 49, 66, 61, 74],
                    borderColor: "#38e4f0",
                    backgroundColor: "rgba(56, 228, 240, 0.10)",
                    borderWidth: 2,
                    fill: true,
                    tension: 0.4,
                    pointRadius: 2,
                    pointHoverRadius: 5
                },
                {
                    label: "Indicateur B",
                    data: [18, 22, 26, 23, 31, 28, 37, 33, 42, 39, 47, 44],
                    borderColor: "#a78bfa",
                    backgroundColor: "transparent",
                    borderWidth: 2,
                    fill: false,
                    tension: 0.4,
                    pointRadius: 0,
                    pointHoverRadius: 5
                }
            ]
        },

        options: {
            responsive: true,
            maintainAspectRatio: false,

            interaction: {
                intersect: false,
                mode: "index"
            },

            plugins: {
                legend: {
                    display: false
                },

                tooltip: {
                    backgroundColor: "#10172a",
                    borderColor: "#24304a",
                    borderWidth: 1,
                    padding: 12,
                    titleColor: "#f1f5f9",
                    bodyColor: "#cbd5e1"
                }
            },

            scales: {
                x: {
                    grid: {
                        display: false
                    },
                    border: {
                        display: false
                    },
                    ticks: {
                        color: "#8290a8",
                        maxRotation: 0,
                        font: {
                            size: 10
                        }
                    }
                },

                y: {
                    beginAtZero: true,
                    border: {
                        display: false
                    },
                    grid: {
                        color: "rgba(148, 163, 184, 0.10)"
                    },
                    ticks: {
                        color: "#8290a8",
                        font: {
                            size: 10
                        }
                    }
                }
            }
        }
    });
} else if (chartCanvas) {
    chartCanvas.insertAdjacentHTML(
        "afterend",
        '<p class="chart-error">Le graphique nécessite une connexion internet pour charger sa bibliothèque.</p>'
    );
}
```

});
