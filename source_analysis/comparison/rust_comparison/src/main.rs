use sqlx::{postgres::PgPoolOptions, Pool, Postgres};
use std::env;

#[tokio::main]
async fn main() {
    println!("Hello, world!");
    let pool = connect().await.unwrap();

    let _z = taxa_distribution(&pool).await.unwrap();
}

async fn connect() -> Result<sqlx::Pool<Postgres>, sqlx::Error>{
    let connection_string = format!(
        "postgres://{}:{}@{}:{}/{}",
        env::var("PG_USER").unwrap(),
        env::var("PG_PASSWORD").unwrap(),
        env::var("PG_HOST").unwrap(),
        env::var("PG_PORT").unwrap(),
        env::var("PG_DATABASE").unwrap(),
    );

    let pool = PgPoolOptions::new()
    .max_connections(5)
    .connect(&connection_string).await?;
    Ok(pool)
}

async fn _do_query(pool:&Pool<Postgres>) -> Result<(), sqlx::Error>{
    let row: (i64,) = sqlx::query_as("SELECT count(*) FROM sur_mat")
    .bind(150_i64)
    .fetch_one(pool).await?;

    println!("Row:{}", row.0);

    Ok(())
}

async fn taxa_distribution(pool:&Pool<Postgres>) -> Result<(), sqlx::Error> {
    // All records
    let mut row: (i64,) = sqlx::query_as("SELECT count(sm.*)
    FROM sur_mat sm
    JOIN nomenclature.species s on sm.tik = s.id
    JOIN nomenclature.genus g on s.parent = g.id
    JOIN nomenclature.family f on g.parent = f.id
    JOIN nomenclature.superfamily sf on f.parent = sf.id;")
    .fetch_one(pool).await?;

    println!("Total records: {}", row.0);

    // Bombus records
    row = sqlx::query_as("SELECT count(sm.*)
    FROM sur_mat sm
    JOIN nomenclature.species s on sm.tik = s.id
    JOIN nomenclature.genus g on s.parent = g.id
    JOIN nomenclature.family f on g.parent = f.id
    JOIN nomenclature.superfamily sf on f.parent = sf.id
    WHERE g.name = $1;")
    .bind("Bombus")
    .fetch_one(pool).await?;

    println!("Bombus records: {}", row.0);

    // Other bee records
    row = sqlx::query_as("SELECT count(sm.*)
    FROM sur_mat sm
    JOIN nomenclature.species s on sm.tik = s.id
    JOIN nomenclature.genus g on s.parent = g.id
    JOIN nomenclature.family f on g.parent = f.id
    JOIN nomenclature.superfamily sf on f.parent = sf.id
    WHERE g.name != $1
    AND f.name = $2;")
    .bind("Bombus")
    .bind("Apidae")
    .fetch_one(pool).await?;

    println!("Other bee records: {}", row.0);

    // Social (Crabronidae) wasp records
    row = sqlx::query_as("SELECT count(sm.*)
    FROM sur_mat sm
    JOIN nomenclature.species s on sm.tik = s.id
    JOIN nomenclature.genus g on s.parent = g.id
    JOIN nomenclature.family f on g.parent = f.id
    JOIN nomenclature.superfamily sf on f.parent = sf.id
    WHERE f.name = $1;")
    .bind("Crabronidae")
    .fetch_one(pool).await?;

    println!("Social wasp records: {}", row.0);
    
    // Other wasp records
    row = sqlx::query_as("SELECT count(sm.*)
    FROM sur_mat sm
    JOIN nomenclature.species s on sm.tik = s.id
    JOIN nomenclature.genus g on s.parent = g.id
    JOIN nomenclature.family f on g.parent = f.id
    JOIN nomenclature.superfamily sf on f.parent = sf.id
    WHERE f.name != $1
    AND f.name != $2
    AND f.name !=$3;")
    .bind("Crabronidae")
    .bind("Apidae")
    .bind("Formicoidea")
    .fetch_one(pool).await?;

    println!("Other wasp records: {}", row.0);

    // Ant records
    row = sqlx::query_as("SELECT count(sm.*)
    FROM sur_mat sm
    JOIN nomenclature.species s on sm.tik = s.id
    JOIN nomenclature.genus g on s.parent = g.id
    JOIN nomenclature.family f on g.parent = f.id
    JOIN nomenclature.superfamily sf on f.parent = sf.id
    WHERE sf.name = $1;")
    .bind("Formicoidea")
    .fetch_one(pool).await?;

    println!("Ant records: {}", row.0);

    Ok(())
}