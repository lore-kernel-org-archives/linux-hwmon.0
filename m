Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD617D6
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 02:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489266; cv=none; b=cQ4jYY1V9A9xTs8Za++NQd45b1EPvfSRQWOxSKsUxnevJCDE1/+NuR+/NkHr6skkGPYfI1ukrvVtLo+VxCB2Ux7KGLLeDGj3AsjoBGf5LQL7Vlgw8UZW7vCPH54feONWCIhODdwtk2O0EIOSpKAY2YQC2AZ7xJFk+o9EJEkKpwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489266; c=relaxed/simple;
	bh=Xk0VSnkk4NKOTsLZ81xE3K5NnOQxQU4ryFEZyO24XAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WfZpq8uPzGXA498/gssZb89xVdpNjXsa6QwUoJnJKqfvQmvVy4v73EtqosjBS1lNBcpNodn6X2ApElRcfk73V7Fx5BjE3ueJy0f3ZNVMTAbqpj4d8Hsacz+W6vZTULsm5zt718cUsUH3bA/8BvkrKp1Uat3zlDD59pKDpXUJ9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfAUHqXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfAUHqXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E601F000E9;
	Fri,  4 Sep 2026 02:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788489264;
	bh=VLQ/6ULhXxOGTgMmAYC54vOfIFuFgSLPWMQvv8KKoCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LfAUHqXZklGXahW1DcvXYxJ5P/uWKyw5qr18wOVcA/4eKdMbZ/+pZXAxAjBTapSXY
	 6sOhBcDYovXFW147z2PnBl2kVOWNXuX84vlKqy+PoSJHPnkmgwYE2gfJdVuZVadicE
	 JLrhrzDgNkspW+OIghKd8/alPjr5gt+TCDjBJQPdnyXOi9dYiXy+dL8zvUcheGfM6K
	 Xkl7cLM0qhZlQzPz5DM6FSiTSOnVdVr9SpTuFE5QTwn7wsZBO5NcqXLTwYClR55rnv
	 oWX7bSxHaFUPesytc3SoVfnUEGNf+fOrfpnCnjuXMSvjPYNmgtSSdUWPr4O613+kwm
	 dzoW4b47Jlmkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command
 and report handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260904022129.97896-3-renari@arimil.com>
References: <20260904022129.97896-1-renari@arimil.com>
 <20260904022129.97896-3-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:34:24 +0000
Message-Id: <20260904023424.B3E601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver starts the hardware and registers hidraw before initial=
izing the driver's spinlock and completions, leading to a potential NULL po=
inter dereference panic if a report arrives early.
--

commit 3c28258aa778caf1385fb4cb2e13b3f6eaf844f5
Author: Arie Miller <renari@arimil.com>

    hwmon: (asus_rog_ryujin) Synchronize HID command and report handling

    This commit fixes a race condition where a HID response can be lost bec=
ause
    the event handler did not acquire the status lock before updating the
    completion. It modifies both the command execution and raw event paths =
to
    use irqsave spinlock variants to prevent the command from timing out.

    Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9=
@smtp.kernel.org/

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index f4d99c5103691..e297557ca3463 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
[ ... ]
> @@ -421,15 +422,18 @@ static int rog_ryujin_raw_event(struct hid_device *=
hdev, struct hid_report *repo
>  				int size)
>  {
>  	struct rog_ryujin_data *priv =3D hid_get_drvdata(hdev);
> +	unsigned long flags;
> =20
>  	if (size < 2 || data[0] !=3D RYUJIN_CMD_PREFIX)
>  		return 0;
> =20
> +	spin_lock_irqsave(&priv->status_report_request_lock, flags);

[Severity: High]
This is a pre-existing issue, but I am wondering if this could lead to a NU=
LL
pointer dereference during initialization?

Looking at rog_ryujin_probe() in drivers/hwmon/asus_rog_ryujin.c, the hardw=
are
data flow is started before the synchronization primitives used by the
interrupt handler are initialized:

rog_ryujin_probe() {
    ...
    ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
    ...
    ret =3D hid_hw_open(hdev);
    ...
    spin_lock_init(&priv->status_report_request_lock);
    init_completion(&priv->cooler_status_received);
    ...
}

If a USB device sends a HID report immediately after hid_hw_open() but befo=
re
probe() completes initialization of the spinlock and completions, the event
handler rog_ryujin_raw_event() will attempt to lock an uninitialized spinlo=
ck
and trigger completion logic on zero-allocated struct completion objects.

Would this result in a NULL pointer dereference in the waitqueue list handl=
ing
if a report arrives early?

> +
>  	if (data[1] =3D=3D RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
>  		if (size <=3D priv->info->temp_offset + 1 ||
>  		    size <=3D priv->info->pump_speed_offset + 1 ||
>  		    size <=3D priv->info->fan_speed_offset + 1)
> -			return 0;
> +			goto unlock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022129.9789=
6-1-renari@arimil.com?part=3D2
