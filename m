Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830874;
	b=lBSpRDk2pteI+AB6iOWtk+rAjxtjCC4Lci9qFUWTvyKtS81eopjS9liuXA4auMUCLEL2
	 2a0C3KOntAcOHjHhmzvI5GjAQKfVcEfI6rPnIkvivcvIztGXmdQ/e1MpPdXUAe7V55/rS
	 HTwXaipL+RWQfA9z5exni8Hcne8+tp0wfXA5Z06wUfjmbCGaiqru8lh3QpmpH/XEIj8UI
	 wki0/wrNKejsGJxVbP2tBkMWHsgeWNiS5YpEOuVPPBDIYDoY1oh/p1rs0+L/k2jZGisAn
	 iR5Qv0ta5gu0VRpBIbFfd86IXcaKgrSJJ7pVWWpAtnlb83YgH7vPDzDOguEsJdx6gdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830874;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kBPs/8VZaDFiONEwTy2/iCO+gypqBr884gNjfD1TiHI=;
	b=pgerQBycWHuZTcYzQF++9G9B4vaCw3EFVWrWN7eg0CqXCXswn8M7TX+Vsg+lDEcywsvy
	 Kc9uWX6uftKRBM4avDfc9cbREyUwSXKNbYIDR9CoRk1UqEKJ/muVGNgYRbalRU7NAngv9
	 rX9ppvDKTiDV8oqrxMb7ncV7xh5HnTwejFo29KbBuTPgIkJ313bueldKHtV430UsiK+OH
	 qyBBmsBmFjk54ALh8bthOph8zIjZccT/QULnZY0LaqRWsHXBKhc9KQd8nNVp1SbiSFilO
	 Y9c5WZlPU+2z2tpbpRvOSq6L087m8T+/SdJjMn1q8BfvdGzYUzgtzHSKICxOkE/Lbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cL6yizzi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED8606A33A;
	Wed,  4 Nov 2026 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cL6yizzi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B0E1F00A1A;
	Wed,  4 Nov 2026 22:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793830874;
	bh=kBPs/8VZaDFiONEwTy2/iCO+gypqBr884gNjfD1TiHI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cL6yizzi/aywNIPUZL3qfchbHzqr6qOA9H1Vxg8kkbyOD19oci73ZfQMPpoQ2mD9p
	 QO0PvXsOek4wUrjqCLAz6vHVZb7Pq1WJt2MC1K3n5IpmK2s4j1aDWzzaHOnZCn/QLN
	 tdBoszcZDiAfo4+7YXU4zZ6R6Q5nXU8421jg3pgih0ptAKhBLeShW87h/1xlmoJJBn
	 9pfeQLZjZD5cwTvCja3YoqWsyT4E1oQXwQvnYoqWyuKAnVX8kAp6MAyOmvF0SHQdLS
	 O1LQA9AKbKq9CuW/o6aaKci1HYaUxdWPOjgH0KPrCSbwCPea74440DY784ZT0OKb0C
	 7QiHU03oXJ7Jg==
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/7] clk: bcm: Add BCMBCA PMB clocks
From: Brian Masney <masneyb@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-5-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-5-455fe9eed5ee@kernel.org>
Date: Wed, 04 Nov 2026 17:21:06 -0500
Message-Id: <179383086680.620422.9240673673295480953.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=17131; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=+u+qjLYttGlTB1hON2gW8MWmkDK866nWqd/K+VG6gUM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJer7+yIlZx/r7vdx2kb3DNiUvzk8zZ1JKTt9Silu+5i
 cXyiY4dHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwk9yvDf3eZd8Xyry+0Fijf
 SQpKunhJTX4Lv/PfI/0hp2bsOmPhWcvwz+KrDf/96d91rqlmFh+26H70OpjdY7fEymmPfkzesmS
 nLTMA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Linus,

