Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8145FCA0EC9
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 21:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238662AbjIKVQr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236431AbjIKKhr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2023 06:37:47 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EFBE5F
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2023 03:37:42 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-273527a8fdeso2738932a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2023 03:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1694428662; x=1695033462; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Po8IS4DRMtQvmgPVXjH58qy9Rqo/kKZSvAUadebqBp4=;
        b=F5+2kUx330xrTBjysIEeGshORGE1FhL24CGmIHwUzCrJblsIpZ/H2Psn2ChN7KXU+8
         6dh5n3pwOr3Eb7F+UQxAdjI86fqnThoR0hBdtby5E+ssxCBqBoA6z97zkKhAsheyna3I
         GTuaxnq+s+Z5HiLWy87YxBOV7oSW6OisCNKluEqhq9arL8CsULm0ZORTMc0IsABgHDtD
         l/bEfLRvX7MTLxMkuSG9orwUMK9FZPuyK2GBP3zab1R9K1tVEJoJk++GFLQ+2xeyliIi
         woJAfZZROzBWZukqneM2mQqGnldxV7JGaGW0S+c4qRaZxPAGYX7lEB8GWsskMvItRYT3
         qG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428662; x=1695033462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po8IS4DRMtQvmgPVXjH58qy9Rqo/kKZSvAUadebqBp4=;
        b=PFHD/7BVap+cK7zNeq/PgiiLSG1tzY/aLdybDQplYUFMOiqqmF5oirFQJJfehJt1bj
         okOecNdJNWmgZTi6l7esHQTYm2FfWcZAR4KfLFKi9CManq1qWSkilowIpPxxGJm6+gTF
         hnNZ0CaPYbq9GYeyUTyLTqVMOQXUbTITH3ymkEbwQq+5DeYlg0lw2VLBowp7g/TIqJMi
         1xd8ulBACMQZ9laeXkms59thRVZSJu0POtWxHxY0R/hjiY76+hEt0ON0IxJZOEELcynE
         uufAKiSE9VuJsN1qT1iNmChoPgSNlPIvSy0Jnv5dwF5pfB/4CBjZYVgeAPLaFGw8Kdhp
         9PfQ==
X-Gm-Message-State: AOJu0YyBrYJUY8i/eSfP7Fk0DkpQyRxdjTmCfXEPFvucaZvFyKUUV5ct
        2JtMBDOiXfW7Xj/8iFFjdYrRuQjqz5MGCar2n7hUfQ==
X-Google-Smtp-Source: AGHT+IHmOIqa/z6dMpq8pdMxxAGEDuHNj5xcEgKDzqBAe8nBbBBoEdwfdK2+IK8kAeHSnZ6SVg4Hu4N7waaldgyLK1Q=
X-Received: by 2002:a17:90a:4ce4:b0:263:1f1c:ef4d with SMTP id
 k91-20020a17090a4ce400b002631f1cef4dmr7075991pjh.10.1694428662010; Mon, 11
 Sep 2023 03:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230901093449.838414-1-Naresh.Solanki@9elements.com> <83f2afcc-aa9a-2d60-f5e2-971f7d669e00@roeck-us.net>
In-Reply-To: <83f2afcc-aa9a-2d60-f5e2-971f7d669e00@roeck-us.net>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Mon, 11 Sep 2023 16:07:31 +0530
Message-ID: <CABqG17iOLLb8qJkMRc7YCLMLE5mL9AV0fu7ckQz==FihFOUsKQ@mail.gmail.com>
Subject: Re: [PATCH v2] regulator (max5970): Add hwmon support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     broonie@kernel.org, zev@bewilderbeest.net,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On Fri, 1 Sept 2023 at 20:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/1/23 02:34, Naresh Solanki wrote:
> > Utilize the integrated 10-bit ADC in Max5970/Max5978 to enable voltage
> > and current monitoring. This feature is seamlessly integrated through
> > the hwmon subsystem.
> >
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>
> Nit, but you still have this:
>
> CHECK: From:/Signed-off-by: email comments mismatch: 'From: Naresh Solanki <naresh.solanki@9elements.com>' != 'Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>'
Ack. Will fix it in V3.
>
> > ---
> > Changes in V2:
> > - default case added for switch statement
> > - Add dependency on HWMON
> > ---
> >   drivers/regulator/Kconfig             |   1 +
> >   drivers/regulator/max5970-regulator.c | 123 ++++++++++++++++++++++++++
> >   2 files changed, 124 insertions(+)
> >
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index 965d4f0c18a6..ab245893033d 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -559,6 +559,7 @@ config REGULATOR_MAX5970
> >       depends on I2C
> >       depends on OF
> >       depends on MFD_MAX5970
> > +     depends on HWMON
>
> Not sure if that is acceptable. The maintainer will have to decide.
>
> >       help
> >         This driver controls a Maxim 5970/5978 switch via I2C bus.
> >         The MAX5970/5978 is a smart switch with no output regulation, but
> > diff --git a/drivers/regulator/max5970-regulator.c b/drivers/regulator/max5970-regulator.c
> > index b56a174cde3d..c337044e1523 100644
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
> > @@ -32,6 +33,120 @@ enum max597x_regulator_id {
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
> > +             default:
> > +                     break;
> > +             }
> > +             break;
> > +     case hwmon_curr:
> > +             switch (attr) {
> > +             case hwmon_curr_input:
> > +                     /* Current measurement requires knowledge of the shunt resistor value. */
> > +                     if (ddata->shunt_micro_ohms[channel])
> > +                             return 0444;
>
> missing break;
>
> Interesting, I thought the compiler would complain about that nowadays,
> but apparently it doesn't.
>
> Guenter
>
> > +             default:
> > +                     break;
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
> > @@ -432,6 +547,7 @@ static int max597x_regulator_probe(struct platform_device *pdev)
> >       struct regulator_config config = { };
> >       struct regulator_dev *rdev;
> >       struct regulator_dev *rdevs[MAX5970_NUM_SWITCHES];
> > +     struct device *hwmon_dev;
> >       int num_switches;
> >       int ret, i;
> >
> > @@ -485,6 +601,13 @@ static int max597x_regulator_probe(struct platform_device *pdev)
> >               max597x->shunt_micro_ohms[i] = data->shunt_micro_ohms;
> >       }
> >
> > +     hwmon_dev = devm_hwmon_device_register_with_info(&i2c->dev, "max5970_hwmon", max597x,
> > +                                                      &max5970_chip_info, NULL);
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
