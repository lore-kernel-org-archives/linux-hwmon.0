Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572283;
	b=jSJhgWMK2/nVmIfARJmR+A7DhQJ4FsRdGFEoSDS2SxVuouLgxTsWmXiT42YgKZE4qtA+
	 anN2sngLaCVPrNN92sqQ4/QNC+wD9aeVKnFnQatCweRwe9KKgLON9BI7seVHpxVpGLVNJ
	 LiElPsqZXQFk2GWGXqxabaqOIljeyhhMDzlTdRlIIJj0/C6gDrjxH8+uB5HfRVSGCyGmg
	 605SdZNTdv5ZQZh8aERo2NZJgBBvI1B2xtSCXvIF+nqGkcbcVUL8MzarFr1/0N9obQo/r
	 8Sc8oMiXewfHmEjauTvmbmWdl5ni5EmOODsGZ86qsgi1dlasXaY4AJtoJbZvkB7kozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572283;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZgFhjp6JatCggkAYxg/vp+1mf90BydjF63/ncPFoYdU=;
	b=ptSQpS6F/cKiDduMyMXRvieYE7OqNyPagWg0AfqHR6HqXzXJQQuTnvloLryZOAFnlFgk
	 1xptKoKeuajkVNnezrqWRlKgpYZfbsN1krvA1/OkaOGPpZljcloS9wq+qlZsT8q1MhX7q
	 izETPsypImOl5GyBbVeqDDxTCVOMORNMVhz/lfLoHPgccrdIVtFl57qXvhKjx/ydUxebe
	 z/hNSgMcxwbctWM8RhpPm3hbX+GPRenBzulzb7zDY/NJbrW6QLPVIQl+pzrgaBZXRYrx8
	 DzVnTleFmeodoiXXuMYNA5JZgp8SDUdTnXXG24G1EKeQ9FCTUObKVEyE9RMYt6hX+QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBPJWFx5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98999606A326;
	Sun,  1 Nov 2026 22:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBPJWFx5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C701D1F000C1;
	Sun,  1 Nov 2026 22:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572282;
	bh=ZgFhjp6JatCggkAYxg/vp+1mf90BydjF63/ncPFoYdU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LBPJWFx54E6vyAJ1EllRVHLAJGHGTpOawmzgq36Z0nEM6IHNnfVtEhvj0KbTwXmER
	 viJ+aseKEX61UirKfB1yM+0Ay2mq68xBCruzpb9ardwBY6u957EDZlL9bazV1+p/3E
	 aLWbGtvNEa3Ce+uhw7h+HkBKKDGlVCNoQGb0xgpIpGy/PaDfD6Rs1AJEACNjfqvHd7
	 O4X/1jUn7P+uL/Va6uwDXVCIEfuIAcwGl0nsP6tSY39ay0Ckg5ZiFXT59AwhrqDEuu
	 47t1kNIYHlfEdOmAUMOfik/TE70xxpIcayy27meKPMCTYcm5Phhu+g7vrbeGp+aFg1
	 +jlh++KFyrkAw==
Message-ID: <sashiko-outbox-192713@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:31:21 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mfd: bcmbca_pmc3_pmb: debugfs stall, WARN_ON, and HW read in bcm=
bca_pmb_regmap_init()
- [Low] mfd: bcmbca_pmc3_pmb: mfd_cell match data and unused drvdata in bcm=
bca_pmb_probe()
--

commit cbd0d7381d66545c4a7f2cd3781134426406ab49
Author: Linus Walleij <linusw@kernel.org>

mfd: Add a shared BCMBCA PMC3 PMB transport

This commit adds an MFD driver for the Broadcom BCMBCA third generation Pow=
er
Management Controller (PMC3) Processor Monitor Bus (PMB) on BCM6846, exposi=
ng
a shared regmap to child devices while managing hardware keyhole semaphore
locking and recovery.

>     mfd: Add a shared BCMBCA PMC3 PMB transport
>
>     Add an MFD driver for shared access to the Processor Monitor Bus (PMB)
>     of the third generation Power Management Controller (PMC3), initially
>     for BCM6846.
>
>     Expose an uncached regmap to all children, encoding the bus, device a=
nd
>     word offset in each register address. Keep keyhole semaphore acquisit=
ion
>     and transaction recovery inside the MFD driver.
>
>     A software timeout does not abort a transaction. If the keyhole is st=
ill
>     busy, retain its hardware lock and reject new callers until delayed w=
ork
>     observes completion and releases it.
>
>     The keyhole register layout differs from older Broadcom PMB controlle=
rs.
>     Match only BCM6846 for now.
>
>     Signed-off-by: Linus Walleij <linusw@kernel.org>

