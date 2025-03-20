-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 20. 12:58
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '2025_03_19_080452_create_posts_table', 1),
(3, '2025_03_20_093528_create_comment_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-03-20 09:57:00', '$2y$12$4AbMu3kPpl2AYL6AscgcSO6V39OLt55JXhxTMUZv9dYB1peXPaTLG', 'YZvucZJhyl', '2025-03-20 09:57:00', '2025-03-20 09:57:00'),
(3, 'Blanditiis enim dolore autem consequatur explicabo.', 'Placeat et dolor nemo ea illo sint atque. Qui et mollitia dolorem repellat harum. Autem ut est voluptatibus quidem. Ut eum optio accusantium non et.', '2025-03-20 10:14:31', '$2y$12$w88se3X1.NuvdCu5wybA.OOevjiWUXdBsCnLk13svqsqWW9amjM7G', 'naJXcnTV6A', '2025-03-20 10:14:32', '2025-03-20 10:14:32'),
(4, 'Quam deleniti illum possimus incidunt aut explicabo quibusdam.', 'Dolorem qui voluptatibus aut aut. Atque vel numquam temporibus assumenda doloribus repellendus. Ducimus doloribus et voluptate animi. Sunt qui quia quisquam sint temporibus nisi nam.', '2025-03-20 10:14:32', '$2y$12$sRpYPQDDSn51IHlhbthZk.j3esRzkjoRyd.o/DKtC.XSp4m8k5ktG', 'qoZP13RbLK', '2025-03-20 10:14:32', '2025-03-20 10:14:32'),
(5, 'Ex in cumque molestiae ducimus dignissimos dolorum officia ipsa.', 'Et hic omnis sint. Rerum voluptatem quidem quos quaerat natus explicabo. Maiores debitis dolor voluptates cum quos id. Voluptatem eveniet laudantium ratione nihil error omnis.', '2025-03-20 10:14:32', '$2y$12$kVatrIzTWCnkM28whGOFW.ioU4MsONuCzth21PE8G4l7I/32B7dbi', 'gAGhMk9YSA', '2025-03-20 10:14:32', '2025-03-20 10:14:32'),
(6, 'Officia placeat voluptatibus voluptatem.', 'Dolore voluptatem aspernatur dolores commodi. Placeat laboriosam sit nemo repudiandae qui itaque non. Atque ad et unde debitis hic.', '2025-03-20 10:14:32', '$2y$12$2o5CwtBY2Z7OvD7kAjQ9puCLO7PhvcxLJeh7KpgQy3KZNAFnX/Upu', 'ozODLdyFqC', '2025-03-20 10:14:32', '2025-03-20 10:14:32'),
(7, 'Atque quia aut voluptatem error velit.', 'Dicta dolores iusto nobis sunt. Voluptate et rem quis in sed quia consectetur. Voluptas est dolorem voluptatem a expedita. Voluptas consequatur officia modi voluptates fuga sequi.', '2025-03-20 10:14:32', '$2y$12$U22osdc4FuFpplThtYArP.WB/PpolcjJoBXM6PhWUNafpQ7hw0LAK', 'ABIXuPN1FW', '2025-03-20 10:14:33', '2025-03-20 10:14:33'),
(8, 'Cum perspiciatis vel necessitatibus fugit placeat eum.', 'Aut vel itaque perferendis quia soluta voluptatem et. Unde ullam quia voluptatum ipsum.', '2025-03-20 10:14:33', '$2y$12$7W6FX527zGqbZ.LQisNVG.xJ2nMF22K/PAyENLdPi3XQQe0hbaOQi', 'I9DFe6XPPQ', '2025-03-20 10:14:33', '2025-03-20 10:14:33'),
(9, 'Molestiae recusandae architecto quis accusantium eligendi.', 'Excepturi aut ut omnis blanditiis id. Consequatur delectus pariatur a rerum natus. Ex sed aspernatur et ducimus aut unde dolor.', '2025-03-20 10:14:33', '$2y$12$MLJ6sSR1bCsuS1cvvkiuAeTbAmTopHjS.ittWSG3qqUQhREvSAA4a', 'mnXCeC21Ix', '2025-03-20 10:14:33', '2025-03-20 10:14:33'),
(10, 'Est et ut animi.', 'Est mollitia qui nemo deserunt asperiores at. Tenetur perspiciatis excepturi aliquid ut excepturi fuga. Dolore numquam accusamus iure ducimus eum. Est officia vel tempora quod et et et qui.', '2025-03-20 10:14:33', '$2y$12$6T9qAcKuUkgXUzlz4GWU7eD82gVF6icflHU8LQR6ujKkU2iHfrCxW', 'bgPVyETpur', '2025-03-20 10:14:33', '2025-03-20 10:14:33'),
(11, 'Velit et aut voluptatem excepturi praesentium.', 'Facere ut iste aperiam ullam rerum laborum. Esse atque omnis nam voluptate magnam. Consectetur reprehenderit tempore cumque corrupti.', '2025-03-20 10:14:33', '$2y$12$VW1vN.1vCyWN2S5TG6RA7uPT1bHLXy/6bt9XXQDpnFHb8gk2fGM9K', 'ZZNPCmonyf', '2025-03-20 10:14:33', '2025-03-20 10:14:33'),
(12, 'Dolores sit minus ut veritatis.', 'Et illum nam velit quo voluptatem at a rem. Rerum autem est aperiam. Impedit voluptatem excepturi est eaque. Aut suscipit sed et exercitationem quo eum. Debitis labore non nihil incidunt.', '2025-03-20 10:14:33', '$2y$12$uNHarEvsFZkGFZXKjmVVKutcXfQwezJFFh46RqfyQle1JKDqfvhIy', 'F1tzfqmSMJ', '2025-03-20 10:14:33', '2025-03-20 10:14:33'),
(13, 'Omnis velit soluta officia eius sint beatae.', 'Aliquam et perspiciatis quis sunt ut cumque est recusandae. Repellat inventore tempore quod quis voluptatem. Aut soluta omnis est.', '2025-03-20 10:15:35', '$2y$12$blsoS9eBgfb5quLOHZOHBuFXd3bVjtth78fJgAN6VKUEpV8pBw7te', 'YybRvWT6IE', '2025-03-20 10:15:35', '2025-03-20 10:15:35'),
(14, 'Porro et eius iusto dolorum cumque.', 'Accusantium tenetur quia aspernatur quae qui. Similique minima quia quod architecto quis. Vitae repudiandae mollitia ex eum in qui. Aut nihil iure iure.', '2025-03-20 10:15:35', '$2y$12$CAh6ejEecbyJkmIkEY03LOsGPjW8ztZRW/IgbGonpT.vYUkvMVmYu', 'CynKiKUrLP', '2025-03-20 10:15:35', '2025-03-20 10:15:35'),
(15, 'Voluptatem aut amet voluptatem quos voluptatem doloribus maxime.', 'Cum autem quia assumenda sit ut. Pariatur consequatur eum veritatis atque reiciendis. Nesciunt aut exercitationem laboriosam. Est et et minima rem illo nobis.', '2025-03-20 10:15:35', '$2y$12$307niowHtsyeteQWN6fMOubx9zgfOo1j2MQkzvg/OdYiI2zJG5mdm', '3hZoqvbXmK', '2025-03-20 10:15:36', '2025-03-20 10:15:36'),
(16, 'Necessitatibus fugiat repudiandae fugiat dolore numquam.', 'Quae sint cumque voluptatibus. Molestias quis officiis nesciunt iusto. Velit dolorem voluptas repellendus rerum eius dolorum.', '2025-03-20 10:15:36', '$2y$12$synp8lzCLdV.HDXFo.8GOOmqNVBMqdcAc7R1O.HrUPoGmSlngG/d2', 'YagsyGyisx', '2025-03-20 10:15:36', '2025-03-20 10:15:36'),
(17, 'Et laboriosam qui maiores ea vel aperiam consequatur.', 'Nemo non aut fugiat quisquam. Sed ab quos necessitatibus consequatur ratione molestiae praesentium. Quo a voluptatem qui autem assumenda. Unde qui aliquam consequuntur nihil recusandae amet qui.', '2025-03-20 10:15:36', '$2y$12$Z/rCA9jj5oddDbAvNQt7l.39exlziSs10I2sgJfju8RnGPpxlHo.m', 'd0szynfjhY', '2025-03-20 10:15:36', '2025-03-20 10:15:36'),
(18, 'Quaerat facilis quas est quam.', 'Voluptatem error iste reiciendis aperiam. Ea occaecati quia iure amet placeat sunt necessitatibus at. Laudantium non dolore harum corrupti occaecati perferendis.', '2025-03-20 10:15:36', '$2y$12$NGXxBd.skxkpK2y88ecm1eB18OCMjRh9cv6eKjXDZjbNZbeyBqExq', 'zSUUQQtij3', '2025-03-20 10:15:36', '2025-03-20 10:15:36'),
(19, 'Voluptatibus natus dignissimos id.', 'Maxime autem odio magni. Sit rerum eos voluptate eligendi sapiente. Adipisci quos qui cumque consequatur sequi sunt. Aspernatur voluptatem provident earum quod.', '2025-03-20 10:15:36', '$2y$12$ga3sNCqvotar4GX.XbjF4e3JAuPT5/ggtdOZjRkOIexSewF.dQa3W', 'ZRbZ7QToI5', '2025-03-20 10:15:36', '2025-03-20 10:15:36'),
(20, 'Sed aut minima sit blanditiis corrupti assumenda assumenda.', 'Aut molestiae cumque et. Sed odio maiores possimus molestias. Molestiae quod cupiditate cum eum. Porro laborum rerum pariatur rerum.', '2025-03-20 10:15:36', '$2y$12$55zxCqOjBsUubLo3DNRfReYmBzn4CmwaEqYrAmdflXmAk8KstKawu', 'YyNBT365Al', '2025-03-20 10:15:37', '2025-03-20 10:15:37'),
(21, 'Esse sunt quia provident.', 'Aperiam qui quos fugiat. Minus est corrupti omnis culpa saepe.', '2025-03-20 10:15:37', '$2y$12$1ETEDdzSA7kkeV5wAzvT1eHeuUE92FFI6EEeHfDQOg1blm2roCqJi', 'l0VaM5p4M2', '2025-03-20 10:15:37', '2025-03-20 10:15:37'),
(22, 'Iusto quod placeat laboriosam et voluptatem.', 'Doloribus corporis amet beatae rerum dolor qui. Nihil et commodi aliquid illo consequuntur. Nihil exercitationem dicta facilis provident aut recusandae nihil.', '2025-03-20 10:15:37', '$2y$12$Pn/AKjSiyTovzHvvfw06U.a0lBRMnRI3fy8DO6r9T1TDGSe2moJoy', 'hVQIQQiSBZ', '2025-03-20 10:15:37', '2025-03-20 10:15:37');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

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
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
