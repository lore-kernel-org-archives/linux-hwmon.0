Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901917;
	b=R0D6aNQxViKR3LSx31T8Vd3wxtI1J7r5oLVtwvo/zL5xBQjPHI3jcfqfTQN5puFB/8F+
	 Y5xMda9jLxRb/JRLhZd41Fl3VcchPqlCQgSx5SusormBoDnbnmiz98IqfkeYG27Zeiase
	 uYADhP964gGKom4sRNhfJjKLN9hMKmNlMpv3rJardnW+F6y9Eu5s2sZkU1cmXwXfNGpeJ
	 OfafwoupXffJnHi7/LHYq8lJMQZX4WD6HYlTFFzcF5V7iz3LrkAQTJhwJ8+ZQisMhEAz7
	 JLrTg8EG9V1NSkRH43XqOqRLJZW9kwV4XT+X5H+zFw0M1FpyCcV1edcVq6LkIflMcEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901917;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rIJXEnTSAop9B99n0hCpLTJmdxbXSzACUbth90vE0tU=;
	b=DsJXYbCUX1sBlojRWnWCc9TQiOljrjyE0UgWW7j9reigMaIkhIoEYHciVZn07s6Vvat7
	 tr9HQSmwzOo02Cte7dGRmUI4KoGHM+MVIZUot+XAxUCYezwDflS7Qxs/4whUvVrwNIda/
	 dty4SJNDpOyjz/ULzjjvUqtThaSpo2yTchDRrCcmTEUXRsxSbGtnfyLuI3/SrZi99/M4O
	 j1iTsLB+lZeQZLcXRzNcSPungS/orPqVN50n2PQoqiP8+JMmZYnIfE+L/r5qs3XgKB6DG
	 GvYGTVL913O7FLEW4+u014pidyWol+FoYQoSJ708vXWhyaLoWvj9QX0CKnI5nYkKDTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KERiUUhU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AC8606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KERiUUhU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83861F01828;
	Sun, 25 Oct 2026 04:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901917;
	bh=rIJXEnTSAop9B99n0hCpLTJmdxbXSzACUbth90vE0tU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KERiUUhUFuZVUV3XLgoPfLZs39BNFvYgMRZ0rmtKHGDJuNfQaGD0r210uPHICqNvG
	 MUkth4r75e3Im2ips+YdSSA7b/Ws1Q3tKzIu+jhAOmThFWk3WCo5mWRonjc5d45Ptv
	 2P3QETIdudBVi1XcmySeXUquT79vKgM5m3E4kLMxLiVN1B808M/JI5sr+XxM1aoOnM
	 4lfjUGjcZoTCbLKCCR+PznblIdnqovuXr6MKwgJrAgQLtQSQGf5uQY8bnJIrIc2tZL
	 FhhNfHrqr4/xg+subZg6sO1+V1UPEXZkqLuova/N2dZ83ebABcG5eiFgiHYOUcEfr6
	 BKrZYjYZnZZGg==
Message-ID: <sashiko-outbox-184055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 28/31] hwmon: (pmbus/tps53679) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-28-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-28-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:36 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the buffer size to i2c_smbus_read_block_data() in
> tps53679_identify_chip() and tps536xx_read_block().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D28

