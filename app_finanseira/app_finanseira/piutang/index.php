<?php
require_once '../config/config.php';
require_once '../config/middleware.php';

$title = 'Piutang';
$pages = 'Piutang';
$master = null;

// Fungsi untuk filter periode tanggal
function filterByDate($koneksi, $start, $end)
{
    $query = "SELECT * FROM `tb_piutang` WHERE `user_id` = '$user_id' AND `tanggal` BETWEEN '$start' AND '$end' ORDER BY `tanggal` DESC";
    return mysqli_query($koneksi, $query);
}

// Ambil nilai dari form jika tersedia
$start = isset($_GET['start']) ? $_GET['start'] : null;
$end = isset($_GET['end']) ? $_GET['end'] : null;

// Lakukan filter jika tanggal start dan end tersedia
if ($start && $end) {
    $result = filterByDate($koneksi, $start, $end);
} else {
    // Jika tidak ada filter, tampilkan semua data
    $result = mysqli_query($koneksi, "SELECT * FROM `tb_piutang` WHERE `user_id` = '$user_id' ORDER BY `tanggal` DESC");
}

function rupiah($angka)
{
    $hasil_rupiah = "Rp" . number_format($angka, 2, ',', '.');
    return $hasil_rupiah;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once '../_partikel/head.php' ?>
</head>

<body id="page-top">
    <div id="wrapper">
        <?php require_once '../_partikel/sidebar.php' ?>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <?php require_once '../_partikel/navbar.php' ?>

                <div class="container-fluid" id="container-wrapper">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800"><?= $pages ?></h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<?= $base_url ?>">Home</a></li>
                            <?php if ($master != NULL) : ?>
                                <li class="breadcrumb-item"><?= $master ?></li>
                            <?php endif; ?>
                            <li class="breadcrumb-item active" aria-current="page"><?= $pages ?></li>
                        </ol>
                    </div>

                    <div class="row mb-3">
                        <div class="col-lg-12">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <form action="" method="get" class="form-inline">
                                        <label class="my-1 mr-2 col-form-label col-form-label-sm">Periode Tanggal</label>
                                        <!-- Tambahkan kondisi untuk memeriksa apakah nilai sudah ada atau tidak -->
                                        <input type="date" name="start" id="start" class="form-control form-control-sm mr-2" autocomplete="off" value="<?= isset($_GET['start']) ? $_GET['start'] : null ?>" required>
                                        <label class="my-1 mr-2 col-form-label col-form-label-sm">s/d</label>
                                        <!-- Tambahkan kondisi untuk memeriksa apakah nilai sudah ada atau tidak -->
                                        <input type="date" name="end" id="end" class="form-control form-control-sm mr-2" autocomplete="off" value="<?= isset($_GET['end']) ? $_GET['end'] : null ?>" required>
                                        <button type="submit" class="btn btn-primary btn-sm my-2 mr-1">Submit</button>
                                        <!-- Tombol reset untuk mengembalikan nilai form ke nilai default -->
                                        <button type="button" class="btn btn-secondary btn-sm my-2" onclick="window.location.href='<?= $base_url ?>piutang'">Reset</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Daftar <?= $title ?></h6>
                                    <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='<?= $base_url ?>piutang/create.php'">Tambah Data</button>
                                </div>
                                <div class="table-responsive p-3">
                                    <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>No</th>
                                                <th>Tanggal</th>
                                                <th>No Transaksi</th>
                                                <th>Nama</th>
                                                <th>Jatuh Tempo</th>
                                                <th>Deskripsi</th>
                                                <th>Jumlah</th>
                                                <th>Tipe</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $no = 1;
                                            foreach ($result as $row) :
                                            ?>
                                                <tr>
                                                    <td><?= $no++ ?></td>
                                                    <td><?= date('d F Y', strtotime($row['tanggal'])) ?></td>
                                                    <td><?= $row['no_transaksi'] ?></td>
                                                    <td><?= $row['nama'] ?></td>
                                                    <td><?= date('d F Y', strtotime($row['jatuh_tempo'])) ?></td>
                                                    <td><?= $row['deskripsi'] ?></td>
                                                    <td><?= rupiah($row['jumlah']) ?></td>
                                                    <td><?= ($row['tipe']) ?></td>
                                                    <td><a href="<?= $base_url ?>piutang/edit.php?id=<?= $row['piutang_id'] ?>">Edit</a> | <a href="<?= $base_url ?>piutang/delete.php?id=<?= $row['piutang_id'] ?>" onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?')">Delete</a></td>
                                                </tr>
                                            <?php
                                            endforeach;
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?php require_once '../_partikel/modal_logout.php' ?>
            <?php require_once '../_partikel/footer.php' ?>
        </div>
    </div>

    <?php require_once '../_partikel/javascript.php' ?>

</body>

</html>