Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794736192;
	b=nW4TqNkbM6dEqpnHMgDcGxoQ0RAWPGGbwYlmofqcNB28TbYaKXMSGLVbhDGYf5T6ibCc
	 E4MJ7NhS/0Vi7u6jfstzK56DTlTjU1NMPyr4GyRDyD+YtjC6Dmc+0lcWjWTxEXl+11bT4
	 kyhKEnDWwp7xlpnLbHXL0soMwzFRZt4+k5SryxVLdanam19+h5px4ZUf5NefbSXsR/tYr
	 li9YHo3mWBcB2Udg80y4UpYRT1PCaOSKXKhamzEzgW3hQwA6fd/eQOxnsnym+wwJIe8Pj
	 TtEY4SE3aEUeSBvrF5JfUNDwvyQ7FGB0R1pAgLVFwIzZPXp9hVRJDN18ngFnwvf+czQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
	b=MksbLOvtwdkm7ELUWNUh0k2dB20qWa2DNBddE71rleu71WaNemnaTxDOe5Qf/vKu7I0B
	 t5/zNElmLBhZLIS9XjvNZ/rvHN/Z2FfR6ftyNejmTz1vl2a8VDz3u+ce0WEK+mJBVT/Te
	 OLQIKNQS4vsSdoCtynqG25IH97j8y1aH8Pq0CrfcB8uwZd+UkdBh6lUWHJJqpImWyrmG9
	 vnTXD8QNTpM08DyRqI95mk5OPFW0fV/e+eRbpUt6wl10RIxMY5YuB2SHcEhWSk6YEpjBW
	 GJxl3Gxy0J5kVqB2J3SLGI8VP4nLLADXFg3pMq3TQ4qS8u8VE/7P8VyMfyhpcY37oMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kno+NK60;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA98606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 09:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA98606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kno+NK60
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso2509220a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 01:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794736190; cv=none;
        d=google.com; s=arc-20260327;
        b=WXzfZ+ptm04ruqriDNcALRMX3oVdKizexGXn9qmFcelNIq8jmtp2hddOhiGUT04bFs
         0YRFnx0ArOOeNihDYMpoEWPD1uEQhVPuKECHGumhXM5ukUZPjXTUqo0R8d5bpp8GDBWj
         u4tqbUhDSP9VOBsJOc5oZOmfan8Gt1QgYH+nAMNFKbJ3BmW64CLlp3rSblhPCfJHvrA1
         ugXv0Whx+KwABih461Eb/Fb63sDYmLIw9MVXq2lIkEXT5cRtnC6Im72s4V6XW6nPtmNT
         tLhfPDKkiBIEd8k80GrnrNJs6PkocRbZM+E4EOLobcWv/jOXRzfJJSNvrnDVm2cPSGCq
         qekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
        fh=kSB1oIPL/pVXSqyjrmj1Eb+gPOy1ZxhTYDVaNz3QKTc=;
        b=fy9br7q+cWjP8qFHKTHZZkHLgol65G3IeBUoHncTOc5KqvLsGAMhMg88dNv5nMqaCE
         tD2slq3R8ZlR/N1kVPdrAyMgKgNWVF4fCs3HejW/XzIwgIPKJgISywHrdyXjvjkD/5vX
         8A4QjL0QQYt+PMpbMED8swb+zdXGqyzZf+wWRzYWbR+6QicKm84smKmLU0je0VkBDjps
         z6ZfdzCG3I/5UUrpIPPqzngd8tuk/jsFiNNb8/8ajrfdM5OnBUddxRYachpC3IsJv3Rb
         iSHtscLhJyO5YYXi90ODs8ZH9l/Hn6CchryoAUpv6oFzGK5cuZPhf45e1l6kK2gAQZBw
         iALA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794736190; x=1795340990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
        b=kno+NK60r8jxNBTQ1AXmjamD3XzlFkzX0wFPaVSt0YOkrBktfxeKWV5XroNY3l8by+
         doqlo+lGMRxPqG6Kd3RYWPzTCA6GNWm5wUkqRrsbw6gMbAaMueyjcf9dUSLb1j/uKjqF
         dJzdGDUwWE1KOYyluuRWWFpQtWrQmXZCm6ef/rurR2TmTg6deI1bOpd5iF8QtxV64cZF
         lQbxU6G937bTAlOHu1FgzOYMreLdzbHaBKFMCFVPRgBTynTTFe5AmpdNtiI4EIHT7NnM
         q69z93rT6NfHGPp1K4DaGCbIgiVsHhY3Hg3tOZf/yCj6I1WtHUEuMpBknC5ZhXbwnx13
         x4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736190; x=1795340990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UK343mUy01H1/Ns82fEJYNJUb4iFiuMHSBjmIFuYfD4=;
        b=iSy4SO3Dd23zxx5/nv9oNq9cAm+02bmJy7r1046A5idZqilade7E4GAipI8AMS9s5V
         HY3ODC4EAcfgMoUXIGr8zNrhxPY+hxM7RyUZjEixXX/XH4Po4QFAtnmQ1fNtynIh5zwJ
         gSTjVwNsoOpFjbwnp0tCJnql7M7sdLXBnEFkO16q3XLoEgM1KYR2eN4okCoEmQkkBfKi
         IOGs3JqmAm1b67kVW1eAEhhMsAgFuJmLsyBRsB/bJzW/JGWeS7o4CNGDC2mufik08kdN
         rNein8+s3QKPN41MNzDSbJ7YYvc/RYIVFVE8ZwlCPWfySKqNiC7X8jndMxmFZ0yFcCld
         l3dg==
