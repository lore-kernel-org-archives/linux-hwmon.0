Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC33C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 21:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiD0VPl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 17:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiD0VPl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 17:15:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7FA13D67
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 14:12:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id a1so3374127edt.3
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GuM0vvaEiZIINbNzZ0hkPF4JyRwJGMtYPB1G5ixTRpU=;
        b=htGCen8o9av6yemxPx7r674T6TIVEfQPFqdISZhJv93Fs99Lq5dRQ3vb9az5YcWRyU
         Ovx15ZYuGwL1Ax6Lf1FIUQfZTMU/V0AnxydAdo69kHWcQO3KM9hJn8irDFWCdu4lxXWE
         tK3oJFqpp+WUgEx2PIM20XUxlyGn75rSGVPS8Y+UphBLKIf3fqpinM0BiRxrXcIAEQqv
         eeKn0TIU17vSeoqdrBrK8XMHNwPK9KLHAaUWJkqGCfkFDaryeiSMcXXoOkmvrJX1l3P6
         YOXULxZFe8L85Ae5i4KTE4USvWhYLET6dnHHQ5hCBkl3R0uvLU7iFUYM/6q/1/wVsza4
         JnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GuM0vvaEiZIINbNzZ0hkPF4JyRwJGMtYPB1G5ixTRpU=;
        b=bLh5VoKBktZ1IWEIqS6eBofhr85h4XyI/9yQdUSO/Yt6sqTwWocJfVgFhnlCEnWYcV
         Moe42AyXSYPBc9XP5cQqYGtFlV83qj2Gp4H9QFrL3s1QlF7U/Le8uR94oBTFahGplzNW
         3iG5LApiwR1vL7SglPO9UzzZvt9DEePosnZV+bsK2uGz1bz+vJj9JLgaSF2ZYoRlFsMl
         ojLrztFqgJKsEwzzPqbZqB1sMUs58U+Y9Dt+eSAippekWGr3MjZY74cc8yiQGH6wSkKv
         N85ahIj2CJ2neEgQEXfJRfdt40lGyrHpbm5rTvAzHzBycoDe3PkpVwewo6st01jk8YYX
         U86Q==
X-Gm-Message-State: AOAM532fmmQZhDgDHWZw59gVB8BZYlmvEhjppV8cimUOjHqvdnRiJII1
        TkdMpZddxAkViXHZ+6H5Rq9Tfa8mQx0=
X-Google-Smtp-Source: ABdhPJzFe7ngqmjSBOp+oPj7E3wE6hPqUs+gVZP2rCHl+KwLaqxMrTnDyDv37M4eTIy7Cyp8XNEWyg==
X-Received: by 2002:a05:6402:1a42:b0:424:20bb:3e37 with SMTP id bf2-20020a0564021a4200b0042420bb3e37mr32637384edb.29.1651093944579;
        Wed, 27 Apr 2022 14:12:24 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id ka6-20020a170907990600b006ce54c95e3csm7345179ejc.161.2022.04.27.14.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 14:12:24 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Ruslan Zalata <rz@fabmicro.ru>
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: Add hwmon driver for LRADC found on Allwinner A13/A20 SoCs
Date:   Wed, 27 Apr 2022 23:12:23 +0200
Message-ID: <2540957.7s5MMGUR32@jernej-laptop>
In-Reply-To: <323b9658b13b9ccf99432dc55ef8c6bb@fabmicro.ru>
References: <202204272007.23RK74Ds021079@devbox.fabmicro.ru> <6425291.4vTCxPXJkl@jernej-laptop> <323b9658b13b9ccf99432dc55ef8c6bb@fabmicro.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dne sreda, 27. april 2022 ob 23:01:58 CEST je Ruslan Zalata napisal(a):
> Dear Jernej and all.
>=20
> I used sendmail instead of "git send-email" and it did the whole this
> wrong - several separate emails were sent. I'm sorry for that, will
> stick to git command next time.
>=20
> I read the guide of course and I fed the patch through
> scripts/checkpatch.pl many times in an effort to elaborate all the
> errors and warnings. The only warning left is this:
>=20
> WARNING: added, moved or deleted file(s), does MAINTAINERS need
> updating?
> #61:
> new file mode 100644
>=20
> total: 0 errors, 1 warnings, 304 lines checked

Did you used --strict? Anyway, you have multiple consecutive empty lines in=
=20
several places. Only one empty line is allowed.

