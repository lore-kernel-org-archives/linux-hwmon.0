Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957233A9F8
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026908; cv=none; b=pAM2+st5CpRA8651l55Jihb9wQVhmZZnwuKMFsvT4b6BT8ic1WO2RDjk5yuyx+tnp3N4HwXQrwCBiXGUWmHchtxronFktBXSUlyB+d+g6LpUfLyR4be1ey3zhZTeLZgVrmPrTh/0lWMnX9QD8h+DcjfRV3pRUfFna2LY3ZKTOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026908; c=relaxed/simple;
	bh=ED+ya2z8Evs1BEdxjc8XAhtMlf5RbhXlMVchYCoRPug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZqkQt4J9DqLnT6m+JdC+Q49psD0OT6MiQLDg6C+W4WLXzLsFEJItlTDD9Sz7ToKB7+jBD/XYqsDRoOVDODE9Vusf3WCa7cI3aqdgzS8oBC9T6Nhkx6dYuEkIsLLNK2x/7UAqXsCdQL6TC/2dikhEXeK2VfonZPqjQ1NI3GuLU2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC5O9eOO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC5O9eOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81821F000E9;
	Thu,  6 Aug 2026 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786026906;
	bh=Gvy3WqI7dXFGq/8zSQLfSoAGFzYFj5Efx4k0OMSDlYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kC5O9eOOXG12Bc15MCv8McjAFUKXYOFzwf0hgs9QPxDXEDqfk10DkDVjjD2Ff4/EU
	 TeqWOfl+kYgfqQcm7dLQvW+iD26DqvjneneGcWyN3rhg/dj6U5Bl5bZaFccprKfJQr
	 f5YynrG271KDLTArXj1IyOXmF6yI+22v6KtcnXFFGaE3dZClsc7uxizKNwR+eKUUXQ
	 S4UBrqvOpVItz456gjju+BdJ2M9vxPUgKDGbn1rUkpKZYkImzHG3HqojzHOBC0VvjH
	 elKbANaWIvtZiLdkpHgv33eQsOMNaNAIM95ehLWdYfieXYKrwIYqakRpXQpnoPEkC3
	 JSp9Frr4XuHwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (corsair-psu) serialize debugfs access
 against hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260806142139.168611-1-ali@iusegentoo.com>
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260806142139.168611-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:35:06 +0000
Message-Id: <20260806143506.B81821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential data race and buffer corruption on the shared `cmd_buffe=
r` following a command timeout.
- [High] Out-of-bounds read and potential information leak in debugfs handl=
ers for vendor and product strings.
--

--- Patch [1]: [PATCH v2] hwmon: (corsair-psu) serialize debugfs access aga=
inst hwmon ---
commit 17027f95f57d41549658af1b49c4295c03ed4860
Author: Ali Ahmet Memis <ali@iusegentoo.com>

hwmon: (corsair-psu) serialize debugfs access against hwmon
   =20
This commit adds guard(hwmon_lock) to the debugfs read paths in=20
print_uptime() and ocpmode_show() to serialize them against the hwmon core.
This prevents data races and incorrect sensor readings resulting from
concurrent USB commands interleaving.

Link: https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roec=
k-us.net/
Link: https://lore.kernel.org/all/20260806161028.42218ebd@posteo.net/
Link: https://lore.kernel.org/all/20260802123653.19532-1-ali@iusegentoo.com/

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index ce958cdaef58a..033166db6bc42 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -664,6 +664,8 @@ static void print_uptime(struct seq_file *seqf, u8 cm=
d)
>  	long val;
>  	int ret;
> =20
> +	guard(hwmon_lock)(priv->hwmon_dev);
> +
>  	ret =3D corsairpsu_get_value(priv, cmd, 0, &val);

[ ... ]

[Severity: High]
This is a pre-existing issue, but can this sequence lead to a data race or
buffer corruption on the shared cmd_buffer if a USB command times out?

If wait_for_completion_timeout() times out in corsairpsu_usb_cmd(), the
completion is left uncompleted. If the hardware later sends a delayed
response, the asynchronous HID interrupt in corsairpsu_raw_event() will
blindly copy the data:

drivers/hwmon/corsair-psu.c:corsairpsu_raw_event() {
    ...
    memcpy(priv->cmd_buffer, data, min(CMD_BUFFER_SIZE, size));
    complete(&priv->wait_completion);
    ...
}

If a new request is concurrently executing in corsairpsu_usb_cmd(), this
delayed copy will race with its setup:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    ...
    memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
    ...
}


[Severity: High]
This is a pre-existing issue, but does this code potentially cause an
out-of-bounds read and information leak in the debugfs handlers?

When corsairpsu_fwinfo() fetches the vendor and product information, it
copies exactly REPLY_SIZE (24) bytes from the untrusted USB device into
priv->vendor and priv->product:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    ...
    memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);
    ...
}

If a malicious device provides exactly 24 non-null characters, these strings
will not be null-terminated. When seq_printf() prints them in vendor_show()
and product_show(), it could read past the array bounds and leak adjacent
kernel heap memory:

drivers/hwmon/corsair-psu.c:vendor_show() {
    ...
    seq_printf(seqf, "%s\n", priv->vendor);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806142139.1686=
11-1-ali@iusegentoo.com?part=3D1
