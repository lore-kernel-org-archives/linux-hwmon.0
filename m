Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDEC14A8B
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061654; cv=none; b=eoSihQGWPm0sSXamyyLGxtrT09xhlCMHrbx4FyNEue0tw/he2RcL7GJbPAq+wWlOmFQ9oEJpkGlhcr6OGjrDJ9ntv0E0Yw7niq3JNzuaR4H+ikazmibsqs8zwO6WIT+WDAbbTcs+QY8TTTsRUk3PWGd+Ws45FhIGx9m9aktV28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061654; c=relaxed/simple;
	bh=BLyblP1qFvuq4gC2hGy+mb6T4ANADfx5Hpe9B8rM4DQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I5M+woolNcdqhDDCHXfpOB7PNF+E2RqYECXUvhMkb+Zet/7bQN40QQo1AATbfFDfn6s/0Pd+lz7KS6ZHqYNGeHfHMObNYcRAGo84wlwjap9ya8Rm3RPccPINzVjPQVfzk6B2FOv1KYO6EsCrxYCRNAQ5t45uXeQdJpdY4zbotXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJxssG3U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJxssG3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61901F000E9;
	Fri,  7 Aug 2026 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061653;
	bh=YRqp6YR60Mz5EEu3ba2oGXL79DteF8eHu2VwZPBN6yE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJxssG3UvLXRucznf3HBkrKYor5urhaeS29Hmeg0Mocow0XOf7RP5cQSCpcVVOfM/
	 BUgM7vu/HGKDSHgvBRiXVcNNXC4rJJfW7U8FpQXpv7a37rwwTAaGPYbK80OCZJlYxC
	 HzyB++BO4i0LeeD07eM8L0/q5ijiS4NwZj/uGtrFNh737vx7nIPYAasJoF5ShzSH8J
	 G+pV6jF66pHpR8Ekpl6Yl9858Y055GPalyU/DZT/n+TNk6hTDQ2Pje3XZ8sEbfSvBL
	 48sQFJunqxRtwcvMjWCnzjiRLQ9FAJMvXYoSydYhuSO578qS13xIC3NVsH0mjDCvkA
	 dvojcVx/Uu2kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260807000107.1786892-2-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-2-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 00:14:12 +0000
Message-Id: <20260807001412.B61901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Dynamic sysfs IDs (new_id) binding will cause a NULL pointer deref=
erence because `id->driver_data` is unchecked.

Pre-existing issues:
- [High] Missing bounds check on HID report size before accessing payload o=
ffsets in `rog_ryujin_raw_event`, leading to an out-of-bounds read and info=
rmation leak.
- [High] The `status_report_request_lock` fails to protect `reinit_completi=
on()` from concurrent `complete_all()` calls in `rog_ryujin_raw_event`.
- [High] The device is exposed to HID raw events before its completions and=
 locks are initialized, risking a NULL pointer dereference and kernel crash.
- [High] The driver allocates a DMA buffer using `devm_kzalloc()`, which br=
eaks cacheline alignment and causes memory corruption on non-coherent DMA a=
rchitectures.
--

--- Patch [1]: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configur=
ation ---
commit 532faa30887394da7e60da86be21849f6a4f86c4
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Add per-device configuration

