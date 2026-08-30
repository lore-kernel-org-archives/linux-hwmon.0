Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B33B42F8
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095504; cv=none; b=Yb5bvfW97g4tzmugm63srkGlrlMPeV/+oiVCNKxIsRITSgXxHT3+FwRQchfzLtd2Ckpsfobkdo9gWrApq8siLihjSjaDVB4cJVBl3em5s66uK1RLQ9U3lj2DOoEqp380GR5XgcW/916ix5nrtnoybd/tIJ0L6Z3EGlBIla3djpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095504; c=relaxed/simple;
	bh=R3bFS65AFjFI5NBGfmBbJuFkvHyJ4una/t8+fSrBHSE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OYmLGoNWnFkljMFiqjAnEB7uX/bX7CJjHSNcOGdilcid9apNOWKCgFmO0Whh4ThD5Yyn0pm6O8FlKNL7NlzywWliISL5lMOC0ZJdryMaSy8pVCf4dIcXVh+n9hWjBqKDcnkevAFeK027pjEIXzxH21PhYclxLLYGvDBv/OymeHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRLvr1FX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRLvr1FX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410D91F000E9;
	Sun, 30 Aug 2026 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788095503;
	bh=R3bFS65AFjFI5NBGfmBbJuFkvHyJ4una/t8+fSrBHSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oRLvr1FXhQ+x+gUbNQcEF2D4wyixqR+nfWL4eutAz7TKNAe8go75VffSmY5StAanH
	 82vhONwWsdHNWmOIEFhpAoRDrFYbcJQh2tarqCLkPGwi7y5BsLcJPx9BGpRWMjkosv
	 u6+hB6nKQGzosUMcZK1TrWq9cnvxHzV+//yB61jQuYFD9JuECBGoXA9YxBSAeZoWZy
	 s8Pv0F63dsjWc/C+tf5PZ55psBRET3QejIoeb+0VpKeh+7PQUPkrXDL7AoI6Y7WJUH
	 6GVTymaLwFPgcLKseDyjUdSThX95GlGJlpmQ9t2N2t3jzPgZXs5C8FcKbP21T5+k0A
	 patrDzcyuR4ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING
 WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Asai Neko" <sugar@sne.moe>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
References: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 13:11:42 +0000
Message-Id: <20260830131143.410D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Asai Neko <sugar@sne.moe>
>=20
> The ROG STRIX X670E-A GAMING WIFI is missing from the driver's DMI
> table. Consequently, the board lookup fails with -ENODEV,
> asus_ec_sensors does not load, and no asusec hwmon device or EC
> temperature readings are available.
>=20
> Add a board definition using the AMD 600-series register layout and the
> ACPI mutex used by the board firmware. Expose CPU, CPU package,
> motherboard, and VRM temperatures, and add the board to the supported
> hardware documentation.
>=20
> Before the change, there was no asusec device under /sys/class/hwmon and
> there were no EC readings. After the change, the driver registered four
> sensors with representative readings of 57-61 C for CPU, 68-71 C for
> CPU package, 43-44 C for motherboard, and 49-52 C for VRM.
>=20
> The readings correlated with nct6775 and k10temp. Repeated polling with
> both hwmon drivers loaded produced no EC access, bank-switch, concurrent
> access, or locking errors.
>=20
> Tested on an ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
>=20
> Signed-off-by: Asai Neko <sugar@sne.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-asus-x670e=
-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe?part=3D1

