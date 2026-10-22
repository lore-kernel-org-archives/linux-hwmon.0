Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693604;
	b=OfUeCJ0kI6d9RD9lWBQ2RSec4753eDgMmQKeLCNwtpXn9AYYrfgtnDFi35KFQrb7ObZq
	 O5xK6lc3WNXaa2tLG8fBZ/AQZRt3339h0q6DWgxABkO2PHqti1rJwVTislqKKPyXZqzI0
	 8mDk+FJURqGfzSaVp/erXsWNqwpIxBzD2wNIM2S6xoKvigCuAXzkQLDL48fsO1KPqY+mg
	 lhUYOohk2Ry0/WvaUcAiu262+A6lmuEDnG5H4n2ig3AMXaI3zkf3jZFGPHt46QEj1V+9H
	 c77CX4Bw+6KJlDFYcX+IXPP06+O6Zdabpa9tObVTiieXtFBulZVNeGi6JgbewjN04iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693604;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tXlpWmp4SOOvegpstZMdsN2TebshTEpShChgsG1EgDI=;
	b=j5ptYZ8DTNlNTEWiXzcLB4NxTzVvapcIpLVrs6CN27s2c8m6nr31wTtQoIxql3+6Femu
	 dtkELDrDsu15a+II8f5MeSWI1GyM2zdTxumJ3mMOAMUWoYi6gxnZ8HsVBgFP2RbuHhy2j
	 CK4RPnBIrhZO/N9DNEUNl/Q7FfdqnJVhBaYHM0UWwa4nOYlYk+sJHfLdK0qXnqVlVrgAJ
	 3NO2VG0jV1kSkvtM1/JFCIoQNyKjNLubmJFz7n3Tw38IKLzTdKBV360qfRKoDC2nH09uG
	 f4ZzwKYllLWwRFDN3cI6+KIkpw3F/97BfCb9XoFrumpQ5B1bLL98uR1Ya9I+vo5bh8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVZVPKJh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE90606A319
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVZVPKJh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD1E1F01825;
	Thu, 22 Oct 2026 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693604;
	bh=tXlpWmp4SOOvegpstZMdsN2TebshTEpShChgsG1EgDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hVZVPKJhNGBob8V92BpJkY7V3Yt8hGBXqMRXuQhvjvux8eoTLMhwRSUfWnf0QQGn3
	 h26+96TMpVA2bIbP4yIu9LUVt33OstPCcvjexpwgb5ZVG8w8wpKC0CmcKgYICA8ncv
	 BKU6/SAuQV4UHfLzrnjXQJyF4Agj5ZeXBxIt4ydQxV6turg65KOYExpkNXT59DNRVw
	 iVVco6ID8Duits+guA5nuq1jlglJeQQ6FwobSHrPgF3Upc/sQufoDboJivtWxajxu3
	 pO1Kicp+LyANrOydX/h1eqeuulw/vHmPnr/0DvLCEY34CWjNQ2MEdron1Z2qyYLdyT
	 NU/FJDSL4aQZw==
Message-ID: <sashiko-outbox-181910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to
 fan control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022182247.46381-1-W_Armin@gmx.de>
References: <20261022182247.46381-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 18:26:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A user reported that the Dell Pro Micro Plus QBM1250 needs to be
> whitelisted for the special SMM calls necessary for globally
> enabling/disabling BIOS fan control.
>=20
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
> Co-developed-by: Sergei <serjo32.dev@gmail.com>
> Signed-off-by: Sergei <serjo32.dev@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022182247.4638=
1-1-W_Armin@gmx.de?part=3D1

