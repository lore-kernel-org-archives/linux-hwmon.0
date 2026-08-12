Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6830C16F
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531579; cv=none; b=eSNfU/K6nH2QfeRR+kIqOtH1SJTPpBRSJLYtXmMLA/RrjlHSdFte8bWX6e1Tya4CoJ6vOYYOmQU42wNrgrsifsG+GDHD3niqoSArTi+B0PvCCPKI/HQKZmAqUtbYSexsGB7bHF1fhv3xbxJphAnOO2CXGEnfp+b04IasHGcfHlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531579; c=relaxed/simple;
	bh=1z1FsND7JzX4IOGuSl+iNRVUgDv+L66kLZ0i+vhFI/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qo34uJ/ZheIQDwxcr+93D5KWovUMkFm1HKP+yoR2fqQ/tY5zVy+Ezic8Dsx455S6jiewgfuLmytBLccWVMHNLRsnBYOh2x6tYu0V0Q6ib3FmXTaEA7bRX2Q3/2irL+QuZdYo3HneKQfiK1DVex7euibIMLsn0NxMmaZp4wQCjYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2iTCIVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2iTCIVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858D01F000E9;
	Wed, 12 Aug 2026 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531577;
	bh=lfSVfLvmnNavRVJt8OUqYQDI2Y6NjQF2gFbqYFzWm/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2iTCIVrpcvGiuZsflnh2L+T7Uh3b9mwfR3WA7KhWZ/4v2xRqAJwGyiMqQmL78uiW
	 EzEJiF9KLMh2XE6KvJ1+ACRCL9U841eM1J9TTmIbNiYmQkHA533gUX5RJYVWT7rxfi
	 PHwNEB9V2vKI+DHkJaFnnSJvF9rWFB7HaJ0uGi/4bVMdAD7ZVjUvZjMSYkUJmhuw3R
	 LG9db3B5UYMfY77BHy+/2C3P5QQWqEtm0FWoGvGFd1VpOcQioYVmfR42mVPnQnPARq
	 E+Y8H9LRGxCoyqZRtrDggfJNN7p/jURCgyUfeZKIjskeb5zBpRS3zsSS8ZP2gpsFlN
	 L3dn2N92Bc5pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812103532.395049-3-renari@arimil.com>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-3-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:46:16 +0000
Message-Id: <20260812104617.858D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Hardware transport is started before synchronization primitive=
s are initialized, leading to a NULL pointer dereference.
- [High] Missing bounds check on HID report size leads to kernel memory inf=
ormation leak.
- [High] Ineffective spinlock usage causes data races and corrupted complet=
ion state.
--

--- Patch [2]: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III s=
upport ---
commit 38401fc658552e2aee59237664fe94f5ef49d39c
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Add ROG Ryujin III support

The ROG Ryujin III uses different report offsets and a different
cooler-duty channel from the Ryujin II. It also lacks the separate
external fan controller supplied with the older model.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 80563ce38519d..79e5b6d6dae0a 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
[ ... ]
> @@ -34,6 +36,14 @@ static const struct rog_ryujin_device_info rog_ryujin_=
ii_360_info =3D {
>  	.has_controller =3D true,
>  };
> =20
> +static const struct rog_ryujin_device_info rog_ryujin_iii_info =3D {
> +	.temp_offset =3D 5,
> +	.pump_speed_offset =3D 7,
> +	.fan_speed_offset =3D 10,

[Severity: High]
This isn't a bug introduced by this patch, but does this driver check the
size of the incoming HID report before parsing it?

In rog_ryujin_raw_event(), the driver dynamically accesses payload
offsets without validating against the received report size:

	priv->speed_input[1] =3D
		get_unaligned_le16(data + priv->info->fan_speed_offset);

If a malicious or buggy USB device sends a HID report shorter than the
expected length (e.g., 1 byte), this code would unconditionally access
memory up to the offset. Since the underlying HID transport buffer is
dynamically allocated to at least 64 bytes (HID_MIN_BUFFER_SIZE), an
out-of-bounds page fault wouldn't occur, but uninitialized buffer bytes
could be parsed as sensor values and exposed to userspace via hwmon
sysfs attributes.

Could we add a size check at the beginning of rog_ryujin_raw_event()
to prevent leaking kernel memory information?

> +	.duty_channel =3D 1,
> +	.has_controller =3D false,
> +};
> +
[ ... ]
> @@ -605,4 +619,4 @@ module_exit(rog_ryujin_exit);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Aleksa Savic <savicaleksa83@gmail.com>");
> -MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin II 360 AIO cooler");
> +MODULE_DESCRIPTION("Hwmon driver for Asus ROG Ryujin AIO coolers");

[Severity: Critical]
This is a pre-existing issue, but is the initialization order safe in
rog_ryujin_probe()?

The hardware transport is enabled and opened before initializing the
completion structures used in the raw event handler:

	ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
	...
	ret =3D hid_hw_open(hdev);
	...
	init_completion(&priv->cooler_status_received);

If a report arrives immediately after hid_hw_open(),
rog_ryujin_raw_event() can fire and call complete_all() on a zero-allocated
struct completion.=20

The wait.head list_head inside the completion is uninitialized, which could
cause __wake_up_locked() to dereference a NULL pointer and trigger a kernel
panic.

Should init_completion() be moved before the hardware transport is started?

[Severity: High]
This is a pre-existing issue, but does the spinlock usage correctly seriali=
ze
against the raw event handler?

In rog_ryujin_execute_cmd(), the spinlock is acquired to serialize
against the raw event handler:

	spin_lock_bh(&priv->status_report_request_lock);
	reinit_completion(status_completion);
	spin_unlock_bh(&priv->status_report_request_lock);

However, rog_ryujin_raw_event() modifies the completion state concurrently
without acquiring this protective spinlock:

	if (!completion_done(&priv->cooler_status_received))
		complete_all(&priv->cooler_status_received);

If a device report arrives on another CPU exactly as execute_cmd() is
calling reinit_completion() (which sets done =3D 0), this lack of mutual
exclusion allows reinit_completion() to race with complete_all().

Could this corrupt the completion count and cause the driver to sleep
until timeout?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812103532.3950=
49-1-renari@arimil.com?part=3D2