X-Forwarded-Encrypted: i=1; AL+hErGuWj74qYtqFEGky2Cs5byqSOvBIsEuGUGEZQXbSrWcwq683BpQKFMaoIw7IE6wJINPX2i9ZQv5KgsBMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8LpJQe2R2INHQKFHBVYeR9Mj0x9xsIWlNECAVP5R2PC7rC18VZ
	kUQPIxc81wjycx3sRgbz5fKNJ5lZljOz7LcRx9F5s5XCcIINOvL0Te1k5FFAAT+bfjN9bYqXtNn
	/M6hR8CSo1lyF+mgi+SIX29UQi+4MFA79kiFg
X-Gm-Gg: AYBFou3ohU4qDtZDyxXwJYlEJqsMvVG9r0NtQmMcnGdExsANfj6tDy/FuIWaUl+i0eG
	U3yoqXsV7FxJZ0/+DZ/egs8ayGtvKZNjIK5/qorA1eoymX8g8f6sG6sWAuGI1giLYr8QxlYrN5A
	iuZS13xl3VM2FtJpS6j7XVvGWhuUUNL0MLMYIFTRVNK19XG1eLdVBgyO9QFU6c0hKrl4Sn9j/BA
	plOOapQ9znMPQ0vMfAi1sCR1UmUQ69lr9vj3f3tNK+0evk9C+drRak92L9s7BL7YMHU7CpcmUsl
	oyuYogejkmkxMXNIQx6+NM5PTPkf5jX+zNRSNGm2dhFOcnuFRhZjnFBqHdp9yyTSDLKED38V0J8
	X66Ed+tEmR5tjPnoejwg5/Uj8ibU71khjdki2up1LmyHSc+04/wfK5HNxVhf78stWuIku5zi4oW
	sDqypbXxP/ZrOgV+MaaWJpcaG7
X-Received: by 2002:a05:6402:562a:b0:6b7:b872:27a0 with SMTP id
 4fb4d7f45d1cf-6b7c0c62880mr4117460a12.21.1794736190059; Sun, 15 Nov 2026
 01:49:50 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com> <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 15 Nov 2026 10:49:38 +0100
