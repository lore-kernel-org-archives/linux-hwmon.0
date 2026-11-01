Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793497887;
	b=IRXESCYggoLipC50ymoKMePFTEr4/NLyNMlPE7znerPb7B19tk+RcT8Eu3q9CNLEC7Yg
	 saQgh4tisVZBdH8dRdMthMRNVAbmoQXuyth1rzUK12neSiKLrSlreMfeZAR8x0uWwcH3C
	 yWOWcvFnCAmfeQLR6o7Y83wgWofVHFlSBlTVskKCG6b03+4RYGafbxoOGb0b1ZQ8F9FrG
	 pCaWMxoWjY0JNokJAlTSEv0+qyTuoo2L+7sgtmehOR6WutoqWi4Aiuzy4JNUQau0TykF/
	 1ftJM6f8s36HBzhV3zBXSJKdOJ5Rf6mzCwUpd/uo7vsk1WyPdB60Ek61xsPlucsxlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793497887;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hHrN5CPPzPEttfXylnOFlHA7QtlueN4mkolcFdlE77Y=;
	b=TDvZHGqSN1Esu39MVItRodhbaDfdtAo5qef911ad+cfTsni/tLzkDquveHjrCK/K3XAS
	 S1jAMtuLyAzpUpXU6NOj7nq839x+yNdfNfo1F14wKKnN6nqU04LVRdLqGvGiuZU9TDaeF
	 utso9/Ujli9G2gb5w5JaW5MAWHSiE1ilLjXNWoyyu4jNn3YF7pZBBrEPoEAWrwOD41if0
	 rqrNf6d9vvi8mxd0nnbxWIt+pQYKQYAvwI6qoiVuO6B1w/UX5enMsJJSpMeTE9k+4QTR8
	 0AE0kWdQFKET7zUz/lo//Li1vCJm+p7ZlUOjONWX9S2BgvCoL9x9pSeg4+O5R5F/T7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YKmuL+Lq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB8E606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 01:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YKmuL+Lq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385341F000C1;
	Sun,  1 Nov 2026 01:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793497886;
	bh=hHrN5CPPzPEttfXylnOFlHA7QtlueN4mkolcFdlE77Y=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=YKmuL+LqJRYrJOeuCDc8edFObnepBQAO1gHFVKEunkqmfwi4a86t8vu1cF6/2zXAs
	 bTHh+bsuPXslDtWovGo3dO85FrmFgIIPQndzi6NK9wWPC7p6UqWtIT1AYXW8/qUaAm
	 YA4bL7MS8DQFIBmZEsZMDWLHdR7Ck+u1E83Pv64oP1Pa2t1pyuYT0bD/OUcz7OFU8e
	 AweO+hJcqx/7eDyrgC951xd7SPcMssln7ml4XtiRjRzUg6LqOv13I98gRIbwg4jGlj
	 3TUO5Kfp7rfPHUxpkdZ8skJTrAvKF99U56E2NvlSv5syGD8xV3VBBFhzBNOTo0Ec6C
	 /6WIB+xA9migQ==
Message-ID: <sashiko-outbox-192241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sht4x) Convert update_interval to jiffies in
 pending data check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261101014756.1921506-1-linux@roeck-us.net>
References: <20261101014756.1921506-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 01:51:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In sht4x_read_values(), the check for whether a pending post-heater
> measurement is still fresh compares get_jiffies_64() against
> data->heating_complete + data->update_interval. However,
> data->heating_complete is stored in jiffies whereas data->update_interval
> is stored in milliseconds.
>=20
> Whenever HZ !=3D 1000, adding data->update_interval directly without
> msecs_to_jiffies() mixes incompatible time units. For example, with the
> default 2000 ms update_interval, the validity window is inflated to 8
> seconds at HZ=3D250 and 20 seconds at HZ=3D100 instead of 2 seconds. A re=
ad
> within that extended window skips triggering a fresh measurement and
> instead returns and caches the stale post-heating measurement left in the
> sensor's output buffer.
>=20
> Convert data->update_interval to jiffies using msecs_to_jiffies() when
> computing the pending measurement expiration deadline, matching the
> next_update calculation right below it.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101014756.1921=
506-1-linux@roeck-us.net?part=3D1

