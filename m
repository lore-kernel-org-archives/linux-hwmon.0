Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739635200D
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489323; cv=none; b=RrWo/fEyotQUgSokVjounNd5thwyI+iaZR4NsMwHnFhDLJJWBHuJ60XCalvBtYxfnqL773vXs1ZaAQ2e6n4EYQwNd/An/aFrvOIR+dkaCJn4s/T79yGlbFYKEXoZMT9Nvp1LaBwAmvRtI1nIrHqYcJlmdUFqZKPsEIOIq3sg9t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489323; c=relaxed/simple;
	bh=ZBknDB8YKH55mWXSiT/7MqK9UQ6UxDKpEnJljun4DL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T50cYWQiSihpcQX8zy4FV9Q3kD1dAPQayxbaqIbWcuvvqxVMVasKKDp8LnH4lvTTQe/3+tnqjUGo16YFaU7h6VDi8hplUbGzGPXvYIPLjRkPWHJuqUkTkMAmSLzaUY2D1yFjcqRHak5acsglNi7FFwfcAqzYl4A/BC5JM7L73bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S707hX/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S707hX/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A471F000E9;
	Fri,  4 Sep 2026 02:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788489321;
	bh=yRWwfcYuYPzhLS/zrhZfqZeGHPAu+IyuwfcEzwBVsBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S707hX/A9ubjbhB6Nw3Sl/yntU4K8Zo3RAQPcN1CUuatavfg/rLEl2YEgYAjbBFT+
	 Hx8Wj+81w1/4FTi7RfiGU84Fljrelk/Zyi2V0kMKxBgtWHz1WaYzwYjLDMpDB5FfBB
	 JtCYRlcDdWdFnDIi6/H0F365zDP4J18lXTVgseeWN8u5HVhgid9c4AydU4ED1vjdtY
	 Ch5RTocfaWk7t+9E+KlsGCMorNIqsAPA64SmiLU2sLMWG0vg9VDdk1JO7YGVYM42te
	 UAbnoEd4C7ZiVXbIiG/on9nCiuUU1iR2XPp55lXTPXYT+wTAurqCG7ChFmqRAA0cxm
	 ZVgWKPw6X+T0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus_rog_ryujin) Validate HID report
 lengths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260904022129.97896-2-renari@arimil.com>
References: <20260904022129.97896-1-renari@arimil.com>
 <20260904022129.97896-2-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:35:20 +0000
Message-Id: <20260904023521.75A471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Missing synchronization when reading sensor data in sysfs callba=
cks, violating hwmon subsystem guidelines.
--

commit 4aa6deb585949a68bf55aaa6ef4f88906594c6f3
Author: Arie Miller <renari@arimil.com>

hwmon: (asus_rog_ryujin) Validate HID report lengths

This commit validates response headers and payload fields in the HID raw
event handler before parsing them. This prevents the driver from consuming
uninitialized bytes from short reports.

Link: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.=
kernel.org/

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 702edb8313945..f4d99c5103691 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
[ ... ]
> @@ -422,10 +422,15 @@ static int rog_ryujin_raw_event(struct hid_device *=
hdev, struct hid_report *repo
>  {
>  	struct rog_ryujin_data *priv =3D hid_get_drvdata(hdev);
> =20
> -	if (data[0] !=3D RYUJIN_CMD_PREFIX)
> +	if (size < 2 || data[0] !=3D RYUJIN_CMD_PREFIX)
>  		return 0;
> =20
>  	if (data[1] =3D=3D RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
> +		if (size <=3D priv->info->temp_offset + 1 ||
> +		    size <=3D priv->info->pump_speed_offset + 1 ||
> +		    size <=3D priv->info->fan_speed_offset + 1)
> +			return 0;
> +
>  		/* Received coolant temp and speeds of pump and internal fan */
>  		priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
>  			data[priv->info->temp_offset + 1] * 100;

[Severity: Medium]
This isn't a bug introduced by this patch, but is it possible for a data
race to occur on the sensor data arrays like priv->temp_input between
this interrupt handler and the sysfs read callbacks?

While the sensor arrays are written to from the HID raw event handler
here in interrupt context while holding the status_report_request_lock
spinlock, the sysfs read callback appears to read the sensor values
locklessly in process context:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_read() {
    ...
	case hwmon_temp:
		*val =3D priv->temp_input[channel];
		break;
    ...
}

Concurrently, an unsolicited hardware report or a report triggered by
another hidraw client can be processed by the HID interrupt handler in
rog_ryujin_raw_event(), overwriting the sensor values while they are
being read. This could lead to torn reads or undefined behavior.

The hwmon subsystem guidelines mandate that drivers must implement locking
required for interrupt handling. Could the driver take its
status_report_request_lock spinlock during rog_ryujin_read() to safely
synchronize with the raw event handler? This pre-existing issue remains
unfixed in the final state of the series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022129.9789=
6-1-renari@arimil.com?part=3D1
