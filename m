Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901820;
	b=zYas2dnqwhA4tfWXcLdvK6b09N+TSsLn9ijuF+eAKO9VfgfV2ZbCruXIOySVLxoVSGiz
	 Fih+81pzzdU45wIVRJbcdAxifMh7VKbExlYIev3W4IRIocethUrc1Tk7ULXtj4rMSFCvT
	 BddyotIzjsGo+gW1iJQgBtK1BQdsKF6lEqB9on3UbESi+t/Y1Toxo/WnlMgOqBciZi3MJ
	 PvpUp5N6dOYvTfts89PHUM28bbdAbPQSzkAUBAy4CiKF192V4fpXqN46TwIQmA52gdAyM
	 rjRIPDVUWlB/LyDCp+owYBaZiyhfdAZ+RM035Ux2GoswR7Boyk21/ie9LzvSn6PAdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901820;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VAkLnXp9Z6aaFCJpiZcus/v0BvbOriUJwSzl5qBqb5Y=;
	b=cqAywBZbhIQ4b+2eahQHLTBdqh2Gj3aNRHKnr6zVOii8q4wOTigsy402To6qkiVXXwIA
	 oKsd4Q9Yy7mMUnjid7RGWv5nem3MAjNiE9Sv+WejNd+BTImEXnrBvRcjHHPSvF85HEOmH
	 zg3tUImWEVBCQP7lYmfH7MEjMnhhPCC/+JRmAM+tOCKDVUDwFTojSINXOsZz8yLjyTuV3
	 Y2CESa6rRfPbhIbN9kOs3evCysXBYGQLSi1VObtMQ4EVwDYsZkpHRkGNCQQOlKZI3JdWn
	 I66Kvic0Lt7OsYqZK2G/3uso+gg3i4DVnP3TTYCx8v1TA2Ffkw2LlHl2xemwuAvyAEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBbVeG+E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F3606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBbVeG+E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CF41F01825;
	Sun, 25 Oct 2026 04:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901819;
	bh=VAkLnXp9Z6aaFCJpiZcus/v0BvbOriUJwSzl5qBqb5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBbVeG+E8JP9TFAxGjpnXSxqjvSEQf38B/6TZndTPOzAZnmGxBdgfOA/dxbShugVS
	 Hj+qMPHFMLAA0nTyZTqao11S824daSeRgtgmXAtXqKRejFODOyITjwBadSUrGmrPGP
	 hQ+RBwULWHSMO1IVv3+K8hqgUZfpuloa3c888bvzQ9aIyVjazTVgN+SYH+GrB7feps
	 kPXJydzAC4+0NmCANPInQyGJ0jn1OKqkZU2Gv3nZKR1TyvKXaUs59E1re30ai4IisJ
	 XC4CmBY+ddYBH7jCzx7ctJ6f6b/vY16TDatH4GrNw6SWqS2OPDwB+l3xnsAJWsNrn/
	 A2jVUz4gza3aw==
Message-ID: <sashiko-outbox-184037@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/31] hwmon: (pmbus/lx1308) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-18-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-18-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:16:59 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in lx1308_probe()
> to leave space for the NUL terminator.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D18