>=20
> Since this is my first attempt to submit my code I'm quite confused whom
> should I add as a maintainer for this driver. :)

Usually yourself.

>=20
> PS: What's wrong with the subject ?

Too long and ARM is not a proper tag. Check git history of drivers/hwmon=20
folder for ideas.

Best regards,
Jernej

>=20
> ---
> Regards,
> Ruslan.
>=20
> Fabmicro, LLC.
>=20
> On 2022-04-28 01:23, Jernej =C5=A0krabec wrote:
> > Hi Ruslan!
> >=20
> > Dne sreda, 27. april 2022 ob 21:25:12 CEST je Ruslan Zalata napisal(a):
> >> Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
> >> low rate (6 bit) ADC that is often used for extra keys. There's a
> >> driver
> >> for that already implementing standard input device, but it has these
> >> limitations: 1) it cannot be used for general ADC data equisition, and
> >> 2) it uses only one LRADC channel of two available.
> >>=20
> >> This driver provides basic hwmon interface to both channels of LRADC
> >> on
> >> such Allwinner SoCs.
> >>=20
> >> Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
> >=20
> > Before even going to check actual driver, please read
> > https://www.kernel.org/
> > doc/html/latest/process/submitting-patches.html in detail.
> >=20
> > Just few basic things to fix first:
> > 1. subject doesn't conform to rules
> > 2. send patch to maintainers and mailing lists (use
> > scripts/get_maintainer.pl)
> > 3. code has style issues (multiple empty lines). Run
> > scripts/checkpatch.pl --
> > strict on your patch before submission and fix all reported issues.
> > 4. you sent same patch two times. If it's same, it should be marked
> > with
> > RESEND, if not, it should be versioned (V2, V3, etc.) with short
> > changelog
> > after --- line (as explained in above link)
> > 5. it's customary to add new entry in MAINTAINERS when adding new
> > driver
> >=20
> > Best regards,
> > Jernej
> >=20
> >> ---
> >>=20
> >>  drivers/hwmon/Kconfig             |  13 ++
> >>  drivers/hwmon/Makefile            |   1 +
> >>  drivers/hwmon/sun4i-lradc-hwmon.c | 278
> >>=20
> >> ++++++++++++++++++++++++++++++
> >>=20
> >>  3 files changed, 292 insertions(+)
> >>  create mode 100644 drivers/hwmon/sun4i-lradc-hwmon.c
> >>=20
> >> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> >> index 68a8a27ab3b..b7732a9e992 100644
> >> --- a/drivers/hwmon/Kconfig
> >> +++ b/drivers/hwmon/Kconfig
> >> @@ -521,6 +521,19 @@ config I8K
> >>=20
> >>  	  Say Y if you intend to run userspace programs that use this
> >=20
> > interface.
> >=20
> >>  	  Say N otherwise.
> >>=20
> >> +config SENSORS_SUN4I_LRADC
> >> +	tristate "Allwinner A13/A20 LRADC hwmon"
> >> +	depends on ARCH_SUNXI && (!KEYBOARD_SUN4I_LRADC)
> >> +	help
> >> +	  Say y here to support the LRADC found in Allwinner A13/A20 SoCs.
> >> +	  Both channels are supported.
> >> +
> >> +	  This driver can also be built as module. If so, the module
> >> +	  will be called sun4i-lradc-hwmon.
> >> +
> >> +	  This option is not compatible with KEYBOARD_SUN4I_LRADC, one
> >> +	  of these should be used at a time.
> >> +
> >>=20
> >>  config SENSORS_DA9052_ADC
> >> =20
> >>  	tristate "Dialog DA9052/DA9053 ADC"
> >>  	depends on PMIC_DA9052
> >>=20
> >> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> >> index 8a03289e2aa..43bed6fff27 100644
> >> --- a/drivers/hwmon/Makefile
> >> +++ b/drivers/hwmon/Makefile
> >> @@ -30,6 +30,7 @@ obj-$(CONFIG_SENSORS_AD7314)	+=3D ad7314.o
> >>=20
> >>  obj-$(CONFIG_SENSORS_AD7414)	+=3D ad7414.o
> >>  obj-$(CONFIG_SENSORS_AD7418)	+=3D ad7418.o
> >>  obj-$(CONFIG_SENSORS_ADC128D818) +=3D adc128d818.o
> >>=20
> >> +obj-$(CONFIG_SENSORS_SUN4I_LRADC) +=3D sun4i-lradc-hwmon.o
> >>=20
> >>  obj-$(CONFIG_SENSORS_ADCXX)	+=3D adcxx.o
> >>  obj-$(CONFIG_SENSORS_ADM1021)	+=3D adm1021.o
> >>  obj-$(CONFIG_SENSORS_ADM1025)	+=3D adm1025.o
> >>=20
> >> diff --git a/drivers/hwmon/sun4i-lradc-hwmon.c
> >> b/drivers/hwmon/sun4i-lradc-hwmon.c new file mode 100644
> >> index 00000000000..1947b716dbf
> >> --- /dev/null
> >> +++ b/drivers/hwmon/sun4i-lradc-hwmon.c
> >> @@ -0,0 +1,278 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * Allwinner sun4i (A13/A20) LRADC hwmon driver
> >> + *
> >> + * Copyright (C) 2022 Fabmicro, LLC., Tyumen, Russia.
> >> + * Copyright (C) 2022 Ruslan Zalata <rz@fabmicro.ru>
> >> + */
> >> +
> >> +#include <linux/err.h>
> >> +#include <linux/init.h>
> >> +#include <linux/input.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of_platform.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/regulator/consumer.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/hwmon.h>
> >> +#include <linux/hwmon-sysfs.h>
> >> +
> >> +#define LRADC_CTRL		0x00
> >> +#define LRADC_INTC		0x04
> >> +#define LRADC_INTS		0x08
> >> +#define LRADC_DATA0		0x0c
> >> +#define LRADC_DATA1		0x10
> >> +
> >> +/* LRADC_CTRL bits */
> >> +#define FIRST_CONVERT_DLY(x)	((x) << 24) /* 8 bits */
> >> +#define CHAN_SELECT(x)		((x) << 22) /* 2 bits */
> >> +#define CONTINUE_TIME_SEL(x)	((x) << 16) /* 4 bits */
> >> +#define KEY_MODE_SEL(x)		((x) << 12) /* 2 bits */
> >> +#define LEVELA_B_CNT(x)		((x) << 8)  /* 4 bits */
> >> +#define HOLD_KEY_EN(x)		((x) << 7)
> >> +#define HOLD_EN(x)		((x) << 6)
> >> +#define LEVELB_VOL(x)		((x) << 4)  /* 2 bits */
> >> +#define SAMPLE_RATE(x)		((x) << 2)  /* 2 bits */
> >> +#define ENABLE(x)		((x) << 0)
> >> +
> >> +/* LRADC_INTC and LRADC_INTS bits */
> >> +#define CHAN1_KEYUP_IRQ		BIT(12)
> >> +#define CHAN1_ALRDY_HOLD_IRQ	BIT(11)
> >> +#define CHAN1_HOLD_IRQ		BIT(10)
> >> +#define	CHAN1_KEYDOWN_IRQ	BIT(9)
> >> +#define CHAN1_DATA_IRQ		BIT(8)
> >> +#define CHAN0_KEYUP_IRQ		BIT(4)
> >> +#define CHAN0_ALRDY_HOLD_IRQ	BIT(3)
> >> +#define CHAN0_HOLD_IRQ		BIT(2)
> >> +#define	CHAN0_KEYDOWN_IRQ	BIT(1)
> >> +#define CHAN0_DATA_IRQ		BIT(0)
> >> +
> >> +
> >> +struct lradc_variant {
> >> +	u32 bits;
> >> +	u32 resolution;
> >> +	u32 vref;
> >> +};
> >> +
> >> +struct lradc_variant variant_sun4i_a10_lradc =3D {
> >> +	.bits =3D 0x3f,
> >> +	.resolution =3D 63,
> >> +	.vref =3D 2000000,
> >> +};
> >> +
> >> +struct lradc_variant variant_sun8i_a83t_r_lradc =3D {
> >> +	.bits =3D 0x3f,
> >> +	.resolution =3D 63,
> >> +	.vref =3D 2000000,
> >> +};
> >> +
> >> +static const struct of_device_id sun4i_lradc_of_match[];
> >> +
> >> +
> >> +struct sun4i_lradc_data {
> >> +	struct device *dev;
> >> +	struct device *hwmon_dev;
> >> +	void __iomem *base;
> >> +	const struct lradc_variant *variant;
> >> +	u32 in[2];
> >> +	u32 in_mvolts[2];
> >> +};
> >> +
> >> +
> >> +static ssize_t lradc_in_mvolts_show(struct device *dev,
> >> +			struct device_attribute *attr, char *buf)
> >> +{
> >> +	struct sun4i_lradc_data *data =3D dev_get_drvdata(dev);
> >> +	int nr =3D to_sensor_dev_attr_2(attr)->nr;
> >> +
> >> +	if (IS_ERR(data))
> >> +		return PTR_ERR(data);
> >> +
> >> +	return sprintf(buf, "%d\n", data->in_mvolts[nr]);
> >> +}
> >> +
> >> +static ssize_t lradc_in_show(struct device *dev,
> >> +		struct device_attribute *attr, char *buf)
> >> +{
> >> +	struct sun4i_lradc_data *data =3D dev_get_drvdata(dev);
> >> +	int nr =3D to_sensor_dev_attr_2(attr)->nr;
> >> +
> >> +	if (IS_ERR(data))
> >> +		return PTR_ERR(data);
> >> +
> >> +	return sprintf(buf, "%d\n", data->in[nr]);
> >> +}
> >> +
> >> +
> >> +static umode_t lradc_is_visible(struct kobject *kobj,
> >> +		struct attribute *attr, int index)
> >> +{
> >> +	return attr->mode;
> >> +}
> >> +
> >> +
> >> +
> >> +static SENSOR_DEVICE_ATTR_2_RO(in0_input, lradc_in, 0, 0);
> >> +static SENSOR_DEVICE_ATTR_2_RO(in0_input_mvolts, lradc_in_mvolts, 0,
> >> 1);
> >> +
> >> +static SENSOR_DEVICE_ATTR_2_RO(in1_input, lradc_in, 1, 0);
> >> +static SENSOR_DEVICE_ATTR_2_RO(in1_input_mvolts, lradc_in_mvolts, 1,
> >> 1);
> >> +
> >> +static struct attribute *lradc_attrs[] =3D {
> >> +	&sensor_dev_attr_in0_input.dev_attr.attr,
> >> +	&sensor_dev_attr_in0_input_mvolts.dev_attr.attr,
> >> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> >> +	&sensor_dev_attr_in1_input_mvolts.dev_attr.attr,
> >> +	NULL
> >> +};
> >> +
> >> +static const struct attribute_group lradc_group =3D {
> >> +	.attrs =3D lradc_attrs,
> >> +	.is_visible =3D lradc_is_visible,
> >> +};
> >> +__ATTRIBUTE_GROUPS(lradc);
> >> +
> >> +
> >> +static irqreturn_t sun4i_lradc_irq(int irq, void *dev_id)
> >> +{
> >> +	struct sun4i_lradc_data *lradc =3D dev_id;
> >> +	u32 ints;
> >> +
> >> +	ints  =3D readl(lradc->base + LRADC_INTS);
> >> +
> >> +	if (ints & CHAN0_DATA_IRQ) {
> >> +		lradc->in[0] =3D readl(lradc->base + LRADC_DATA0) &
> >> +			lradc->variant->bits;
> >> +		lradc->in_mvolts[0] =3D lradc->in[0] * lradc->variant-
> >> vref /
> >> +			lradc->variant->resolution / 1000;
> >> +	}
> >> +
> >> +	if (ints & CHAN1_DATA_IRQ) {
> >> +		lradc->in[1] =3D readl(lradc->base + LRADC_DATA1) &
> >> +			lradc->variant->bits;
> >> +		lradc->in_mvolts[1] =3D lradc->in[1] * lradc->variant-
> >> vref /
> >> +			lradc->variant->resolution / 1000;
> >> +	}
> >> +
> >> +	writel(ints, lradc->base + LRADC_INTS);
> >> +
> >> +	return IRQ_HANDLED;
> >> +}
> >> +
> >> +static int sun4i_lradc_open(struct device *dev)
> >> +{
> >> +	struct sun4i_lradc_data *lradc =3D dev_get_drvdata(dev);
> >> +
> >> +	writel(FIRST_CONVERT_DLY(2) | CHAN_SELECT(3) | LEVELA_B_CNT(1) |
> >> +		HOLD_EN(1) | KEY_MODE_SEL(2) | SAMPLE_RATE(3) |
> >=20
> > ENABLE(1),
> >=20
> >> +		lradc->base + LRADC_CTRL);
> >> +
> >> +	writel(CHAN0_DATA_IRQ | CHAN1_DATA_IRQ, lradc->base + LRADC_INTC);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void sun4i_lradc_close(struct device *dev)
> >> +{
> >> +	struct sun4i_lradc_data *lradc =3D dev_get_drvdata(dev);
> >> +
> >> +	writel(FIRST_CONVERT_DLY(2) | LEVELA_B_CNT(1) | HOLD_EN(1) |
> >> +		SAMPLE_RATE(2), lradc->base + LRADC_CTRL);
> >> +	writel(0, lradc->base + LRADC_INTC);
> >> +}
> >> +
> >> +static int sun4i_lradc_resume(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev =3D &pdev->dev;
> >> +
> >> +	return sun4i_lradc_open(dev);
> >> +}
> >> +
> >> +static int sun4i_lradc_suspend(struct platform_device *pdev,
> >> pm_message_t
> >> state) +{
> >> +	struct device *dev =3D &pdev->dev;
> >> +
> >> +	sun4i_lradc_close(dev);
> >> +	return 0;
> >> +}
> >> +
> >> +static int sun4i_lradc_remove(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev =3D &pdev->dev;
> >> +
> >> +	sun4i_lradc_close(dev);
> >> +	return 0;
> >> +}
> >> +
> >> +static int sun4i_lradc_probe(struct platform_device *pdev)
> >> +{
> >> +	struct sun4i_lradc_data *lradc;
> >> +	struct device *dev =3D &pdev->dev;
> >> +	int error;
> >> +
> >> +	lradc =3D devm_kzalloc(dev, sizeof(struct sun4i_lradc_data),
> >=20
> > GFP_KERNEL);
> >=20
> >> +	if (!lradc)
> >> +		return -ENOMEM;
> >> +
> >> +	dev_set_drvdata(dev, lradc);
> >> +
> >> +	lradc->variant =3D of_device_get_match_data(&pdev->dev);
> >> +	if (!lradc->variant) {
> >> +		dev_err(&pdev->dev, "Missing '%s' or '%s' variant\n",
> >> +			sun4i_lradc_of_match[0].compatible,
> >> +			sun4i_lradc_of_match[1].compatible);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	lradc->dev =3D dev;
> >> +	lradc->hwmon_dev =3D devm_hwmon_device_register_with_groups(dev,
> >=20
> > "lradc",
> >=20
> >> +
> >=20
> > lradc, lradc_groups);
> >=20
> >> +	if (IS_ERR(lradc->hwmon_dev)) {
> >> +		error =3D PTR_ERR(lradc->hwmon_dev);
> >> +		return error;
> >> +	}
> >> +
> >> +	lradc->base =3D devm_ioremap_resource(dev,
> >> +			platform_get_resource(pdev, IORESOURCE_MEM,
> >=20
> > 0));
> >=20
> >> +	if (IS_ERR(lradc->base))
> >> +		return PTR_ERR(lradc->base);
> >> +
> >> +	error =3D devm_request_irq(dev, platform_get_irq(pdev, 0),
> >> +			sun4i_lradc_irq, 0, "sun4i-lradc-hwmon",
> >=20
> > lradc);
> >=20
> >> +	if (error)
> >> +		return error;
> >> +
> >> +	error =3D sun4i_lradc_open(dev);
> >> +	if (error)
> >> +		return error;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static const struct of_device_id sun4i_lradc_of_match[] =3D {
> >> +	{ .compatible =3D "allwinner,sun4i-a10-lradc-keys", .data =3D
> >> &variant_sun4i_a10_lradc}, +	{ .compatible =3D
> >> "allwinner,sun8i-a83t-r-lradc", .data =3D &variant_sun8i_a83t_r_lradc},
> >> +
> >=20
> > {
> >=20
> >> /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);
> >> +
> >> +static struct platform_driver sun4i_lradc_driver =3D {
> >> +	.driver =3D {
> >> +		.name	=3D "sun4i-lradc-hwmon",
> >> +		.of_match_table =3D of_match_ptr(sun4i_lradc_of_match),
> >> +	},
> >> +	.probe	=3D sun4i_lradc_probe,
> >> +	.remove	=3D sun4i_lradc_remove,
> >> +	.resume	=3D sun4i_lradc_resume,
> >> +	.suspend =3D sun4i_lradc_suspend,
> >> +};
> >> +
> >> +module_platform_driver(sun4i_lradc_driver);
> >> +
> >> +
> >> +
> >> +
> >> +MODULE_DESCRIPTION("Allwinner A13/A20 LRADC hwmon driver");
> >> +MODULE_AUTHOR("Ruslan Zalata <rz@fabmicro.ru>");
> >> +MODULE_LICENSE("GPL");




