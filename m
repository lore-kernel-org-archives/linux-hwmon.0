Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954116;
	b=QjquRLRvPskdfKvnIi/Lnfv3Q8Hl5xANUnAGDidbzlUs+cP+ifimnUcKPsiV+yV3Uihx
	 AMUpCH5zsFPqloB6d0kJhVunBB1rf9JiWDMQVMLPVhQYdLm8dWxyXrsvA2IFp4b4P0RrY
	 LlJknuawedOGCYEpZ7OIBSRGnn2dPNmOsY2w31caV0AjurOvevX4bJC5J/5z6iczBGi3x
	 qtOUcYjDLb+IxB4RRlQ61/WVHjwOWXuHtgPhR6JzOrFhRiFpu3bbV5a3Km45u/Uy0uG0I
	 6TmQL8iwNUG5Fnzqqt1NhMOYNPQRbITSo0LVBNXbhGdqo0wkbVzynxvQihiA01HU7QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0G1v+kcDjQoKiCOm+Z2WMhKHWuAJPH31BHrEdjlnu8g=;
	b=3ZryLq4uXmdqm2KAMe7Qib/bAcxTbhEj1ynSfS/OUBYTH9dkaNvh8O3MVjYiQjFOTnrh
	 NDbO6X5/hzCaV3b5Q7lMlHpfCdwu6vjdJ9N6aZ3GyEnh5KCicZ0vjWpYnlAjw0JbU70KR
	 6tDuxpFmV0upFCQN/cdVz7nW8p2LQUMGYBclhO6hdYbuHSMNPh+ybQqI/wHkugf7WTISC
	 NNQyyo4HDfGzwlhST+J1tPaImo3YtYBMVrZh0vfLP1k1QiL4UWK6AlgDmMnsG6nEFps2K
	 lCzwpn+8IWBJI/58y6ZYdoQ658CysTcEjUWJxSfcogcBir6ydQobWM66GPMANE7BGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag1nyGoJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17520606A335;
	Fri,  6 Nov 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ag1nyGoJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3E61F008A4;
	Fri,  6 Nov 2026 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954115;
	bh=0G1v+kcDjQoKiCOm+Z2WMhKHWuAJPH31BHrEdjlnu8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ag1nyGoJ119Bm6Qn+G8zxG3NYO1zTnxCEUvt2G9YemNp+7Ymdppn3j9ROZc/4q65G
	 YwWe8bkW55cqx2ezolVipfFLJz4t2YF0bjyq4BoPd8Mq+p31BgNYD+XpbjaEdPHCOE
	 HBbDnGeoYp2gsf+lb4tHGjiAJyJfMrP2pP3erDURJj6YGvTu12TNMQaLyuDTX48WTv
	 xcR9fKULxLI06I0+svLpUHghpy9X3QMh6Sm66qwurGkfGhbruIslaaeJT/2JSiANF0
	 HL4DyLmhqzdaY7x6egSMg8/sh6jfOfsoAJHUSbbZVm7X09B2lHjeA8bpf8AeSbk8QR
	 c2yqpEJRra6UA==
Message-ID: <sashiko-outbox-201070@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] reset: Add BCMBCA block resets through the PMB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-5-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-5-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:35:14 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] reset: bcmbca-pmb: redundant reset callback in
  bcmbca_pmb_reset_group
--

commit cb99ec1412a9c3107e489e88034ee115dfafb214
Author: Linus Walleij <linusw@kernel.org>

reset: Add BCMBCA block resets through the PMB

This commit adds a reset controller driver for Broadcom BCMBCA blocks
controlled through the PMC3 Processor Monitor Bus regmap, implementing
the BCM6846 XRDP reset group and PVTMON acquisition reset.

> diff --git a/drivers/reset/reset-bcmbca-pmb.c b/drivers/reset/reset-bcmbc=
a-pmb.c
> new file mode 100644
> index 0000000000000..e8e079c9ccb56
> --- /dev/null
> +++ b/drivers/reset/reset-bcmbca-pmb.c
> @@ -0,0 +1,243 @@

[ ... ]

> +struct bcmbca_pmb_reset;
> +
> +struct bcmbca_pmb_reset_group {
> +	const char *name;
> +	int (*reset)(struct bcmbca_pmb_reset *rst,
> +		     const struct bcmbca_pmb_reset_group *group);
> +	const struct bcmbca_pmb_reset_block *blocks;
> +	unsigned int num_blocks;
> +	/* Minimum reset assertion hold time in microseconds. */
> +	unsigned int assert_hold_us;
> +};

[ ... ]

> +static const struct bcmbca_pmb_reset_group bcm6846_pmb_reset_groups[] =
=3D {
> +	[BCM6846_RESET_XRDP] =3D {
> +		.name =3D "XRDP",
> +		.reset =3D bcmbca_pmb_reset_sequence,
> +		.blocks =3D bcm6846_xrdp_resets,
> +		.num_blocks =3D ARRAY_SIZE(bcm6846_xrdp_resets),
> +		.assert_hold_us =3D 10,
> +	},
> +	[BCM6846_RESET_PVTMON] =3D {
> +		.name =3D "PVTMON",
> +		.reset =3D bcmbca_pmb_reset_sequence,
> +		.blocks =3D &bcm6846_pvtmon_reset,
> +		.num_blocks =3D 1,
> +		.assert_hold_us =3D 1000,
> +	},
> +};

[ ... ]

> +static int bcmbca_pmb_reset(struct reset_controller_dev *rcdev, unsigned=
 long id)
> +{
> +	struct bcmbca_pmb_reset *rst =3D container_of(rcdev, struct bcmbca_pmb_=
reset, rcdev);
> +	const struct bcmbca_pmb_reset_group *group;
> +
> +	if (id >=3D rst->variant->num_groups)
> +		return -EINVAL;
> +	group =3D &rst->variant->groups[id];
> +	if (!group->reset)
> +		return -EINVAL;
> +
> +	guard(mutex)(&rst->lock);
> +	return group->reset(rst, group);
> +}

[Severity: Low]
As reported by Philipp Zabel on RFC [1], is the reset callback pointer in
struct bcmbca_pmb_reset_group still needed now that XRDP zone power
transitions live in the PMB power domain driver?

Every entry in bcm6846_pmb_reset_groups[] sets .reset to
bcmbca_pmb_reset_sequence, so bcmbca_pmb_reset() could call
bcmbca_pmb_reset_sequence(rst, group) directly and drop the callback field
along with the forward declarations of struct bcmbca_pmb_reset and
bcmbca_pmb_reset_sequence().

[1] https://lore.kernel.org/r/90c5efa22600044657e67b9e1297bda2fb53f60c.came=
l@pengutronix.de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D5
