4-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 27. 09:10
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

--
-- A tábla adatainak kiíratása `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 7, 21, 'Illum qui ut qui ea molestiae.', '2025-03-27 07:08:05', NULL),
(2, 7, 3, 'Voluptate et ipsum est facere.', '2025-03-27 07:08:05', NULL),
(3, 7, 10, 'Porro corrupti eum veritatis quibusdam dolorem.', '2025-03-27 07:08:05', NULL),
(4, 9, 8, 'Quaerat sed dolor impedit quaerat.', '2025-03-27 07:08:05', NULL),
(5, 9, 19, 'Culpa quis vel adipisci.', '2025-03-27 07:08:05', NULL),
(6, 6, 5, 'Inventore at ipsam non est accusamus amet.', '2025-03-27 07:08:05', NULL),
(7, 1, 7, 'Vero ad consequatur eum aut similique unde sunt.', '2025-03-27 07:08:05', NULL),
(8, 6, 12, 'Totam repellat at et eos ut cumque laboriosam.', '2025-03-27 07:08:05', NULL),
(9, 1, 21, 'Aut culpa numquam quasi dolor atque doloremque.', '2025-03-27 07:08:05', NULL),
(10, 4, 19, 'Eius qui pariatur omnis distinctio voluptas.', '2025-03-27 07:08:05', NULL);

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

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 9, 'Architecto expedita nostrum dolorem voluptatem sed.', 'Sed esse eum facere harum consequatur non.', '2025-03-27 07:07:50', NULL),
(2, 5, 'Corrupti numquam provident aspernatur nesciunt aut eos.', 'Illum rem et qui corrupti est modi.', '2025-03-27 07:07:50', NULL),
(3, 17, 'Fugiat vel eum debitis sint.', 'Omnis sint quo et molestiae non omnis est.', '2025-03-27 07:07:50', NULL),
(4, 9, 'Voluptas accusantium vel rerum ut enim.', 'Alias pariatur magnam debitis quidem.', '2025-03-27 07:07:50', NULL),
(5, 3, 'Incidunt laudantium eius voluptatem deserunt.', 'Quae velit at molestiae et ducimus suscipit quos.', '2025-03-27 07:07:50', NULL),
(6, 7, 'Qui quia dolor dolorum temporibus.', 'Soluta sunt quisquam voluptas quis repudiandae.', '2025-03-27 07:07:50', NULL),
(7, 10, 'Quisquam at ab aut quo et saepe et.', 'Placeat sit ullam ab laudantium vel esse.', '2025-03-27 07:07:50', NULL),
(8, 21, 'Et minima nobis modi est placeat.', 'Deleniti incidunt nemo veritatis quae.', '2025-03-27 07:07:50', NULL),
(9, 13, 'Aut aut voluptas ipsa aliquid veniam omnis expedita voluptatibus.', 'Delectus quidem et labore rerum reiciendis.', '2025-03-27 07:07:50', NULL),
(10, 9, 'Iure eos quo aspernatur quas aut.', 'Excepturi ea esse asperiores delectus recusandae.', '2025-03-27 07:07:50', NULL);

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
(3, 'Esse.', 'lillian.luettgen@gmail.com', NULL, '$2y$12$OtWzGz04t3LRssF7Gts0hOyPRPXuVQMYhd808LrhgXKEQOTwEsIOK', NULL, '2025-03-27 07:05:36', NULL),
(4, 'Illo.', 'vmarquardt@jaskolski.biz', NULL, '$2y$12$vUbPlF32/w529JcuBwp7felLhe75Qgzrurew9qfSjhf0bz6GTtdbG', NULL, '2025-03-27 07:07:30', NULL),
(5, 'Autem.', 'sally81@yahoo.com', NULL, '$2y$12$Gj564AHguAOX8Tjk9DXL6uhi/p6fAqMIHhLAP0NRMr.04vvTQeFqy', NULL, '2025-03-27 07:07:30', NULL),
(6, 'Ut.', 'dspencer@goldner.net', NULL, '$2y$12$mmf1xDzHWs/RVRTspEzWFefFj3iYmrptyZAnQxlgm6IHikXv2t1MK', NULL, '2025-03-27 07:07:31', NULL),
(7, 'Iure.', 'cruickshank.rashawn@mraz.com', NULL, '$2y$12$Gs17DRxYyRHl/sk/x/ReXeC19HbHJLl1s2YkSDIIBtKOXEB4vFeLu', NULL, '2025-03-27 07:07:31', NULL),
(8, 'Et.', 'yolanda32@dibbert.biz', NULL, '$2y$12$uDSTq4usEwro1TMN8HhePeI4qdd/EmN9vfQrKju15aeHTWRbJIGUa', NULL, '2025-03-27 07:07:31', NULL),
(9, 'Quis.', 'qmueller@hermann.com', NULL, '$2y$12$BisDnm4h5Rk5DnpQI4QNt.pDg693/eNw1RLDStNbA.X/CfeY3d84e', NULL, '2025-03-27 07:07:31', NULL),
(10, 'Qui.', 'lstoltenberg@hotmail.com', NULL, '$2y$12$LxVNsrg1KV5bdSv40AH7rex8zf9tkChwXyMpsgRiBHWR2D3OtESSW', NULL, '2025-03-27 07:07:31', NULL),
(11, 'Atque.', 'gkoepp@crooks.org', NULL, '$2y$12$qObem/Pfzmk0fBbYBm8MwuLbStI8d5Nm0n23Zm.dnpOYfA9glvvcu', NULL, '2025-03-27 07:07:31', NULL),
(12, 'Qui.', 'dessie11@stokes.com', NULL, '$2y$12$KuijtTw7wv1ed0Bu6wn8D.Gd3hLB4sSrvxAatBXasqcL3y3d2JzaW', NULL, '2025-03-27 07:07:32', NULL),
(13, 'Totam.', 'millie.beer@hotmail.com', NULL, '$2y$12$cagOdyBaRXUNS6RinhvTV.q94m2P3CbuD6ECixhhq4YYnvsUrj6ZG', NULL, '2025-03-27 07:07:32', NULL),
(14, 'Autem.', 'alverta78@kutch.biz', NULL, '$2y$12$6aYbmgtYmUNEuJObDblSyeZ5Lc1v8bohipeZlONbVSeudSCAihV5W', NULL, '2025-03-27 07:07:32', NULL),
(15, 'Iure.', 'njakubowski@yahoo.com', NULL, '$2y$12$7I1VtXrAfU32D.Pc0uYXHeA.k9VcokI0sPkH4RnmzXz/pSDxnKWwG', NULL, '2025-03-27 07:07:32', NULL),
(16, 'Quia.', 'russel.janelle@yahoo.com', NULL, '$2y$12$PqcB4Nb.Yo04.Nn.k2BTMeXzyYTvNRNTuedUOEb7vi.bYujMy0cuC', NULL, '2025-03-27 07:07:32', NULL),
(17, 'Quis.', 'ydurgan@hotmail.com', NULL, '$2y$12$3VDsGmeVuLEPhtPDIQqGNO1fpNl7N63dVp0jBV1ufF9bCQpn.lbOi', NULL, '2025-03-27 07:07:33', NULL),
(18, 'Iure.', 'deion09@yahoo.com', NULL, '$2y$12$XMEW3USEBR/gqsJyhaWKVewsewupounE1xS1UOZirolDif/pQVPyC', NULL, '2025-03-27 07:07:33', NULL),
(19, 'Rerum.', 'glesch@hagenes.com', NULL, '$2y$12$W9datHrTajP2.ZyZLex71uAuLYVO9B.6uB88u7bF8PlyJ6CWLAQOe', NULL, '2025-03-27 07:07:33', NULL),
(20, 'Quis.', 'jwalsh@hickle.biz', NULL, '$2y$12$2g3ldqHcqIZFdIzoPdbaX.LDGCZb1ZLRXBhrNUVpbHwsZP6ch5S9i', NULL, '2025-03-27 07:07:33', NULL),
(21, 'Aut.', 'walter.raina@koss.com', NULL, '$2y$12$mlJgBI.CJ7rQCQcupn3dQeZ8iMgt3NBczE8oBo2hoG6bGFpVGD3k6', NULL, '2025-03-27 07:07:33', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
