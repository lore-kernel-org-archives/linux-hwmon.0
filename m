Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99AF140381
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Jun 2024 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272331; cv=none; b=CBINGVqPphOP9XhiY/sDXi9DBHH2kDWUOwdgg2qQcYWoix0oH0pg7lAOag4uV9D+oD0Vxg5PtGwKBX6EiFvbB4YAYSDNplXwaJECbHS1rRp00eyiETUSKB0m2yc057lCQyUV/hqrvXIeFBKxJZ+fDpNT8ERt93EpZe9Eb3n5Lw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272331; c=relaxed/simple;
	bh=FgEZ83BbUZDdhh6OE9jruHlNefyUN4waZuPcjz1kyng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8u1tYqGi18DchTJgxWIyzy/Xkx/vMHCHZz5zFqsZUnZzEicpDdWIEGkHfwmJpYDoIczCP4haaEXl8oXGsMhN4aoLKOvq/Ed/0veijYL9CKoafSGdvPs2GqQWwMY4nP5Rn1SXTQjqeoBg51IOQLLjw/hg9I5DO21XjcHz5hwo+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=JZX2sPnU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="JZX2sPnU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c2c6b27428so599818a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Jun 2024 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1718272329; x=1718877129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOfCY9Yo/89iNmQQ1MgsJNPnyHBaOODSKsxbUGx0JtA=;
        b=JZX2sPnUinx8APH0MyVhH/93F1hptjUzzgRN6F23r0SO1psWUV0Mlh3otgHAJ8B0zZ
         PP3yA/voXtyBFckt6G4UmzbxRqoT6uEduo6G1sVJDqAql3vmxtKhT5Bv2b/OfsX1IUCR
         xHLfX6kSS8TVCLfMdH+Qkx0ic0rCgrXrWnyXl/irTIsNL/FI7O9v33B24T5BTDsoOl9S
         kFWAk4qeEZ31l76uJHDqJgzy0sL/3V75hhnvTPwGnmAaQYo7vp4UFSjsO6l1hsewaMbx
         HkoE4OOwJibdCJH4kBC9vCalKFawnUs8MVPy3BMl4o1lm7J0w6HIE4zN07bBf1Vepzp8
         Hk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718272329; x=1718877129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOfCY9Yo/89iNmQQ1MgsJNPnyHBaOODSKsxbUGx0JtA=;
        b=sgYAz7jKA9SWvjABdKveVdniLhkiVYK4DHBfZlSeG8UtMy0IfsF922XF1jRtgSN1TE
         tKfzFFaFYB73UHibmTtPPXsjKks6KBEw1PVWZbobkRznj2DYTdT+pJd35tZj1e0fow/3
         JqZhFSUWFDbSy8rz78lAnIL4UK9GkJFCCs1jyZoJ+XE9OgNZ5N1y680dE3X62zfQUGGJ
         lKd9hJfwH//Fgbdvul0LmceHj092jaaGV2YwZRnAcDp6kUXvPQx4EpiQOLIYW/FDAdy/
         DgbPKrQSqcFELgmnNas/92kHcT6kWNKyhWg4yMjnYM2FT2ivAZ0srYdrsOSAaobqvUAs
         Dejw==
X-Forwarded-Encrypted: i=1; AJvYcCWIn1piHcDXJFjGmvk9LG+Do4g01PIK01Wy1hDdJSWZrAWCU5DQN72pNq/LBVPi3tKpS6mgG58BYKHOyGyVv3ECGRGHuRbMJts+sNs=
X-Gm-Message-State: AOJu0YzOG7GcPQdn5PcKu+xRTejQDlB6LAEze4buDllino17fwC12m/q
	h1DkucCvFCu2L/ileWHa4mkPRDrijW+mdlonbEpxGe0t3kx2RnbqEEDI1o35oCvsz+YxhKmP7nU
	UHWIBomdrIn84RSyZLkR1k4/gcky15yTYJUT0aQ==