X-Gm-Features: AclHuK8qRce5cRBzcDjB8VekNbsS9sEDkZF1RlxUCV92tByMHRtFAPcTCxD6S2w
Message-ID: <CA+=Fv5QCKVcTY8P7=TUfzeYo50sCTR5zV9vvwC0F0sVeZ_XLSQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] hwmon: (marvel-env) Notify userspace of environmental events
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Nov 14, 2026 at 6:40=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of the alarms that changed. The notifier runs in machine check
> context, so it only queues an irq_work, which queues the work.
>
> Assisted-by: Claude:claude-opus-5-5
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
> index db36127c3805..f88feba7bfe4 100644
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
> index 50a1bf966f30..6d17c2e89a7c 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
>  config SENSORS_MARVEL_ENV
>         tristate "Marvel (EV7) AlphaServer environmental sensors"
>         depends on ALPHA_MARVEL || ALPHA_GENERIC
> +       select IRQ_WORK
>         help
>           If you say yes here you get support for the temperature, fan,
>           voltage and power supply sensors of Marvel AlphaServers (the
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> index cdc7e059e17b..3dd2ea658fa3 100644
> --- a/drivers/hwmon/marvel-env.c
> +++ b/drivers/hwmon/marvel-env.c
> @@ -11,13 +11,16 @@
>   */
>
>  #include <linux/hwmon.h>
> +#include <linux/irq_work.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/gct.h>
>  #include <asm/marvel_env.h>
> @@ -81,17 +84,22 @@ struct marvel_env_node {
>  struct marvel_env_chan {
>         struct marvel_env_node *node;
>         unsigned int pkt;               /* packet offset in the node */
> +       u8 last_status;
>         char label[32];
>  };
>
>  struct marvel_env_data {
>         struct device *dev;
> +       struct device *hwmon;
>         struct mutex lock;              /* serializes refreshes and reads=
 */
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
> @@ -226,6 +234,7 @@ static void marvel_env_add_chan(struct marvel_env_dat=
a *data,
>         c =3D &data->chans[type][data->nr_chans[type]++];
>         c->node =3D n;
>         c->pkt =3D pkt;
> +       c->last_status =3D env_status(n, pkt + env_status_off(type));
>
>         if (n->cabinet || n->drawer)
>                 len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> @@ -460,6 +469,72 @@ static const struct {
>         { hwmon_power, HWMON_P_ALARM | HWMON_P_LABEL },
>  };
>
> +static const u32 marvel_env_alarm[hwmon_max] =3D {
> +       [hwmon_temp] =3D hwmon_temp_max_alarm,
> +       [hwmon_fan] =3D hwmon_fan_min_alarm,
> +       [hwmon_in] =3D hwmon_in_alarm,
> +       [hwmon_power] =3D hwmon_power_alarm,
> +};
> +

With the v2 mapping from the 5/7 thread, one attribute per type is not
enough. A Warning to Failure change flips only temp_crit_alarm or
fan_fault, so nobody polling those is woken. For a supply as an in
channel, hwmon_in_alarm does not exist, so sysfs_notify() finds nothing
while the uevent still says NAME=3DinN_alarm (hwmon_notify_event() does
not check the attribute, drivers/hwmon/hwmon.c). Notifying every
alarm/fault attribute the channel has would cover both.

The machine check -> irq_work -> work chain and the teardown order look
right to me. If the ES47 has a redundant supply, pulling one should
exercise this end to end.




> +/* Reread everything after a system event and report changed alarms. */
> +static void marvel_env_event_work(struct work_struct *work)
> +{
> +       struct marvel_env_data *data =3D
> +               container_of(work, struct marvel_env_data, work);
> +       unsigned int i, k;
> +
> +       mutex_lock(&data->lock);
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               data->nodes[i].valid =3D false;
> +               marvel_env_refresh(data, &data->nodes[i]);
> +       }
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_hwmon); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_hwmon[k].type=
;
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++) {
> +                       struct marvel_env_chan *c =3D &data->chans[type][=
i];
> +                       u8 status =3D env_status(c->node,
> +                                              c->pkt + env_status_off(ty=
pe));
> +
> +                       if (status =3D=3D c->last_status)
> +                               continue;
> +                       c->last_status =3D status;
> +                       hwmon_notify_event(data->hwmon, type,
> +                                          marvel_env_alarm[type], i);
> +               }
> +       }
> +       mutex_unlock(&data->lock);
> +}
> +
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
> @@ -469,7 +544,6 @@ static int marvel_env_probe(struct platform_device *p=
dev)
>         const struct hwmon_channel_info **info;
>         struct marvel_env_data *data;
>         struct hwmon_chip_info *chip;
> -       struct device *hwmon;
>         unsigned int i, k, nr_info =3D 0;
>
>         data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -534,9 +608,16 @@ static int marvel_env_probe(struct platform_device *=
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


Magnus
