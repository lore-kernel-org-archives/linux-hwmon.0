Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B035B18FDDE
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124171; cv=none; b=Hem2ChyCoPtWKfj3643EIaxRIYbTU77fhB1P+g8c502r5J56IGWcI/SAhZ9cJ1r6HABCUephjTHtwjPlK7R84F4dGKHnh5nh/RrSIqoegrgFnTABe3H3GDvuNUductwJMgkvPL/GmBSb7XIovxIlGDFsm+bvP8Ivl1FRuiYWH0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124171; c=relaxed/simple;
	bh=1yEMAe+kKDuHD1fuPzoubMuYN7PvO0pb4YaPtaosaD0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MmkPGEE8MxicQgE++KC7OMVpdTvS396nFxBIhkDLdMklCC7rJ7Q+Lodv5ZurqZxg2IQiOxXGZ7Aj4M771HaA+XLRu4SQ49+8IS4dn5kHI/qSMWs75smWzSvRxt2IkTlM89KnL5rWKj90/AKqE6Pk4kOIYJYxYFPWBx6fJV1vF+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJ9HFsro; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJ9HFsro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29B71F000E9;
	Mon, 27 Jul 2026 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785124170;
	bh=tDvKDqBpueRHZuET7J3aro6UFPj/7Kqb7Is80t0H1jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJ9HFsro6lpsgREOOS/2of3XBC4reha749WAAgMQN7cQWQx47GRXYNiHMEVHOa3ex
	 dUUzC1oQ4dcQ40AiiwdgeKhgBPDtPLPtJRp6+j/hoFu1q5Jy62J0qtnUid7XNad9DC
	 ZGlBw0FER4hRLVbHFOrBhIxYE6WwFjdBIM7GlOfGSvBb97udEDTRNWdMVaMJXnkxVU
	 HKx6tsdTB30fJOj6Kr5N8x6D499Ema1AuJsidarj4SwfnDI/nQYM+nNT8wckdUe/Bd
	 n+AmSqTHRPyBniAQWwzc0MY7qYdKGzJzs0/TFfUkyryRZPiFDwBOt2zz4bVy9lbu90
	 F7BU0gQygVTZA==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v3 1/6] hwmon: (adt7470) Fix fans stuck in manual
 mode on I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_thermalzone-v3-1-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-1-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 03:49:29 +0000
Message-Id: <20260727034929.E29B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless access to sensor data combined with macro multiple expans=
ion causes TOCTOU divide-by-zero crashes.
--

--- Patch [1]: [hwmon PATCH v3 1/6] hwmon: (adt7470) Fix fans stuck in manu=
al mode on I2C errors ---
commit f43c48cc32db2262b55dd289a4c96b005040eb1e
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
   =20
During adt7470_read_temperatures(), the driver temporarily switches
the PWM channels to manual mode, performs the temperature collection,
and then restores the original configuration registers.

However, if an I2C transaction fails at any point after entering manual
mode, the function aborts and returns immediately. This leaves the
configuration registers un-restored, permanently trapping the fans in
manual mode.

Introduce a recovery path to ensure that the original PWM configuration
registers are always restored, even when intermediate I2C operations
fail.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.o=
rg
Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 664349756dc2b..481d51617f4be 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this lockless access combined
with macro expansion risk a divide-by-zero?

drivers/hwmon/adt7470.c:adt7470_fan_read() {
        ...
        case hwmon_fan_input:
                if (FAN_DATA_VALID(data->fan[channel]))
                        *val =3D FAN_PERIOD_TO_RPM(data->fan[channel]);
        ...
}

Because data->fan[channel] is accessed multiple times without a lock or
READ_ONCE(), the compiler can generate multiple memory loads.

Concurrently, if an unprivileged user reads a custom attribute like
num_temp_sensors, it bypasses hwmon_lock and triggers adt7470_update_device=
()
which acquires data->lock, reads new I2C data, and writes to
data->fan[channel].

If the I2C read returns 0 (e.g., due to a stalled fan or bus glitch) exactly
between the validation check and the division, could this crash the kernel?

The same pattern appears to apply to fan_min and fan_max as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_th=
ermalzone-v3-0-21424d550c3d@gmail.com?part=3D1
