Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856A3B2FF9
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676259; cv=none; b=RBf6zlBCDgnNa9CKfWRK/ZBQ1ZtQwUQy2BmeNycxldtUokaW2DmzBSVYJXlozVJ7L9LivWosDCIDPwBOuSeoxO8+INyGlzIdxlXEZ+jeDTekuVHiC8pnt5m22+8fes2Rag8hZY8uL8BQQlKQesu2xJQGSJgnVvpdJzwMf9ZsvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676259; c=relaxed/simple;
	bh=RwzxNHnk6hyM1IDPaGSHqUI8UzIk2EzBSGvLq11lFx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1rhGvi7CEU3ZnNU9ciHbxDfA6bEDRZXDrWTurretwW6ZXXICSziTnQiSZnj7sm+NDE1DcyhrjP6XNatS3qyuiGM7DWWV/RMfYeBii0gUs5Nzt3Vb4Ns9cgVOHc1Qgay1W5KsWtUyczoS8rSn51CGN3dbemf8FgvoKbX8ktZJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otGDN128; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otGDN128"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2861F00A3A;
	Sun,  2 Aug 2026 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785676257;
	bh=0c+CDyZAhhZDR7PH8EKPYfXHY4dFANW09Xqf9ud+xGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otGDN128f0zIgZ8+diAqwS/mftnWRy4dAgIa6piJ9S4ZMCuU9UUToUHub6R3Xx+5S
	 TFVA2UDRis9BxBZ0G8YZHWPthjxqs1ezm6luugaPEfu7ehtXILRS4IqPtrYi0Dro+g
	 y6/KFjjT1Sv3CQouTJiVKDsdYCCONgumMnDfkLoXRbxAJKp20IzyQJqwY3SUg6Esqe
	 bKmeVL4cHMCwpcjsTaYQIh2cFoYbHkXfjKfiuZ/0KPW0rpORDaDDTx96BkEDmFiSA+
	 Zt3NCryNY6zPNjBBO82WePpYYEKHFAjl5ox+CyJx7a0LsopJZiV+zOqMmcAX9r1ngN
	 ZiqLvUkK1KDDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) null terminate the vendor and
 product strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260802125327.21469-1-ali@iusegentoo.com>
References: <20260802125327.21469-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 13:10:56 +0000
Message-Id: <20260802131057.3F2861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Debugfs attributes lack hwmon_lock() serialization, causing race c=
onditions with sysfs operations on shared command buffers.
- [High] The mantissa sign-extension in `corsairpsu_linear11_to_int` fails =
due to C integer promotion rules, causing negative mantissa values to be pa=
rsed incorrectly as massive positive values.
- [High] The driver shares a single buffer (`priv->cmd_buffer`) between the=
 TX path and asynchronous RX path without proper separation, leading to dat=
a races and DMA corruption.
--

--- Patch [1]: [PATCH] hwmon: (corsair-psu) null terminate the vendor and p=
roduct strings ---
commit b38110dc992661872091c42f387566734213a5a4
Author: Ali Ahmet Memis <ali@iusegentoo.com>

hwmon: (corsair-psu) null terminate the vendor and product strings

This commit increases the vendor and product arrays by one byte. Because
the structure is zero-allocated, this ensures the strings are always
null-terminated even if the device fills the entire buffer.

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index ce958cdaef58a..5852f3e4474c8 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -123,8 +123,8 @@ struct corsairpsu_data {
>  	struct dentry *debugfs;
>  	struct completion wait_completion;
>  	u8 *cmd_buffer;

[Severity: High]
This is a pre-existing issue, but does the lack of hwmon_lock()
serialization in debugfs functions cause race conditions?

Concurrent reads of debugfs attributes and sysfs attributes bypass the hwmon
core's serialization. For example:

drivers/hwmon/corsair-psu.c:uptime_show() {
    print_uptime(seqf, PSU_CMD_UPTIME);
    ...
}

This invokes USB commands without acquiring hwmon_lock(priv->hwmon_dev) or
an internal driver lock, which can race with sysfs operations:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
    ...
}

Could this data race on priv->cmd_buffer and wait_completion cause malformed
commands to be sent to the PSU hardware, potentially leading to undefined
device behavior or unexpected power down?

[Severity: High]
This is another pre-existing issue, but is it possible for the shared
priv->cmd_buffer to lead to data races and DMA corruption between the TX and
RX paths?

The HID event handler runs asynchronously in softirq context and overwrites
the buffer locklessly:

drivers/hwmon/corsair-psu.c:corsairpsu_raw_event() {
    memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
    ...
}

This can interrupt and corrupt the transmission of the shared command buffe=
r:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    ret =3D hid_hw_output_report(priv->hdev, priv->cmd_buffer, CMD_BUFFER_S=
IZE);
    ...
}

If a delayed response arrives precisely when a new command is being
transmitted, the outgoing buffer could be corrupted mid-flight. Would this
send a garbled command to the PSU hardware and violate DMA mapping rules if
the USB host controller is actively reading the buffer?

> -	char vendor[REPLY_SIZE];
> -	char product[REPLY_SIZE];
> +	char vendor[REPLY_SIZE + 1];
> +	char product[REPLY_SIZE + 1];
>  	long temp_crit[TEMP_COUNT];

[Severity: High]
This is a pre-existing issue, but does the mantissa sign-extension fail when
parsing temperatures?

Looking at corsairpsu_linear11_to_int():

drivers/hwmon/corsair-psu.c:corsairpsu_linear11_to_int() {
    const int mant =3D (((s16)(val & 0x7ff)) << 5) >> 5;
    ...
}

This operation fails to sign-extend the 11-bit two's complement mantissa
because the value cast to s16 is bounded by 0x7ff, resulting in a strictly
positive integer after promotion and left shift.

A negative sensor reading would be parsed as a massive positive value.
Because the driver registers with the thermal subsystem, could this massive
temperature reading immediately trigger a thermal trip and cause an
unexpected emergency system shutdown?

>  	long in_crit[RAIL_COUNT];
>  	long in_lcrit[RAIL_COUNT];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802125327.2146=
9-1-ali@iusegentoo.com?part=3D1
