Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216285;
	b=suUker9V4VnTr7cgI3vkiY5d2TMt7KkVgRzSzIyjbyH2BdebutnryJ0n9EHoI2VSB5yU
	 zBo5sFHHOqBnjd55y5Tbo6YrUWBDk+5hsplDAQP4rr3/sYS+5no0Fo6jIatmeWbPZrpQm
	 2ArgA/RiCWph+tNh8hrZACP1x+i0cQO0TWli5glF0HnCXMj5gkv604x8VZkG78A0obVNi
	 iDb42UAjJyhb687kAu/8nXcZSGbBr9RKkN0dH1LJxkONPdrCA7W9k3j5mMI4aNfbGxJdh
	 teM/H5oVEOuE5QG/rqHhxZetLMjs/o9/kUcBezEJL1tadxDX8Nqk7E/gaMMRzN0/0Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WD40oQQDquyj0I7c1Ci2seKwjcWvTFi3y/XFP6cc4m0=;
	b=NbXBGQ4hpfyFWq6cfyLcaGm3N3go3tLEbvz/dzhTqS0+sJU2kPPtzehriWvMy9X0owbH
	 uPsf9BkDod5pw82MrWvMqPlNUY0LRfO3BzXOWOc9Q9215AhVBYkJGeTNWT8cg7dr8wqAw
	 1W0RhsqovObsgbThovWG4R2VAUTmGtvMzFd1EpF2DvujkzK5AUrcRMc49aBMPb9DrGfb+
	 ruJd7v5hLrkAv60QRGcaSd6MZkVBBEzkuci0dq5CVs98+pnYKhW/W9ks3r4lSFOikRiMC
	 DZ+yJBNzR0aXEg0QNjmgfMCxZLzAE4b0msZfOyTU+W1q8JI8SghT5UdS5P1DZ0YpbSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llzF55l8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD385606A339
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 23:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llzF55l8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BE01F000C0;
	Fri, 20 Nov 2026 23:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795216285;
	bh=WD40oQQDquyj0I7c1Ci2seKwjcWvTFi3y/XFP6cc4m0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=llzF55l89mU7EcCxZ1RCoMhTTydtVpsF4uD2+lFs1ixIPXgyU83o5JJTaBd19XrKY
	 UCYGaM37nDnhT0qXES/XtGTg2fNr+TVd1cmju+Y3gNDZtHmUY5l89lfTqPH0i86N53
	 fNjHLNdTgqa/htVRgVNPG0cFF2kezNnyD65z0lJLfnf4evBRWqrAH/N7W7nJDdr66F
	 9X+byjOG/TfolbxNxbQ67aKuoJ4FW7TOB+H40NajJuzerxh4PlSGL2h7u2EdURqbNa
	 MJV/DaO1xd7ceg0ZHUO+hV1mN2Pp7yKO9Avc75qPdsMlXdB7eFYCvPNw0mfHFU8SgV
	 WOJToH03tUPgw==
Message-ID: <sashiko-outbox-226336@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga 9 2-in-1
 14ILL10
Reply-To: sashiko-reviews@lists.linux.dev
To: KuwaLee <kuwaleecross@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261120230744.34942-1-kuwaleecross@gmail.com>
References: <20261120230744.34942-1-kuwaleecross@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:11:24 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: LI-JIA-EN <kuwaleecross@gmail.com>
>=20
> The Lenovo Yoga 9 2-in-1 14ILL10 (DMI product name 83LC) currently
> matches the generic "Yoga" quirk, which looks up
> \_SB.PCI0.LPC0.EC0.FANS. That object does not exist on this Intel
> Lunar Lake platform, so probe fails with -ENODEV and no hwmon device
> is registered.
>=20
> The DSDT exposes two 8-bit fan tachometer fields in the EC0 namespace,
> used by the vendor WMI fan speed queries (feature IDs 0x04030001 and
> 0x04030002) with a multiplier of 100:
>=20
>   \_SB.PC00.LPCB.EC0.FANS  (fan 1, EC offset 0x06)
>   \_SB.PC00.LPCB.EC0.FA2S  (fan 2, EC offset 0x03)
>=20
> This is the same layout as the Yoga Pro 9 16IMH9 (83DN), so reuse
> yoga_pro_83dn_cfg and add a DMI entry matching product name 83LC
> ahead of the generic Yoga entry. Document the model in the reference
> table.
>=20
> Tested on a Yoga 9 2-in-1 14ILL10 (BIOS Q9CN31WW): both fans read 0 RPM
> when idle and rise to a few thousand RPM under CPU load.
>=20
> Signed-off-by: LI-JIA-EN <kuwaleecross@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120230744.3494=
2-1-kuwaleecross@gmail.com?part=3D1
