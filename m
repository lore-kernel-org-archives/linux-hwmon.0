Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2238143C63
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2024 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782190; cv=none; b=PpWpiLp46l4LlGOTUfXFWnpkPji+WhwgbEl809/MxgHuZpgsLZlJxeCxdnuUOUq81QNiq9PY4t0BR0pJvZn22wf1448BdlCyRUARZqgcAK0R1B4nu8gi8ijqdsv0UHiVi0h2T/FEChbBSKdYCc9ci4aCo6eWMLP7NafbwkogCxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782190; c=relaxed/simple;
	bh=LEAgVPRS/v7QMqRe2lYOSIBa2FBbjKuZ1bzeNhjcAjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3f3ME6foqItMNLrCBrczkkezAeAXUW3/7ETyqJdCvCn9ZsSDP3V9Kiw+ssJc/tWr48kKM/yQJfJzeduIlLwFcJTM7HNKyIa6RVsgdcRuN86EpFa1blWXxwcwmTyX0A6halgai5vWKv0a17CWNEvH+2EEqn6cgz2RP+lFmL/tl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=CdaNymqS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="CdaNymqS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2a614b0391dso3286520a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Apr 2024 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1713782187; x=1714386987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X4bOgoi4dBCbRXc3BVmosIsW8tNXMI2zajK7wfOqMv4=;
        b=CdaNymqSWBnhi9O8hFXyPZ+1tRAXMzpVsCBdEb+3kMcBwQWTdIIE+hkAYROZoXQaNL
         frr6oq/pUtDqZMsoPOa1bjBJGhQCr3viPF1f7JBhSRljtOoH8NAweQoEj6m/qDdmXvPo
         jQqRqZLVNbGFcNXPXDn2lt5G334zj1JuJIrf+sBBlIxIcIlCBvj7mPFQ+eMLk7/8F/8+
         lzqtL3A2oaGkuo8tnR4oAagAk7yhBTUuNCqFZULd7qZhWCGbf4cB/SPo94RifWpjBiDs
         iqrofWei9OlDyA2MbPUvw1CgHGY2RKakH2/HJPWykyYIEcE8HJAqQTwQ30ZYvSj9WStH
         xMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782187; x=1714386987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4bOgoi4dBCbRXc3BVmosIsW8tNXMI2zajK7wfOqMv4=;
        b=CTcx3TkgOvQYtXy3srrwIAaR3EuVZu+e13PmbOIiemJtBIW32z8VZFccSdvQxw6+uc
         HWBns5RLbv8ZssNJtAw3MbsiWR4+X8fM8vgPNM6EARbFGzmgY0rT2mkjzktsQ7Zw5gWf
         joj6fqf1nCVVQRll/LGLEZfwyjNyW0swo5cS510SbvlGAHx4G5yqc+Kqd1kBKTYrw2qf
         Etm5mhyYBr6RF2o24QSV5zZkEw6FQYeco3QNC28tk342d/En4wFKuRHKlLv4jQ5hDRVq
         DfmKH3RtaQ0L3wQvQDJVmHQkePvs11XQfsvqFiCZWl44hW0RlYwG0MpRQpcpVuu8UHne
         +WXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLW8X5gu6LOuDgshefo7zXkIJzROlaYGWRLT+7BWxIMJ5VQOFVc9es5zUBndSpn0OnlM6iWo1mXarTryo36SiHrHLaIdijoo4PusU=
X-Gm-Message-State: AOJu0YyTRHsd7vLrpfxYrO8cNNVMLHflw18e7o2hlbzW0ydaNnviz50K
	xewTMt/OelWZouzDoqAhsVElFXHfwMv1IvukbguxjV5IvqVrSz9NrPecuxgs9bzda5BRMpGovoG
	MY2UULWVVwBJ4GhJPO42//AR2dlTZZTiHvcvs+g==
