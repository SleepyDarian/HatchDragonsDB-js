const App = {

    db: null,

    init: async function() {

        this.db = await Database.init(
            "assets/hddb.sql"
        );

        UI.init();

        this.loadFilters();

        this.bindEvents();

        this.applyFilters();
    },


    loadFilters: function() {

        UI.fillSelect(
            "set-filter",
            this.db.getSets()
        );

        UI.fillSelect(
            "rarity-filter",
            this.db.getRarities()
        );

        UI.fillSelect(
            "essence-filter",
            this.db.getEssences()
        );

    },


    bindEvents: function() {

        document
        .querySelectorAll(".filter")
        .forEach(el => {

            el.addEventListener(
                "change",
                () => this.applyFilters()
            );

        });

    },


    applyFilters: function() {

        const filters = UI.getFilters();

        const dragons =
            this.db.getAll(filters);

        UI.renderDragons(dragons);
    }

};

App.init();