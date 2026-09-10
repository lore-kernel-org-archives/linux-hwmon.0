Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2393C9EF6
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 13:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047939; cv=none; b=HpgOvuoYwO4zBcH8iKMLt7kbCOFXNXewmvKCfpHGpVjQbjuelsZv+WooonBsoegir88nNjD50P8Ekc0qpNMxBW9WIYF0UePfkvhPuxXA4mvvIdhFzBXsC328B9AAI97L3JJQ7WNJvFvJuQWfKyC+HLydLKPARmbvtaz3e6Htick=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047939; c=relaxed/simple;
	bh=C1C553+uN+R6NOjWZGKttUPdSxS/zT2jYCzTlBkuw8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o7lfCE9JeVqpHkjzRCu8FB20rG/Z9KoJ/x06GakFuuzFPcR1EoUm7drRQHJ9JWi6OH/huYZ7r/7Aytxixk4I3QjTqGvomdurF2sIWL+9jN5p5XQKNcnR1woQbziOYOBG49wFAgxX5I17HJFJEdLdsU2mYzd+8uSWA5VblHwrGNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO4EMWJM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO4EMWJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E6F1F000FF;
	Thu, 10 Sep 2026 13:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047938;
	bh=zAgNNlqu7ea/cyLJJ4yW+6lskGhPCnVVUm7QIcqg6Tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RO4EMWJMdi3caw9Np04rywsPgbS51DEzFu2447/zWRbW28fRCyri4e5HzBsqgN2ph
	 +FoF2z3g83ukoKa4mQHF1dQ+ANsy7cTMrjv1pnQ6ys7cSOto88k4ua9/tRfmJ5EsQo
	 JOb/GlGg/dx8NIWb7WNdnaVyYyVOWS7XV7O3bD/HfNH2cLMH2YZQsUewF8zjh1bDaB
	 btJE4KRUlS4bCPGzTckN7X/yscg6aU8Y7hv0NnuhuEWBGKn47q5INFTqvnd3YZA/Pr
	 61/kH9YdugR2Sihp4/UlIxMEee6H5kaLDDdJ6U3E1Nbo4eFbzFxVss3DbCb46SY+pu
	 WWAEfPvFj0flQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (cgbc-hwmon): Add some temperature sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-2-ef13ae2fa147@bootlin.com>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-2-ef13ae2fa147@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:45:38 +0000
Message-Id: <20260910134538.76E6F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds a 15th voltage sensor ('12V Standby Voltage', map=
ping to `in14_input`) to the driver's string labels and documentation, but =
fails to add its corresponding configuration entry to the `cgbc_hwmon_info`=
 array. As a result, the hardware monitoring core will silently ignore the =
15th channel and fail to expose it to sysfs.
--

commit 0d30ff3c376bb1134975af10205e094badb07304
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

hwmon: (cgbc-hwmon): Add some temperature sensors

This commit adds several new temperature sensors, updating documentation and
string labels to match the Congatec board controller documentation. It also
modifies existing labels.

> diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
> index 2effa0b562862..098896ec8c6f6 100644
> --- a/drivers/hwmon/cgbc-hwmon.c
> +++ b/drivers/hwmon/cgbc-hwmon.c
> @@ -41,32 +41,42 @@ enum cgbc_sensor_types {
[ ... ]
>  static const char * const cgbc_hwmon_labels_in[] =3D {
> -	"CPU Voltage",
> +	"CPU Core Voltage",
>  	"DC Runtime Voltage",
>  	"DC Standby Voltage",
>  	"CMOS Battery Voltage",
> -	"Battery Voltage",
> +	"Battery Supply Voltage",
>  	"AC Voltage",
>  	"Other Voltage",
> -	"5V Voltage",
> +	"5V Runtime Voltage",
>  	"5V Standby Voltage",
> -	"3V3 Voltage",
> +	"3V3 Runtime Voltage",
>  	"3V3 Standby Voltage",
>  	"VCore A Voltage",
>  	"VCore B Voltage",
> -	"12V Voltage",
> +	"12V Runtime Voltage",
> +	"12V Standby Voltage",
>  };

[ ... ]

> @@ -255,7 +265,12 @@ static const struct hwmon_channel_info * const cgbc_=
hwmon_info[] =3D {
>  			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>  	HWMON_CHANNEL_INFO(in,
>  			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
>  			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,

[Severity: Medium]
This patch adds a 15th voltage label ("12V Standby Voltage"), but is the
corresponding configuration entry missing from the cgbc_hwmon_info array?

Looking at the 'in' channel info array here, it only has 14 configuration
elements.

Since the hardware monitoring core iterates over the cgbc_hwmon_info
array and stops after 14 entries for 'in', will it silently ignore the 15th
channel and fail to expose it to sysfs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-cgbc-hwmon=
-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com?part=3D2
