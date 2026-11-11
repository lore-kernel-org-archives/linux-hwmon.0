Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395499;
	b=OKVTrgQunHSJlo8yF6VBfI5RiP7oOvUv9ld98jYpwEuc0JMW6+4dvWdbO7R2/K7ts9dS
	 1Pgf/7UfuRlpiJjz6NHaLIYAWE/bB7cClFF1cXVlRJWNFglNL8FX6TIoFVEFwhJmUBBLO
	 uX/FWr9kyHnLrnpDkpRlFWzouSw28sN6IHnC1Z+Dz/EpRfIcvmmdQqIJw8TW2EAGq9Wcp
	 qSD6MK4Q1M2nf4nQ5wmxp7cGsfAetvKYiQZXJ6p1jDjDLIUjoV4Hwe1Fh1I7mDHTou/KF
	 bM1/qHixLFDVpq8HII3Ympo9/Ggq3zYO582PjewyvIg/QrdF75N9GzuwdVGOzyqKZ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395499;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VWlIFnl/R7N4MuBCwI627lUj+HA5ZNpPpu+Lx6I35RE=;
	b=EovOM/a/79yWAknIriZ2sDHXg6IjibE0N4lOl6PWPFfhVjmHmCeP70CMkBq+dkWG2IVb
	 nuFRABUye7lMcWjR8ja6V6nqbKCo0TrmluJyWuXIIvlUku9MPNL5yrVoS8wh2GKWbV1zk
	 cKf46WU4/u3c6MmhTWD8uiGHMqW78z5DDRPvsFpnLkgod2ufNnEJ9yelGZylMx1G0ePRV
	 60higC7oK7bBajQ5BD25qqy1/s9d+ZlKPdbzgg66wHpfTm6ybPIqvHR1wpxxv9WvhvNIi
	 qwL3wZi9xKXtmyVhbQKRB/OlL87eLcdy9kUsgqKvhqPvYfXNNqrB2i+FVbM8uSB83Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IV6St29e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F45606A882;
	Wed, 11 Nov 2026 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IV6St29e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D111F00A0B;
	Wed, 11 Nov 2026 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395498;
	bh=VWlIFnl/R7N4MuBCwI627lUj+HA5ZNpPpu+Lx6I35RE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IV6St29eWg2cWn/+M6K96XAu8kkMVS+pYfnN0lqCWYkLonF1jfxBNPHl1Tf3cZjqm
	 1O96z/N9tuf0se9fbpoyBBSIJhESzFcTFyjW4jnq9wGGE4qB1vsU7Oubem54icQjIp
	 /4I0uUDmc9RjoBkda/RdC5361zg8jRy3f8PAK2vZmK5mWCBF81hGNZl4SGn5zyowJP
	 v8nEpFLodfwQvMaYyumi1ul0kef3Fst5K66Dsb3HpKmtAuXzkfhc1owXHSTKsl7WSW
	 6/Bn97n1CAm48jz7rmKTmJy1X8ToyZOCg5oUVnDnHBkpryl2DQSI7yOhOUrvzT2fkK
	 ELWBbmH5OBnUQ==
Message-ID: <sashiko-outbox-208857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] clk: bcm: Add BCMBCA PMB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-6-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-6-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:11:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a BCM6846 clock provider for the Power Management Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
>=20
> PVTMON and zone clocks provide gate control only.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D6

