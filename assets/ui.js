const UI = {


    init() {
        this.results =
            document.getElementById(
                "results"
            );
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
                    <a href="https://hatch-dragons.fandom.com/wiki/${d.name.replaceAll(" ","_")}">
                        <span class="tag wiki">
                            Wiki 🔗
                        </span>
                    </a>
                    <span class="tag type ${d.dragon_type}">${d.dragon_type}</span>
                </div>
                <div>
                    <span class="tag set ${d.dragon_set.replaceAll(" ","_")}"> ${d.dragon_set} </span>
                    <span class="tag essence ${d.essence}"> ${d.essence} </span>
                    <span class="tag rarity ${d.rarity}"> ${d.rarity} </span>
                </div>
            </div>
        </div>
        `).join("");
    }

};