const UI = {


    init() {
        this.results =
            document.getElementById(
                "results"
            );

        this.view = localStorage.getItem("view") || "list";
        this.setView(this.view);

        document
            .getElementById("card-view")
            .addEventListener("click", () => {
                this.setView("cards");
            });


        document
            .getElementById("list-view")
            .addEventListener("click", () => {
                this.setView("list");
            });
    },


    getFilters() {
        return {
            set:
                document.getElementById(
                    "set-filter"
                ).value,

            rarity:
                document.getElementById(
                    "rarity-filter"
                ).value,

            essence:
                document.getElementById(
                    "essence-filter"
                ).value
        };
    },


    fillSelect(id, values) {
        const select =
            document.getElementById(id);

        values.forEach(v => {
            select.innerHTML += `
            <option>
                ${v.name}
            </option>
            `;
        });

    },


    renderDragons(dragons) {
        this.results.innerHTML =
            dragons.map(d => `
        <div class="card ${d.rarity.toLowerCase()}">
            <img src="assets/dragons/${d.name}.jpg" width="64" height="64">
            <div class="column">
                <div>
                    <span> ${d.name} </span> 
                    <a href="https://hatch-dragons.fandom.com/wiki/${d.name.replaceAll(" ", "_")}">
                        <span class="tag wiki">
                            Wiki 🔗
                        </span>
                    </a>
                </div>
                <div>
                    <span class="tag type ${d.dragon_type}">${d.dragon_type}</span>
                </div>
                <div>
                    <span class="tag set ${d.dragon_set.replaceAll(" ", "_")}"> ${d.dragon_set} </span>
                    <span class="tag essence ${d.essence}"> ${d.essence} </span>
                    <span class="tag rarity ${d.rarity}"> ${d.rarity} </span>
                </div>
            </div>
        </div>
        `).join("");
    },

    setView(view) {

        this.results.classList.remove(
            "cards",
            "list"
        );

        this.results.classList.add(view);

        document
            .querySelectorAll(".view-toggle button")
            .forEach(btn =>
                btn.classList.remove("active")
            );
        
        
        document
            .getElementById(`${view === "cards" ? "card" : "list"}-view`)
            .classList.add("active");

        localStorage.setItem("view", view);

    }

};