> diff --git a/drivers/mfd/bcmbca_pmc3_pmb.c b/drivers/mfd/bcmbca_pmc3_pmb.c
> new file mode 100644
> index 0000000000000..837143409ce9c
> --- /dev/null
> +++ b/drivers/mfd/bcmbca_pmc3_pmb.c
[ ... ]
> +struct bcmbca_pmb_data {
> +	const struct mfd_cell *cells;
> +	unsigned int num_cells;
> +};
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
> +		.reg_read =3D bcmbca_pmb_reg_read,
> +		.reg_write =3D bcmbca_pmb_reg_write,
> +		.lock =3D bcmbca_pmb_regmap_lock,
> +		.unlock =3D bcmbca_pmb_regmap_unlock,
> +		.can_sleep =3D true,
> +		.lock_arg =3D pmb,
> +	};
> +
> +	return devm_regmap_init(pmb->dev, NULL, pmb, &config);
> +}

[Severity: Medium]
What happens when CONFIG_DEBUG_FS is enabled and a user reads the regmap
debugfs files (/sys/kernel/debug/regmap/<dev>/registers, range, or access)
with max_register set to BCMBCA_PMB_REG(3, 255, 65535) (0x03ffffff) and
bcmbca_pmb_precious_reg() returning true for all registers?

Because config.max_register is non-zero and readable_reg is unset,
regmap_debugfs_init() creates the registers, range, and access files.

When reading the registers or range file, regmap_debugfs_get_dump_start()
scans from 0 to 0x03ffffff (67,108,864 iterations) under map->cache_lock.
Because every register is marked precious, regmap_printable() returns false
for every address, leaving map->debugfs_off_cache empty and triggering a
WARN_ON on every read:

drivers/base/regmap/regmap-debugfs.c:regmap_debugfs_get_dump_start()
	WARN_ON(list_empty(&map->debugfs_off_cache));
	ret =3D base;

Furthermore, regmap_debugfs_get_dump_start() then returns base (0) to
regmap_read_debugfs(), which enters its loop at start_reg =3D 0 without che=
cking
regmap_printable(map, start_reg) and performs a hardware PMB read of regist=
er
0 (bus 0, device 0, offset 0) on the first iteration:

drivers/base/regmap/regmap-debugfs.c:regmap_read_debugfs()
	for (i =3D start_reg; i >=3D 0 && i <=3D to;
	     i =3D regmap_next_readable_reg(map, i)) {
		...
		ret =3D regmap_read(map, i, &val);

Similarly, reading the access debugfs file causes regmap_access_show() to
iterate over all 67,108,864 addresses and call seq_printf() for each one,
repeatedly doubling the seq_file buffer until kvzalloc() fails with -ENOMEM.

Should max_register be left unset in bcmbca_pmb_regmap_init() (removing the
need for bcmbca_pmb_precious_reg()) so regmap_debugfs_init() does not create
the registers, range, and access debugfs files for this sparse 26-bit addre=
ss
space?

[ ... ]
> +static int bcmbca_pmb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct bcmbca_pmb_data *data =3D device_get_match_data(dev);
[ ... ]
> +	platform_set_drvdata(pdev, pmb);
> +	pmb->regmap =3D bcmbca_pmb_regmap_init(pmb);
> +	if (IS_ERR(pmb->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pmb->regmap), "failed to register PM=
B regmap\n");
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->cells,
> +				   data->num_cells, NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register PMB functions\n");
> +
> +	return 0;
> +}
> +
> +static const struct mfd_cell bcm6846_pmb_cells[] =3D {
> +	{
> +		.name =3D "bcm6846-pmb-clock",
> +		.of_compatible =3D "brcm,bcm6846-pmb-clock",
> +	},
> +	{
> +		.name =3D "bcm6846-pmb-reset",
> +		.of_compatible =3D "brcm,bcm6846-pmb-reset",
> +	},
> +	{
> +		.name =3D "bcm6846-pmb-pvtmon",
> +		.of_compatible =3D "brcm,bcm6846-pmb-pvtmon",
> +	},
> +};
> +
> +static const struct bcmbca_pmb_data bcm6846_pmb_data =3D {
> +	.cells =3D bcm6846_pmb_cells,
> +	.num_cells =3D ARRAY_SIZE(bcm6846_pmb_cells),
> +};
> +
> +static const struct of_device_id bcmbca_pmb_match[] =3D {
> +	{ .compatible =3D "brcm,bcm6846-pmb", .data =3D &bcm6846_pmb_data },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but in MFD drivers, passing mfd_cell arrays through the
.data field of struct of_device_id is discouraged in favor of either passing
bcm6846_pmb_cells and ARRAY_SIZE(bcm6846_pmb_cells) directly to
devm_mfd_add_devices() while only one compatible is matched, or storing a
device ID enum in .data and selecting the static const mfd_cell array with a
switch in bcmbca_pmb_probe().

Also, are platform_set_drvdata(pdev, pmb) and struct bcmbca_pmb::regmap nee=
ded
in bcmbca_pmb_probe(), given that struct bcmbca_pmb is private to
drivers/mfd/bcmbca_pmc3_pmb.c and child drivers look up the regmap via
dev_get_regmap(dev->parent, NULL)?

Finally, could the commit subject include the driver prefix to match MFD
conventions (for example, "mfd: bcmbca-pmb: Add a shared BCMBCA PMC3 PMB
transport")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D3
