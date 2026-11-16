Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871835;
	b=aQLZLIO+vYaKchDqOvLXmzMejOR6LyYutMEhRMpHoUbgN4WtWZXsabu70Rb+yKCSsLhk
	 6tChFOheHii/z/wBsjQJrOd9DV+w/m2Lrp9CR4fCSNlPbSssyVn9f42HcklOuhDLStN0A
	 RxViJWHajjtUU5Mb732OtPPATlj8GtqJs8mgfb93suVv2Pqwbb54elhHXUJQOYr1OmlEY
	 aWH5dloJd6q69BZIlS9V0ri2eBH3OU+7JKQnWiIVrSlc5CMRKi+RT9Fwx6RxzkoV1Id8T
	 s/bcq6FckldkjcqSzTg9m6jNz7+4Nmhrv8b80nWm7YzfZ//9icZjh9+iilTtlnvLaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871835;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PNyyNTUO6IF/IGDxW9Fo6kL64+tbw9kWzwaytmvtnHA=;
	b=gikzArFSnZD+KdquGDgVt4dSktzbKcy++S9hhDi2gjuFRTFEfdg1xpPe7JvKBvVTHD9m
	 HTcSRKCE2loAbwU91K4YlkJmkPHexv4JmxIzPnRKfguU+bXxMZaVHcub6nn8F1/82W2z7
	 TKpkbdrUmpNScp5rVDHSRZSS7/w7aH7uyb/jLT3vhOIcvVYnG1pERlYKEh3jUb21coBqj
	 X9w+45zm7l+9FQvIjTkcSpcVkyCaHlaPcqV6h1gG6scXSkfPfVMH/AOmlTHnQLJComemK
	 C9G6jw6qTtDPes/X5fTxQNh32S2vHMRDJq3oeSCivSNuNvYZH5B6Jx5TjUnzK/l1VZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQTPBTee;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB4E606A31C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 23:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQTPBTee
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09001F000C4;
	Mon, 16 Nov 2026 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871835;
	bh=PNyyNTUO6IF/IGDxW9Fo6kL64+tbw9kWzwaytmvtnHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQTPBTeedD4mQOVsZPF0gh4N0BqrD0W9odb9KJoQHw/i6fD2b1GEm9JvmQHJTfQmg
	 cYgGiKx3wmt8lrBZO8NarDGgteLVEzWfpgsCn1/IUk/F+UiqOn1vnCNacFdtqbr0ES
	 70YL/p0tBo02tsuNrLbA12UOvcVIdsieIX/Cl47Ipe5tPGXMBPAO1ljOyWooZxSCMX
	 DYMfWb/c5k+RAuqqKnmHkSbW9Q8cgsqxmHyYzJhx1O0KSW69lzGEHvFDlXeCj7uj2q
	 cf+zLYe++lipo6XqX9y6GkWYSy5ySLfg+rBW0SNcEtTvBdtc+sS17nj0VxgYhg4hJd
	 6DYya8upTZMPg==
Message-ID: <sashiko-outbox-217883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Make pwmN_auto_channels_temp of
 NCT6687D-R writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116232612.501586-1-tomasz@bojanowski.me>
References: <20261116232612.501586-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:30:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Allow selecting the temperature used by a fan curve on MSI boards with
> an NCT6687D-R (customer ID 0x20d), in manual and in automatic mode.
>=20
> On an MSI MAG B850M MORTAR WIFI, the BIOS setup offers four temperature
> sources for the fans: CPU Core, System, MOS and Chipset A. Reading the EC
> before and after selecting them shows that each sets a single bit in the
> lowest byte of the fan's source register, the bit of the monitoring
> channel of temp1, temp2, temp3 and temp4 respectively, and that nothing
> else in the fan curve registers changes. The other bytes were never seen
> in use, and how the EC would combine several bits is not known, so only
> a single temperature reported by the driver on the first eight monitoring
> channels can be selected; other values return -EINVAL. The range can be
> extended if a board needs it.
>=20
> The attribute is writable if, when the driver is loaded, the curve uses
> [ ... ]
> manual mode was still restored. With the driver unloaded during suspend,
> the BIOS restored its own curve but the EC kept the selected source, so
> restoring the source on resume could not be tested on this board.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116232612.5015=
86-1-tomasz@bojanowski.me?part=3D1

