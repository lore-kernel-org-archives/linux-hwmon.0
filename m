Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954352;
	b=rf2eaBz0EN7fcmWQ0z7+RHPvgg0Uh849ccyzVudHEK3KUAY9CvUymd5Vs25tfDCCQ0d2
	 njYWomm2cnCn9Hcx5rAhxN56OcZbDTa2kcQ4vNgqq2OA/kaki0tZxDWwfj4Zs4anlsjZ/
	 7BI5O0HA8MpKG0R47SzQ/HP/fhdS4CfFlkIHv3UoMZP4NGo+fvErJ84r8ccZmy4ud8SU2
	 kB8po9Gg0D5pkCz+BrydoGF2sLHkk8b74sPznrAICYPedOmzWi1MRUvldtB2/nPixshAz
	 T1kmizwLEjLnZS4zcMWduy11LsJb3mrAPG6hG/6G6WPq5eTkGf07OmM4iJ5670hgtWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954352;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d1+OkghnGiRcx8h2ATHYPlUGg6cThrk9pXEfDHGzYa4=;
	b=Sxte0GJYpv77awpZnDZD2aesa6thGHINXUMVV5ZBZeTQDj41psiR3DFGIqBo9nD30Qpm
	 E/nUfkflFhGyGpFp5ZAVw3E9LhVaVarwL0KtEPmP4qyqj+k2Ktdg32BzxiCGD2LQXKX74
	 YY6LbtWNg6cO0awwfKtzq2lzkAH0AuZ6aU4vqh3vXNOYKX3iA583IHuh48mShwASDwUK/
	 6wyCRnjhjlrBVkjpuRSZEaGO1HEyz53Ip2AJYeM6OvwcqKE8a12sowd+rsLq6JJ7ggFxJ
	 w7pNq3UKrTDGxa22R5qONXk/RhnwXFVWzPA1pXTBVd2kp1uDp0U8vaaCGHgwM9Rlyow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VykRMMpy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A750606A326;
	Fri,  6 Nov 2026 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VykRMMpy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A981F0089F;
	Fri,  6 Nov 2026 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954352;
	bh=d1+OkghnGiRcx8h2ATHYPlUGg6cThrk9pXEfDHGzYa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VykRMMpy2J/zka5F5sMSZq2iuvkJo4QydSnoD5/qKwbvZHHCNsmhgRlrVDc/MM1xO
	 5/qpdJnnMYLFXhACnMKBSEXrRK/K4yQk5kr636KvFmt7S+NRtu06k3i6gaNDguBJ4+
	 oBK8W5/exaAq+xEVSADHveSy4KDcZxi6IZlgRJRGNtb796Zwl495tH/N614Ak17kik
	 B75/NSTPY2osg8fL1e8fnfJ5uWMYmZiiV3GSbkG2HDql/40mKce3xTm8kXRA2ZTlR4
	 c1XaUcw5BQYWQ2tB5iF5IuJV6UnL1o9ra7zOq9bAl+erTuRMR5+r/MX4OoKnT2KIcQ
	 9iYR2I9ctE4/Q==
Message-ID: <sashiko-outbox-201080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB
 transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-3-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-3-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:39:11 +0000
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
- [Medium] mfd: bcmbca_pmc3_pmb: debugfs stall, WARN_ON, and HW read in
  regmap init
--

commit df29cb4d33202540fcf38b25c63a3a8cd862dcfb
Author: Linus Walleij <linusw@kernel.org>

mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB transport

This commit adds an MFD driver for the Broadcom BCMBCA PMC3 Processor
Monitor Bus (PMB) that exposes a shared uncached regmap to child devices.

> diff --git a/drivers/mfd/bcmbca_pmc3_pmb.c b/drivers/mfd/bcmbca_pmc3_pmb.c
> new file mode 100644
> index 0000000000000..8ebcbc26a502d
> --- /dev/null
> +++ b/drivers/mfd/bcmbca_pmc3_pmb.c

[ ... ]

> +static bool bcmbca_pmb_precious_reg(struct device *dev, unsigned int reg)
> +{
> +	/* Do not let debugfs probe unimplemented or firmware-owned registers. =
*/
> +	return true;
> +}
> +
> +static struct regmap *bcmbca_pmb_regmap_init(struct bcmbca_pmb *pmb)
> +{
> +	const struct regmap_config config =3D {
> +		.reg_bits =3D 32,
> +		.val_bits =3D 32,
> +		.reg_stride =3D 1,
> +		.max_register =3D BCMBCA_PMB_REG(3, 255, 65535),
> +		.cache_type =3D REGCACHE_NONE,
> +		.precious_reg =3D bcmbca_pmb_precious_reg,

[Severity: Medium]
Does marking every register precious in bcmbca_pmb_precious_reg() while
setting max_register to BCMBCA_PMB_REG(3, 255, 65535) (0x03ffffff) with
reg_stride =3D 1 cause a 67M-iteration stall, a WARN_ON(), and an unintended
hardware read when the regmap debugfs files are read?

When the debugfs "registers" or "range" file is read,
regmap_debugfs_get_dump_start() scans all 67,108,864 addresses from 0 to
map->max_register under map->cache_lock.  Because regmap_printable() is
false for every address, map->debugfs_off_cache stays empty,
WARN_ON(list_empty(&map->debugfs_off_cache)) fires on every read, and
regmap_debugfs_get_dump_start() returns base (0).  regmap_read_debugfs()
then starts its loop at start_reg (0) without checking regmap_printable()
on the first iteration and calls regmap_read(map, 0, &val), issuing a
hardware PMB read to BCMBCA_PMB_REG(0, 0, 0).

In addition, because neither readable_reg nor writeable_reg is set, reading
the debugfs "access" file causes regmap_access_show() to format all
67,108,864 addresses into a single_open() seq_file buffer until a >1 GiB
allocation fails with -ENOMEM.

Omitting max_register and precious_reg from config (leaving max_register
at 0 without max_register_is_0) avoids creating the debugfs "registers",
"range", and "access" files while bcmbca_pmb_op() continues to validate
the bus and offset bounds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D3
