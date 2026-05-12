Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE70191F91
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 03:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556754; cv=none; b=sPR6KSl1coY9tiYvtqtIzFTLyY8DgrsV2fOXBpliCoxo99J10j+EnRYGzbraw5EhCgatv9V9YN2ODVhuE5pUm3EPxuRydQAeLsCu16BYuxl//pAb6AezcLEbZ9kQloQ5dFR14WeEm6MkXV9zYI7OJGgBWmG79scxk7jP2Oq3r88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556754; c=relaxed/simple;
	bh=3KA+XOVtBM2uV25A/cgI/ebSZEh9PtQNWUfj/0NQ35Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ac5nKOZWIJ0hilbV37D8zjivFzHrpm0VxC0OW3rY24kLOc3GCT6iQX0IehcpI1CmazmW/gsfefUw7eWP/XpS+mV2+6Kk7YTASo2jhpP5KW+RQ/7u4OVzhedn9yTHuEQnabPYwvyUxQV6ABnnzojUlARC08u3afIg+E5+jF+81zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S726mVQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S726mVQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6868FC2BCB0;
	Tue, 12 May 2026 03:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556753;
	bh=3KA+XOVtBM2uV25A/cgI/ebSZEh9PtQNWUfj/0NQ35Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=S726mVQ8TfVrxT9jEZg17FdEgJOs1A0RuSFGMFewbe2FKBFJRg1FVPZbT18d5FHTm
	 c25RXvYI285Wz0HzxIhsvrLf1tAPP2XdzausaQxz/0VjA+a1HiquoDVFkF/mdf4ub1
	 VpEPPrIm3UAlxJO5N2FVXImjF4C7FiWNiSwrGhJha6UiPNYrH1K7sVQGCvhwC1Dzkz
	 L1X/p7+GU/AVAxwwirUfk/MMQCGSpVFRoOcS5urXlaI4zU6P1DKnIkSr23rDTaPBQR
	 OVSgsNbnPPoEi/utuofYKMI9g94fUv5zT4WI7qjY57sNuC12busO6a1THKEzkUuxc1
	 v5uZMV52e1ebg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 4/5] hwmon: (pmbus/adm1266) replace probe-time
 RTC seed with rtc_class device
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260511-adm1266-v2-4-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-4-7a6d34f0de5d@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:32:32 +0000
Message-Id: <20260512033233.6868FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing locking in RTC callbacks causes race condition with PMBus =
transactions.
- [Medium] Premature exposure of the RTC device before hardware initializat=
ion is complete.
--

commit 20e4a34f4a236495f598a1957552fb4fea44b3d3
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

    hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device

This commit replaces the probe-time RTC seeding with an rtc_class device
backed by SET_RTC. This allows userspace tooling to drive the re-sync again=
st
/dev/rtcN once it trusts the system clock.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 99e92a8365fb7..0dfb02db86837 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> +static int adm1266_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	u32 secs;
> +	int ret;
> +	int i;
> =20
> -	memset(write_buf, 0, sizeof(write_buf));
> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_SET_RTC, buf);

Since this RTC device is exposed to userspace, can this callback be invoked
concurrently with hwmon sysfs attributes managed by the PMBus core?

The PMBus core uses pmbus_lock to serialize multi-step sequences. If an RTC
I2C transaction interleaves in the middle of a PMBus sequence, can it disru=
pt
the device's internal state machine or cause unpredictable behavior?

Should this callback acquire pmbus_lock(client) (or its interruptible
variant) around the I2C transfer to prevent a race condition?

> +	if (ret < 0)
> +		return ret;
[ ... ]
> +static int adm1266_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +
> +	return adm1266_write_rtc(client, rtc_tm_to_time64(tm));
> +}

Does this callback also need to acquire pmbus_lock(client) around the I2C
transfer to prevent concurrent access with PMBus transactions?

[ ... ]
> @@ -553,7 +603,7 @@ static int adm1266_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D adm1266_set_rtc(data);
> +	ret =3D adm1266_register_rtc(data);
>  	if (ret < 0)
>  		return ret;

By registering the RTC device here, is the /dev/rtcX interface exposed to
userspace before pmbus_do_probe() completes the hardware discovery and
initialization sequence?

If a userspace process immediately opens the RTC device and issues read/wri=
te
commands, can the resulting I2C traffic interleave with the driver's
initial setup?

Should adm1266_register_rtc() be called at the end of the probe function,
after pmbus_do_probe() succeeds, to ensure the device is fully initialized
before it is accessed externally?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-adm1266-v2=
-0-7a6d34f0de5d@nexthop.ai?part=3D4
