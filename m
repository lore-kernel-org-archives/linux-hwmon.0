Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66A3B14CE
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080942; cv=none; b=C2jZ7jRoJhr9lfs94drIWq/5yGf0okEmjKiwvhf4a1TnpF1oMQjSpxxiC8QnQGBqVxNKrmcHdVsWBpbeFa2fEY+hqJAXfdfF04fCEganTL7tjXgI+l/lVOExftliHlOLxKnotbG6Bj59jlbQP9qiWOTh3kW9OnxYKXLage8PYrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080942; c=relaxed/simple;
	bh=7p5+tk5ltG4ga4z93B/TOd8Fuix28Z9Y4xGafKIn6+4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ph57GdQLdTj7OyVMM1G41sfZMb4wUuY8MHkvE90KU4J3EdGEHjn3mOaJqIX3wj7xsQ4cRY89Up5cW7PgmWy+9nxgj53BxQeB30U67zjFDbYRntkOmw2fPFr7kZwhCjAaowgNi9IDjjGcc6OlbhCbDFz2c9yRIaMCrQYJaQgtq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB+4zxyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB+4zxyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658091F000C4;
	Thu, 15 Oct 2026 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080929;
	bh=7p5+tk5ltG4ga4z93B/TOd8Fuix28Z9Y4xGafKIn6+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RB+4zxyE8tGHhQvCL3WKvqZUcISmg6OME8UPMAJ14WNLCs1/X4MLPSkVTswrCOj3U
	 +WUJNaxdZ6JZworR3o5OOSTuGz6molNWwuxCC07Re7JK9JJeJjdOQ2EWs/EYerPNfg
	 /LRwyZMy6nIZ7wXnQzmBMhZHjfM2bnHZOpquLPI75AkQMqX8YVYojVr1PbtlDS7cws
	 Q507EfsbQ9e2VZzqJ1po+NMAzIdXjVqeBSVahHPeUkFSLJOibNqLPEFPNZ/vvb01bl
	 2g3wTo3XvSPBgW6UdzupfrpYjZpO4x61mKSl6XskAIgeLGwObvh7Fc8QwqB1Dztmwc
	 I/c8Mg6ZqCuIQ==
Message-ID: <sashiko-outbox-173155@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add MAXIMUS IX EXTREME
Reply-To: sashiko-reviews@lists.linux.dev
To: "Remy Demangeot" <remy@demangeot.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>
References: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:15:28 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Remy Demangeot <remy@demangeot.net>
>=20
> Add support for the ROG MAXIMUS IX EXTREME (Intel Z270). The board
> uses the same EC layout as the PRIME Z270-A for the chipset and
> T_Sensor temperatures, and additionally exposes the VRM temperature
> at the same register as the 300-series boards (bank 0, 0x3e), so add
> that sensor to the Intel 200-series family.
>=20
> The hardware access mutex is \_SB_.PCI0.LPCB.SIO1.MUT0, as on the
> PRIME Z270-A (verified in the board's DSDT).
>=20
> Readings were checked against HWiNFO 8.54 on the same machine
> (Chipset 47 C, T_Sensor 25 C, VRM 32 C).
>=20
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-b4-m9e-ext=
reme-v1-1-621da921e320@demangeot.net?part=3D1

