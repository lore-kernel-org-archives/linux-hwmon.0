Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A617328611
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788002369; cv=none; b=JIPKocFeUz/ACYz+bD13iJjJ0BTa8xuEtaP7UR9ZzSUJU4q+Ta59tCpJynGYaKV2+Z0Pjv2pyhQwTp3WxLPCmWYMnpp9u7VDHs/pauwqf9jBsYRbPXeyQPVUu00Tsa5HqRNoZctZ4p2a0ZUSQzk/WjnFrs7DtsJNgRulbof+YMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788002369; c=relaxed/simple;
	bh=+7d7U8vhY6uI7ITHQU99AHMxDDK+Xz3cYQJhOU1ZfKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CbvHf6QYupaQ24TnHkc8rXmPbsG0caoiIz7DFakXtwmm3RCuG4IXxGjTu4YdJGmO7pEmQ0BBiLMVtnNTXqYnidtacVHAkr6lh9Jdxojqh8Azy6InFE0JgfNpAznbUh7MoWwTz2Cds5CCprEfWXktR708bzvjgt/Z6/bU1HCc7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCV7Us6O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCV7Us6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D441F000E9;
	Sat, 29 Aug 2026 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788002367;
	bh=1jZ1aOR4DXN4oBHI7aQG8r05nXz3UPZ330OWm0fXuOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCV7Us6O9jDuKjkkFITzMF8QSrtIh6vNeU3eB7BfPi6x0yCdNpTD0fuG2H1PVvCmZ
	 r5knmQktiJrZ+EQN+rozxnbTA3e400h/8PbOQ49/IhJR4DoHA8sGE50EmmWxrkKyXs
	 7itKWbo2NTjX/vS7wEqanPuO6mSNqYwkwhgk25EHXHcH4zQZy3L9v032+B2pCRcqfQ
	 vUlOSDKKUIJzAnaYJF3PKtIslHd6v0Q8Eb9cb8Fc7qy1mQV9MDnDVuYsMoMQwxK7Ez
	 9zl6wuHL22iLyzMN80TLyq1yM/V6LhfcQu/Vbpe1LXDpYnqFG+4lOzEW0qQsdpIA2j
	 znoFN80Tq3qZw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] hwmon: it87: Add basic IT8613E fan monitoring
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829110829.34269-1-jerome.tollet@gmail.com>
References: <20260829110829.34269-1-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 11:19:27 +0000
Message-Id: <20260829111927.A3D441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional execution of PWM, limit, and voltage configuration i=
n it87_resume() bypasses chip safety guards.
--

commit 38aeab66f2bad568170fc7c7a3bf957b47ace77f
Author: Jerome Tollet <jerome.tollet@gmail.com>

hwmon: it87: Add basic IT8613E fan monitoring support
   =20
The IT8613E is not recognized by the in-tree it87 driver. Full
support was proposed previously but withdrawn after problems were found
in the temperature and PWM paths.

Add conservative support limited to fan input monitoring. Detect device
ID 0x8613, check the fan pin muxes, use the existing 16-bit tachometer
layout, and expose enabled fan inputs read-only.
   =20
Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@pere=
nite.com/

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 87edb1b6048bb..2f58004246c39 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c

[ ... ]

> @@ -3355,7 +3396,8 @@ static void it87_init_device(struct platform_device=
 *pdev)
>  		data->auto_pwm[i][3] =3D 0x7f;	/* Full speed, hard-coded */
>  	}
> =20
> -	it87_check_limit_regs(data);
> +	if (!has_fan_input_only(data))
> +		it87_check_limit_regs(data);
> =20
>  	/*
>  	 * Temperature channels are not forcibly enabled, as they can be
> @@ -3364,7 +3406,8 @@ static void it87_init_device(struct platform_device=
 *pdev)
>  	 * run-time through the temp{1-3}_type sysfs accessors if needed.
>  	 */
> =20
> -	it87_check_voltage_monitors_reset(data);
> +	if (!has_fan_input_only(data))
> +		it87_check_voltage_monitors_reset(data);
> =20
>  	it87_check_tachometers_reset(pdev);

[Severity: High]
Since we need to guard these register writes during initialization, do we
also need to guard them during system resume?

Looking at it87_resume() in drivers/hwmon/it87.c, these functions are called
unconditionally:

static int it87_resume(struct device *dev)
{
        ...
        it87_check_pwm(dev);
        it87_check_limit_regs(data);
        it87_check_voltage_monitors_reset(data);
        ...
}

Could this bypass the has_fan_input_only() guards on the resume path and
attempt to write to unsupported PWM, voltage limit, and VIN enable registers
on the IT8613E chip?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829110829.3426=
9-1-jerome.tollet@gmail.com?part=3D1
