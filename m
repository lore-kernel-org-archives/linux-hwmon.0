Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC0299929
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788003442; cv=none; b=iLSvfVVGntZh+kHv0MWLTsyo2tNm3e3+zSpYoNNQisLM2DHHMc7/6BB3eiYz+fNxrol80DxYxQhel3PUz0hkqkups6jKyA2BWteMt+hkiI6e5V9SoEZCxmEkobI+/LIsH+rTg7dxyFY5zYQT5rgHNfrIJTYZbfy0+ktLs23NyBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788003442; c=relaxed/simple;
	bh=uJmL3uCqHARjAdu9FjhOg0UEnhQaidtWPwDy+xTCODI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UfYqZAQVyTH9rFeXaHe/Zdn70PXDenF1FqmGoTMFrBZBGdElqFkILZPYPaUp0dnzx5btaBMb82qzBE3BsoYjCWBAHbc1c0XLwGP28RRtzvIxXc2vEp70FU4aZGNcldvVCD2nx7gEjnWBbLkZC8iNnO68COcy+UBuTQhCVv9ebSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLIJHDI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLIJHDI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A201F000E9;
	Sat, 29 Aug 2026 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788003440;
	bh=uJmL3uCqHARjAdu9FjhOg0UEnhQaidtWPwDy+xTCODI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLIJHDI5cMb0TdyCWfKKDMYOR7YxJZ0UYid18vfzbmd7BJWI6vvoIYZ0f+HgADds9
	 UaviOgUdIqa7UiHFA66HzjDI/ntkjr8vR/4RdggIPlIomBsZ5c7jYUGdkMo7Wb0vYI
	 gHXgdi93vIctflNEl7D4Y0XSZQeX08Fl2feXRrGf3Z1vKD/F7SfDyVj9Tdw9Zfqoop
	 X6qC3ExgRNVmZl8gQWIOEjyW8xmrG77B8I8klCxcYRGxgDxn8WmYU/adur8AORuP8R
	 TS+0JcTgoEwQB2abMocdvEXu8xsh7RIz5Bc5029wLL5UmkB0S5GSDq0Tvpe3ajTcN1
	 E0LhfbtL38R2A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2] hwmon: it87: Add basic IT8613E fan monitoring
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829113011.51290-1-jerome.tollet@gmail.com>
References: <20260829113011.51290-1-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 11:37:20 +0000
Message-Id: <20260829113720.B6A201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The IT8613E is not recognized by the in-tree it87 driver. Full
> support was proposed previously but withdrawn after problems were found
> in the temperature and PWM paths.
>=20
> Add conservative support limited to fan input monitoring. Detect device
> ID 0x8613, check the fan pin muxes, use the existing 16-bit tachometer
> layout, and expose enabled fan inputs read-only. Do not expose voltage,
> temperature, PWM, limit, beep, or alarm interfaces.
>=20
> The device ID and fan pin-mux checks follow the earlier v4 proposal by
> Benoit Masson.
>=20
> Tested on a system with an IT8613E at 0xa30, revision 12. Only
> fan2_input was exposed, with stable readings between 1268 and 1320 RPM.
> In a back-to-back comparison, the in-tree driver with force_id=3D0x8622
> reported 1483 RPM and the out-of-tree driver reported 1442 RPM.
>=20
> Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@pe=
renite.com/
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829113011.5129=
0-1-jerome.tollet@gmail.com?part=3D1

