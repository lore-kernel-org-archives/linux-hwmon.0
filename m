Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004484;
	b=TSr/YRHNRA3P9BjGncGwSLtniCkfwQYS4y5zk70EVo+R3qHhE99Z9L9HFRma/j9yJqzx
	 HqkcukkJ7pa39Dn588nJEXTXTFkOseG/5R15YCQrbzKajp6aIOq3AyJSvUeCBjUnremAi
	 VbhR0CIllMXVkgWkI3A2sPKmlu7IGD5F4/dVil2GP4iPlC5NrHFFP+Rc/0Mzag17QGYNe
	 zKJLjJ+ZSY96HXdLceTpW537VAdOetGd2NpqKJiCttYy9PEE4Qv3oAsUMRvKl+Y5JXcN3
	 24zd6Filsp4OEHtyb+8gnwXwF3Yd/iF7XGwSmSa1Moyfm6AB3RoNIs+XmPaWctpkRBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004484;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FV1+dni14xmSTWxX4kxB0IzmHKdPfp5EOylGs3oTQHs=;
	b=5pwLZJQUHSW281gZoUMAb8HobX0L2Ly3w0uSXmcHg8rwpwk8501dqjRSwGn2Ga0pzHyP
	 LvWTugQLVcGlV+7/uN6ZOLLKb8JsZQfdQvlhmzOCzgrx2gJoefOqjKD+ajsrJHUVj+AJ0
	 ZS+VswHGJkNgInbgq3dy8pJlzgFdSSNYAgZOjGgwh3dhWijHLxWb9ODrKXEpSCWGnsf6j
	 MH0rYWgvu46hnTe+I3fYT+2IM2DCmQWC6l7+BIbMYpywFN1UkzcTwIchy3nwgjeiOqeQL
	 RIxMUiqrlOvmG8KqakYBrw9nXICEqLu274diEnpOmgpx4SQP5/CmUx7q8sBzKfSIaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAoy3zBw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09E606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAoy3zBw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995AE1F01825;
	Mon, 26 Oct 2026 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793004483;
	bh=FV1+dni14xmSTWxX4kxB0IzmHKdPfp5EOylGs3oTQHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAoy3zBw0xvJPD5ivVWLThy0e9ERNkAP/oaKk/JC/Jcvfr404sh3H5q3rLynIoM0G
	 yRYFupqcs6OB3T9ZriAeNgXr1FpWcS1tiyqmB3H0qqhKfMOqRl8NhWva1X0keNa9nY
	 6054sqWnuho3v1UZIlf2O/OunJRIpkBG0D7ZtmlDsoYdSnUttshfVhFVk0FIJo+qw/
	 mNA4s09bBcUsy3zAvImnYG9TeAWTsl1E+6dYYuuWb68OiY7X9Zn+afXpQliD2QAqPa
	 H+PDaVd8cRera28XuQ1d1ioYESfd+n1vU7Xdsc+ckGXvMwASct6dkUEXxTFBA+uMjt
	 ftPKD8zo3HiQA==
Message-ID: <sashiko-outbox-184690@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) Add support for MAX20810,
 MAX20815, LTM4739, LTM4740
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlos Jones Jr" <carlosjr.jones@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261026050241.100428-3-carlosjr.jones@analog.com>
References: <20261026050241.100428-1-carlosjr.jones@analog.com>
 <20261026050241.100428-3-carlosjr.jones@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 08:48:03 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add support for additional members of the MAX20830 family:
> - MAX20810: 2.7V-16V input, up to 10A output
> - MAX20815: 2.7V-16V input, up to 15A output
> - LTM4739:  3V-15V input, up to 10A output
> - LTM4740:  3V-15V input, up to 15A output
>=20
> The LTM4739 and LTM4740 are the LTM-series equivalents of the MAX20810
> and MAX20815 respectively. All share the MAX20830 PMBus command set and
> telemetry, so no new register handling is required; they are accepted by
> matching their IC_DEVICE_ID.
>=20
> The LTM4739 and LTM4740 are uModules built around the MAX20810/MAX20815
> dies and therefore report the die's IC_DEVICE_ID by design: "MAX20810B"
> and "MAX20815B" respectively. Match on those identifiers rather than on
> the module part names.
>=20
> Matching is via the existing adi,max20830 fallback compatible; no new
> of_match entries are needed.
>=20
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026050241.1004=
28-1-carlosjr.jones@analog.com?part=3D2

