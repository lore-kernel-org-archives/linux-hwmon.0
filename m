Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915063;
	b=r9Lcg/Zf2/FWwYxuP5WxdjX0hlINLIT9HY8x27p1keQo3cSUi5mdoYWHBna5cGRBE8W9
	 Vy1qzhfvtU5Cx3Ex8AVuB9MpjQAIB0qCBVt8mh2OXvUdP6nSpMRkfFUSUbABl3x+BYyzF
	 YcfyhAT8Uda8Man3v1ddKOm1Yh/8yWGzJbceBPEYE9BC54ii9vsk7nZKO8f0cDowdfTd3
	 2pruXAmTNuNPFGV00Uh4UAlGSxVqVwXnmHRsCKn5qM1VhZMspDfLbpotxw1rXGCtKoHdx
	 8zGXtOxUGXn0FKWng8QZEMXyvc6g11HK263JQaOgKHK/BI9SxlTqLd0vv+7LfN2t/Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
	b=TIZe6vIw91xWMjhxM2lhPE9D5Qwh3h58zW6MqFiAyNZYBpCgYUWZn7lU888EO9jSwWtv
	 +ft2AOGXYI94LpYcqIMDf3myZAwI4X7jcsv6ubrrmKg88pfbhp4fuubbQqa57yw4BocWN
	 lHrYN0TJfe5tWTdhmyh+TiLnSIxS0Ke9nHrIRIFe50M7a7FhUzEoiJqaDNP9lczs8eDNs
	 +VlQIwGu/N2uNSSZcCtSVigHhHlePnDuC2FJlisbeYLjFFC+jNCNx4fa8t9tep4nWg1Yf
	 slY/e2rcWpnMOQtbu8Tt0zFN1UZjXPflLq2+5KMiCnAEjdW2/c6iEqdvU8ghYpAZqfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwIoUr8d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D303606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D303606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwIoUr8d
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so556943a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794915062; cv=none;
        d=google.com; s=arc-20260327;
        b=nQVeaK9IBGU1aqg0iCw8j2o3YnNJM3XSKRFjTdKIhqjiD7h+nzFd9GPXts1VlX4fhe
         4rGp/Z6+pK+DR9A8pKMHT9yqA9VCdnivYS6NhVHJUj868ke9B4YxyXc+YOWqALq3rvGL
         OsiELeIrLus47aynbgaERcz3RNxNpbZPXxUCjF7cRSgC5fDheheXRyIsRJ2Ufppwsi8X
         iue8IiN2iT/d4iKiw4UwfBXrKJAeVnTo4WWl3UiAsWDirvrfofH+h3L9DNxtnCzeuKXH
         manfB7ArEA/hdokCTaD95595P24ztga6mso0VIl1u0s0TYoh0jdcIsHb74C76fO0GOm/
         V6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        fh=Jw1BDTKJb760C1Qyd5AKZIUbGJuWkW4macDiXpoMCRc=;
        b=XfFhJzJeib+Yq77V3EXAhk4F8QlIuN7HpijZw0RV55p4e0GqJfU0koluN+ePEc3O45
         S9dFBn8TIRU4ntMQDj37V74wR07XPFJxRbAOel01VS2YrMsHRRi3qCTi7XzFaWTxOikg
         oXGYy/XTP89Jmq6n8b0tVwjzjJ3h0I2M079QUj9vjQJobjyJ5CLOyZXx3ubazXys1WZq
         UPl9LzhJscyrDWGWa5YQft5OZzmyUDiZu+vkojonPgzN6E5O/V7JPYEmPOqgfK2yv6ax
         JRsNSLhRMr0Dapfcv/vkj13eG/H9oXhaqg+VsYNfU6uSoKiZkreB33KSJHVBklOdS9E0
         gUGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915062; x=1795519862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        b=EwIoUr8dYX5uu2QBYSJJWAL7KC8VxBwQlezHVA7WcEJDGlOfNIo8aMgev/cvmDDr+3
         yxwOPTyImz5SLnJlmKhfv6Wu9jeInPZ2Z8kKoAMudYHa3UjlCNEsjLUX8i7ko1sCnBO/
         UX9o9Q4bh6WWgRYqqjsRMFIGPekA44Tpx9mJKsrWnjnlC78OVgqVO+4A76KMqRk6di/G
         g6oznk4Yxu1e8GS6tJsiEtu2QVVrRxAv/1MONqENUPkUVNI5iBSUqdBh9V5E0m9ikqKq
         zp9NxfampMxxsKFeE/zM3yOJlyYmDdSdh7Nubr9CV3a7IbAqA6apkjbyTDGA8c3rTde3
         YU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915062; x=1795519862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHqTog/ne1tIAODWoueABoMI9y3MVejv4Wup7ITBtxs=;
        b=yt/uITNge0Hu0x0LdCLJkWfTbkKxBxvK6A50VLZHZNPVS90WccmLYEYj0iBT0KClCn
         Ywmxxw3awMi2bldreKW5HCKK7gkEKZrpGjozaL7JvZe2NQJVTrOkQ7dtTwwvfqJ/eSRs
         LHneQTi4k1BapX09j3VAw3UQLJRwFqhhkHORapcs4naOxZIgoMbpxHeANsS8kTGw+Jo3
         6UjplQW9Cho43ALLBzJ4bZk3y6FPlsJqdvghl5v6vsNOAkwqSufZxxrZfoQuSAm5Wi2J
         3wXd8RBALy5YSsg3jFxkjyM/Q6Vy0uB7HyDBrJFNzm8Edg2qz3r/UiM0em5XiRJGvtPD
         iCjQ==
