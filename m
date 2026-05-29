Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9D403146
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066703; cv=none; b=dLcTbTtMW0lt7nCw/0c4bnrnzR6DtVSqul4qPSuoNS2eWUO3HqXe2xx8cdh+mSaK7Nc8tZmahApGwoq2WKOpHs0tf0B+8dpcyqFHltYOH+H3DZOe0tDLxXvXjl1OfLbOlu1aBeVFrOpQEuo3WGtcwupZ09LGcB9+CdCpzLIuqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066703; c=relaxed/simple;
	bh=gcWaHeEjwB+2vvhipKTXNylFHvWIJ0O+6KhycQ+UFh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nhi1aruwL4u2mSwgyHs7ocvEVDrKYUkQyEBVSddncZNc2aSchChUsiOLfE+tptkDrzKUrmhUCLtIO6sUs1giUOMBYEeJi99RdIqZP1RhkCYQWkdcCdfJce53cEcoDvmIKHJ0fcge/FZZ9Pkzz/S/PRQDWSL+4MYHLprkX+5+xrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxelqqja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxelqqja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2D21F00893;
	Fri, 29 May 2026 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066701;
	bh=gcWaHeEjwB+2vvhipKTXNylFHvWIJ0O+6KhycQ+UFh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxelqqja5monXtY6Zasspc6vcnH5JstBWGcYqTZI8IAD8KMBNyB+agh6yDrfS2Kd6
	 JHFIxdMZzLZSEeyKcVK+AXGYoIzI3+Lnn1RxPhoSNHuzYaULGVfFnEtmy3+RR3pdfL
	 IFaIv6uYvgKFkoc11Yjc24hnfjIPi+LRT+BdpRM2w20gNKL2dkG5PuRHqTZ2E85PQi
	 4U1CSi3Yr3pj5lbbaQZ5LvecqvtBdXOCyUFDvHDEdAHHaMrJHqO//GTpcLlssA5mNm
	 kLUndXcIPwBDo/YDRRaWAteC3E2lAMVxhBniwZsjWU24LKG8LiFYphtwrYDYK/2KEs
	 iEUfA1L4lDRJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: it87: Clamp negative values to zero in
 set_fan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
References: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:58:21 +0000
Message-Id: <20260529145821.6D2D21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> set_fan() parses user input with kstrtol() and passes the resulting
> value to FAN16_TO_REG() on chips with 16-bit fan support.
>=20
> Negative fan speeds are not meaningful and should be rejected before
> conversion. Worst scenario, one may be able to abuse undefined
> behaviour of signed overflow to possibly induce rpm * 2 =3D=3D 0 in
> FAN16_TO_REG(), thus causing a division by zero.
>=20
> Instead, clamp val < 0 to zero and keep the conversion in its valid
> input domain, avoiding unsafe arithmetic in the register conversion
> path.
>=20
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>=20
> Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529141839.1639=
287-1-n.zhandarovich@fintech.ru?part=3D1

