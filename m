Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903373;
	b=n+AbENLEAWfPDJ/iMr1eMtEHRqWGRM4mGniNqb6NiEoAoUGOryCTsvC1JOBW0gUB4lrl
	 dQkiyF7/c91aQR5AspSF+7eOTzhF14Q2UlUeqnQzj3KO1lOJ6Ky4S9CrTQUPjlmr6Rauv
	 kKDC9WPuNT31oXvvU0SGCMmWZ3PVezEegCyJ/AcLvSEwaq+rxHRblr+kxj7qzIHY10DlE
	 cPctL5aj9voUR1ey385FewfNAT+xS1cBnyKQcWFZCKNtADR+spRT6q2ni9BgkLjuSIjRP
	 1KXhdo052sCap0kyqn+icvM5YS8ji/KZIhdJlb69o95o+bP//nTVXRHIHoE/e+qFKYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903373;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+kHXh4RlBBhg9fLviYWiXZqY6C0Y/ucPoStMG3e8BrE=;
	b=cJPEo9dZZc9wn2i8IEQovMLJuI1om4ST4o5ypQMCvEHZ2RDtgkaA0k/pz+v840HxW5Vi
	 ueqX14Ns1gbrQbO0UCx1c0YklEVmd34pOG8GQrfNoig+QKj6Dt0uDGnpHxJDBrh59qgeA
	 QX0nukwMP2t/q1jlF+uKMxrgUFba+DAHH8g+8Ftpfzeb/IQIZgA7c5viACblkB87l+7GT
	 ItvICOVfcNSn3zctvYBSmkUCBuPE1GZZGrTnpkfKfQRXEPe16KgInUxieuezeIDX2nWAE
	 +W77sk/PBVKPIOzFrgV4c3kO+JcvdysvMKHABOjsOfxMkfLLDK0qldnQmuGhDEDIEow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPkvj+S1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A49606A31B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPkvj+S1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5973A1F000C1;
	Thu,  5 Nov 2026 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793903372;
	bh=+kHXh4RlBBhg9fLviYWiXZqY6C0Y/ucPoStMG3e8BrE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=dPkvj+S1PZJcfZxgqddPDZJYsNE7pm6OqnYo3od+gx9OWBLxmX/rvGHkH+X/Mxcz1
	 X81U+YhK6Dp1gW4gPWG9qJde8ODcD1mvEQ2UD+wfhEhbHorJC1BqGag8KoHRq4wn9u
	 4wRJgSS0lPyc2vgfV1TcgbqJhnaMLTAs7PaUJiBXQhPlKyQ/C5Ik28d/WVlkOdYZIn
	 PX/tJV+5DKizEtmeCBK15IChRI3XluZNGhowd7Da1v1ipJ2zoKboSbSmesYlzawPo1
	 FPhoFkCOC0vxnOzsUVg7U7C3u7GczTzm9CKWN/72wrSVe5163yUsMCvRw4ZJwAhzwy
	 IXMlkJFHHVK5w==
Message-ID: <sashiko-outbox-199767@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpio-fan) Fix runtime PM imbalance in probe and
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261105182427.2369928-1-linux@roeck-us.net>
References: <20261105182427.2369928-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 18:29:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In gpio_fan_probe(), gpio_fan_stop() is registered conditionally as a
> devres action before runtime PM is initialized, while gpio_fan_stop()
> unconditionally calls pm_runtime_disable(). This breaks runtime PM
> disable_depth and usage_count invariants across several paths:
>=20
> - On alarm-only devices without control GPIOs, gpio_fan_stop() is never
>   registered, leaving pm_runtime_enable() unbalanced on unbind and
>   triggering "Unbalanced pm_runtime_enable!" on subsequent binds.
> - When control GPIOs are present and devm_add_action_or_reset(), hwmon
>   registration, or fan_alarm_init() fails, gpio_fan_stop() runs before
>   pm_runtime_enable(), incrementing disable_depth to 2 (leaving runtime
>   PM permanently disabled on re-probe) and, if speed_index > 0,
>   underflowing usage_count via pm_runtime_put_sync().
> - If pm_runtime_resume_and_get() fails when speed_index > 0, it drops
>   its reference while speed_index remains non-zero, causing
>   gpio_fan_stop() to call pm_runtime_put_sync() and underflow
>   usage_count.
> - Registering the hwmon device before enabling runtime PM exposes sysfs
>   attributes that can invoke set_fan_speed() before runtime PM state is
>   initialized.
>=20
> Initialize runtime PM upfront with pm_runtime_set_suspended() and
> devm_pm_runtime_enable(), remove pm_runtime_disable() from
> gpio_fan_stop(), and acquire the initial active runtime PM reference
> before registering gpio_fan_stop() and the hwmon device.
>=20
> Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> Reported-by: Sashiko <sashiko@sashiko.dev>
> Link: https://sashiko.dev/#/bug/linux-349aa3ba-30c3-4c3c-b47e-f52839af2b8d
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105182427.2369=
928-1-linux@roeck-us.net?part=3D1

