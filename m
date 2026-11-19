Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047333;
	b=ccO0Xs6ttMi9rVGTLRD3gtuGPFCH5CudwQKnBJ00DWaZXmUgF5HvV5ETwE42Tu1UZbyh
	 5Bz+3/5Q+/tZ9t3nkZa7RfjCVnKHrZvouRlT/Sp+n0cpYd3/oN8DyG+fiTxFI6xs9cFh/
	 c4dX8KVdWqefXgrjwrllslVbp9Cisc+E7Ng30C10HMB3YvigMcHXVdJGvNWqEeQSmm/v4
	 tOvyUyyjUckznkidLxao1ulk6f7g9JueyGA9UmrkDwWVuWpvgW3sSjNuQe56Fa8t9UAX3
	 E5zTdGNAJO1Fuug1J0NmomQSzGuelT45i185vIWYraM9YnIJ0oQ8aEhYN5ROFVY6bnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047333;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D4JPfoM+hVzma5+RxLZfvNjHiVpd7KUOf5cxeeQcLjs=;
	b=xWkYady3W6csVFFvFVDGiGLrfrw7i/VYZY1xb/Fz21Vq3sMX9wqemSx1ARxGsFy6ANrI
	 9jXmu17H1vDFDQySWZmFiOW0SRMTHM3FxzlH/lS+JEkB6C2dCqWYzQntSakr9Xs5O/OrB
	 D5AT6jap9tDNDuwGPg5L0p+5jq/FH5JjDVhTrB3HtfS3oL3Wycup32JmcHiqi4esGKdWS
	 FrNB/B6ucaG777DoFzpf+3PUJXtvSEazlL9K92mSLfAIVHQrMslsMkc3WFdgcF5HNjZlR
	 lqfB2hxBhPF5Q14HZOkVLe6Ih04ApXM6zusxeDV3+dHiKKaqIfq7ha1/iYCN1Mc2yqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXalPHsI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9A606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 00:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXalPHsI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F961F000C5;
	Thu, 19 Nov 2026 00:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047333;
	bh=D4JPfoM+hVzma5+RxLZfvNjHiVpd7KUOf5cxeeQcLjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZXalPHsIToKUDFZufMwhQZcecvQ+hxVU8K3xxex8dLRhN886Fpx1hLN6J+v5Yvhgf
	 DoN1QOWjcfWF5exnaWzwYnyVvZKwJUTibAGeW/A6aZCrLPGQ4ygSuhpevlWzJ/FGf3
	 /f1uaAEb8DDgqenwmHP00A/7IWEKdTEmZ0H+clxmh2ZQ5wdzrBDPHvY126kIvb5ps7
	 JiGtvKqsEWTZTae/rICZfccBsKZlyW6wIa5KPMDkMTYbqK3wuImRX+agPg9nfR7nxm
	 2X2AfVxqvhJs7xAzCWSsAbf6kTUOrlCP+ORIndgO6s1A1gd9y5wEcDMiWL1pt+AScw
	 JQVWToNKHdSNA==
Message-ID: <sashiko-outbox-222239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261118-marvel-env-v4-6-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-6-200317e496c2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:15:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
> The SRM console describes each sensor as a packet in a power and
> environment node of its config tree (GCT), and fills in the readings
> when asked to refresh the node. The packet layout was taken from Tru64
> UNIX.
>=20
> The firmware gives each temperature, fan and voltage sensor a warning
> limit and a failure limit, and reports the sensor in the warning or
> failure state once its reading reaches one. Neither state means that the
> sensor is broken: a temperature past its failure limit is too high, not
> faulty. Power supplies are either working or failed, with the cause
> (AC, POK, overtemperature, fan) logged by the firmware.
>=20
> Export the sensors through hwmon. A temperature's warning and failure
> [ ... ]
>=20
> The console callback lives in core_marvel.o, which generic kernels
> built with ALPHA_LEGACY_START_ADDRESS leave out.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-marvel-env=
-v4-0-200317e496c2@gmail.com?part=3D6