> Add a BCM6846 clock provider for the Processor Monitor Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
> 
> PVTMON and zone clocks provide gate control only.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/clk/bcm/Kconfig          |  11 ++
>  drivers/clk/bcm/Makefile         |   1 +
>  drivers/clk/bcm/clk-bcmbca-pmb.c | 389 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 402 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29ec1c9d617e..74f0783d512f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5451,6 +5451,7 @@ F:	Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
>  F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
>  F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
>  F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> +F:	drivers/clk/bcm/clk-bcmbca-pmb.c
>  F:	drivers/mfd/bcmbca_pmc3_pmb.c
>  F:	drivers/reset/reset-bcmbca-pmb.c
>  F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index a972d763eb77..db17eadde7aa 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,5 +1,16 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +config CLK_BCMBCA_PMB
> +	tristate "Broadcom BCMBCA PMB clocks"
> +	depends on MFD_BCMBCA_PMB
> +	select REGMAP
> +	default MFD_BCMBCA_PMB
> +	help
> +	  Provide BCM6846 PLL output, Runner, crystal, PVTMON and block-zone
> +	  clocks through the Processor Monitor Bus.
> +
> +	  The module will be called clk-bcmbca-pmb.
> +
>  config CLK_BCM2711_DVP
>  	tristate "Broadcom BCM2711 DVP support"
>  	depends on ARCH_BCM2835 ||COMPILE_TEST
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index d0b6f4b1fb08..7123eefff138 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_CLK_BCMBCA_PMB)	+= clk-bcmbca-pmb.o
>  obj-$(CONFIG_CLK_BCM_63XX)	+= clk-bcm63xx.o
>  obj-$(CONFIG_CLK_BCM_63XX_GATE)	+= clk-bcm63xx-gate.o
>  obj-$(CONFIG_CLK_BCM63268_TIMER) += clk-bcm63268-timer.o
> diff --git a/drivers/clk/bcm/clk-bcmbca-pmb.c b/drivers/clk/bcm/clk-bcmbca-pmb.c
> new file mode 100644
> index 000000000000..41acab23688a
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-bcmbca-pmb.c
> @@ -0,0 +1,389 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Broadcom BCM6846 Processor Monitor Bus (PMB) clocks.
> + *
> + * PMB transactions sleep, so gating uses the prepare callbacks. Firmware
> + * also uses these clocks: leave prepared clocks running and retain PLL
> + * rates.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/math64.h>
> +#include <linux/mfd/bcmbca-pmb.h>
> +#include <linux/mod_devicetable.h>

Please drop mod_devicetable.h. Uwe has a bunch of cleanups for this, and
this is one of his recent messages that I picked at random.

https://lore.kernel.org/linux-clk/auGhPHjanNTkkzG-@monoceros/

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>

This include doesn't appear to be used.

