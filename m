Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793705287;
	b=b+/RsnOitqYePGymx6rc85+3fw5YnEkxPwHMsC4A8TsWWar2rjW6fEWmepvxFRA978NB
	 RJJqKe9xKPQD6vNXFi19aJqE+ukRJb1S3GOLqwKBYT3HpwFydW06tAKixUmrrGaJtEjfj
	 h50Gh7d7gLwnOO7y62LwEsOE1OWY1IEvViSCqkNxYEr7avvVsgBFe0ykrzKHjm7IslK/w
	 87EHbxXOhKaVq8MQyhpdzvWBUp0CX/Ni8HOyLYnabtCn4BFV1tmQY/rNgR04NoEbZZPPy
	 7VWn9/PVdUvRVITNecFQWDIECwmIBmz0w9P0Z/R6cK8hvd1yLSEQjOgppR4d3/rmHSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705287;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=jAHMstR0tHPZUqjtg+eClm/7Ws23/FN7WMsd8yxYEA4=;
	b=GXF9pZUF1xpC127tgFw9P/zv545Gbl5Hfs44/YoCO+wUnoLfqLtccoVcImNwNI/4l5/o
	 iTz8OvBz9qkWuZ1GwgEuMeSfw2Gnq9UmIjZjUjN9/kzreeX+jGqHDryTgRR1gvsNdAhcH
	 Tn7wVAHRGm0AalZIsp3uJ4VaS0DYwx/l5rZOfqFIbnjDyXxSNyCLz+3dWoz2Az5S1HiGS
	 8H8fHJbmLG6d5iZxNlglQAkI/87xxllX8WCMQZpxiCd95jaRMQX1vkfSXdsN+zTAJfTKr
	 nkbmnlqhmJq8WhO2Iiba8b0XtkGvcgolDXzyby/1laOk3bc/JiFltDIIFtKJopB8CzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f0RBJ50l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420B606EE8B;
	Tue,  3 Nov 2026 11:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E420B606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f0RBJ50l
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3485D202833;
	Tue, 03 Nov 2026 12:28:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793705284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAHMstR0tHPZUqjtg+eClm/7Ws23/FN7WMsd8yxYEA4=;
	b=f0RBJ50l+Y92to4q+l/Wp8U1hp2vdKq7qJXpVWneTGkAxoWM0bzhJ12X7ezKmf2rkUgFAS
	nNjKPdCo/5/yU75BMc9kFxx/6lWwuRMcBWhsnvQBbXa+7TMYpR58bR56h4UDHeX/r0ChzL
	z9odDSL1pnM18gK7XDWJwQbkgsED4BtuFF8pKZYnNvfY82Bdd1w5SAGiVul4R4YQmYHHOi
	p+1J88RiuBq27yVHk+m1rwEdE9PASl52Y8aYZtWMxnOuwcdm0qH5voI11+eyPQF9ApC8An
	YtqeAoB5Gi1/Pxl06HgYXiJdRFMB3GSg1daWHUyhVXLCXAGGkc3MQVldp0uu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793705284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAHMstR0tHPZUqjtg+eClm/7Ws23/FN7WMsd8yxYEA4=;
	b=LT8z8RaYwFk+KE+wPVsMzV3MrNcD3+QAEaLLkf1iUINNh3UOZe4xvcIOMWRUa7uJ2Qn6RA
	HKwol4eTnsL7Kx89TchSU0l2aKfWfgfosHCuTowBfVl9pn7ZSjB8BLBmDYNDMbLQPKEbCh
	RaRwAG6Vak+oJ9+DTV309xseY3lBTF/TZvMMN2rIo/5UwrpyFZdtKhETdVz5J1+5wdB/N2
	8FtZY5cfoEX4h6+5fmY3QhdE5jbJlE9jnoZDWYXcXAVWj+gF/40ws+oPyF95atWiEpZaXR
	JSL4xU2tZxAW2I+1Kp40UBKAhpEOYLp6Vu2aIebVv71BNM+oScwJrRIQVKTIag==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793705284; a=rsa-sha256;
	cv=none;
	b=SHa28VfmxAbFkRDwoM20WdRbQG5BTxFtFUTPCp3GMJUdxITYofK1FrdzcOH8k+MwO4UPg5
	vtvIIHuPkU36Wzdy4aL7C4rqvBhbRQDsHGyHswX+mftW0q0Dwrma/A+bUBTtgo98/pExJn
	NZu271ySI8JoL+ZCLItwt520mCeXfB6vdSRWxXgE2JhS1v9nI483qjQlCczmVa68P27cD6
	rf/WpxhmWmw5KN/vTW/ho/nXcO8YnjFdabrOtyc7f72rG34m5wM8niyGE1O7+1O/K3Bv6b
	puYyCtkKX15CaCaTquEBgBhy+C5eca1JeHMLdMzgKZvENiVN0+SSeRt399lFrQ==
