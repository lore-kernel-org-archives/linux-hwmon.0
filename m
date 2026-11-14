Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679028;
	b=voT/BY/WmbK0gttx6aRp/olqNGJI7m4nqT3KQE+/mDMQShv0ay7VecqJV75Laf6iJK2f
	 lpvWRCGOfGJ43k61RaSNUPPEjckFWC6nl3zVHbKTJWs7u10TNS8jDwNmakcdaXcXh04md
	 Z339AhjjhlncKaNOaaL0B5Y8k1ZGvuddxLX0y74CK1hN1W4jGcBdHYHXCgxeYft7Gi5UW
	 CMDLk0mNQt/s3KJ3ruvLNIRsOVLdnmbjBM1zdwb73fxyLv6voIDcFkMKx0noEN8W6yruw
	 Jo6+6eMIMG81DgOGSK5fsuivPSYOEASV/x7YZ2Kj0iMSnVYXu3TaTlcqyPsgqFGYRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679028;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s5KMi8zGohuigeRTIfiUiHwcK3cIFJEhlbfVuvLrYQY=;
	b=DNcTS/JoXnD36CwBooyDiLw5jyMjIFMryagKmN9cQZrmhZx7ZpIzCFEo2sK8gmw5H/XG
	 WIF+2GRI5pvxvf53liAUVF8GqfMgzRhdwm6uLT1/vro/iOlSZyORX2np9zW4+bVwmtA7E
	 o0XzhKqja5bSuOxemgnafPFNu8Nz6OlaJFcWQ5UxmDkyEBvmldOlQoL47crDBD4QpNKTF
	 XkpceVPRF4b5w2i/ZwAS47goz+QkQ9n/lpOdiNV9e+YEtjNEn6eo+TajggZIMiIB6PXHa
	 /vB0BbdGvdWdpzwvmpYiXUowaDq4zU3N1eTNrg2rTMlqHEwKrKP+pkLCj/Jp70N9LfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aimspo1P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F575606A333
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aimspo1P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A601F000C4;
	Sat, 14 Nov 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679027;
	bh=s5KMi8zGohuigeRTIfiUiHwcK3cIFJEhlbfVuvLrYQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aimspo1PiCwFRv4HDKYR9MN93qlaMvKDKxmPsM/XOJ7VhkC6cutL7JTk3qRaFoqSI
	 Nxsmt5Jb7S7sP5dDIBGy1Dw8j7cpi0kuP2iMHQ1kw3f8yaWjj5pZLjoiZFO3XHFMO4
	 EtlXCx1UyWkD4K0XTyGF+bHqNM8c/WZxGSsdFdye3CEY7ibYRyvBzN/WG21GGcaNy5
	 OZhUxFS/ik7EbR6uMsod1BlPKodBIYpCVoHwVzue7Km2lzmfJdTK3DUY+AiNp89qzo
	 Jwa2UcYMwT6jBtbJ/d17k3f+Gys8DhhZ5yp2WEaFdmaaBqhkZ9ZiYqXfuAXREOjvKC
	 S07Hf8tsuWhOw==
Message-ID: <sashiko-outbox-214860@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:57:07 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] hwmon: (marvel-env) link failure when
  CONFIG_ALPHA_LEGACY_START_ADDRESS=3Dy
- [Low] hwmon: (marvel-env) redundant driver-private mutex instead of
  hwmon_lock()
--

commit 0d0046c1ab7829344c10cd3a7021d92b64106a5d
Author: Matt Turner <mattst88@gmail.com>

hwmon: Add driver for Marvel AlphaServer environmental sensors

This commit adds a hwmon driver for the temperature, fan, voltage, and
power supply sensors exposed by the SRM console configuration tree on
Marvel (EV7) AlphaServers.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a4756..50a1bf966f30b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1255,6 +1255,17 @@ config SENSORS_MACSMC_HWMON
>  	  This driver can also be built as a module. If so, the module will
>  	  be called macsmc-hwmon.
> =20
> +config SENSORS_MARVEL_ENV
> +	tristate "Marvel (EV7) AlphaServer environmental sensors"
> +	depends on ALPHA_MARVEL || ALPHA_GENERIC

[Severity: High]
Does this fail to link when CONFIG_ALPHA_GENERIC=3Dy and
CONFIG_ALPHA_LEGACY_START_ADDRESS=3Dy (as in alpha defconfig and
allmodconfig)?

marvel_env_refresh() calls marvel_cfgtree_partial_update() in
core_marvel.o, which is omitted on ALPHA_GENERIC builds when
CONFIG_ALPHA_LEGACY_START_ADDRESS is enabled:

arch/alpha/kernel/Makefile:
    ifdef CONFIG_ALPHA_GENERIC
    ...
    ifndef CONFIG_ALPHA_LEGACY_START_ADDRESS
    obj-y	 +=3D core_marvel.o core_titan.o core_wildfire.o
    ...
    endif

Should this depend on ALPHA_MARVEL || (ALPHA_GENERIC &&
!ALPHA_LEGACY_START_ADDRESS)?

[ ... ]

> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> new file mode 100644
> index 0000000000000..cdc7e059e17bb
> --- /dev/null
> +++ b/drivers/hwmon/marvel-env.c

[ ... ]

> +struct marvel_env_data {
> +	struct device *dev;
> +	struct mutex lock;		/* serializes refreshes and reads */
> +	unsigned int update_interval;	/* ms */
> +	struct marvel_env_node *nodes;
> +	unsigned int nr_nodes;
> +	struct marvel_env_chan *chans[hwmon_max];
> +	unsigned int nr_chans[hwmon_max];
> +};

[ ... ]

> +static int marvel_env_read(struct device *dev, enum hwmon_sensor_types t=
ype,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct marvel_env_data *data =3D dev_get_drvdata(dev);
> +	struct marvel_env_chan *c;
> +	struct marvel_env_node *n;
> +	unsigned int pkt;
> +	u8 status;
> +	int ret;
> +
> +	if (type =3D=3D hwmon_chip) {
> +		*val =3D data->update_interval;
> +		return 0;
> +	}
> +
> +	c =3D &data->chans[type][channel];
> +	n =3D c->node;
> +	pkt =3D c->pkt;
> +
> +	mutex_lock(&data->lock);

[Severity: Low]
This isn't a bug, but is the driver-private data->lock mutex needed here
and in marvel_env_write()?

The hwmon core already serializes .read and .write callbacks under its
internal lock, and non-hwmon_ops paths (such as the event workqueue added
later in this series) can use hwmon_lock() and hwmon_unlock() instead of
maintaining a separate mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D5
