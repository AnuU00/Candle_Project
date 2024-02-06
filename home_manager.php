<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Factory Login</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./styles_main.css">
    </head>
    <body>
    <header class="header">
        
        <img class="logo" src="./images/logo.jpeg" alt="comapny logo">
        <h4 class="topic">This website is made for the use of authorized employees in the candle factory site</h4>
        <button class="side_login_button"><a href="candle_login.php">Sign out</a></button>

    </header>
        <div>
            <h1>Hi Manager!</h1>
            <form action="" method="post">
                <label for="parts">Choose What to do:</label>
                <select name="parts" id="parts">
                    <option value="no_option">Select</option>
                    <option value="employee">Details of Employees</option>
                    <option value="production">Production of Candles</option>
                    <option value="ot">OT Payments</option>
                    <option value="ship">Shipping Details</option>
                    <option value="wax">Wax Orders</option>
                </select>
                <input type="submit" value="SHOW">
            </form>
        </div>
        
        
        
        <?php
        $host = 'localhost';
        $dbname = 'candle_factory';
        $user = 'root';
        $pass = 'root';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Could not connect to the database $dbname :" . $e->getMessage());
        }

        // Get the user's selection from the drop-down menu
        if (isset($_POST['parts'])) {
            $selected_option = $_POST['parts'];

            // Conditionally execute different SQL queries based on the user's selection
            if ($selected_option == "employee") {
                $stmt = $pdo->query('SELECT ssn, CONCAT(f_name, " ", l_name) 
                AS full_name, CONCAT(street, ", ", city, ", ", state) 
                AS address, dob, gender, date_hired 
                FROM employee');
                ?>
                <div id="employee">
                    <h3>Details of Employees</h3>
                    <table>
                            <tr>
                                <th>SSN</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>DOB</th>
                                <th>Gender</th>
                                <th>Date Hired</th>
                            </tr>
                        <?php while ($row = $stmt->fetch()): ?>
                            <tr>
                                <td><?= $row['ssn'] ?></td>
                                <td><?= $row['full_name'] ?></td>
                                <td><?= $row['address'] ?></td>
                                <td><?= $row['dob'] ?></td>
                                <td><?= $row['gender'] ?></td>
                                <td><?= $row['date_hired'] ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </table>
                </div>
            <?php
            } elseif ($selected_option == "production") {
                $stmt = $pdo->query('SELECT p.id AS production_id, c.candle_type, pd.qty AS qty_made, p.date_made
                FROM production_details pd
                JOIN production p
                ON p.id = pd.id
                JOIN candle c
                ON c.candle_id = pd.candle_id;');
                ?>
                <div id="production">
                    <h3>Production of Candles</h3>
                    <table>
                            <tr>
                                <th>Production ID</th>
                                <th>Candle Type</th>
                                <th>Qty Made</th>
                                <th>Manufactured Date</th>
                                
                            </tr>
                        <?php while ($row = $stmt->fetch()): ?>
                            <tr>
                                <td><?= $row['production_id'] ?></td>
                                <td><?= $row['candle_type'] ?></td>
                                <td><?= $row['qty_made'] ?></td>
                                <td><?= $row['date_made'] ?></td>
                                
                            </tr>
                        <?php endwhile; ?>
                    </table>
                </div>
            <?php
            } elseif ($selected_option == "ot") {
                $stmt = $pdo->query('SELECT o.rec_no, CONCAT(e.f_name, " ", e.l_name)
                AS full_name, o.ot_hours, o.pay_month, o.date, o.ot_salary
                FROM ot_payment o
                JOIN employee e
                ON o.ssn = e.ssn;');
            ?>
            <div id="ot">
                <h3>OT Payments</h3>
                <table>
                            <tr>
                                <th>Record No</th>
                                <th>Name</th>
                                <th>OT Hours</th>
                                <th>Month Paid</th>
                                <th>Date Paid</th>
                                <th>OT Salary</th>
                                
                            </tr>
                        <?php while ($row = $stmt->fetch()): ?>
                            <tr>
                                <td><?= $row['rec_no'] ?></td>
                                <td><?= $row['full_name'] ?></td>
                                <td><?= $row['ot_hours'] ?></td>
                                <td><?= $row['pay_month'] ?></td>
                                <td><?= $row['date'] ?></td>
                                <td><?= $row['ot_salary'] ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </table>
            </div>
            <?php
            } elseif ($selected_option == "ship") {
                $stmt = $pdo->query('SELECT sd.ship_id, c.candle_type, sd.qty, sd.price, d.name
                FROM ship_details sd
                JOIN candle c
                ON c.candle_id = sd.candle_id
                JOIN shipment s
                ON s.ship_id = sd.ship_id
                JOIN distributor d
                ON d.dis_id = s.dis_id;');
            ?>
            <div id="ship">
                <h3>Shipping Details</h3>
                <table>
                            <tr>
                                <th>Shipping ID</th>
                                <th>Candle Type</th>
                                <th>Qty Shipped</th>
                                <th>Price</th>
                                <th>Distributor</th>
                                
                            </tr>
                        <?php while ($row = $stmt->fetch()): ?>
                            <tr>
                                <td><?= $row['ship_id'] ?></td>
                                <td><?= $row['candle_type'] ?></td>
                                <td><?= $row['qty'] ?></td>
                                <td><?= $row['price'] ?></td>
                                <td><?= $row['name'] ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </table>
            </div>
            <?php
            } elseif ($selected_option == "wax") {
                $stmt = $pdo->query('SELECT w.order_no, s.name, w.wax_type, w.qty_kg, w.date, CONCAT(e.f_name, " ", e.l_name)
                AS checked_name
                FROM wax_order w
                JOIN supplier s
                ON s.sup_id = w.sup_id
                JOIN employee e
                ON e.ssn = w.check_by;');
            ?>
            <div id="wax">
                <h3>Wax Orders</h3>
                <table>
                            <tr>
                                <th>Order No</th>
                                <th>Supplier</th>
                                <th>Wax Type</th>
                                <th>Qty Ordered(kgs)</th>
                                <th>Order Date</th>
                                <th>Checked By</th>
                                
                            </tr>
                        <?php while ($row = $stmt->fetch()): ?>
                            <tr>
                                <td><?= $row['order_no'] ?></td>
                                <td><?= $row['name'] ?></td>
                                <td><?= $row['wax_type'] ?></td>
                                <td><?= $row['qty_kg'] ?></td>
                                <td><?= $row['date'] ?></td>
                                <td><?= $row['checked_name'] ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </table>
            </div>
            <?php
            }
        }
        ?>
        
        <script src="manager_content.js"></script>
    </body>
</html>