Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60E3DA7D8
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775675962; cv=none; b=oNTbIUh7g2V37F/kVSCKs1eSAcZzM+W6y907X6gngwL/ankn8qnb4gai8Hl5kuy0FDzynSKcptyufTyfPvGucO5ru49r1iK9HkALodvlWdEOU9/Adrm6i+DsRia342vLZy8UXU4IjadpNguVDGCxhJ/ju/WnEOtO64o3ig2OB9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775675962; c=relaxed/simple;
	bh=Rf6XQOYBVSldG2+816tA354bAiew1e5Z0GWQu+naq0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LsyhxSr6NC4LykbK2N7Kr6IBMyvJPPMheCCm/DHfFEqYKhU6ddm376Ysm94hh0qsT7ao30lOe8CncwxesOSFZ4Uu0TUcOsa0Q4zGHK2PYWQMTet7FFYtNlsnPPD+SbaZ3DZBrFR2chG9xPGaB6/q46X35uQRIhb0Z6GnkcPNwmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad6Gnkq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad6Gnkq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2C9C19421;
	Wed,  8 Apr 2026 19:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775675962;
	bh=Rf6XQOYBVSldG2+816tA354bAiew1e5Z0GWQu+naq0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ad6Gnkq7/x4auKo2cmKTbiAJI2lsbEaXUqjHBqyqIlmtDyyp9VNoyKijEU+HwCLqa
	 5HwxVdWNFY+DoCODyQr4W4JYOBdpMJlF3BY5tI91n0tOCCx+CNZdiZOi/SPlWtQH6d
	 5qlGlwGQwECl/63LCzajgHdKOhyriBEEBagJoiDNY2FyxcwEdGYxTcCdiAlXH6RR+J
	 Pdt3mOABr2PQIugiTLEA0B4MNakrG0XFuJeEpLsb9jSZ2fucJgPWDy/JVHcto7WtVu
	 hq9k4032Y6+rU4INRFmEGPSwoz4cnEymmUYUtL+Sax+cehnZhp2ydNNZdwOTpE0qXg
	 o4gSdwpffQ6eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (powerz) Avoid cacheline sharing for DMA buffer
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260408-powerz-cacheline-alias-v1-1-1254891be0dd@weissschuh.net>
References: <20260408-powerz-cacheline-alias-v1-1-1254891be0dd@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 19:19:21 +0000
Message-Id: <20260408191922.2A2C9C19421@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] A Use-After-Free (UAF) vulnerability occurs on `priv->urb` due to =
a race condition between sysfs reads and device disconnection.
- [High] Incorrect error handling of `wait_for_completion_interruptible_tim=
eout()` allows an active URB to leak in-flight, leading to concurrent DMA m=
odification and URB state corruption.
--

commit e653439f03252b9df547ec7df8f35d202c25c060
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (powerz) Avoid cacheline sharing for DMA buffer

This commit uses the high-level DMA helpers to ensure cacheline sharing
cannot occur for the DMA transfer buffer.

https://sashiko.dev/#/message/20260408175814.934BFC19421%40smtp.kernel.org

> diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
> index 4e663d5b4e330..5e83978956137 100644
> --- a/drivers/hwmon/powerz.c
> +++ b/drivers/hwmon/powerz.c
[ ... ]
> @@ -33,7 +34,9 @@ struct powerz_sensor_data {
>  } __packed;
> =20
>  struct powerz_priv {
> -	char transfer_buffer[64];	/* first member to satisfy DMA alignment */
> +	__dma_from_device_group_begin();
> +	char transfer_buffer[64];
> +	__dma_from_device_group_end();
>  	struct mutex mutex;
>  	struct completion completion;
>  	struct urb *urb;

While reviewing this patch, I noticed a couple of pre-existing issues in
this driver.

Can a use-after-free occur on priv->urb during device disconnection?

The hwmon device is registered using devm_hwmon_device_register_with_info(),
meaning its sysfs attributes are removed during devres cleanup, which
happens after powerz_disconnect() returns.

If a userspace process performs a sysfs read concurrently, it can block
on mutex_lock(&priv->mutex) in powerz_read(). Once powerz_disconnect()
frees the URB and drops the mutex:

drivers/hwmon/powerz.c:powerz_disconnect() {
    ...
	mutex_lock(&priv->mutex);
	usb_kill_urb(priv->urb);
	usb_free_urb(priv->urb);
	mutex_unlock(&priv->mutex);
}

The blocked sysfs read could wake up, proceed into powerz_read_data(),
and use the freed priv->urb:

drivers/hwmon/powerz.c:powerz_read_data() {
    ...
	usb_fill_bulk_urb(priv->urb, udev, ...);
	ret =3D usb_submit_urb(priv->urb, GFP_KERNEL);
    ...
}


Additionally, is the error handling for wait_for_completion_interruptible_t=
imeout()
correct in powerz_read_data()?

drivers/hwmon/powerz.c:powerz_read_data() {
    ...
	ret =3D usb_submit_urb(priv->urb, GFP_KERNEL);
	if (ret)
		return ret;

	if (!wait_for_completion_interruptible_timeout
	    (&priv->completion, msecs_to_jiffies(5))) {
		usb_kill_urb(priv->urb);
		return -EIO;
	}
    ...
}

If wait_for_completion_interruptible_timeout() is interrupted by a signal,
it returns -ERESTARTSYS (a negative value). The condition
if (!wait_for_completion_interruptible_timeout(...)) only catches timeouts
(which return 0), bypassing the usb_kill_urb() cleanup.

This could allow the function to return -EIO (since actual_length is 0)
and release priv->mutex while the USB transfer is still active.

Could a subsequent sysfs read then acquire the mutex, modify
priv->transfer_buffer, and call usb_submit_urb() on an active URB?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408-powerz-cac=
heline-alias-v1-1-1254891be0dd@weissschuh.net?part=3D1
