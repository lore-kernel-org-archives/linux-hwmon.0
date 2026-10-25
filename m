Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901823;
	b=IIueV+N7GnSlhwcfgY7e//2XQe/MSwC9U+adZzu03zwuAz+6L3SFciEo28Ra6z3XSJBC
	 LDLXRB/XNTfO9/VV3wwsslYIlkAJ7V8BvHBaSZoTc4Lhx0tKxcI8cAOwk+6AFcjs1j4N8
	 sxmUYa9C/nj6B0ZM1uQ5CWcuvSWWVjvCQlMJ4YjGu1/qEgL5GEu16Wgc/b/ENmJrI9xl2
	 RjtqsGNR0g6Dgm2DqPQSLZAiDgSx4TNJUEkOs6Of7P8H9/H3qiqIjPvtWWlc48LApUDc8
	 nI/ujHqzphshNpvRCiDPCVr7uUALxY62UKah2S3oyFPCi+GUFIrk315LRCWEEuXLdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901823;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WJIBjIQr+R1mZ9//YkbSbBZz8Z9qOqH+Aune2zzUH2Y=;
	b=hEAUFQysUIm/74S9R5L8Ms4j1DuwRQ1QdH8hlR09luazSJaLxmckTxRF3ma31nLYaCtu
	 kxvGandxTmIs7LOec7UeJO5M3N2mFGFKN8+1K+EZW2BOT6sy+3wvyvMbK9IUkfe+Ow6fu
	 HcHygHPEFS98CFMJr4mvI/KE87AwfRhM2oOWPPm3vS3B0SGgMOYsRdpZsXgI+YujvklSZ
	 lqR0uFkak4rutj6RdiRMKTV26yOvTUsKDXm5ASxGruukHomXkUI3OiypPN4/5PPDpfAYC
	 kRT/6UkrvxFmkDWg+wjIGwi42VzCejtLLpQBcepbOb2FAcyrbsMYDap/+vehZcJIIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9xsqJw6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2D606A31B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9xsqJw6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9711F01825;
	Sun, 25 Oct 2026 04:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901822;
	bh=WJIBjIQr+R1mZ9//YkbSbBZz8Z9qOqH+Aune2zzUH2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9xsqJw6oQzU6/EdOWx/9t7pdVZTrFFHzZIisXjm8HBDX12x7cDZL9fbh1obgU10h
	 8PmfL5rg9BPgBKKPfWD8rI8vUX4ve+0MzFEQZVSzZzAE1mpzUrAnVrQtDiRXcsbbCA
	 nAheP2Gn8Lf5HU8jGdlez2Vbwf09ulU7OlLwMTf91rSbrXIHS2N6Y3Tjz9Pl/hz48m
	 WgBSPdN1ZTGrMfxGZ142rVrDCKUuCdb5rygvQuwtJZy9CNE7mCAYiQXGgpI+myk4Dw
	 WXuE/jYbW0ZJwaX67uPJC6vKrOCbepoAy6GGWYE7cEGzbLjQQcvHGdhDyqVSnZVTJ/
	 ZDW7ZId5VT0Kg==
Message-ID: <sashiko-outbox-184041@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/31] hwmon: (pmbus/ltc4286) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-17-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-17-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass sizeof(block_buffer) - 1 to i2c_smbus_read_block_data() in
> ltc4286_probe() to leave room for the NUL terminator, and explicitly
> terminate the buffer before comparing model strings.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D17