Message-ID: <340843f896db387a7c3ff4d6a06ef7c2155d1f98.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/7] reset: Add BCMBCA block resets through the PMB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore	 <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Guenter Roeck	 <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Randy Dunlap	 <rdunlap@infradead.org>, Benjamin
 Larsson <benjamin.larsson@genexis.eu>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Date: Tue, 03 Nov 2026 12:28:04 +0100
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org>
References: 
	<20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
	 <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On So, 2026-11-01 at 23:14 +0100, Linus Walleij wrote:
> Support BCM6846 XRDP and PVTMON resets through the Processor Monitor
> Bus (PMB) of the third generation Power Management Controller (PMC3).
>=20
> The sequence is hardware-tested in the XG6846B OpenWrt port.
>=20
> Power-cycle resets for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL were
> considered but left out. These belong in power-domain and platform
> power-management abstractions, which can coordinate affected users.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/reset/Kconfig            |  13 ++
>  drivers/reset/Makefile           |   1 +
>  drivers/reset/reset-bcmbca-pmb.c | 309 +++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 324 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 18e32cc036b5..29ec1c9d617e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5452,6 +5452,7 @@ F:	Documentation/devicetree/bindings/mfd/brcm,bcm68=
46-pmc.yaml
>  F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
>  F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
>  F:	drivers/mfd/bcmbca_pmc3_pmb.c
> +F:	drivers/reset/reset-bcmbca-pmb.c
>  F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
>  F:	include/dt-bindings/reset/brcm,bcm6846-pmb.h
>  F:	include/linux/mfd/bcmbca-pmb.h
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index eda9c698a95f..56f7aee6cf1f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -49,6 +49,19 @@ config RESET_BCM6345
>  	help
>  	  This enables the reset controller driver for BCM6345 SoCs.
> =20
> +config RESET_BCMBCA_PMB
> +	tristate "Broadcom BCMBCA PMB reset controller"
> +	depends on ARCH_BCMBCA || COMPILE_TEST
> +	depends on OF && HAS_IOMEM
> +	depends on MFD_BCMBCA_PMB
> +	select REGMAP
> +	default MFD_BCMBCA_PMB
> +	help
> +	  Reset BCMBCA blocks through the Processor Monitor Bus (PMB) of
> +	  the third generation Power Management Controller (PMC3).
> +
> +	  The module will be called reset-bcmbca-pmb.
> +
>  config RESET_BERLIN
>  	tristate "Berlin Reset Driver"
>  	depends on ARCH_BERLIN || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 489fafd6bbe3..26c8a73f774f 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_ASPEED) +=3D reset-aspeed.o
>  obj-$(CONFIG_RESET_ATH79) +=3D reset-ath79.o
>  obj-$(CONFIG_RESET_AXS10X) +=3D reset-axs10x.o
>  obj-$(CONFIG_RESET_BCM6345) +=3D reset-bcm6345.o
> +obj-$(CONFIG_RESET_BCMBCA_PMB) +=3D reset-bcmbca-pmb.o
>  obj-$(CONFIG_RESET_BERLIN) +=3D reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) +=3D reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) +=3D reset-brcmstb-rescal.o
> diff --git a/drivers/reset/reset-bcmbca-pmb.c b/drivers/reset/reset-bcmbc=
a-pmb.c
> new file mode 100644
> index 000000000000..532398032fa8
> --- /dev/null
> +++ b/drivers/reset/reset-bcmbca-pmb.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * BCMBCA block resets through the Processor Monitor Bus (PMB) of the
> + * third generation Power Management Controller (PMC3).
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/bcmbca-pmb.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/brcm,bcm6846-pmb.h>
> +
> +/* BCM6846 BPCM zone control, in PMB words (6846/BPCM.h). */

What does this reference?

