Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55D3D812D
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276251; cv=none; b=fRwT6u0aRJIRdtzQpO/GCKoQvuSS1bVtBq0SnislZzdDjRbeNAQfUwMHtTdVanW4iCzmXNQrGkHOWT7sRqK5P6NNekmtHe12AR0OEqgyBT+6aSmppcHFuaGRRduILxLNsvUFakD1GkvHPoB4jIGZ/yygEj3LdgXiwGtj5PON2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276251; c=relaxed/simple;
	bh=tM1ilMaZAxDakKg1eKn++ifmRL8gfb+zpgBLnIJ6HVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UnZJsX8cCu+G2FHdTHBPwZNpGg32B1VHQMUIdGFq0+jP9V/I9XxKNOsJKQAJAI8jSiGPWzm4W4JKTF9dJupDlIhsxJ8uUgC92iHKj5dAaMK66+i4KGOrTjRnAb0yuO4FOo+U4jBQgwV7OBfu+rGj/6l3F8+3LSPvAQnaRH5EmgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy/twJMf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy/twJMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548C21F000E9;
	Wed, 20 May 2026 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779276250;
	bh=tM1ilMaZAxDakKg1eKn++ifmRL8gfb+zpgBLnIJ6HVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jy/twJMfNnAZM8IZEYBVspr/ZieUDZcJ0Wb8CLjvkJM8DMnzvbKwcoNcbnsofYUhy
	 VQ37OXGfEL3UNNiiIE43YjJaNBsDzE+600JDcfTpYjU/3JLJgWJAAq0J3iTvVT1J2K
	 ojtzC8ERc2DCQ+PgocfoCyBmGgKmsiF1aspm3qwj9KlmHkP/RvDpUHmoldda+PxhZA
	 fy4lzrjbs47mBun3Lwhq2QDcUphirxPwFPNwlqPrjwp1Qdor8eNv0kkK/3G3T7VYMQ
	 wUvbJsMajIrMeuNeW/BKdA0OpVNTzQ1M2IRs59TYL0eIjWhawvKLijY+jihVtk3VZc
	 p8RFt7/Tcrn0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 7.0] docs: hwmon: sy7636a: fix temperature sysfs
 attribute name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520111944.3424570-16-sashal@kernel.org>
References: <20260520111944.3424570-16-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 11:24:09 +0000
Message-Id: <20260520112410.548C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Chen-Shi-Hong <eric039eric@gmail.com>
>=20
> [ Upstream commit 51f57607e30bee282a1d40845f89a311cbb26481 ]
>=20
> The hwmon sysfs naming convention uses
> temp[1-*]_input for temperature channels.
>=20
> Documentation/hwmon/sy7636a-hwmon.rst currently documents
> temp0_input, while the driver uses the standard hwmon
> temperature channel interface.
>=20
> Update the documentation to use temp1_input.
>=20
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> Link: https://lore.kernel.org/r/20260514154108.1937-1-eric039eric@gmail.c=
om
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520111944.3424=
570-16-sashal@kernel.org?part=3D1

