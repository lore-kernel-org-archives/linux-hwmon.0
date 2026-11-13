Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556465;
	b=wht92g05DufZfo5V5YAbgzViuGnk8z1fCawFkC4vWjsuU4owCi11KiTj4e/FQWTzOwFS
	 MA29jmlOBpfEouAETK2+vXMEe77/EDYncUA1tSK2csdfWUi4hpbuxYHOcLgpQVBeOv1Q4
	 AH/91ZR1b+ctqTOTSP7B2UzNW9Wf0fdw5U104Ysjsba7Hy/MMJMHrJVQpmDLGNdsYF/YT
	 myvi5gFgXEZ74Ch8laTIPG5FcutNc8KT9ag6hSiOnQ2vtrrUV2aFoGmlewE83TB2v+HNH
	 Zp5dnInTZKZYtZdsyR3Bq4dxWPt4djqj4oSn57+31OQOFHFOrRM5DGdZw/xVyIxzspA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556465;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Gq51DCVR8n9Og8xKjwzGKdFz8EWXnXmS3PVTUUYB3Ic=;
	b=ZAqBT7qaAdhBzssOwZ3OG5rR09qZE2mjffTpn1O+ERax4HSlLPE9XXgHHUD6osy5f/GP
	 +cOK7yACTTJW9SAGV1bzM/B3zjrRosht5ZdhKPN3rU3tuF8StIjtOkBqOaLrl7CK5FCP1
	 amZXBZUP7x/rrH2cZpyAiZsXOMUC3CcT++oXqAExN6YoylxoNJO6PBNbSVKgN5vEEajJS
	 IXMHkwg6lWjk+GFPYhCkHc9yWrZkbV+GeBd9DouKxwb5WfMfBGjH0uBe4JIaNfqIISOps
	 xwgeZtb3nmyEUvF0hnlDcGxoAedwxEEhxyb14T2U53fQW00mgW60Ch0vbD+pcjb1iSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpeT4fTw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A26606A33E
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpeT4fTw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67581F000CB;
	Fri, 13 Nov 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556464;
	bh=Gq51DCVR8n9Og8xKjwzGKdFz8EWXnXmS3PVTUUYB3Ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QpeT4fTwYl2imFSucmD25iEXVDQzjP1UNUHIyb1qXkC5sdd9WqdvRqtf9doXYXZ6o
	 hhDR2yatDQT9LYv7s8te7lkxkQYJGtSYnw25XNkExWqWjouJpAVLxZd1vCZ/4pG4Ej
	 daGgkhp0/DbfG53gjn+fFtc8bXJh3He8mV+GDCD/m+D7cEt38Vwd7heZsv3Z5pzk6i
	 /SbakarSlWmEC+Uj7/NY1iBkFGXVQGV+c1t0uy/5qo7JSfvx2Z58zcNzXqTTdtY9y+
	 gi7VHIhOHTdcsw8UoB8atZlKdRK7IMt4wm2F1ZgwGernulSbyBDk09dr2tnyX6XQTA
	 EI9gstXASGX/A==
Message-ID: <sashiko-outbox-212371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] platform/x86: dasharo-acpi: Add fan mode and PWM
 write support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113074347.2301465-3-filip.golas@3mdeb.com>
References: <20261113074347.2301465-1-filip.golas@3mdeb.com>
 <20261113074347.2301465-3-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:54:24 +0000
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
- [Medium] platform/x86: dasharo-acpi: broken per-channel fan mode
  mapping and visibility
--

commit 1345c6559b6f48fc9853d519fa4b3c71e20766e1
Author: Filip Go=C5=82a=C5=9B <filip.golas@3mdeb.com>

platform/x86: dasharo-acpi: Add fan mode and PWM write support

This commit adds hwmon support for switching fans between automatic and
manual control via pwmN_enable and setting PWM duty cycles via pwmN.

> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/d=
asharo-acpi.c
> index 13d97eb43511f..29afcf78564c5 100644
> --- a/drivers/platform/x86/dasharo-acpi.c
> +++ b/drivers/platform/x86/dasharo-acpi.c
[ ... ]
> @@ -162,6 +189,14 @@ static int dasharo_hwmon_read(struct device *dev, en=
um hwmon_sensor_types type,
>  			*val =3D value;
>  		break;
>  	case hwmon_pwm:
> +		if (attr =3D=3D hwmon_pwm_enable) {
> +			/* hwmon: 1 =3D manual, 2 =3D automatic */
> +			ret =3D dasharo_read_channel(data, "GFMD", DASHARO_FEATURE_FAN_MODE,
> +						   channel, &value);
> +			if (!ret)
> +				*val =3D value ? 1 : 2;
> +			break;
> +		}
>  		ret =3D dasharo_read_channel(data, "GFDC", DASHARO_FEATURE_FAN_PWM, ch=
annel, &value);
>  		if (!ret)
>  			*val =3D value;
> @@ -174,6 +209,31 @@ static int dasharo_hwmon_read(struct device *dev, en=
um hwmon_sensor_types type,
>  	return ret;
>  }
> =20
> +static int dasharo_hwmon_write(struct device *dev, enum hwmon_sensor_typ=
es type,
> +			       u32 attr, int channel, long val)
> +{
> +	struct dasharo_data *data =3D dev_get_drvdata(dev);
> +
> +	if (type !=3D hwmon_pwm)
> +		return -EINVAL;
> +
> +	switch (attr) {
> +	case hwmon_pwm_enable:
> +		if (val !=3D 1 && val !=3D 2)
> +			return -EINVAL;
> +		return dasharo_write_channel(data, "SFMD", DASHARO_FEATURE_FAN_MODE,
> +					     channel, val =3D=3D 1);
[ ... ]
> @@ -210,9 +270,11 @@ static umode_t dasharo_hwmon_is_visible(const void *=
drvdata, enum hwmon_sensor_t
>  			return 0444;
>  		break;
>  	case hwmon_pwm:
> -		if (channel < data->caps_found[DASHARO_FEATURE_FAN_PWM])
> -			return 0444;
> -		break;
> +		if (channel >=3D data->caps_found[DASHARO_FEATURE_FAN_PWM])
> +			break;
> +		if (attr =3D=3D hwmon_pwm_enable)
> +			return channel < data->caps_found[DASHARO_FEATURE_FAN_MODE] ? 0644 : =
0;
> +		return data->caps_found[DASHARO_FEATURE_FAN_MODE] ? 0644 : 0444;

[Severity: Medium]
Can indexing DASHARO_FEATURE_FAN_MODE directly with the hwmon_pwm channel
number operate on the wrong fan when only a subset of PWM fans supports
mode control?

dasharo_fill_feature_caps() packs capabilities for each feature densely
from index 0 across groups, skipping groups with no capabilities.  If an
earlier fan supports DASHARO_FEATURE_FAN_PWM without
DASHARO_FEATURE_FAN_MODE while a later fan supports both,
data->capabilities[DASHARO_FEATURE_FAN_MODE][0] refers to the later fan
while channel 0 of DASHARO_FEATURE_FAN_PWM refers to the earlier one.
dasharo_hwmon_is_visible() will then expose pwm1_enable on the earlier
fan instead of the later one, and GFMD/SFMD will read and switch the mode
of a different fan than GFDC/SFDC.

Also, for hwmon_pwm_input, dasharo_hwmon_is_visible() checks
data->caps_found[DASHARO_FEATURE_FAN_MODE] globally rather than checking
whether the given channel supports DASHARO_FEATURE_FAN_MODE, exposing
pwmN as 0644 instead of 0444 on fans without mode control.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113074347.2301=
465-1-filip.golas@3mdeb.com?part=3D2
