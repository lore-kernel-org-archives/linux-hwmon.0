Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959518;
	b=Ar6PRj+D0s9++KWbRIfMZDp+kQ35VRZM6qcXI2a2CsMBQe/+u2Ht/IZEjQGHy4Ny2oYm
	 an+cwANnJXSWr8IBJ0xX+14k80TRNLiZKpGVtorHaxXX+i2ZBMPicyv+cwTvk7U6tL9jD
	 mI0JcCTw5I5Lb9CstKyDcv+nT/qFykq5yMqVEoLFLva6QEQexRRbRKmxfg7bkvYjZ9Lqh
	 A/DfJyQbsr1TUp9cfl/l25FnJ+GIdKLCiHAZcIu7YnFygVdj5tnLaB2w7iBWlgazIpzji
	 kvT3ZnnUip4fxT3Hu8j1q8GeyCGV30jET3sFXjfvKUB545DgN9vB8hEwKMH64uLtcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uZ1slX+AQ1NtcolqNI0vgq+mu/KZSbKlcjGi9zPpN3w=;
	b=eAXa42LAdeNiKqJ7L6GEnakafm3AZbxQ1Tj4O10GEpgFe94zdpkVS6z5lbY2mTIQu1Ju
	 kFJVd/Je6V8a6TmxwtI4uXaIfDIrxO3uMlCsWoDobDVdkhsm+xneBRo1wdvNO3gOUywe1
	 loxm9qfpMRkv9MxupU9FuY2s1CrH3twKA7nL7eiUxaPRZbD/UsqA2xC9xvGta+yF11nCf
	 HLMHqTJchVMvQ8LkyBgPoEM5ueKs6pBgeosupyiyk2pQYruJWZeiHY/TaVagwTXujSpHN
	 GJas+0s33NAnto8i+3TXWxjY5dL1xyRZRcWhuWPTKmxI6rWI+l7VRAYOBORao9IKZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGi2SPOs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23503606A335
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGi2SPOs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE801F000C4;
	Tue, 17 Nov 2026 23:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959517;
	bh=uZ1slX+AQ1NtcolqNI0vgq+mu/KZSbKlcjGi9zPpN3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iGi2SPOsLi1RiJ+T9MbY2k/qLHv6NX/d39bkDg9S9vZFcZIUQXG/4VKoGg3qob98v
	 JjeLmM0lBPKvyefB3jxjqvAjvSeREtzaSbip7CLDd06jmjbwhPtrn7F22qRYPgzV92
	 3b/eZKJubhPmE/OPBkcN15ooT8hqGgOnRdABSAkAhBLI1wumgwA7s43BKryAR4YZ5f
	 peuacAUgl86fpu15AW6GiKK7Qt1V1rQEu6eAAdOBoJ56i0Nu37jOxc/SYVWiubc5Cb
	 KwqGYozSICcG5mAgJ1pvwr0qD/09dQKk28yaN0EywfL/XsKEorCtdo05HtApDVMspe
	 PEfItgq6txlNA==
Message-ID: <sashiko-outbox-219816@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389006/TPS389008
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luna Hart" <lhart.opensource@witekio.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-lhart-dev-tps38900x-v2-2-e5730523d3ee@witekio.com>
References: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
 <20261117-lhart-dev-tps38900x-v2-2-e5730523d3ee@witekio.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 23:51:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Luna Hart <lhart.opensource@witekio.com>
>=20
> Add support for the TI TPS389006/TPS389008 I2C voltage supervisors and
> monitors. This initial implementation supports enabling ADC monitoring
> from the chip and reading back the measured voltage in millivolts. All
> functionality is provided over sysfs. The voltage range of each channel
> is taken from the chip configuration, and device tree may be used to
> further configure each voltage channel.
>=20
> This work is based on an initial implementation by Flaviu Nistor.
>=20
> Signed-off-by: Luna Hart <lhart.opensource@witekio.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-lhart-dev-=
tps38900x-v2-0-e5730523d3ee@witekio.com?part=3D2

