Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751DD334C3D
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128889; cv=none; b=fMtpcsj5kaZOWVEGXHlYuA6TXCYa+ujvf8x9wBEbSz6hDc4zz4+R51ePc7t+2GYwOe4Xzy/8xFVG8Nl1So/0NUb6jd9tFIt90AAH8BcnTuDLX5OBusuKnsGB3d+nN/MnrnLOl1QHkoa+H9zVrCqJnm0btthkNS03hemS5yW6tpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128889; c=relaxed/simple;
	bh=IhivOh/qiSKNivYtX2QFBpAJ3vy1+AQN/93TYaNC5Rk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RN0+CFfzvMhs7ZYH4SGKzWzVwTvruU6f4c7VvL79oxrz5+nBM+1kK7KCSr5fofDiTC92dkfVwkujzCOXuMkc+IIJThckQFIx1fMTKWKJRZCynMBjApmc3KKOWBSqxuXj572wHcmelvszTpJ/fkDWnvhMPw50f8MzPGEjOb1hdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioQGnCbB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioQGnCbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4A91F000FF;
	Sun,  4 Oct 2026 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791128888;
	bh=DGsD6hOtldnSCHfOlLHRyuRrmXeXQUgk7B3Q13voSNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ioQGnCbBs5xA5XFTDJPDSDscpBZY/MemPJKNrdXFooJimNvg04YLtWOc88GtxHGCS
	 thZUzYtTvHPqimSyTHKsljhCEaaK3C62AKakYLiSoRP+4tv7hl8pn/jYIPz03QVg2b
	 JR+2/imN5FmQSBt21wp7s9sRZ6cKuHPbwDM4/aI809hlW0/oxj6k44RbrWw39EHdTb
	 GuZ2fcnUQloelP/69YBuaDgClfi8q5PVfcAIQk5ca5kx04jKazCOoRW68Vd3U0CMHO
	 n2QzB35m7K45eCSoX8ePR4Mn/v5FK2xQljs4hMBUn4opPbEKB5e7VXxD/DXKIYIMyD
	 oyVKSkJtpKN0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6683) Add fan control support for MSI
 boards with NCT6687D-R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hamza Mahfooz" <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261004153250.516730-3-someguy@effective-light.com>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-3-someguy@effective-light.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 15:48:07 +0000
Message-Id: <20261004154807.DD4A91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The fan control registers of the NCT6687D-R used on recent MSI boards
> (customer ID 0x20d) differ from the ones used on Mitac boards, and
> changes must be made in a configuration phase of its fan engine.
>=20
> Add fan control support for these boards, based on a reverse engineered
> register map:
>=20
> - Manual mode is selected with bit (channel % 8) of register 0xa00
>   (channels 0-7) or 0x80f (channels 8-15). In manual mode, the duty
>   cycle is set with register (0xa28 + channel) (channels 0-7) or
>   (0x260 + channel - 10) (channels 10-15). Otherwise, the fan curve
>   configured by the BIOS is used.
> - A configuration phase is requested by setting bit 7 of register
>   0xa01, and is entered once register 0xcf8 reports that the fan
>   registers are unlocked. It is completed by setting bit 6 of register
>   0xa01, after which the EC checks the new configuration, locks the
>   registers again and reports whether the configuration was accepted.
>=20
> Fan control is supported for the CPU (channel 0), pump (channel 1) and
> system fan (channels 10-15) headers. Add pwmN_enable attributes for
> them, with 1 selecting manual and 2 automatic mode, and make pwmN
> writable in manual mode. The behaviour of the driver does not change
> unless pwmN or pwmN_enable is written.
>=20
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004153250.5167=
30-1-someguy@effective-light.com?part=3D2

