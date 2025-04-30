-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 30. 22:23
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vizsgaremek_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(1, 'Elden Ring'),
(2, 'Grand Theft Auto V'),
(3, 'Warframe'),
(4, 'League Of Legends'),
(5, 'Counter-Strike 2'),
(6, 'Minecraft'),
(7, 'Path of Exile 2'),
(8, 'Pokemon Legends Z-A'),
(9, 'The First Berserker: Khazan'),
(10, 'Assassin\'s Creed Shadows');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 7, 3, 'Ut et qui quia iure et maiores.', '2025-04-30 18:23:00', NULL),
(2, 3, 7, 'Pariatur et eos qui qui.', '2025-04-30 18:23:00', NULL),
(3, 3, 17, 'Similique ipsam et sunt voluptatibus quae ipsum.', '2025-04-30 18:23:00', NULL),
(4, 6, 19, 'Atque vitae quod numquam necessitatibus.', '2025-04-30 18:23:01', NULL),
(5, 7, 11, 'Accusantium eum saepe corporis nihil.', '2025-04-30 18:23:01', NULL),
(6, 8, 8, 'Minus omnis eos eum eaque nihil quaerat vel.', '2025-04-30 18:23:01', NULL),
(7, 8, 3, 'Mollitia aut unde iusto vitae facilis pariatur.', '2025-04-30 18:23:01', NULL),
(8, 10, 7, 'Omnis officiis qui et temporibus provident.', '2025-04-30 18:23:01', NULL),
(9, 10, 17, 'Officia unde omnis harum velit.', '2025-04-30 18:23:01', NULL),
(10, 5, 16, 'Tenetur quia accusantium voluptas velit et porro.', '2025-04-30 18:23:01', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_03_19_080449_create_categories_table', 1),
(2, '2025_03_19_080450_create_roles_table', 1),
(3, '2025_03_19_080451_create_users_table', 1),
(4, '2025_03_19_080452_create_posts_table', 1),
(5, '2025_03_19_080453_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 7, 7, 'Ut vero quod sapiente vel earum tempora veritatis.', 'Qui accusantium impedit sequi ex qui harum quod.', '2025-04-30 18:23:00', NULL),
(2, 5, 10, 'Qui aut placeat ducimus voluptas et quibusdam in.', 'Est assumenda in amet. Est eaque sequi a dolorem.', '2025-04-30 18:23:00', NULL),
(3, 7, 1, 'Vel sunt enim beatae sint molestiae animi.', 'Corporis molestias aut deserunt.', '2025-04-30 18:23:00', NULL),
(4, 2, 1, 'Ipsum dolores reiciendis maiores ullam et.', 'Debitis et hic repellendus ut distinctio.', '2025-04-30 18:23:00', NULL),
(5, 15, 7, 'Harum dolorem rem odio iusto excepturi.', 'Impedit quas et dolores eum.', '2025-04-30 18:23:00', NULL),
(6, 10, 1, 'Fuga expedita et quia voluptatem.', 'Hic soluta illum beatae.', '2025-04-30 18:23:00', NULL),
(7, 3, 3, 'Quasi voluptatem ut quia suscipit aut nulla aperiam.', 'Et hic et iure ipsam modi cupiditate.', '2025-04-30 18:23:00', NULL),
(8, 7, 3, 'Totam occaecati fugiat a et voluptate est.', 'Vel maiores alias quo.', '2025-04-30 18:23:00', NULL),
(9, 13, 4, 'Ea voluptas eaque laborum.', 'Quas sapiente accusantium sunt accusamus cum.', '2025-04-30 18:23:00', NULL),
(10, 20, 2, 'Sunt omnis optio et cumque.', 'Quam voluptas cum ipsam a ipsam minima sit saepe.', '2025-04-30 18:23:00', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quae.', 1, 'kozey.landen@hotmail.com', '$2y$12$qWSjQ5mEq2hOLXu.xU9uvuVoSla8csN.yOI6cG8k8wCYwwJJ7ZqlW', NULL, '2025-04-30 18:22:55', NULL),
(2, 'Odio.', 1, 'ohara.ilene@yahoo.com', '$2y$12$QsSu/k3nmDTt095dWZA95.4pb3I9rprq6WkxvnIVaTFfLmeoLZgX2', NULL, '2025-04-30 18:22:55', NULL),
(3, 'Sit.', 1, 'zoila.torphy@gmail.com', '$2y$12$4B81smoq0aO4tCof8LxTRuofO0VaU5fQpUug9MEnKdDLs.KcDtZ8K', NULL, '2025-04-30 18:22:55', NULL),
(4, 'Saepe.', 1, 'uhackett@hotmail.com', '$2y$12$chwKRmOuVoSd/lb4YpV00.AmMBihHIs7gZINMfsz4KVA3ublk/lY2', NULL, '2025-04-30 18:22:55', NULL),
(5, 'Et et.', 1, 'astoltenberg@stark.net', '$2y$12$r0fGFRqS8w6bmj14FAMOa.LMBczCwNGMhWWfBYzVZ8BOv1CslrhqS', NULL, '2025-04-30 18:22:56', NULL),
(6, 'Eum.', 1, 'cheyanne96@yahoo.com', '$2y$12$nMSqS9HkQGM5SlqLsF8/L.jTFdzdcdpYfEoyPqFdgEy/0R5rE2kD.', NULL, '2025-04-30 18:22:56', NULL),
(7, 'Et.', 1, 'margarita.stehr@yahoo.com', '$2y$12$Su4HZ74TbcgkxoYSrpJnp.Ekl3sfkgWOUnTs9yNSdLYtrsq.JZe0G', NULL, '2025-04-30 18:22:56', NULL),
(8, 'Odit.', 1, 'goldner.claudine@hotmail.com', '$2y$12$.9vfd6m7VK6hqerFSljX7.lP7VQcj0YimdeOrIYwoknvP6kZLZSNa', NULL, '2025-04-30 18:22:56', NULL),
(9, 'At.', 1, 'lweber@gmail.com', '$2y$12$akPQejzIHybgYuw.3Z3Utes2apdJ8C1OvWCx3.ZyYbJe7HtCUztde', NULL, '2025-04-30 18:22:57', NULL),
(10, 'Autem.', 1, 'josie10@yahoo.com', '$2y$12$tNebsi5YKbaR/bJpNov3v.G9VXmd8CexLVJv8HyqaN948grx3ABhG', NULL, '2025-04-30 18:22:57', NULL),
(11, 'Modi.', 1, 'carmella58@hotmail.com', '$2y$12$6wf.zmoFhyUJuikAc02x9OGOKmRXKENGV9biwUkPGi1FfMQYEVI9G', NULL, '2025-04-30 18:22:57', NULL),
(12, 'Ex.', 1, 'jhoeger@white.net', '$2y$12$J119.RIR5sPjbSicLsuC3./M6hx.iE/ybQhLwQk70RNp6TCs/C0Yi', NULL, '2025-04-30 18:22:58', NULL),
(13, 'Alias.', 1, 'dena.metz@hotmail.com', '$2y$12$ildH4wqGOBmYs2chJOghM.rtkPf6L9YuEV/jY0kUtdt54lV0p/D.q', NULL, '2025-04-30 18:22:58', NULL),
(14, 'Alias.', 1, 'loma85@hotmail.com', '$2y$12$rf6W7azMjMiaahjw4elq8eq9US4aC27rZ/VyLj04Q9zy7K7LAfOXe', NULL, '2025-04-30 18:22:58', NULL),
(15, 'Sed.', 1, 'tristin54@hotmail.com', '$2y$12$GTkFZ5rP2UbGR550pXTe.Oq.t4YEuY4FrPmXdgh.wN8.M7asEcJ9O', NULL, '2025-04-30 18:22:58', NULL),
(16, 'In.', 1, 'sauer.claire@yahoo.com', '$2y$12$6ZxWRMl0BKsMp9JXb6jfce5tdu689cXBcJ5AyDkcF7wAScIWZbpVm', NULL, '2025-04-30 18:22:59', NULL),
(17, 'Autem.', 1, 'josefa.rutherford@yahoo.com', '$2y$12$IPSOwFDotzV1yirGhxxkN.vP9NRE9lrkTyqmF7FZB8D71/nx/XXsi', NULL, '2025-04-30 18:22:59', NULL),
(18, 'Sint.', 1, 'hbartell@mayer.net', '$2y$12$ba77op2G8/f4iQ7RhOF.neX.8l84jjkLxQSuv8DY3a6tyHM.LblSK', NULL, '2025-04-30 18:22:59', NULL),
(19, 'Esse.', 1, 'noemy.weissnat@hotmail.com', '$2y$12$VFulBjtfvh7aw.jd7qq9kOK5a3G9EhvnozSYju55Eggc9zbE1ZWNe', NULL, '2025-04-30 18:22:59', NULL),
(20, 'Ipsum.', 1, 'chaya.stanton@bartoletti.com', '$2y$12$UF.b7E7DNdNCYaf2KAy8NOi1PE1W7n1IqFvFLc9ficbbyrcIe/WEu', NULL, '2025-04-30 18:23:00', NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