> +#define BCM6846_ZONE_CONTROL(zone)	(32 + (zone) * 8)
> +#define BCM6846_ZONE_DPG_EN		BIT(8)
> +#define BCM6846_ZONE_POWER_DOWN		BIT(9)
> +#define BCM6846_ZONE_POWER_UP		BIT(10)
> +#define BCM6846_ZONE_MEM_POWER		BIT(11)
> +#define BCM6846_ZONE_RESET		BIT(12)
> +#define BCM6846_ZONE_POWER_ON		BIT(26)
> +
> +struct bcmbca_pmb_reset_block {
> +	u8 bus;
> +	u8 device;
> +	u16 offset; /* PMB word offset of the reset register. */
> +	u32 mask;
> +	u32 assert_value;
> +	u32 deassert_value;
> +};
> +
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
> +
> +struct bcmbca_pmb_reset_variant {
> +	const struct bcmbca_pmb_reset_group *groups;
> +	unsigned int num_groups;
> +};
> +
> +struct bcmbca_pmb_reset {
> +	struct reset_controller_dev rcdev;
> +	const struct bcmbca_pmb_reset_variant *variant;
> +	struct regmap *regmap;
> +	/* Serialize complete reset pulses and failure cleanup. */
> +	struct mutex lock;
> +};
> +
> +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group);
> +
> +static int bcm6846_xrdp_reset(struct bcmbca_pmb_reset *rst,
> +			      const struct bcmbca_pmb_reset_group *group);
> +
> +static const struct bcmbca_pmb_reset_block bcm6846_xrdp_resets[] =3D {
> +	{
> +		.bus =3D 1,
> +		.device =3D 12,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		/* Keep bits 0=E2=80=932 deasserted, matching the vendor sequence. */
> +		.assert_value =3D GENMASK(2, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +	{
> +		.bus =3D 1,
> +		.device =3D 14,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +	{
> +		.bus =3D 1,
> +		.device =3D 15,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +	{
> +		.bus =3D 1,
> +		.device =3D 16,
> +		.offset =3D 5,
> +		.mask =3D GENMASK(27, 0),
> +		.deassert_value =3D GENMASK(27, 0),
> +	},
> +};
> +
> +/* Analog acquisition reset, independent of clock and power configuratio=
n. */
> +static const struct bcmbca_pmb_reset_block bcm6846_pvtmon_reset =3D {
> +	.bus =3D 1,
> +	.device =3D 6,
> +	.offset =3D 17,
> +	.mask =3D BIT(0),
> +	.deassert_value =3D BIT(0),
> +};
> +
> +static const struct bcmbca_pmb_reset_group bcm6846_pmb_reset_groups[] =
=3D {
> +	[BCM6846_RESET_XRDP] =3D {
> +		.name =3D "XRDP",
> +		.reset =3D bcm6846_xrdp_reset,
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
> +
> +static const struct bcmbca_pmb_reset_variant bcm6846_pmb_variant =3D {
> +	.groups =3D bcm6846_pmb_reset_groups,
> +	.num_groups =3D ARRAY_SIZE(bcm6846_pmb_reset_groups),
> +};
> +
> +/* Best effort: never restart a partially reset group. */
> +static void bcmbca_pmb_reset_cleanup(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group)
> +{
> +	const struct bcmbca_pmb_reset_block *block;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < group->num_blocks; i++) {
> +		block =3D &group->blocks[i];
> +		ret =3D regmap_update_bits(rst->regmap,
> +					 BCMBCA_PMB_REG(block->bus, block->device, block->offset),
> +					 block->mask, block->assert_value);
> +		if (ret)
> +			dev_err(rst->rcdev.dev,
> +				"failed to hold PMB bus %u device %u in reset: %d\n",
> +				block->bus, block->device, ret);
> +	}
> +}
> +
> +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> +				     const struct bcmbca_pmb_reset_group *group)
> +{
> +	const struct bcmbca_pmb_reset_block *block;
> +	enum {
> +		PASS_ASSERT,
> +		PASS_DEASSERT,
> +	} pass;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!group->num_blocks)
> +		return -EINVAL;
> +
> +	/* Assert every block before releasing any of them. */
> +	for (pass =3D PASS_ASSERT; pass <=3D PASS_DEASSERT; pass++) {
> +		for (i =3D 0; i < group->num_blocks; i++) {
> +			block =3D &group->blocks[i];
> +			ret =3D regmap_update_bits(rst->regmap,
> +						 BCMBCA_PMB_REG(block->bus, block->device,
> +								block->offset), block->mask,
> +						 pass =3D=3D PASS_DEASSERT ? block->deassert_value :
> +						 block->assert_value);
> +			if (ret)
> +				goto cleanup;
> +		}
> +		if (pass =3D=3D PASS_ASSERT && group->assert_hold_us)
> +			usleep_range(group->assert_hold_us, group->assert_hold_us * 2);
> +	}
> +cleanup:
> +	if (ret) {
> +		dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u device %u: %d\n",
> +			group->name, pass =3D=3D PASS_DEASSERT ? "deassert" : "assert",

This could use str_assert_deassert() from <linux/string_choices.h>.

> +			block->bus, block->device, ret);
> +		bcmbca_pmb_reset_cleanup(rst, group);
> +	}
> +	return ret;
> +}
> +
> +/* The boot loader may power down the Runners before entering Linux. */
> +static int bcm6846_power_on_zone(struct bcmbca_pmb_reset *rst, u8 device=
, u8 zone)
> +{
> +	unsigned int reg =3D BCMBCA_PMB_REG(1, device, BCM6846_ZONE_CONTROL(zon=
e));
> +	u32 value, mask;
> +	int ret;
> +
> +	ret =3D regmap_read(rst->regmap, reg, &value);
> +	if (ret)
> +		return ret;
> +	if ((value & BCM6846_ZONE_POWER_ON) && !(value & BCM6846_ZONE_POWER_DOW=
N))
> +		return 0;
> +
> +	/* Match PowerOnZone() in the BCM6846 vendor PMC driver. */
> +	mask =3D BCM6846_ZONE_POWER_DOWN | BCM6846_ZONE_DPG_EN |
> +	       BCM6846_ZONE_POWER_UP | BCM6846_ZONE_MEM_POWER | BCM6846_ZONE_RE=
SET;
> +	ret =3D regmap_write_bits(rst->regmap, reg, mask, mask & ~BCM6846_ZONE_=
POWER_DOWN);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_read_poll_timeout(rst->regmap, reg, value,
> +					value & BCM6846_ZONE_POWER_ON, 10, 10000);
> +}
> +
> +static int bcm6846_xrdp_reset(struct bcmbca_pmb_reset *rst,
> +			      const struct bcmbca_pmb_reset_group *group)
> +{
> +	/* BCM6846 pmc_addr.h: XRDP, three Runners, then WAN (no WAN reset). */

What does this reference?

> +	static const struct {
> +		u8 device;
> +		u8 zones;
> +	} power[] =3D {
> +		{ 12, 3 }, { 14, 1 }, { 15, 1 }, { 16, 1 }, { 11, 3 },
> +	};
> +	unsigned int i, zone;
> +	int ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(power); i++) {
> +		for (zone =3D 0; zone < power[i].zones; zone++) {
> +			ret =3D bcm6846_power_on_zone(rst, power[i].device, zone);
> +			if (ret) {
> +				dev_err(rst->rcdev.dev,
> +					"XRDP power-up failed at PMB bus 1 device %u zone %u: %d\n",
> +					power[i].device, zone, ret);
> +				bcmbca_pmb_reset_cleanup(rst, group);
> +				return ret;
> +			}
> +		}
> +	}

This doesn't look like it belongs in the reset controller driver.
Are these power domains?

> +	return bcmbca_pmb_reset_sequence(rst, group);
> +}
> +
> +static int bcmbca_pmb_reset(struct reset_controller_dev *rcdev, unsigned=
 long id)
> +{
> +	struct bcmbca_pmb_reset *rst =3D container_of(rcdev, struct bcmbca_pmb_=
reset, rcdev);
> +	const struct bcmbca_pmb_reset_group *group;
> +	int ret;
> +
> +	if (id >=3D rst->variant->num_groups)
> +		return -EINVAL;
> +	group =3D &rst->variant->groups[id];
> +	if (!group->reset)
> +		return -EINVAL;
> +
> +	mutex_lock(&rst->lock);
> +	ret =3D group->reset(rst, group);
> +	mutex_unlock(&rst->lock);
> +	return ret;

	guard(mutex)(&rst->lock);
	return group->reset(rst, group);


regards
Philipp
