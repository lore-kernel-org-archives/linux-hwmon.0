Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7C263C7F
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549381; cv=none; b=UBwgGkGH5vYKz2sttti+ybH7CObKkQyB0jq7GjpE9h32rjviphlQFdFJnkUQ0yE4nqhNGvedtDHd1Vbuukiodkhj43Ycks8dIPOC6eaE9brMYtQvSQtAkm3jlEZ0YUj7DpSSHUv8oM1bfRyyTnYbD9FdwYBDUAtFmkZMTDwnfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549381; c=relaxed/simple;
	bh=zHnTmeJeRcd62Uy0IRaf/VsnvgixqYwi47Dx+gb0qXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LgrspUsANwxZkB/tVZ/ZCZ8CIGq1sgPPYGFYnpSHp7ax4YUv4s0RqnFKboTDqECEABmAPXliILQOHDlstNt29WkGFw40zWHDBpcwnWN5uXn7JDyKUPwhROyGCrLUU2i3xidPi/OY8KhgxAabYaFRXixcUKR9UMOkWATTy0cXAnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Llx1j72J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Llx1j72J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF82C2BCB0;
	Tue, 12 May 2026 01:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549380;
	bh=zHnTmeJeRcd62Uy0IRaf/VsnvgixqYwi47Dx+gb0qXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Llx1j72JIV+9s83k+Hpcu9Y/SxT+tLd5v10h3hys5OeMZma0CldHFLNw8IzGu1+eb
	 KLxdOSmvyQnz/rljXDll3nByojPq682Xvviu4xjsmJtZe6a321YRpjCWlAb3o5Mngn
	 04pF1ewT+DOfybiX6JHzDqfBoaVOyva/NpvOjXI3AXmxLZjf9b++65ryvMB9rvCPqJ
	 Lk3lBtXOZwT8gGJYBPm8dyEdI3X9CaAVUqECrnpo0TcbsWTQXmni5AvEITI5uBIsmI
	 pRKMtliSDKzAZfcHO2LxlK+d+rimN2AW4fN/AdqWZOx5GV3kJayosygC+gSHhEVQOb
	 Jgs+AbrbhooXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 3/5] hwmon: (pmbus/adm1266) add
 powerup_counter debugfs entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260511-adm1266-v2-3-7a6d34f0de5d@nexthop.ai>
References: <20260511-adm1266-v2-3-7a6d34f0de5d@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:29:40 +0000
Message-Id: <20260512012940.BCF82C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing lock in debugfs read function violating hwmon subsystem gu=
idelines.
--

commit 59d29098021812d7f7bd1712ee63ceafd8397c54
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

    hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
   =20
    The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
    (0xE4, datasheet Rev. D, Table 93) that increments on every power
    cycle and cannot be reset by the host. Each blackbox record already
    embeds the counter at record time, so the standalone live value is
    primarily useful for matching a captured record back to the boot it
    came from when correlating logs.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 31aefa8fc75f5..99e92a8365fb7 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -356,6 +357,31 @@ static int adm1266_firmware_revision_read(struct seq=
_file *s, void *pdata)
>  	return 0;
>  }
> =20
> +/*
> + * POWERUP_COUNTER (0xE4) is a 2-byte little-endian non-volatile counter
> + * that increments on every device power cycle (datasheet Rev. D, Table
> + * 93). It saturates at 65535 and cannot be reset by the host. Each
> + * blackbox record embeds the counter value at record time, so this live
> + * read is mainly useful for matching a record back to its boot.
> + */
> +static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
> +{
> +	struct device *dev =3D s->private;
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);

Does this debugfs read need to be protected by hwmon_lock()?

According to the hwmon subsystem guidelines:

"The hardware monitoring subsystem core serializes sysfs operations
for attributes registered with the info parameter of
hwmon_device_register_with_info() and
devm_hwmon_device_register_with_info().
Drivers must implement locking required for interrupt handling and for
attributes registered by any other means. Drivers should use hwmon_lock()
and hwmon_unlock() for this purpose."

Since this attribute is registered via debugfs rather than the info
parameter, concurrent I2C operations here could potentially interleave
with multi-part transactions from the hwmon core (like PMBus page switching=
),
which could disrupt the device's state machine or cause cross-page data
corruption.

> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 2)
> +		return -EIO;
> +
> +	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-adm1266-v2=
-0-7a6d34f0de5d@nexthop.ai?part=3D3
