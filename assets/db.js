const Database = {

    db: null,


    async init(file) {

        const SQL = await initSqlJs({
            locateFile: file =>
            `https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.10.3/${file}`
        });


        const sql =
            await fetch(file)
            .then(r => r.text());


        this.db = new SQL.Database();

        this.db.run(sql);


        return this;
    },


    query(sql, params = []) {

        const stmt =
            this.db.prepare(sql);


        stmt.bind(params);


        const rows = [];


        while(stmt.step()) {
            rows.push(
                stmt.getAsObject()
            );
        }


        stmt.free();


        return rows;
    },


    getAll(filters = {}) {

        let query = `
            SELECT *
            FROM dragons
            WHERE 1=1
        `;


        const params = [];


        if(filters.set) {

            query += `
            AND dragon_set = ?
            `;

            params.push(filters.set);
        }


        if(filters.rarity) {

            query += `
            AND rarity = ?
            `;

            params.push(filters.rarity);
        }


        if(filters.essence) {

            query += `
            AND essence = ?
            `;

            params.push(filters.essence);
        }


        return this.query(query, params);

    },


    getSets() {

        return this.query(
            "SELECT * FROM dragon_sets"
        );

    },


    getRarities() {

        return this.query(
            "SELECT * FROM rarities"
        );

    },


    getEssences() {

        return this.query(
            "SELECT * FROM essence"
        );

    }

};