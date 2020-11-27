Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8978EC2D0E4
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 16:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41447208D5
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 16:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="BjIuPB8/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730826AbgK0QK3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Nov 2020 11:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgK0QK2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Nov 2020 11:10:28 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B831C0613D1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2020 08:10:27 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id y74so6342541oia.11
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2020 08:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eYEdwKr2b7wjSSZToji0jUi86bV85T0/r4g0TROn0Rc=;
        b=BjIuPB8/+edrgcfqZO6mYq42BHqNmgVJ648JiNmGK2ZzFnACH6jRQx81k6iCRdah+I
         cb+1jpJUJPVWjki4UycUXDzLbxqJODtG/RTDhdL5GhhGwsdJyghsGAiOb6mrP0GB05Ee
         Vvyfxnd+ynNvdcL+oUIeCXJUirMoGuuHvnJFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYEdwKr2b7wjSSZToji0jUi86bV85T0/r4g0TROn0Rc=;
        b=cah21Fym1+Wwa0z9XGgPqs9CYGbN3pqbKjsIbiGkjbQkow4TcH43pQ+/VmgVTbgixT
         mvutCWFJarWu9byyam5+MMU6acth+rvrivOR7yHMeBjA9hirkIe70mj5l0MafIiwGCE+
         JU2od8geo1ACkjMPZDA5+LPdpqTI4W4IH4hzwmnTwItSkFid4WN9Et96SOYoGRti2p8H
         pjr37wf7EpwOl9328oShnMUksVVxnpceKl68VH0dKw7tos0WeIC8sBRornbh6kD/wCkJ
         ZRRLISdfRIVHwfmG3s3BozmS3QDpbXOLRI+D6E7eM2Aw9opjk0xhBzWkcYrE6l4I4NKh
         w0rw==
X-Gm-Message-State: AOAM533bGhgb47Gn47G06aQ2fUOAAPAEssQHLDUWarG+nE6eU8Kegv+F
        ngd5F4BV/IJq8mYMKn9ZEJysBzm6H29lneygY0M+9g==
X-Google-Smtp-Source: ABdhPJxwvyU4QsOl/QWk/DQC2pGtZrMx1vP/bxKIgeS4PUMjHbvBMpIevcb9L74nqHYtMIdwMFB6i/RVJLpKoxTxwjk=
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr5854564oih.152.1606493426575;
 Fri, 27 Nov 2020 08:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20201126174408.755-1-pbarker@konsulko.com> <20201126174408.755-3-pbarker@konsulko.com>
 <20201127155539.GA9519@roeck-us.net>
