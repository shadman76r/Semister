<?php
include('../model/db.php');

// Query to fetch sports data
$sport_query = "SELECT * FROM Sports";
$sport_stid = oci_parse($conn, $sport_query);
oci_execute($sport_stid);

// Query to fetch venue data
$venue_query = "SELECT v.Venue_Name, v.Location, v.Rating, s.Sport_Name 
                FROM Venues v
                JOIN Sports s ON v.Sport_ID = s.Sport_ID";
$venue_stid = oci_parse($conn, $venue_query);
oci_execute($venue_stid);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="home.css">
</head>
<body class="mx-auto container max-w-[360px] mt-6">

<!-- Displaying Sports List -->
<h1 class="font-bold">Sports</h1>
<ul>
    <?php while ($sport = oci_fetch_assoc($sport_stid)): ?>
        <li><?php echo $sport['SPORT_NAME']; ?></li>
    <?php endwhile; ?>
</ul>

<!-- Displaying Available Venues -->
<h1 class="font-bold">Available Venues</h1>
<?php while ($venue = oci_fetch_assoc($venue_stid)): ?>
    <div class="venue-item">
        <h2><?php echo $venue['VENUE_NAME']; ?> - <?php echo $venue['SPORT_NAME']; ?></h2>
        <p>Location: <?php echo $venue['LOCATION']; ?></p>
        <p>Rating: <?php echo $venue['RATING']; ?></p>
    </div>
<?php endwhile; ?>

</body>
</html>

<?php
oci_free_statement($sport_stid);
oci_free_statement($venue_stid);
oci_close($conn);
?>
