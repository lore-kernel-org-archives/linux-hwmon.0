Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530187;
	b=npeYMNjm7FrHBq9r8KN545MhefFptSjlIROkbJswo31GOhEFjBs121keei5/8Y4QdpSX
	 VFFLL9SjnP52Iih3Oybb/+mDXNO5nKLvSLu6FSn8EYNoIt0qds7TMnwy34opQcJDn9O/k
	 evrbxcFBokvDdk8H1E8t0eqDQ5M0gajDTPHNlbd1Z8M9NvomKg3vQeaGz9OvgbndtDZ3B
	 SU0Zpb6dg8SV2lNSioVToATmADkksgsrxeZ1M7DTWJb7vI8P44SYu4hYlieJy++72gkxE
	 09M3lAAbC0w/N7l98H20n+FRMhihIniQ3BdkdcKqfUf+at8Cc+dALGT5h+bKD7Rt+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a28JknnsWQs12c70VWuS0AFQoaZgXiRJzsIUSSaMxJY=;
	b=pILKIqW1pVQg/TG1Fr5+3EUav3STiaXwouaDlXRsRMCBOKTAaGVbKfeRc+8kinjkqkzE
	 WMC0KjzqJVtj1cnZR2pLhDnf665JEuPgQK702C+QSdiFihVMJtL9K5C+pL0tQN5V4Xfhb
	 JKKRe34OgloK0fuMm61qlmq2Vy6V9IISkm4szVCc9dSK1dqgA5PYY8YT3TzwIcQpEmVkf
	 Fj/jQAntUf+BW1u3CXii5fpWCSQ3V+P8Rj6bPs8NrOtRdSdPG1hmjQ2rJIdRHCKXKnWj4
	 GKOx4xhvtseeP9mIfFSMz8pV7FxDNqmsKEo33p/mzm7H0zeSYf2qK57vm5H9PuaXvLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=haS40ez2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D4606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=haS40ez2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167CA1F000C1;
	Sun,  1 Nov 2026 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530187;
	bh=a28JknnsWQs12c70VWuS0AFQoaZgXiRJzsIUSSaMxJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=haS40ez2plaatpOhCv7h2Y+/FlxjS4XRkszz+yQAb3Qon/L2j59PHUEAhspf5xYcY
	 oTCvvuBYXaa3ncS8lN5Nc4fw5+o9jEQkZSmdEt/kruRbEGbnlTJOnTtc1QaEwKucF8
	 ttl6iy4HDlKVn/tXtds43gMmXwiwlVjRTIMC65KXFcJAvCWxwt1h5RnyJiiTzf1dai
	 146hG7xZcZcoFhIj38sZCW7quOlDX15JF19KY7FFiuAjv9Rh0iHLhzANIewTkUklPW
	 VQjLi8BSqTzGzQ9aSiAq1bhqXHitoDPm5mTPs5cSKo2OIlZktnUXtuGAdyCDLbZQbd
	 y3ubH/KkTvy2Q==
Message-ID: <sashiko-outbox-192365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] platform/x86: asus-wmi: define the fan floor table
 DEVIDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-3-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-3-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 10:49:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On some ASUS laptops, the embedded controller enforces minimum fan
> duties on top of custom fan curves and reports them through three
> read-only DSTS methods:
>=20
>   0x00110026  CPU fan floor table
>   0x00110027  GPU fan floor table
>   0x00110033  mid fan floor table
>=20
> The mid fan floor uses 0x00110033 rather than the adjacent 0x00110028.
> On examined firmware (FA507, G614PR), 0x00110028 and 0x00110029 are
> stubs; while GV601 exposes a GFLB(0x28) AML selector, it is unrelated
> to the DSTS devid.
>=20
> Define these DEVIDs so a follow-up commit can read the tables.
>=20
> Signed-off-by: Bartu Alev <bartualev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D3

