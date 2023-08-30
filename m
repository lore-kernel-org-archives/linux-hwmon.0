Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5604C6FA8F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 19:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239194AbjH3T5I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Aug 2023 15:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239010AbjH3T4i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2023 15:56:38 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C2D56B8
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 12:28:38 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bdf4752c3cso35705ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2023 12:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693423630; x=1694028430; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGvmAnYANPHouVA+BdJfC0MXGgtwfV2UgiyZIn2PRsI=;
        b=VcpFCpRB8s2cEEOchce0BXS9IVqHIrJzT7NcPaH9c322NqBlKxs8IEijgZ9z+lKfjR
         oNL5MLAFrfl2qhoqUnNAOaQQdsGy/+WtnMQvgfHvSIrcJbH8qB458ZuX27aWmDjIK47W
         obWzjk4CqXylYP1stu2UM+DwFek6FFQlq/g8+ThXQbIvuqVcslku7uszhq9IgXZJCEnl
         sGLg0goRTMngWbY+8da5F7uY/a5qPR5uZtBiIuFqLFDG1clxUitAjqhlqFhq4QAf7b4Q
         5x4F0/8eRKzWzhonJwELqkEaPa3++ShVm9sNOmm3hhR7ZfylUtqeWiEjtVER3UY6u4Nn
         +TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693423630; x=1694028430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGvmAnYANPHouVA+BdJfC0MXGgtwfV2UgiyZIn2PRsI=;
        b=E+4ptJ3e7voH4QUTcfRacklS9crLi2xJI9palwADjEmWG8IuEe6rnjf6eMdGhIJ/Wm
         8jmIiX9ZCH2RWSj/QDVsSSteoi/Bk3vAgZrOmIJ86PytaxnG9IxHHGCh02hhPX0wUTqO
         8efEyJElrWSmpjcLJm4inPHUbzsZpUuLs4vk7mFOgmTd/zcssYPFcf/imnZrLzwbjVpn
         xLQAsG9pgiRjCi+mbM324VRb7NC9mvmMic2jl6VeZ8rAIYF/xEp3YcWUx/n0vL/KfEDa
         Y+VMoTX0ECIT93wIUzJOFX4nVY5RnCeVT/cT4C6UgNGfr9EvoyHv0wzFi4TXJ7rO7kcM
         QGwg==
X-Gm-Message-State: AOJu0YyrTGpZvn0W/0K8UcKJCuliI14wf3ICw2i5aM6OxLGqKpI+cPc+
        erXT5Y1GN/SSkNIDb8NkFkF0F1SckHlDRX6wwHdxftVhJzcqYlWh6zGsbA==
X-Google-Smtp-Source: AGHT+IFAARw8v1UFiFy5BY+Jwg3667PEy/UO72QjYBKljjXc7Hi5OYjANU6LOXgIEcoktmjI6GsRSRfpcd8/MvLOM3g=
X-Received: by 2002:a17:90b:e07:b0:263:f62b:3601 with SMTP id
 ge7-20020a17090b0e0700b00263f62b3601mr2848202pjb.10.1693422895963; Wed, 30
 Aug 2023 12:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230830111319.3882281-1-Naresh.Solanki@9elements.com> <0bfbbbb3-6144-fc9a-c8ab-423a8865591b@roeck-us.net>
In-Reply-To: <0bfbbbb3-6144-fc9a-c8ab-423a8865591b@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Thu, 31 Aug 2023 00:44:45 +0530
Message-ID: <CABqG17ig1VRJYqbrOvPKAYS8iUFwY9J3tYcgYGtnnXw+vrnoRA@mail.gmail.com>
Subject: Re: [PATCH] regulator (max5970): Add hwmon support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, zev@bewilderbeest.net,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi


On Wed, 30 Aug 2023 at 21:26, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/30/23 04:13, Naresh Solanki wrote:
> > Utilize the integrated 10-bit ADC in Max5970/Max5978 to enable voltage
> > and current monitoring. This feature is seamlessly integrated through
> > the hwmon subsystem.
> >
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ---
> >   drivers/regulator/max5970-regulator.c | 119 ++++++++++++++++++++++++++
> >   1 file changed, 119 insertions(+)
> >
> > diff --git a/drivers/regulator/max5970-regulator.c b/drivers/regulator/max5970-regulator.c
> > index b56a174cde3d..3a6f7c293526 100644
> > --- a/drivers/regulator/max5970-regulator.c
> > +++ b/drivers/regulator/max5970-regulator.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/bitops.h>
> >   #include <linux/device.h>
> >   #include <linux/err.h>
> > +#include <linux/hwmon.h>
> >   #include <linux/module.h>
> >   #include <linux/io.h>
> >   #include <linux/of.h>
> > @@ -32,6 +33,116 @@ enum max597x_regulator_id {
> >       MAX597X_SW1,
> >   };
> >
> > +static int max5970_read_adc(struct regmap *regmap, int reg, long *val)
> > +{
> > +     u8 reg_data[2];
> > +     int ret;
> > +
> > +     ret = regmap_bulk_read(regmap, reg, &reg_data[0], 2);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     *val = (reg_data[0] << 2) | (reg_data[1] & 3);
> > +
> > +     return 0;
> > +}
> > +
> > +static int max5970_read(struct device *dev, enum hwmon_sensor_types type,
> > +                     u32 attr, int channel, long *val)
> > +{
> > +     struct max5970_data *ddata = dev_get_drvdata(dev);
> > +     struct regmap *regmap = dev_get_regmap(dev->parent, NULL);
> > +     int ret;
> > +
> > +     switch (type) {
> > +     case hwmon_curr:
> > +             switch (attr) {
> > +             case hwmon_curr_input:
> > +                     ret = max5970_read_adc(regmap, MAX5970_REG_CURRENT_H(channel), val);
> > +                     /*
> > +                      * Calculate current from ADC value, IRNG range & shunt resistor value.
> > +                      * ddata->irng holds the voltage corresponding to the maximum value the
> > +                      * 10-bit ADC can measure.
> > +                      * To obtain the output, multiply the ADC value by the IRNG range (in
> > +                      * millivolts) and then divide it by the maximum value of the 10-bit ADC.
> > +                      */
> > +                     *val = (*val * ddata->irng[channel]) >> 10;
> > +                     /* Convert the voltage meansurement across shunt resistor to current */
> > +                     *val = (*val * 1000) / ddata->shunt_micro_ohms[channel];
> > +                     return ret;
> > +             default:
> > +                     return -EOPNOTSUPP;
> > +             }
> > +
> > +     case hwmon_in:
> > +             switch (attr) {
> > +             case hwmon_in_input:
> > +                     ret = max5970_read_adc(regmap, MAX5970_REG_VOLTAGE_H(channel), val);
> > +                     /*
> > +                      * Calculate voltage from ADC value and MON range.
> > +                      * ddata->mon_rng holds the voltage corresponding to the maximum value the
> > +                      * 10-bit ADC can measure.
> > +                      * To obtain the output, multiply the ADC value by the MON range (in
> > +                      * microvolts) and then divide it by the maximum value of the 10-bit ADC.
> > +                      */
> > +                     *val = mul_u64_u32_shr(*val, ddata->mon_rng[channel], 10);
>
> Why do you use mul_u64_u32_shr() here but a direct shift above ?
There is possibility of overflow due to large value of ddata->mon_rng
>
> > +                     /* uV to mV */
> > +                     *val = *val / 1000;
> > +                     return ret;
> > +             default:
> > +                     return -EOPNOTSUPP;
> > +             }
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static umode_t max5970_is_visible(const void *data,
> > +                               enum hwmon_sensor_types type,
> > +                               u32 attr, int channel)
> > +{
> > +     struct max5970_data *ddata = (struct max5970_data *)data;
> > +
> > +     if (channel >= ddata->num_switches)
> > +             return 0;
> > +
> > +     switch (type) {
> > +     case hwmon_in:
> > +             switch (attr) {
> > +             case hwmon_in_input:
> > +                     return 0444;
>
>                 default:
>                         break;
Ack
>
> > +             }
> > +             break;
> > +     case hwmon_curr:
> > +             switch (attr) {
> > +             case hwmon_curr_input:
> > +                     /* Current measurement requires knowledge of the shunt resistor value. */
> > +                     if (ddata->shunt_micro_ohms[channel])
> > +                             return 0444;
>                 default:
>                         break;
Ack
>
> > +             }
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static const struct hwmon_ops max5970_hwmon_ops = {
> > +     .is_visible = max5970_is_visible,
> > +     .read = max5970_read,
> > +};
> > +
> > +static const struct hwmon_channel_info *max5970_info[] = {
> > +     HWMON_CHANNEL_INFO(in, HWMON_I_INPUT, HWMON_I_INPUT),
> > +     HWMON_CHANNEL_INFO(curr, HWMON_C_INPUT, HWMON_C_INPUT),
>
> Your call, but the chip does support limit and status registers, so you
> could add reporting those as well since you are at it, possibly even including
> notifications.
Will consider separate set of patch for this.
>
> > +     NULL
> > +};
> > +
> > +static const struct hwmon_chip_info max5970_chip_info = {
> > +     .ops = &max5970_hwmon_ops,
> > +     .info = max5970_info,
> > +};
> > +
> >   static int max597x_uvp_ovp_check_mode(struct regulator_dev *rdev, int severity)
> >   {
> >       int ret, reg;
> > @@ -432,6 +543,7 @@ static int max597x_regulator_probe(struct platform_device *pdev)
> >       struct regulator_config config = { };
> >       struct regulator_dev *rdev;
> >       struct regulator_dev *rdevs[MAX5970_NUM_SWITCHES];
> > +     struct device *hwmon_dev;
> >       int num_switches;
> >       int ret, i;
> >
> > @@ -485,6 +597,13 @@ static int max597x_regulator_probe(struct platform_device *pdev)
> >               max597x->shunt_micro_ohms[i] = data->shunt_micro_ohms;
> >       }
> >
> > +     hwmon_dev = devm_hwmon_device_register_with_info(&i2c->dev, "max5970_hwmon", max597x,
> > +                                                      &max5970_chip_info, NULL);
>
> This makes the driver dependent on hwmon, so you either need a strict
>         depends on HWMON
> in Kconfig, or
>         depends on HWMON || HWMON=n
> and add #if IS_ENABLED(CONFIG_HWMON) as appropriate into the code.
Sure, will update accordingly. Thanks
>
>
> > +     if (IS_ERR(hwmon_dev)) {
> > +             return dev_err_probe(&i2c->dev, PTR_ERR(hwmon_dev), \
> > +                                  "Unable to register hwmon device\n");
> > +     }
> > +
> >       if (i2c->irq) {
> >               ret =
> >                   max597x_setup_irq(&i2c->dev, i2c->irq, rdevs, num_switches,
> >
> > base-commit: 35d0d2350d774fecf596cfb2fb050559fe5e1850
>