> +
> +#include <dt-bindings/clock/brcm,bcm6846-pmb.h>
> +
> +/* PMB register offsets are in 32-bit words. */
> +#define PLL_CHANNEL_DISABLE	BIT(8)
> +#define PLL_CHANNEL_HOLD		BIT(9)
> +#define PLL_MDIV_OVERRIDE		BIT(15)
> +#define PLL_LOCK			BIT(31)
> +#define PLL_NDIV_INT		GENMASK(9, 0)
> +#define PLL_NDIV_FRAC		GENMASK(31, 12)
> +#define PLL_PDIV			GENMASK(3, 0)
> +
> +#define XTAL_CONTROL		14
> +#define XTAL_DRIVER_POWER_DOWN	BIT(17)
> +
> +#define PVTMON_CONFIG		17
> +#define PVTMON_CLOCK_ENABLE	BIT(2)
> +#define PVTMON_CLOCK_DIVIDER	GENMASK(12, 8)
> +
> +#define ZONE_CLOCK_ENABLE	BIT(0)
> +#define ZONE_MANUAL_CONTROL	BIT(7)
> +#define ZONE_POWER_DOWN_REQUEST	BIT(9)
> +#define ZONE_POWER_ON		BIT(26)
> +
> +enum bcmbca_pmb_clock_type {
> +	PMB_PLL_CHANNEL,
> +	PMB_RUNNER,
> +	PMB_XTAL,
> +	PMB_PVTMON,
> +	PMB_ZONE,
> +};
> +
> +struct bcmbca_pmb_pll_layout {
> +	u16 ch01;
> +	u16 status;
> +	u16 ndiv;
> +	u16 pdiv;
> +	u16 ch25;
> +};
> +
> +struct bcmbca_pmb_clock_desc {
> +	const char *name;
> +	enum bcmbca_pmb_clock_type type;
> +	u8 bus;
> +	u8 device;
> +	u8 channel;
> +	u16 reg;
> +	const struct bcmbca_pmb_pll_layout *pll;
> +};
> +
> +struct bcmbca_pmb_clock {
> +	struct clk_hw hw;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	const struct bcmbca_pmb_clock_desc *desc;
> +};
> +
> +#define to_pmb_clock(_hw) container_of(_hw, struct bcmbca_pmb_clock, hw)
> +
> +static int bcmbca_pmb_clock_prepare(struct clk_hw *hw)
> +{
> +	struct bcmbca_pmb_clock *clock = to_pmb_clock(hw);
> +	const struct bcmbca_pmb_clock_desc *desc = clock->desc;
> +	unsigned int shift = (desc->channel % 2) * 16;
> +	unsigned int reg = BCMBCA_PMB_REG(desc->bus, desc->device, desc->reg);
> +	u32 value;
> +	int ret;
> +
> +	switch (desc->type) {
> +	case PMB_PLL_CHANNEL: {
> +		unsigned int regs[] = {
> +			BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll->status),
> +			BCMBCA_PMB_REG(desc->bus, desc->device,
> +				       desc->pll->ch01 + desc->channel / 2),
> +		};
> +		u32 values[ARRAY_SIZE(regs)];
> +
> +		ret = regmap_multi_reg_read(clock->regmap, regs, values, ARRAY_SIZE(regs));
> +		if (ret)
> +			return ret;
> +		/* Firmware owns PLL power and reset. */
> +		if (!(values[0] & PLL_LOCK))
> +			return -EAGAIN;

Should this be -EPROBE_DEFER instead?

> +		/* A held output may be undergoing a firmware rate transition. */
> +		if (values[1] & (PLL_CHANNEL_HOLD << shift))
> +			return -EBUSY;
> +		return regmap_update_bits(clock->regmap, regs[1],
> +					  PLL_CHANNEL_DISABLE << shift, 0);
> +	}
> +	case PMB_XTAL:
> +		return regmap_update_bits(clock->regmap, reg, XTAL_DRIVER_POWER_DOWN, 0);
> +	case PMB_PVTMON:
> +		ret = regmap_read(clock->regmap, reg, &value);
> +		if (ret)
> +			return ret;
> +		/* Preserve the divider when firmware already enabled acquisition. */
> +		if (value & PVTMON_CLOCK_ENABLE)
> +			return 0;
> +		return regmap_update_bits(clock->regmap, reg,
> +					  PVTMON_CLOCK_ENABLE | PVTMON_CLOCK_DIVIDER,
> +					  PVTMON_CLOCK_ENABLE |
> +					  FIELD_PREP(PVTMON_CLOCK_DIVIDER, 5));
> +	case PMB_ZONE:
> +		ret = regmap_read(clock->regmap, reg, &value);
> +		if (ret)
> +			return ret;
> +		/* Power and isolation belong to the power-domain sequencer. */
> +		if (!(value & ZONE_POWER_ON) || value & ZONE_POWER_DOWN_REQUEST)
> +			return -EHOSTDOWN;
> +		if (!(value & ZONE_MANUAL_CONTROL))
> +			return 0;
> +		return regmap_update_bits(clock->regmap, reg, ZONE_CLOCK_ENABLE,
> +					  ZONE_CLOCK_ENABLE);
> +	case PMB_RUNNER:
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int bcmbca_pmb_clock_is_prepared(struct clk_hw *hw)
> +{
> +	struct bcmbca_pmb_clock *clock = to_pmb_clock(hw);
> +	const struct bcmbca_pmb_clock_desc *desc = clock->desc;
> +	unsigned int shift = (desc->channel % 2) * 16;
> +	u32 value;
> +	int ret;
> +
> +	if (desc->type == PMB_PLL_CHANNEL) {
> +		unsigned int regs[] = {
> +			BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll->status),
> +			BCMBCA_PMB_REG(desc->bus, desc->device,
> +				       desc->pll->ch01 + desc->channel / 2),
> +		};
> +		u32 values[ARRAY_SIZE(regs)];
> +
> +		ret = regmap_multi_reg_read(clock->regmap, regs, values, ARRAY_SIZE(regs));
> +		if (ret || !(values[0] & PLL_LOCK))
> +			return 0;
> +		return !(values[1] & ((PLL_CHANNEL_DISABLE | PLL_CHANNEL_HOLD) << shift));
> +	}
> +
> +	ret = regmap_read(clock->regmap,
> +			  BCMBCA_PMB_REG(desc->bus, desc->device, desc->reg), &value);
> +	if (ret)
> +		return 0;
> +
> +	switch (desc->type) {
> +	case PMB_XTAL:
> +		return !(value & XTAL_DRIVER_POWER_DOWN);
> +	case PMB_PVTMON:
> +		return !!(value & PVTMON_CLOCK_ENABLE);
> +	case PMB_ZONE:
> +		return (value & ZONE_POWER_ON) && !(value & ZONE_POWER_DOWN_REQUEST) &&
> +		       (!(value & ZONE_MANUAL_CONTROL) || (value & ZONE_CLOCK_ENABLE));
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static unsigned long bcmbca_pmb_clock_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct bcmbca_pmb_clock *clock = to_pmb_clock(hw);
> +	const struct bcmbca_pmb_clock_desc *desc = clock->desc;
> +	unsigned int regs[4], count = 3;
> +	u32 values[4], ndiv, pdiv, channel, mdiv;
> +	unsigned int shift = (desc->channel % 2) * 16;
> +	u64 multiplier, rate;
> +	int ret;
> +
> +	if (desc->type == PMB_XTAL)
> +		return parent_rate;
> +	/* The vendor sources do not identify these clocks' parent rates. */
> +	if (desc->type != PMB_PLL_CHANNEL)
> +		return 0;
> +
> +	regs[0] = BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll->ndiv);
> +	regs[1] = BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll->pdiv);
> +	regs[2] = BCMBCA_PMB_REG(desc->bus, desc->device,
> +				 desc->pll->ch01 + desc->channel / 2);
> +	if (desc->channel >= 2)
> +		regs[count++] = BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll->ch25);
> +
> +	ret = regmap_multi_reg_read(clock->regmap, regs, values, count);
> +	if (ret) {
> +		dev_err_ratelimited(clock->dev, "cannot read %s rate: %d\n", desc->name, ret);
> +		return 0;
> +	}
> +	ndiv = values[0];
> +	pdiv = values[1];
> +	channel = values[2];
> +	if (channel & (PLL_MDIV_OVERRIDE << shift))
> +		mdiv = (channel >> shift) & 0xff;
> +	else if (desc->channel < 2)
> +		mdiv = (pdiv >> (16 + desc->channel * 8)) & 0xff;
> +	else
> +		mdiv = (values[3] >> ((desc->channel - 2) * 8)) & 0xff;
> +
> +	pdiv = FIELD_GET(PLL_PDIV, pdiv);
> +	/* No rate can be determined from a zero divider. */
> +	if (!pdiv || !mdiv)
> +		return 0;
> +	multiplier = ((u64)FIELD_GET(PLL_NDIV_INT, ndiv) << 20) |
> +		     FIELD_GET(PLL_NDIV_FRAC, ndiv);
> +	rate = div64_u64((u64)parent_rate * multiplier,
> +			 ((u64)pdiv * mdiv) << 20);
> +
> +	return rate > ULONG_MAX ? 0 : rate;
> +}
> +
> +static const struct clk_ops bcmbca_pmb_clock_ops = {
> +	.prepare = bcmbca_pmb_clock_prepare,
> +	.is_prepared = bcmbca_pmb_clock_is_prepared,
> +	.recalc_rate = bcmbca_pmb_clock_recalc_rate,
> +	/* No unprepare: these clocks can remain in use by PMC firmware. */
> +};
> +
> +static const struct bcmbca_pmb_pll_layout bcm6846_rdppll = {
> +	.ch01 = 16,
> +	.status = 19,
> +	.ndiv = 21,
> +	.pdiv = 22,
> +	.ch25 = 23,
> +};
> +
> +/* The BIU PLL uses the classic BPCM register layout. */
> +static const struct bcmbca_pmb_pll_layout bcm6846_biupll = {
> +	.ch01 = 11,
> +	.status = 15,
> +	.ndiv = 17,
> +	.pdiv = 18,
> +	.ch25 = 19,
> +};
> +
> +#define PMB_PLL(_id, _name, _device, _channel, _pll) \
> +	[_id] = { .name = _name, .type = PMB_PLL_CHANNEL, .bus = 1, \
> +		  .device = _device, .channel = _channel, \
> +		  .pll = _pll }
> +#define PMB_GATE(_id, _name, _type, _bus, _device, _reg) \
> +	[_id] = { .name = _name, .type = _type, .bus = _bus, \
> +		  .device = _device, .reg = _reg }
> +#define PMB_ZONE_CLK(_id, _name, _bus, _device, _zone) \
> +	PMB_GATE(_id, _name, PMB_ZONE, _bus, _device, 32 + (_zone) * 8)
> +
> +static const struct bcmbca_pmb_clock_desc bcm6846_clocks[] = {
> +	PMB_PLL(BCM6846_CLK_RDPPLL_CH0, "rdppll-ch0", 3, 0, &bcm6846_rdppll),
> +	PMB_PLL(BCM6846_CLK_RDPPLL_CH1, "rdppll-ch1", 3, 1, &bcm6846_rdppll),
> +	PMB_PLL(BCM6846_CLK_RDPPLL_CH2, "rdppll-ch2", 3, 2, &bcm6846_rdppll),
> +	PMB_PLL(BCM6846_CLK_RDPPLL_CH3, "rdppll-ch3", 3, 3, &bcm6846_rdppll),
> +	PMB_PLL(BCM6846_CLK_RDPPLL_CH4, "rdppll-ch4", 3, 4, &bcm6846_rdppll),
> +	PMB_PLL(BCM6846_CLK_RDPPLL_CH5, "rdppll-ch5", 3, 5, &bcm6846_rdppll),
> +	PMB_PLL(BCM6846_CLK_BIUPLL_CH0, "biupll-ch0", 38, 0, &bcm6846_biupll),
> +	PMB_PLL(BCM6846_CLK_BIUPLL_CH1, "biupll-ch1", 38, 1, &bcm6846_biupll),
> +	PMB_PLL(BCM6846_CLK_BIUPLL_CH2, "biupll-ch2", 38, 2, &bcm6846_biupll),
> +	PMB_PLL(BCM6846_CLK_BIUPLL_CH3, "biupll-ch3", 38, 3, &bcm6846_biupll),
> +	PMB_PLL(BCM6846_CLK_BIUPLL_CH4, "biupll-ch4", 38, 4, &bcm6846_biupll),
> +	PMB_PLL(BCM6846_CLK_BIUPLL_CH5, "biupll-ch5", 38, 5, &bcm6846_biupll),
> +	[BCM6846_CLK_RUNNER] = { .name = "runner", .type = PMB_RUNNER },
> +	PMB_GATE(BCM6846_CLK_XTAL_OUT, "xtal-out", PMB_XTAL, 1, 1, XTAL_CONTROL),
> +	PMB_GATE(BCM6846_CLK_PVTMON, "pvtmon", PMB_PVTMON, 1, 6, PVTMON_CONFIG),
> +	PMB_ZONE_CLK(BCM6846_CLK_PERIPH_ZONE0, "periph-zone0", 0, 0, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_PERIPH_ZONE1, "periph-zone1", 0, 0, 1),
> +	PMB_ZONE_CLK(BCM6846_CLK_PERIPH_ZONE2, "periph-zone2", 0, 0, 2),
> +	PMB_ZONE_CLK(BCM6846_CLK_PERIPH_ZONE3, "periph-zone3", 0, 0, 3),
> +	PMB_ZONE_CLK(BCM6846_CLK_MEMC, "memc", 1, 8, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_USB_ZONE0, "usb-zone0", 1, 10, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_USB_ZONE1, "usb-zone1", 1, 10, 1),
> +	PMB_ZONE_CLK(BCM6846_CLK_USB_ZONE2, "usb-zone2", 1, 10, 2),
> +	PMB_ZONE_CLK(BCM6846_CLK_USB_ZONE3, "usb-zone3", 1, 10, 3),
> +	PMB_ZONE_CLK(BCM6846_CLK_WAN_ZONE0, "wan-zone0", 1, 11, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_WAN_ZONE1, "wan-zone1", 1, 11, 1),
> +	PMB_ZONE_CLK(BCM6846_CLK_WAN_ZONE2, "wan-zone2", 1, 11, 2),
> +	PMB_ZONE_CLK(BCM6846_CLK_XRDP_ZONE0, "xrdp-zone0", 1, 12, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_XRDP_ZONE1, "xrdp-zone1", 1, 12, 1),
> +	PMB_ZONE_CLK(BCM6846_CLK_XRDP_ZONE2, "xrdp-zone2", 1, 12, 2),
> +	PMB_ZONE_CLK(BCM6846_CLK_RUNNER0, "runner0", 1, 14, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_RUNNER1, "runner1", 1, 15, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_RUNNER2, "runner2", 1, 16, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_PCIE0, "pcie0", 0, 18, 0),
> +	PMB_ZONE_CLK(BCM6846_CLK_PCIE1, "pcie1", 0, 19, 0),
> +	/* BIU uses the classic BPCM layout, with its zone at word 16. */
> +	PMB_GATE(BCM6846_CLK_BIU, "biu", PMB_ZONE, 1, 39, 16),
> +};
> +
> +static int bcmbca_pmb_clock_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap = dev_get_regmap(dev->parent, NULL);
> +	struct clk_hw_onecell_data *data;
> +	struct bcmbca_pmb_clock *clocks;
> +	struct clk *ref;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	ref = devm_clk_get(dev, "ref");