In-Reply-To: <20201127155539.GA9519@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Fri, 27 Nov 2020 16:10:15 +0000
Message-ID: <CAM9ZRVvSDn+FHBk3dsfxHpkVaw2XzRcqOvY6oPK-70y_mfqQZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: Convert to hwmon_device_register_with_info
 API
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 27 Nov 2020 at 15:55, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Nov 26, 2020 at 05:44:08PM +0000, Paul Barker wrote:
> > The pwm-fan driver is updated to use the recommended API.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  drivers/hwmon/pwm-fan.c | 112 +++++++++++++++++++++++++---------------
> >  1 file changed, 71 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> > index efe2764f42d3..c8a1d41d6f06 100644
> > --- a/drivers/hwmon/pwm-fan.c
> > +++ b/drivers/hwmon/pwm-fan.c
> > @@ -8,7 +8,6 @@
> >   */
> >
> >  #include <linux/hwmon.h>
> > -#include <linux/hwmon-sysfs.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -39,6 +38,28 @@ struct pwm_fan_ctx {
> >       unsigned int pwm_fan_max_state;
> >       unsigned int *pwm_fan_cooling_levels;
> >       struct thermal_cooling_device *cdev;
> > +
> > +     struct hwmon_chip_info info;
> > +};
> > +
> > +static const u32 pwm_fan_channel_config_pwm[] = {
> > +     HWMON_PWM_INPUT,
> > +     0
> > +};
> > +
> > +static const struct hwmon_channel_info pwm_fan_channel_pwm = {
> > +     .type = hwmon_pwm,
> > +     .config = pwm_fan_channel_config_pwm,
> > +};
> > +
> > +static const u32 pwm_fan_channel_config_fan[] = {
> > +     HWMON_F_INPUT,
> > +     0
> > +};
> > +
> > +static const struct hwmon_channel_info pwm_fan_channel_fan = {
> > +     .type = hwmon_fan,
> > +     .config = pwm_fan_channel_config_fan,
> >  };
>
> In general I'd suggest to use the HWMON_CHANNEL_INFO() macro instead,
> but I think this is to prepare for a dynamic number of channels.
> With that in mind, it is ok.
>
> >
> >  /* This handler assumes self resetting edge triggered interrupt. */
> > @@ -103,14 +124,14 @@ static void pwm_fan_update_state(struct pwm_fan_ctx *ctx, unsigned long pwm)
> >       ctx->pwm_fan_state = i;
> >  }
> >
> > -static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
> > -                      const char *buf, size_t count)
> > +static int pwm_fan_write(struct device *dev, enum hwmon_sensor_types type,
> > +                      u32 attr, int channel, long val)
> >  {
> >       struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> > -     unsigned long pwm;
> > +     unsigned long pwm = val;
> >       int ret;
> >
> > -     if (kstrtoul(buf, 10, &pwm) || pwm > MAX_PWM)
> > +     if (pwm > MAX_PWM)
> >               return -EINVAL;
>
> This happens to catch negative values, but it is odd and somewhat difficult
> to review and understand. I would suggest to drop the pwm variable and use
>         if (val < 0 || val > MAX_PWM)
>                 return -EINVAL;
> instead.
>
> >
> >       ret = __set_pwm(ctx, pwm);
> > @@ -118,55 +139,50 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
> >               return ret;
> >
> >       pwm_fan_update_state(ctx, pwm);
> > -     return count;
> > +     return 0;
> >  }
> >
> > -static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
> > -                     char *buf)
> > +static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
> > +                     u32 attr, int channel, long *val)
> >  {
> >       struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> >
> > -     return sprintf(buf, "%u\n", ctx->pwm_value);
> > -}
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             *val = ctx->pwm_value;
> > +             return 0;
> >
> > -static ssize_t rpm_show(struct device *dev,
> > -                     struct device_attribute *attr, char *buf)
> > -{
> > -     struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> > +     case hwmon_fan:
> > +             *val = ctx->rpm;
> > +             return 0;
> >
> > -     return sprintf(buf, "%u\n", ctx->rpm);
> > +     default:
> > +             return -EINVAL;
>
>                 return -EOPNOTSUPP;
>
> > +     }
> >  }
> >
> > -static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> > -static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
> > +static umode_t pwm_fan_is_visible(const void *data,
> > +                               enum hwmon_sensor_types type,
> > +                               u32 attr, int channel)
> > +{
> > +     struct pwm_fan_ctx *ctx = (struct pwm_fan_ctx *)data;
> >
> > -static struct attribute *pwm_fan_attrs[] = {
> > -     &sensor_dev_attr_pwm1.dev_attr.attr,
> > -     &sensor_dev_attr_fan1_input.dev_attr.attr,
> > -     NULL,
> > -};
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             return 0644;
> >
> > -static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
> > -                                  int n)
> > -{
> > -     struct device *dev = container_of(kobj, struct device, kobj);
> > -     struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> > +     case hwmon_fan:
> > +             return 0444;
> >
> > -     /* Hide fan_input in case no interrupt is available  */
> > -     if (n == 1 && ctx->irq <= 0)
> > +     default:
> >               return 0;
> > -
> > -     return a->mode;
> > +     }
> >  }
> >
> > -static const struct attribute_group pwm_fan_group = {
> > -     .attrs = pwm_fan_attrs,
> > -     .is_visible = pwm_fan_attrs_visible,
> > -};
> > -
> > -static const struct attribute_group *pwm_fan_groups[] = {
> > -     &pwm_fan_group,
> > -     NULL,
> > +static const struct hwmon_ops pwm_fan_hwmon_ops = {
> > +     .is_visible = pwm_fan_is_visible,
> > +     .read = pwm_fan_read,
> > +     .write = pwm_fan_write,
> >  };
> >
> >  /* thermal cooling device callbacks */
> > @@ -287,6 +303,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
> >       int ret;
> >       struct pwm_state state = { };
> >       int tach_count;
> > +     size_t sz;
> > +     const struct hwmon_channel_info **channels;
> >
> >       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> >       if (!ctx)
> > @@ -340,6 +358,13 @@ static int pwm_fan_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, tach_count,
> >                                    "Could not get number of fan tachometer inputs\n");
> >
> > +     sz = (2 + tach_count) * sizeof(struct hwmon_channel_info *);
> > +     channels = devm_kzalloc(dev, sz, GFP_KERNEL);
>
> devm_kcalloc() is preferred.
>         channels = devm_kcalloc(dev, tach_count + 2,
>                                 sizeof(struct hwmon_channel_info *), GFP_KERNEL);
>
> > +     if (!channels)
> > +             return -ENOMEM;
> > +
> > +     channels[0] = &pwm_fan_channel_pwm;
> > +
> >       if (tach_count > 0) {
> >               u32 ppr = 2;
> >
> > @@ -371,10 +396,15 @@ static int pwm_fan_probe(struct platform_device *pdev)
> >
> >               ctx->sample_start = ktime_get();
> >               mod_timer(&ctx->rpm_timer, jiffies + HZ);
> > +
> > +             channels[1] = &pwm_fan_channel_fan;
> >       }
> >
> > -     hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan",
> > -                                                    ctx, pwm_fan_groups);
> > +     ctx->info.ops = &pwm_fan_hwmon_ops;
> > +     ctx->info.info = channels;
> > +
> > +     hwmon = devm_hwmon_device_register_with_info(dev, "pwmfan",
> > +                                                  ctx, &ctx->info, NULL);
> >       if (IS_ERR(hwmon)) {
> >               dev_err(dev, "Failed to register hwmon device\n");
> >               return PTR_ERR(hwmon);

Thanks for the review. Those are all straightforward changes so I'll
make them and send a v2.

-- 
Paul Barker
Konsulko Group