Move model-specific report offsets and capabilities into a device
information structure. This prepares the driver for coolers which use
a different report layout or do not include the external fan
controller, while preserving the existing Ryujin II 360 behavior.

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 10a1f5aca988d..b86b87e33615d 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
[ ... ]
> @@ -394,10 +416,12 @@ static int rog_ryujin_raw_event(struct hid_device *=
hdev, struct hid_report *repo
> =20
>  	if (data[1] =3D=3D RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
>  		/* Received coolant temp and speeds of pump and internal fan */
> -		priv->temp_input[0] =3D
> -		    data[RYUJIN_TEMP_SENSOR_1] * 1000 + data[RYUJIN_TEMP_SENSOR_2] * 1=
00;
> -		priv->speed_input[0] =3D get_unaligned_le16(data + RYUJIN_PUMP_SPEED);
> -		priv->speed_input[1] =3D get_unaligned_le16(data + RYUJIN_INTERNAL_FAN=
_SPEED);
> +		priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
> +			data[priv->info->temp_offset + 1] * 100;

[Severity: High]
This is a pre-existing issue, but does this code lack a bounds check on the
incoming HID report size?

If a malicious device sends a truncated report that is smaller than the
expected payload, the size parameter is ignored. Accessing offsets like
data[priv->info->temp_offset] could result in an out-of-bounds read.

Can we add a check against the size parameter before accessing the payload?

> +		priv->speed_input[0] =3D
> +			get_unaligned_le16(data + priv->info->pump_speed_offset);
> +		priv->speed_input[1] =3D
> +			get_unaligned_le16(data + priv->info->fan_speed_offset);
> =20
>  		if (!completion_done(&priv->cooler_status_received))
>  			complete_all(&priv->cooler_status_received);

[Severity: High]
This is a pre-existing issue, but is there a data race between this
complete_all() call and reinit_completion()?

In rog_ryujin_execute_cmd(), the status_report_request_lock is used:

spin_lock_bh(&priv->status_report_request_lock);
reinit_completion(status_completion);
spin_unlock_bh(&priv->status_report_request_lock);

However, complete_all() is called here in the raw event handler without
acquiring status_report_request_lock. If the device sends an unsolicited
report or commands are interleaved, could this lead to corrupted completion
state or missed wakeups?

[ ... ]
> @@ -476,6 +500,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, =
const struct hid_device_id
>  		return -ENOMEM;
> =20
>  	priv->hdev =3D hdev;
> +	priv->info =3D (const struct rog_ryujin_device_info *)id->driver_data;

[Severity: High]
When binding the driver dynamically via the new_id sysfs interface,
id->driver_data can be NULL if the data field is omitted.=20

If priv->info is assigned NULL here, won't this cause a panic when the hwmon
core subsequently queries attribute visibility during device registration?

hwmon_device_register_with_info()
   rog_ryujin_is_visible()
      if (channel >=3D 2 && !priv->info->has_controller)
                                 ^^^^

Could we add a check to validate id->driver_data before assignment?

>  	hid_set_drvdata(hdev, priv);
> =20
[ ... ]
> 	ret =3D hid_parse(hdev);
> 	if (ret) {
> 		hid_err(hdev, "hid parse failed with %d\n", ret);
> 		return ret;
> 	}
>=20
> 	/* Enable hidraw so existing user-space tools can continue to work */
> 	ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> 	if (ret) {
> 		hid_err(hdev, "hid hw start failed with %d\n", ret);
> 		return ret;
> 	}
>=20
> 	ret =3D hid_hw_open(hdev);

[Severity: High]
This is a pre-existing issue, but is the device exposed to HID raw events
before its completion structures are initialized?

If hid_hw_start() and hid_hw_open() are called before init_completion()
initializes queues like cooler_status_received, and the device sends an
immediate interrupt report:

rog_ryujin_raw_event()
   complete_all(&priv->cooler_status_received)

Could this dereference a NULL pointer since the completions were only just
allocated with devm_kzalloc() and have not yet been initialized?

> 	if (ret) {
> 		hid_err(hdev, "hid hw open failed with %d\n", ret);
> 		goto fail_and_stop;
> 	}
>=20
> 	priv->buffer =3D devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);

[Severity: High]
This is a pre-existing issue, but is it safe to use devm_kzalloc() for a DMA
buffer?

When this buffer is later passed to hid_hw_output_report() in
rog_ryujin_write_expanded(), it is inherently mapped for DMA.

Because devm_kzalloc() embeds a devres header, the returned pointer is not
cacheline aligned. On non-coherent architectures, cache invalidation during
DMA operations could corrupt the adjacent devres header or preceding memory.

Should this buffer be allocated with a non-devm allocator like kzalloc()
to guarantee proper alignment?

> 	if (!priv->buffer) {
> 		ret =3D -ENOMEM;
> 		goto fail_and_close;
> 	}
>=20
> 	spin_lock_init(&priv->status_report_request_lock);
> 	init_completion(&priv->cooler_status_received);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807000107.1786=
892-1-renari@arimil.com?part=3D1