This is never used. Is this to defer probe until the ref exists?

> +	if (IS_ERR(ref))
> +		return dev_err_probe(dev, PTR_ERR(ref), "failed to get reference clock\n");
> +
> +	data = devm_kzalloc(dev, struct_size(data, hws, ARRAY_SIZE(bcm6846_clocks)),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->num = ARRAY_SIZE(bcm6846_clocks);
> +	clocks = devm_kcalloc(dev, data->num, sizeof(*clocks), GFP_KERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num; i++) {
> +		const struct bcmbca_pmb_clock_desc *desc = &bcm6846_clocks[i];
> +		struct clk_parent_data parent = {};
> +		struct clk_init_data init = {
> +			.ops = &bcmbca_pmb_clock_ops,
> +			.flags = CLK_GET_RATE_NOCACHE | CLK_IGNORE_UNUSED,

The CLK_IGNORE_UNUSED has no effect since there's no disable /
disable_unused ops.

Also why CLK_GET_RATE_NOCACHE on all clocks?

> +		};
> +
> +		init.name = devm_kasprintf(dev, GFP_KERNEL, "%s-%s", dev_name(dev), desc->name);
> +		if (!init.name)
> +			return -ENOMEM;
> +		if (desc->type == PMB_RUNNER) {
> +			struct clk_hw *parent_hw = data->hws[BCM6846_CLK_RDPPLL_CH1];
> +			struct clk_hw *runner;
> +
> +			runner = devm_clk_hw_register_fixed_factor_parent_hw(dev,
> +									     init.name, parent_hw,
> +									     init.flags, 1, 2);
> +			data->hws[i] = runner;

The runner intermediate variable can be dropped.

> +			if (IS_ERR(data->hws[i]))
> +				return PTR_ERR(data->hws[i]);
> +			continue;
> +		}
> +		if (desc->type == PMB_PLL_CHANNEL || desc->type == PMB_XTAL) {
> +			parent.fw_name = "ref";
> +			init.parent_data = &parent;
> +			init.num_parents = 1;
> +		}
> +		clocks[i].regmap = regmap;
> +		clocks[i].dev = dev;
> +		clocks[i].desc = desc;
> +		clocks[i].hw.init = &init;
> +		ret = devm_clk_hw_register(dev, &clocks[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register %s\n", desc->name);

newline

> +		data->hws[i] = &clocks[i].hw;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
> +}
> +
> +static const struct of_device_id bcmbca_pmb_clock_match[] = {
> +	{ .compatible = "brcm,bcm6846-pmb-clock" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcmbca_pmb_clock_match);
> +
> +static struct platform_driver bcmbca_pmb_clock_driver = {
> +	.probe = bcmbca_pmb_clock_probe,
> +	.driver = {

The MFD driver sets suppress_bind_attrs to true. Should that also be set
here as well?

Brian

-- 
Brian Masney <masneyb@kernel.org>
