Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380794;
	b=QKjktMT8uAZHkQMCvsIeKQxfLCawjrQNN7y/3o9h3AdugDPIzA6Lv1fU6BFrcH6PI3lj
	 MKOYOdE8ZuB4NYbyLvraZiU8++6PVDSnTd7UXzip/wMQ7jERFZAEV/uNuoZuRHX0TQ6dr
	 6itvO+Y+spnrD9M+WM6i5vqjd/Bpc/7Tv0FivrHoS0h3iWmEGgJ0lyWvSUPONeC3c4o32
	 QRodusVxj3lEzBeyonDyKGZPy6vkiSmenXZPav3HURkdAutNAbxcfD/vefbtQ4I+68eM5
	 bcETzYLlMZAQALbm6EMt82mQ5Kl+oqzzjmGw8ARKqby8BvGrtWk77xuAybBLp/o0CzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cQUxIOfIoj+sddn75BGZcWf11N2VT7o1z711GamHTA4=;
	b=I3wZ5Y+sVsc42JHM99gHW3dI7a7tHgC/PGeMFEo4yJ1WJh9SL00XGkMR+X9jM0sZs7hz
	 3cppBLceJ9Z7an8tYVpYFZ39h0moITFjZjcKuOCPXjMXc5GKozVnnKwRsNZomZVREbP/4
	 1onyW6tZrYKuuuEJReUXAa3nc3G4ef+EbfefRzbSyNlx39UMVaPDFvXLLyzB8cEEZN10d
	 EyTW1uu4PaAZh/VIrtROMKLFDhNcR4Jpi/6p4/hheuejbxFSDqjxs7B6pHcxLgPbu4CPY
	 CR5puWjq4dcYebq2SoVLsVSvSfGGiC/trld6mhVH850QDwMf5l6PfAH3iyO+c2jFUHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8PH5ohv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53A4606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8PH5ohv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7901B1F00A05;
	Wed, 11 Nov 2026 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380794;
	bh=cQUxIOfIoj+sddn75BGZcWf11N2VT7o1z711GamHTA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c8PH5ohvEiOlq7csvQCUW0nrqNWk3Gn/hmxoABvlTlhgK0WLcUlYDXNc26/2Smz1C
	 LW9G24WbANKOwTVzkcLcwe3ZZ+xHkolTHsoyM/JppzPx4hkjvRxNomjlMwZDbUD423
	 DPT+FtAKRFnP4X48frUFld/e2HQt3IZ3ptezL1xWdtPQ3I0F/KQ75vcTOzyq3AaPB+
	 fSOO21/5UUMMHPO8BSNJS7/X5mnmCHLEoS++zlDA2cs8CCEHEdT/GabEljKHCaB2XQ
	 Mfm+zxEeVrfPX+E2DQQF9E71CooAilgQXCrpqANB+Cy8Dv3R8wSQikQkdC43RFWXEE
	 RfaZKXADZ9g6g==
Message-ID: <sashiko-outbox-208493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm85) Bound fan stop temperatures before
 subtraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065324.17776-1-zhujun2@cmss.chinamobile.com>
References: <20261111065324.17776-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:06:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> temp_auto_temp_off_store() subtracts an unrestricted long from the zone
> limit before clamping the resulting hysteresis. Extreme inputs can
> overflow this subtraction and select the wrong end of the hysteresis
> range.
>=20
> Bound the requested stop temperature before calculating the difference.
> A signed 8-bit zone limit and a maximum hysteresis of 15 degrees require
> only the -143..127 degree range.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065324.1777=
6-1-zhujun2@cmss.chinamobile.com?part=3D1