X-Google-Smtp-Source: AGHT+IHBgI/EKRGnimIT+Se0pTH2cINIAU5j87QscBN772mFyQzpugEGWwYUsfLZc0BegHZVKRqQLpneAdf6J6ln52A=
X-Received: by 2002:a17:90a:9a8d:b0:2c4:d097:f8b2 with SMTP id
 98e67ed59e1d1-2c4d097fa3amr360015a91.13.1718272329130; Thu, 13 Jun 2024
 02:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604124742.4093334-1-naresh.solanki@9elements.com>
 <20240604124742.4093334-2-naresh.solanki@9elements.com> <3bd9a52e-bfca-4ac2-af48-59772de8b61e@roeck-us.net>
In-Reply-To: <3bd9a52e-bfca-4ac2-af48-59772de8b61e@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Thu, 13 Jun 2024 15:21:59 +0530
Message-ID: <CABqG17gS=qfrJCkug5aca6Ag1JSPhbFbfr7X8x7XLCpDwtOMAw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: (max6639) : Add hwmon attributes for fan
 and pwm
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Wed, 12 Jun 2024 at 21:25, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/4/24 05:47, Naresh Solanki wrote:
> > Add attribute for fan & pwm i.e.,
> > fanY_pulse
> > pwmY_freq
> >
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >   drivers/hwmon/max6639.c | 74 ++++++++++++++++++++++++++++++++++++++---
> >   1 file changed, 70 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
> > index e2a5210f9f95..6c7eaeeb2a80 100644
> > --- a/drivers/hwmon/max6639.c
> > +++ b/drivers/hwmon/max6639.c
> > @@ -235,6 +235,9 @@ static int max6639_read_fan(struct device *dev, u32 attr, int channel,
> >                       return res;
> >               *fan_val = !!(val & BIT(1 - channel));
> >               return 0;
> > +     case hwmon_fan_pulses:
> > +             *fan_val = data->ppr[channel];
> > +             return 0;
> >       default:
> >               return -EOPNOTSUPP;
> >       }
> > @@ -246,6 +249,32 @@ static int max6639_set_ppr(struct max6639_data *data, int channel, u8 ppr)
> >       return regmap_write(data->regmap, MAX6639_REG_FAN_PPR(channel), ppr-- << 6);
> >   }
> >
> > +static int max6639_write_fan(struct device *dev, u32 attr, int channel,
> > +                          long val)
> > +{
> > +     struct max6639_data *data = dev_get_drvdata(dev);
> > +     int err;
> > +
> > +     if (IS_ERR(data))
> > +             return PTR_ERR(data);
> > +
>
> Unnecessary check.
Ack.
>
> > +     switch (attr) {
> > +     case hwmon_fan_pulses:
> > +             if (val <= 0 || val > 5)
> > +                     return -EINVAL;
> > +
> > +             /* Set Fan pulse per revolution */
> > +             err = max6639_set_ppr(data, channel, val);
> > +             if (err < 0)
> > +                     return err;
> > +
> > +             data->ppr[channel] = val;
>
> Needs mutex protection to avoid inconsistencies due to concurrent writes.
This is single i2c access. Still we need mutex protection here ?
>
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> >   static umode_t max6639_fan_is_visible(const void *_data, u32 attr, int channel)
> >   {
> >       struct max6639_data *data = (struct max6639_data *)_data;
> > @@ -270,6 +299,7 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
> >       struct max6639_data *data = dev_get_drvdata(dev);
> >       unsigned int val;
> >       int res;
> > +     u8 i;
> >
> >       if (IS_ERR(data))
> >               return PTR_ERR(data);
> > @@ -281,6 +311,21 @@ static int max6639_read_pwm(struct device *dev, u32 attr, int channel,
> >                       return res;
> >               *pwm_val = val * 255 / 120;
> >               return 0;
> > +     case hwmon_pwm_freq:
> > +             res = regmap_read(data->regmap, MAX6639_REG_FAN_CONFIG3(channel), &val);
> > +             if (res < 0)
> > +                     return res;
> > +             i = val & MAX6639_FAN_CONFIG3_FREQ_MASK;
> > +
> > +             res = regmap_read(data->regmap, MAX6639_REG_GCONFIG, &val);
> > +             if (res < 0)
> > +                     return res;
> > +
> > +             if (val & MAX6639_GCONFIG_PWM_FREQ_HI)
> > +                     i |= 0x4;
>
> This sequence will need to be mutex protected to avoid consistency errors if
> a write happens at the same time.
Ack. Yes, there is multiple access to the device. Will update accordingly.
>
>
> > +             i &= 0x7;
> > +             *pwm_val = freq_table[i];
> > +             return 0;
> >       default:
> >               return -EOPNOTSUPP;
> >       }
> > @@ -291,6 +336,7 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
> >   {
> >       struct max6639_data *data = dev_get_drvdata(dev);
> >       int err;
> > +     u8 i;
> >
> >       if (IS_ERR(data))
> >               return PTR_ERR(data);
> > @@ -301,6 +347,23 @@ static int max6639_write_pwm(struct device *dev, u32 attr, int channel,
> >               err = regmap_write(data->regmap, MAX6639_REG_TARGTDUTY(channel),
> >                                  val * 120 / 255);
> >               return err;
> > +     case hwmon_pwm_freq:
> > +             val = clamp_val(val, 0, 25000);
> > +
> > +             i = find_closest(val, freq_table, ARRAY_SIZE(freq_table));
> > +
> > +             err = regmap_update_bits(data->regmap, MAX6639_REG_FAN_CONFIG3(channel),
> > +                                      MAX6639_FAN_CONFIG3_FREQ_MASK, i);
> > +             if (err < 0)
> > +                     return err;
> > +
> > +             if (i >> 2)
> > +                     err = regmap_set_bits(data->regmap, MAX6639_REG_GCONFIG,
> > +                                           MAX6639_GCONFIG_PWM_FREQ_HI);
> > +             else
> > +                     err = regmap_clear_bits(data->regmap, MAX6639_REG_GCONFIG,
> > +                                             MAX6639_GCONFIG_PWM_FREQ_HI);
>
> Same as above. In general, every operation with more than a single element
> needs to be mutex protected.
Ack.

Regards,
Naresh
>
> > +             return err;
> >       default:
> >               return -EOPNOTSUPP;
> >       }
> > @@ -310,6 +373,7 @@ static umode_t max6639_pwm_is_visible(const void *_data, u32 attr, int channel)
> >   {
> >       switch (attr) {
> >       case hwmon_pwm_input:
> > +     case hwmon_pwm_freq:
> >               return 0644;
> >       default:
> >               return 0;
> > @@ -415,6 +479,8 @@ static int max6639_write(struct device *dev, enum hwmon_sensor_types type,
> >                        u32 attr, int channel, long val)
> >   {
> >       switch (type) {
> > +     case hwmon_fan:
> > +             return max6639_write_fan(dev, attr, channel, val);
> >       case hwmon_pwm:
> >               return max6639_write_pwm(dev, attr, channel, val);
> >       case hwmon_temp:
> > @@ -442,11 +508,11 @@ static umode_t max6639_is_visible(const void *data,
> >
> >   static const struct hwmon_channel_info * const max6639_info[] = {
> >       HWMON_CHANNEL_INFO(fan,
> > -                        HWMON_F_INPUT | HWMON_F_FAULT,
> > -                        HWMON_F_INPUT | HWMON_F_FAULT),
> > +                        HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_PULSES,
> > +                        HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_PULSES),
> >       HWMON_CHANNEL_INFO(pwm,
> > -                        HWMON_PWM_INPUT,
> > -                        HWMON_PWM_INPUT),
> > +                        HWMON_PWM_INPUT | HWMON_PWM_FREQ,
> > +                        HWMON_PWM_INPUT | HWMON_PWM_FREQ),
> >       HWMON_CHANNEL_INFO(temp,
> >                          HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_MAX | HWMON_T_MAX_ALARM |
> >                          HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_EMERGENCY |
>