X-Google-Smtp-Source: AGHT+IHazBc0sRj+m/5muVKfbwOG9ihKE67/I/fj532JFu5vMsH6MbVYTZ/iULzXjdmvjaREaQX7NijQSIIDMVyYgrA=
X-Received: by 2002:a17:90a:de02:b0:2a5:275c:ed with SMTP id
 m2-20020a17090ade0200b002a5275c00edmr8787229pjv.23.1713782187244; Mon, 22 Apr
 2024 03:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416171720.2875916-1-naresh.solanki@9elements.com> <65607114-89f8-4f48-83fc-b89d87fee247@roeck-us.net>
In-Reply-To: <65607114-89f8-4f48-83fc-b89d87fee247@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 22 Apr 2024 16:06:16 +0530
Message-ID: <CABqG17jveAdxN+tCcPq4hNqWDy1YCJ1z0+kLpM+ect0XEyqBcA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hwmon (max6639): Use regmap
To: Guenter Roeck <linux@roeck-us.net>
Cc: krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Wed, 17 Apr 2024 at 02:55, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Apr 16, 2024 at 10:47:14PM +0530, Naresh Solanki wrote:
> > Add regmap support.
> >
>
> Missing (and not really utilizing) the benefits of using regmap.
This is just replacing with regmap support
>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  drivers/hwmon/Kconfig   |   1 +
> >  drivers/hwmon/max6639.c | 157 ++++++++++++++++++++--------------------
> >  2 files changed, 80 insertions(+), 78 deletions(-)
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index c89776d91795..257ec5360e35 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1223,6 +1223,7 @@ config SENSORS_MAX6621
> >  config SENSORS_MAX6639
> >       tristate "Maxim MAX6639 sensor chip"
> >       depends on I2C
> > +     select REGMAP_I2C
> >       help
> >         If you say yes here you get support for the MAX6639
> >         sensor chips.
> > diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
> > index aa7f21ab2395..1af93fc53cb5 100644
> > --- a/drivers/hwmon/max6639.c
> > +++ b/drivers/hwmon/max6639.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/err.h>
> >  #include <linux/mutex.h>
> >  #include <linux/platform_data/max6639.h>
> > +#include <linux/regmap.h>
> >
> >  /* Addresses to scan */
> >  static const unsigned short normal_i2c[] = { 0x2c, 0x2e, 0x2f, I2C_CLIENT_END };
> > @@ -57,6 +58,8 @@ static const unsigned short normal_i2c[] = { 0x2c, 0x2e, 0x2f, I2C_CLIENT_END };
> >
> >  #define MAX6639_FAN_CONFIG3_THERM_FULL_SPEED 0x40
> >
> > +#define MAX6639_NDEV                         2
> > +
> >  static const int rpm_ranges[] = { 2000, 4000, 8000, 16000 };
> >
> >  #define FAN_FROM_REG(val, rpm_range) ((val) == 0 || (val) == 255 ? \
> > @@ -67,7 +70,7 @@ static const int rpm_ranges[] = { 2000, 4000, 8000, 16000 };
> >   * Client data (each client gets its own)
> >   */
> >  struct max6639_data {
> > -     struct i2c_client *client;
> > +     struct regmap *regmap;
> >       struct mutex update_lock;
> >       bool valid;             /* true if following fields are valid */
> >       unsigned long last_updated;     /* In jiffies */
> > @@ -95,9 +98,8 @@ struct max6639_data {
> >  static struct max6639_data *max6639_update_device(struct device *dev)
> >  {
> >       struct max6639_data *data = dev_get_drvdata(dev);
> > -     struct i2c_client *client = data->client;
> >       struct max6639_data *ret = data;
> > -     int i;
> > +     int i, err;
> >       int status_reg;
> >
> >       mutex_lock(&data->update_lock);
> > @@ -105,39 +107,35 @@ static struct max6639_data *max6639_update_device(struct device *dev)
>
> Conversions to regmap should drop all local caching and use regmap
> for caching (where appropriate) instead.
max6639_update_device deals with volatile registers & caching isn't
available for these.

Please let me know if there is specific optimization that you were looking for.

Regards,
Naresh
>
> Guenter
