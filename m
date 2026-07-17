Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776963A9618;
	Fri, 17 Jul 2026 21:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322746; cv=none; b=WYcW54hwUp3ePptwVMpotbbHNaWCYbZY5fP4G9FZw+1kpEQ9wuX5fp0S+KlAS99HlrchPtUQisaZonsoiIOi3J8RuNGbH6XwD6fmgWERe8r+7dbVsi/Viao8/hFUN4K3nyo6CqtN35QDKArZE4KPbHfrvKHLUMj6qBm/0bEJ9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322746; c=relaxed/simple;
	bh=HwpvmVDSTFQ8lO5yxSoe7u03I4PkFjeLNTvBPH5keI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VUhNJxA8mnIIv5vDB3r4ugw1B20Uqurahp5ltAxr6vwRRmSazwj2Z0bwIhfHMKko13M0NH6/Y+gib7XZa3qLVRhVz6cneCbALnl10Fbolu9y/3aI8kcokbEVmCfSd25o0rY0efLyq4lAn0UiqnKHRPcz540aFkxvyrKQwxN3L04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGKoprfU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGKoprfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E291F000E9;
	Fri, 17 Jul 2026 21:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784322745;
	bh=rReIroXHoNeXulNu+SCIgeKE3eR9zgzCvAaSuBKEbKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PGKoprfUDP8lURcW3DWa7pqJdPemiBByBtDdEIZN4AmArts9nMVJjkph44pyIoadk
	 ndSt6jOgGq8LZtC+7L874L7ZQKhHVDiBkBMSTO+LM2/7yJfg7tecymNoVzp97im8wv
	 PEYfVf/vZIsWqVB5JYJMmF2+vqbI8c7xUCYRnvTckIwjBE87VQpOxNHP+yl9bnVp0S
	 lP4E5uhzHbGc6yc6FEznABHDeXzrmJ2wh7+5DsooPXPyhJraQ5ejO309ITaWBSlLYj
	 ZOzHYhfPxzvyLOAcwL7VIC8GrGI3aq2ZQXFVgMffT3azstrZfX6//JSnzhIhOaLMEC
	 ZduT4Tqryh3wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] hwmon: (adt7470) Fix busy-loop and I2C flooding
 in update thread
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-adt7470_thermalzone-v2-3-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-3-a55147958fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 21:12:24 +0000
Message-Id: <20260717211224.B9E291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Module unload hang due to missed wakeup in kthread loop
- [High] Temperature alarm bitmask logic error causes false negatives and i=
ncorrect states
- [High] Unfreezable polling kthread can crash or hang the I2C bus during s=
ystem suspend
- [High] Subsystem guideline violation: Driver uses private lock instead of=
 hwmon_lock()
--

--- Patch [3]: [PATCH v2 3/6] hwmon: (adt7470) Fix busy-loop and I2C floodi=
ng in update thread ---
commit e6d87eed20a630165f01d0513e17b82247a7f775
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread

This commit prevents a busy-loop and I2C flooding in the background kthread
when userspace configures auto_update_interval and num_temp_sensors to 0.
It resolves the issue by raising the lower limit of the clamp_val in
auto_update_interval_store() from 0 to 500 milliseconds.

Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.o=
rg

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 481d51617f4be..77e7be6927906 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -509,7 +509,7 @@ static ssize_t auto_update_interval_store(struct devi=
ce *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
> =20
> -	temp =3D clamp_val(temp, 0, 60000);
> +	temp =3D clamp_val(temp, 500, 60000);
> =20
>  	mutex_lock(&data->lock);

[Severity: High]
This isn't a bug introduced by this patch, but does the use of a private
mutex for an extra sysfs attribute violate the HWMON subsystem directive
to use the central hwmon_lock() and hwmon_unlock() for this purpose?

>  	data->auto_update_interval =3D temp;

I would also like to ask about some other pre-existing issues in this file:

drivers/hwmon/adt7470.c:adt7470_update_thread() {
    [ ... ]
	while (!kthread_should_stop()) {
		mutex_lock(&data->lock);
		adt7470_read_temperatures(data);
		mutex_unlock(&data->lock);

		if (kthread_should_stop())
			break;

		schedule_timeout_interruptible(msecs_to_jiffies(data->auto_update_interva=
l));
	}
    [ ... ]
}

[Severity: High]
This is a pre-existing issue, but does checking the stop condition while
the thread is in TASK_RUNNING without preparing to sleep cause missed
wakeups?

If the unbind process calls kthread_stop(), it sets the stop flag and
wakes the thread. Because the thread is still in TASK_RUNNING, the wake
is a no-op, and the thread will then call schedule_timeout_interruptible()
and go to sleep, hanging module unload for up to 60 seconds.

[Severity: High]
This is also a pre-existing issue, but does this kthread lack
set_freezable() and try_to_freeze()? It appears to unconditionally attempt
I2C access while the bus might be suspended. Can this crash or hang the
I2C bus during system suspend and resume transitions?

drivers/hwmon/adt7470.c:adt7470_temp_read() {
    [ ... ]
	case hwmon_temp_alarm:
		*val =3D !!(data->alarm & channel);
		break;
    [ ... ]
}

[Severity: High]
This is a pre-existing issue, but does this logic incorrectly use the
integer index channel as a bitwise AND mask instead of a bit shift?
Could this yield completely incorrect hardware alarm states, preventing
userspace from properly monitoring temperature emergencies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_th=
ermalzone-v2-0-a55147958fad@gmail.com?part=3D3
