Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDD1317163
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492161; cv=none; b=Qxh/ofBw85c7ZejvuiXy9O8jNq4xHVfAJQMb2/goB/o5CtJ0KncTUxUgBr6ionDMoYMTTngmujiWSIiRuOq9VSaQ+m7WS8+MIMG9YBl747FdwEUuloVt6UCp5D95VRbYl2hfFPILFiyqYp1r0dNhDgkGdLj2w961r9Ya+X1wg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492161; c=relaxed/simple;
	bh=XUj8SXP3nosHqf/BGCCV2f+Ft65ui/ojW4e4sUzT73s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uCR3nvFLTY6Yh42X33J1GDhFJHqv74PA2N6cIghYAsKMgOsPGMklScgwz+XmJDaCf2PBhvYz6K2/baQTI4P096HrA/b3Xs5zcFwmYrIi3kFwbe+Fpq6NMhdaisozKAk4AbqeteTZtIm8AMv5Q79nYhLCAU7IsWxMfhueXEPYn4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzIjV5ru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzIjV5ru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E331F000E9;
	Tue, 11 Aug 2026 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492159;
	bh=Ai3CFt//M9OwPStuiqcKrae+iC619H53hyZkXeXI4kY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LzIjV5ruYgQuypxvxgY4LWjvx2s2e+sPfYI7DpRUdhjmNOFLGUGlPU1ogs4IVZWEx
	 lKtqqtiDoxd/kbLvm9SHhdG1205FlTtadmGljZIMMieaO4OTEZVQYXf+AKgsLZhZCH
	 X0Oet1uY2Xsi/BUI7idcN9xsABAd5zMPLtNSJ5QKUI7hoF7DTfcNRYYZdbCKD4bwZU
	 KbWYF4FOLrLVdYc3p/fcS2EyJOXpOT4R+HtTPrQ5u1pm5WYgoYGPwXbWzP8NnpFXDB
	 txMhSFvqW63AYgN9uzLqQBHhmjpX8uF9OHgackvVhkUY1oHIfO7PuTI2+e+MAW0qnv
	 WydlHWAAuxoNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260811233943.319729-2-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
 <20260811233943.319729-2-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 23:49:19 +0000
Message-Id: <20260811234919.A6E331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] NULL pointer dereference when device is bound via sysfs `new_i=
d`.

Pre-existing issues:
- [Critical] Out-of-bounds read in raw event handler due to missing size va=
lidation.
- [High] Data race on completion structure leading to missed wakeups.
--

--- Patch [1]: [PATCH v2 1/4] hwmon: (asus_rog_ryujin) Add per-device confi=
guration ---
commit 471ae8f11e4ed856f2112cef2beadd2e4b019b6e
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

[Severity: Critical]
This is a pre-existing issue, but the driver appears to access data[0] and
other offsets without verifying the size of the buffer.

If a malicious device sends a truncated HID report, could this read past
the end of the allocated heap buffer since rog_ryujin_raw_event() extracts
values at offsets like priv->info->temp_offset without verifying that the
size parameter covers these bounds?

> +		priv->speed_input[0] =3D
> +			get_unaligned_le16(data + priv->info->pump_speed_offset);
> +		priv->speed_input[1] =3D
> +			get_unaligned_le16(data + priv->info->fan_speed_offset);
> =20
>  		if (!completion_done(&priv->cooler_status_received))
>  			complete_all(&priv->cooler_status_received);

[Severity: High]
This isn't a bug introduced by this patch, but there seems to be a data
race on the completion structure between rog_ryujin_execute_cmd() and
rog_ryujin_raw_event().

In rog_ryujin_execute_cmd(), the driver attempts to protect the
reinit_completion() call using spin_lock_bh(&priv->status_report_request_lo=
ck).
However, spin_lock_bh() only disables softirqs on the local CPU.

Since rog_ryujin_raw_event() (running in softirq context on another CPU)
calls complete_all() without acquiring status_report_request_lock, could
this lockless write race directly with the locked increment, leading to
state corruption and sysfs read timeouts?

[ ... ]
> @@ -476,6 +500,7 @@ static int rog_ryujin_probe(struct hid_device *hdev, =
const struct hid_device_id
>  		return -ENOMEM;
> =20
>  	priv->hdev =3D hdev;
> +	priv->info =3D (const struct rog_ryujin_device_info *)id->driver_data;

[Severity: Critical]
If a user binds a new USB device ID using the sysfs new_id interface, the
HID subsystem creates a hid_device_id struct with a zero-initialized
driver_data field.

Does this mean id->driver_data can be NULL here? If so, when the hwmon
core calls rog_ryujin_is_visible() during registration, will it trigger a
NULL pointer dereference when evaluating !priv->info->has_controller?

>  	hid_set_drvdata(hdev, priv);
> =20
>  	/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811233943.3197=
29-1-renari@arimil.com?part=3D1