X-Forwarded-Encrypted: i=1; AL+hErFAg8TCpBU+5Zom5A7IwRS9yfOLH2GzTEHxUuekEgt/B0vRLICKeJCmwNKu5ub8UtWlppGrOmVxS12dGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OojhD3gqDOdJaWvF+OO+Tu19U50TmK7J8qxNIwzvVZv1EQPGp
	Bc/U/nrNdIiA+xvn+NSatRBhtmGwmz5HetoyBGSbgbGOv9fxJSLxP9meKw0BKmdKUbjcYMgHFNa
	b/3rBgjJIVJ2dlfDg1ND9N/P+6K+NkUE=
X-Gm-Gg: AYBFou1j5lZNqQ2UWHVE0GhFwH8dsWxhuSd0uh2tS9iL4UIqg9FfHMk3WdpSJY4y7P0
	bl5ZLKAX9/Rh984Ex9Pi3OfpCBljJoBbmLfMlnQJFvgvkkeHF7IuTiM0kgfnpwv2c+xjDmspo6m
	LLxd/kqIGbxrz/RncO0qRoakePf5du9vC0dNHTfXED+XXngJNP+f7VITCk88iBsicUum8/VfWgq
	ubWVBZq4D8DDDoKxTzu263m0RhpJexD1WccQ9DDfUfhmN1f42/y+VBCuo5rLhoHW2zuQ6F3ciuL
	MnhBToICW4x9yCY/V+Vqzmsacc0TyWKez2RZexnUrOCoUK2QDFM5CFi1fU9S4S9gEnvKDlFNF3X
	33uWH6oHGgG1dPyPXgVgCFroihSgQfnIqULf3dqE0+FsSdIQNA5vRhc7QMxr8I8hQYh/DCwjyJ9
	Zj39HuUWMRaaFNvx0zJoat/mE=
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id
 4fb4d7f45d1cf-6b7e9026013mr7246878a12.33.1794915061458; Tue, 17 Nov 2026
 03:31:01 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-7-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:30:49 +0100
