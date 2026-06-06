let db;


async function init() {
    const SQL = await initSqlJs({
        locateFile: file =>
            `https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.10.3/${file}`
    });
    
    // Load db
    const sqlText = await fetch("assets/hddb.sql").then(r => r.text());
    db = new SQL.Database();
    db.run(sqlText);


    // Add values to selects
    const setSelect = document.getElementById("set-filter");
    const raritySelect = document.getElementById("rarity-filter");
    const essenceSelect = document.getElementById("essence-filter");

    const setStmt = db.prepare("SELECT *  FROM dragon_sets");
    const rarityStmt = db.prepare("SELECT * FROM rarities");
    const essenceStmt = db.prepare("SELECT * FROM essence");

    while (setStmt.step()) {
        setSelect.innerHTML += `<option value="${setStmt.getAsObject().name}">${setStmt.getAsObject().name}</option>`;
    }

    while (rarityStmt.step()) {
        raritySelect.innerHTML += `<option value="${rarityStmt.getAsObject().name}">${rarityStmt.getAsObject().name}</option>`;
    }

    while (essenceStmt.step()) {
        essenceSelect.innerHTML += `<option value="${essenceStmt.getAsObject().name}">${essenceStmt.getAsObject().name}</option>`;
    }


    // refilter whenever a dropdown changes
    document.getElementById("set-filter").addEventListener("change", applyFilters)
    document.getElementById("rarity-filter").addEventListener("change", applyFilters);
    document.getElementById("essence-filter").addEventListener("change", applyFilters);

    applyFilters();

}

function applyFilters() {
    const set = document.getElementById("set-filter").value;
    const rarity = document.getElementById("rarity-filter").value;
    const essence = document.getElementById("essence-filter").value;

    const stmt = db.prepare(`
        SELECT *
        FROM dragons
        WHERE
            ${set === "" ? "1" : `dragon_set = '${set}'`} AND
            ${rarity === "" ? "1" : `rarity = '${rarity}'`} AND
            ${essence === "" ? "1" : `essence = '${essence}'`}
    `);

    const dragons = [];

    while (stmt.step()) {
        dragons.push(
            stmt.getAsObject()
        );
    }

    renderTable(dragons);
}

function renderTable(dragons = []) {
    table = document.getElementById("results");
    tableHtml = "";
    dragons.forEach(d => {
        tableHtml += `
            <div class="card ${d.rarity.toLowerCase()}" gap:8px;">
                <img src="assets/dragons/${d.name}.jpg" width=64 height=64> 
                <div class="column">
                    <div>
                        <span>${d.name}</span>  <a href="https://hatch-dragons.fandom.com/wiki/${d.name.replace(" ", "_")}"><span class="tag wiki">Wiki 🔗</span></a> <span class="tag type ${d.dragon_type}">${d.dragon_type}</span>
                    </div>
                    <div>
                        <span class="tag set ${d.dragon_set.replace(" ", "_")}">${d.dragon_set}</span>
                        <span class="tag essence ${d.essence}">${d.essence}</span>
                        <span class="tag rarity ${d.rarity}">${d.rarity}</span>
                    </div>
                </div>
            </div>
            `
    });
    table.innerHTML = tableHtml;
}

init();