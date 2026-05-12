Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB81FBEBC
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548370; cv=none; b=Nby5u/vwhXaxXS1nVY9ACqM1E0RivmUo8OeYfO9SL+CWs4W/9IHg6nH5iFx0qfXq/SWS0llTzI4LMzPt7OIp5xmInlfpmcN8Ep3Xo5KSSaSCVCYnkjlITRjOm6EEMgsHbHkljN/3z2Zwa4Hvzm7oTjFWeg/f7TfWWkURtcdJGUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548370; c=relaxed/simple;
	bh=y5aBr2R6GTuZQew+qO7lmrn+n/MNl7vpXQw4/X5FLR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vDWHhG45+zb6/k6gJbD3Y16l83cfI4fLLTMAm25bN3X8oyInxzjhHFk4p2JllzHGijjHjyp+zKxfg+PsYl8fzSw1F4vDIh17Hq93NrU5c59UiBuY8wom5jiTreZOXOKP66rwZBz+inDBsv/Gc9X6qBSpN/FVApPiWMF8vBuZqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfOd4R02; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfOd4R02"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84306C2BCF7;
	Tue, 12 May 2026 01:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548369;
	bh=y5aBr2R6GTuZQew+qO7lmrn+n/MNl7vpXQw4/X5FLR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lfOd4R02kZggp1O9yjR6S4/wKrStcyd9eEOe7mAjlWOKu5h7EwRrGYtUviirqrz3h
	 Rvc6LsQ7+Dtzh+1Ur7aszIiv+0zbPS+GMx90bTSWyVSdrtHVTnGLWGorDFTFUfQp+L
	 CfIN9VWmjNiqCaCDNRaM956z1OdQo4w4m/m96iGIZ44Je/kg5Et08SXfyHmitKIzwo
	 J/r5YoMLDAj7JvclcYYHiAnboC5o7e1MpV4xV0ouvi0yFCKqdBVmPwHunOtDGCEjDI
	 wgKkzAMybwgkq7ZKI4WOFiWty+07dTN0/IOLdxRpcNHTqJ+outdYzk3ugoVu4rKo7m
	 XXznyqrD6eyeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] hwmon: (pmbus/adm1266) replace probe-time RTC
 seed with rtc_class device
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260510-adm1266-v2-4-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-4-3a22b903c2f1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:12:48 +0000
Message-Id: <20260512011249.84306C2BCF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing Kconfig dependency on `RTC_CLASS` leads to undefined refer=
ence linker errors.
- [High] Premature RTC device registration leads to race conditions during =
probe and potential Use-After-Free during teardown.
- [High] RTC read/write operations perform unprotected I2C bus transactions=
, violating hardware monitoring subsystem locking guidelines.
--

commit acf9685b4d9858e1995d0669238f315fc9a4e09f
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) replace probe-time RTC seed with rtc_class device

This commit removes the unconditional probe-time RTC seeding. It adds
an rtc_class device to allow userspace to synchronize the device's internal
clock.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -513,21 +513,71 @@ static int adm1266_config_nvmem(struct adm1266_data=
 *data)
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

Does this code violate the hardware monitoring subsystem locking guidelines?

The hwmon subsystem guidelines state that drivers must implement locking
required for attributes registered outside of the core, and should use
hwmon_lock() and hwmon_unlock() for this purpose.

Since adm1266_rtc_read_time() and adm1266_rtc_set_time() invoke raw i2c
transactions without acquiring a lock, could these operations interleave
with multi-transaction PMBus sequences and lead to corrupted hardware state?

[ ... ]
> +static int adm1266_register_rtc(struct adm1266_data *data)
> +{
> +	struct rtc_device *rtc;
> +
> +	rtc =3D devm_rtc_allocate_device(&data->client->dev);

Is there a missing Kconfig dependency for the RTC subsystem?

This code calls devm_rtc_allocate_device() and devm_rtc_register_device(),
but if the driver is enabled while the RTC subsystem is disabled, the build
will fail with undefined reference errors during linking.

Unlike some other subsystems, linux/rtc.h does not provide static inline
stubs for these functions when the subsystem is disabled.

[ ... ]
> @@ -553,7 +603,7 @@ static int adm1266_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D adm1266_set_rtc(data);
> +	ret =3D adm1266_register_rtc(data);
>  	if (ret < 0)
>  		return ret;

Can this registration sequence lead to race conditions or a use-after-free
during teardown?

By calling adm1266_register_rtc() before pmbus_do_probe() (which happens
later in this function), the rtc device is exposed to userspace while
the PMBus hardware probe is still executing. Userspace could trigger
read or write operations before the PMBus core is fully initialized.

Additionally, devm_rtc_register_device() registers a devres action. If
pmbus_do_probe() later fails, or during normal device unbind, the LIFO
devres teardown will release the PMBus core structures before the rtc
device is unregistered.

If rtc callbacks are accessed during this window, could they dereference
freed PMBus structures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adm1266-v2=
-0-3a22b903c2f1@nexthop.ai?part=3D4