X-Gm-Features: AclHuK-3AQWyEuEmPx6s_0GtAb_wBlE9MGdQYNlj8Y9ExHWDtBYm7MfD4viHzqc
Message-ID: <CA+=Fv5SHxQq+Fx3hiKdw4_eTw1nP0_Hf7L7rHXJOnzyigi472w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of each alarm attribute whose value changed. The notifier runs
> in machine check context, so it only queues an irq_work, which queues
> the work. The work takes the hwmon device lock to serialize the refresh
> with the sysfs callbacks.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  Documentation/hwmon/marvel-env.rst |  4 ++
>  drivers/hwmon/Kconfig              |  1 +
>  drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++=
++++--
>  3 files changed, 90 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/mar=
vel-env.rst
> index 7e0457a60094..ae3edda557ab 100644
> --- a/Documentation/hwmon/marvel-env.rst
> +++ b/Documentation/hwmon/marvel-env.rst
> @@ -27,6 +27,10 @@ A refresh keeps the boot CPU in the console with inter=
rupts disabled for up
>  to 300 ms per unit, so a unit is refreshed at most once every
>  ``update_interval`` milliseconds (10000 by default).
>
> +The firmware also reports every change of state as a system event machin=
e
> +check. When one arrives, the driver refreshes all units and notifies
> +userspace through the alarm attributes.
> +
>  Sysfs entries
>  -------------
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index c0ce5591c82d..99c5d84c8752 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
>  config SENSORS_MARVEL_ENV
>         tristate "Marvel (EV7) AlphaServer environmental sensors"
>         depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_=
ADDRESS)
> +       select IRQ_WORK
>         help
>           If you say yes here you get support for the temperature, fan,
>           voltage and power supply sensors of Marvel AlphaServers (the
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> index e501e049d702..d319556929e3 100644
> --- a/drivers/hwmon/marvel-env.c
> +++ b/drivers/hwmon/marvel-env.c
> @@ -17,12 +17,15 @@
>   */
>
>  #include <linux/hwmon.h>
> +#include <linux/irq_work.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/gct.h>
>  #include <asm/marvel_env.h>
> @@ -94,16 +97,21 @@ struct marvel_env_chan {
>         unsigned int pkt;               /* packet offset in the node */
>         bool ps;                        /* power supply, as an in channel=
 */
>         bool present;                   /* known when the driver loaded *=
/
> +       u32 alarms;                     /* alarm attributes last reported=
 */
>         char label[32];
>  };
>
>  struct marvel_env_data {
>         struct device *dev;
> +       struct device *hwmon;
>         unsigned int update_interval;   /* ms */
>         struct marvel_env_node *nodes;
>         unsigned int nr_nodes;
>         struct marvel_env_chan *chans[hwmon_max];
>         unsigned int nr_chans[hwmon_max];
> +       struct irq_work irq_work;
> +       struct work_struct work;
> +       struct notifier_block nb;
>  };
>
>  static const char * const pe_names[] =3D {
> @@ -290,6 +298,7 @@ static void marvel_env_add_chan(struct marvel_env_dat=
a *data,
>         c->ps =3D ps;
>         status =3D marvel_env_status(type, c);
>         c->present =3D env_status_valid(status);
> +       c->alarms =3D marvel_env_alarms(type, c, status);
>
>         if (n->cabinet || n->drawer)
>                 len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> @@ -512,6 +521,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types=
 type,
>         }
>  }
>
> +/* Reread everything after a system event and report changed alarms. */
> +static void marvel_env_event_work(struct work_struct *work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(work, struct marvel_env_data, work);
> +       unsigned int i, k;
> +
> +       guard(hwmon_lock)(data->hwmon);
> +
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               data->nodes[i].valid =3D false;
> +               marvel_env_refresh(data, &data->nodes[i]);
> +       }
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++) {
> +                       struct marvel_env_chan *c =3D &data->chans[type][=
i];
> +                       unsigned long changed;
> +                       unsigned int attr;
> +                       u8 status;
> +                       u32 alarms;
> +
> +                       if (!c->present)
> +                               continue;
> +                       status =3D marvel_env_status(type, c);
> +                       if (!env_status_valid(status))
> +                               continue;
> +                       alarms =3D marvel_env_alarms(type, c, status);
> +                       changed =3D alarms ^ c->alarms;
> +                       c->alarms =3D alarms;
> +                       for_each_set_bit(attr, &changed, 32)
> +                               hwmon_notify_event(data->hwmon, type, att=
r, i);
> +               }
> +       }
> +}
> +

This covers crit_alarm, fan_fault and the supplies' in_fault, and the
supply test on the ES47 exercises it end to end. Thanks.

> +static void marvel_env_irq_work(struct irq_work *irq_work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(irq_work, struct marvel_env_data, irq_work);
> +
> +       schedule_work(&data->work);
> +}
> +
> +/* Runs in machine check context, so only queue the irq_work. */
> +static int marvel_env_event(struct notifier_block *nb, unsigned long act=
ion,
> +                           void *unused)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(nb, struct marvel_env_data, nb);
> +
> +       irq_work_queue(&data->irq_work);
> +       return NOTIFY_OK;
> +}
> +
> +static void marvel_env_unregister(void *arg)
> +{
> +       struct marvel_env_data *data =3D arg;
> +
> +       atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb)=
;
> +       irq_work_sync(&data->irq_work);
> +       cancel_work_sync(&data->work);
> +}
> +
>  static const struct hwmon_channel_info * const marvel_env_chip_info =3D
>         HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
>
> @@ -522,7 +597,6 @@ static int marvel_env_probe(struct platform_device *p=
dev)
>         const struct hwmon_channel_info **info;
>         struct marvel_env_data *data;
>         struct hwmon_chip_info *chip;
> -       struct device *hwmon;
>         unsigned int i, k, nr_info =3D 0;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -591,9 +665,16 @@ static int marvel_env_probe(struct platform_device *=
pdev)
>         chip->ops =3D &marvel_env_ops;
>         chip->info =3D info;
>
> -       hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME, data=
, chip,
> -                                                    NULL);
> -       return PTR_ERR_OR_ZERO(hwmon);
> +       data->hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME=
, data,
> +                                                          chip, NULL);
> +       if (IS_ERR(data->hwmon))
> +               return PTR_ERR(data->hwmon);
> +
> +       init_irq_work(&data->irq_work, marvel_env_irq_work);
> +       INIT_WORK(&data->work, marvel_env_event_work);
> +       data->nb.notifier_call =3D marvel_env_event;
> +       atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
> +       return devm_add_action_or_reset(dev, marvel_env_unregister, data)=
;
>  }
>
>  static struct platform_driver marvel_env_driver =3D {
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
