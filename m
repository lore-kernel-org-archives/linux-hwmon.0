Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940019;
	b=KFrveBXRTJbYMyiJF6dLWRP6CQG6Kwlz6ig8eqlC7ObC+OrzDicapLjOeiIh//L4uSaD
	 ENZITegld3E2G8MQHL3fjrZ9h3YBKgdKH7xWsb9opx+pszPVm1nXo55VO8iAwMDxHnZyL
	 QvOAFappe4FiNk5nUDBXWd9N4eNlxGPm7ikukOQVQ3EmuaWsTx6lhAd4zJTEeuI7ZaZn8
	 mL+LHLAUBxWOfgy/vUmPBU8OY27ksYfkVYWXME+OZNdXQuMzjyq9yJrZrxs5B4m+O6mY9
	 eb/Ta9oYBK/CIqyf7fnmAHaRM0qs0xlaB0EKw2B5ZtFJ4ZCR7TQDWTTS67yriZh31Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940019;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+SwcoOsT/82r2DrWLn4kOaLyK9ZUl4frqhRFiPSplCs=;
	b=3FmmSmxwB2LjT5bgF7XoACjxkcQd+CEgC5nhzBwPqxv0Sc5JHwuJf2D1hh8qGlRgw+wF
	 HpvyYyPJqq/GBO0eZaQ+9C82358Ups+hu8G7lipVB/t8luWfcWTMRX24t605i1WKn+2nl
	 fO1h3toCvl7MUUXwfuVsm3TABThFws3lsB1hgoYMSIJYKh6N37OKRbxSSzBMZqQ7hIR+2
	 JfpeJdosFWHyaaM1cWSkjkvo6AD6f4/EvCXoNbTcGP8YB0Y9md4VzZuV48ZTSL7yH0vSm
	 AR7+YaTjocY0qMz+D+xJirGGxzgNP0ymMZIDnghrkdAC64SNZu2W+ed807Cfa/aBsCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIiAeT1p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB706606A32C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIiAeT1p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04111F000C7;
	Tue, 17 Nov 2026 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940018;
	bh=+SwcoOsT/82r2DrWLn4kOaLyK9ZUl4frqhRFiPSplCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YIiAeT1ppQSST5ONG0ZFruXmlB7u1M87G1l6CmWhXVDONmBgZM0Rw0Nxvhm341py2
	 +tdOgq2McYbUXikM4621ayEpW/QxIaawH3jSpN9p5yS82Rsg/Yspsu+3gjfyDI4+f9
	 HecsvSbo/Oe3YB80+2ltqyC1o9IlrHGFEWvKuXSJJt5240QhZM23+Id3LlTRu2pDx5
	 IjprciYcaWQ9D6AnYHcuaeJssI6w+FayTXoV9uvcFBA1PCxo3Yw89zb6SHVFuYrJtS
	 WlpnElHom1m90dJ6cbaMNepo84O2+jGnBIIs76yjHxx8hF2ocwQQ2GBbYcJiZbCMAT
	 tVWo6HE0J/71g==
Message-ID: <sashiko-outbox-219339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-6-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-6-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:26:58 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] hwmon: (marvel-env) off-by-one nr_info check in
  marvel_env_probe()
--

commit 6fbd587456a10850baa1d383c9628002e5d61c42
Author: Matt Turner <mattst88@gmail.com>

hwmon: Add driver for Marvel AlphaServer environmental sensors

This commit adds a hwmon driver for the temperature, fan, voltage, and
power supply environmental sensors exposed via the SRM console config
tree (GCT) on Marvel (EV7) AlphaServers.

> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> new file mode 100644
> index 0000000000000..25c0ecef8e1d6
> --- /dev/null
> +++ b/drivers/hwmon/marvel-env.c
[ ... ]
> +static int marvel_env_probe(struct platform_device *pdev)
> +{
> +	u32 *config[hwmon_max] =3D { };
> +	struct device *dev =3D &pdev->dev;
> +	const struct hwmon_channel_info **info;
> +	struct marvel_env_data *data;
> +	struct hwmon_chip_info *chip;
> +	struct device *hwmon;
> +	unsigned int i, k, nr_info =3D 0;
[ ... ]
> +	for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +		enum hwmon_sensor_types type =3D marvel_env_types[k];
> +		struct hwmon_channel_info *ci;
> +
> +		if (!data->nr_chans[type])
> +			continue;
> +		data->chans[type] =3D devm_kcalloc(dev, data->nr_chans[type],
> +						 sizeof(*data->chans[type]),
> +						 GFP_KERNEL);
> +		ci =3D devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
> +		config[type] =3D devm_kcalloc(dev, data->nr_chans[type] + 1,
> +					    sizeof(*config[type]), GFP_KERNEL);
> +		if (!data->chans[type] || !ci || !config[type])
> +			return -ENOMEM;
> +		ci->type =3D type;
> +		ci->config =3D config[type];
> +		info[nr_info++] =3D ci;
> +		data->max_chans[type] =3D data->nr_chans[type];
> +		data->nr_chans[type] =3D 0;
> +	}
> +	if (nr_info =3D=3D 1)
> +		return -ENODEV;

[Severity: Medium]
Should this check be if (!nr_info) instead of if (nr_info =3D=3D 1)?

nr_info starts at 0 and is incremented once per populated sensor type in
marvel_env_types[], so checking nr_info =3D=3D 1 rejects a valid system with
a single sensor category with -ENODEV and lets the zero-channel case fall
through into devm_hwmon_device_register_with_info() with an empty info
array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D6
