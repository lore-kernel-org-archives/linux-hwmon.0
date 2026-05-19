Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4A2F2607
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 01:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153289; cv=none; b=EIP2GLdlcNpHQPNyNxun4MDBKW28lwuHWS+sgyZDlTK4So4yJnk1711HnSAkSg2Bdz3U2x3x2R7cHqSeGbLAwsfaidgCRXlDKq+kuHnvc+Ura9YuvMbJSoKiDPM+ax3NHO63d+00yQDi8FlAFamZHOr2wkL3trtpKJM/0inJPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153289; c=relaxed/simple;
	bh=o4KrubpZORilvqlIzAylLlIrl6WmMs0NJLOuLcrAeSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lqbdgqf5IcCNQqT0eQ1OyjYUy1jk9a/vO3UQSRKfSm3RkedcdnJz6txaaHVrs796NEHrfIXXEWyd1/LLuzp+Q0lmRqXX5cnnC3RxivowabDA0BnRtLcFZTRwq0Cjv8culaWRKqqqSR0RnShse8qvr4bHfWlUNg5N/DFwyMptXMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsmIOSJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsmIOSJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E759C2BCB7;
	Tue, 19 May 2026 01:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779153289;
	bh=o4KrubpZORilvqlIzAylLlIrl6WmMs0NJLOuLcrAeSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JsmIOSJSdb3qUIhrqOXiMpOQ1Pefj7PMRxr27k5lo+xeJFTPEDmDY/PWO40c5bbKA
	 NwGHtTHqCl7ufqdZrmB2hP9ph3J24WpxWFH6tKt9T0rrpiVJu+6K6teshCJGQQ6KYD
	 P/Z2wQRVV5Zxt7zE3UKhGHUzmktypB3NaIDjBd8ztzu9GvJrvJy3h8bfZT48hNIYYU
	 vhTRU8ZyZSBvp6VWmMHdR15v22AVs39YZNWnn4cM4e257Tr4WiloXFirM9KQf5HPca
	 zdG1jSoZc8R/R5c522d/JiI9n687cfJ95X2QI5Mgxic5+WgvLCXVtb5XGW7/4YJoeu
	 SxRS9V4u0yKRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/8] hwmon: (pmbus/adm1266) cap PDIO scan in
 get_multiple at ADM1266_PDIO_NR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-1-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-1-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 01:14:48 +0000
Message-Id: <20260519011449.0E759C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Overwriting previously set GPIO state in `*bits`.
- [High] Uninitialized stack memory use due to insufficient validation of `=
i2c_smbus_read_block_data`.
- [High] Heap buffer overflow in `adm1266_pmbus_block_xfer`.
- [High] Heap buffer overflow in `adm1266_nvmem_read_blackbox` due to a mis=
sing bounds check.
- [High] Data race and unprotected shared state modification in `adm1266_nv=
mem_read`.
--

commit 850ac6b65baa3669e7d4f1e67c46fb676ed9a96c
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR

This commit modifies the GPIO get_multiple accessor to stop the PDIO scan
at the correct upper bound. While reviewing this change, a few other issues
were noticed in the surrounding code, some of which are addressed by later
commits in the series.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index d90f8f80be8e0..11f9a44f4361a 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -211,7 +211,7 @@ static int adm1266_gpio_get_multiple(struct gpio_chip=
 *chip, unsigned long *mask
>  	status =3D read_buf[0] + (read_buf[1] << 8);
> =20
>  	*bits =3D 0;

This isn't a bug introduced by this patch, but does this second assignment
to *bits unconditionally wipe out the GPIO states successfully collected in
the first loop for indices 0-8?=20

I notice this is fixed later in the series by the commit "hwmon:
(pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple".

Also, is it possible for i2c_smbus_read_block_data() to return a short read
here?

drivers/hwmon/pmbus/adm1266.c:adm1266_gpio_get_multiple() {
    ...
	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_PDIO_STATUS, read_=
buf);
	if (ret < 0)
		return ret;

	status =3D read_buf[0] + (read_buf[1] << 8);
    ...
}

If a short read occurs (returning 0 or 1 byte), does the status calculation
process uninitialized stack memory from read_buf? I see this is addressed
later in the series by "hwmon: (pmbus/adm1266) reject short block-read
responses in the GPIO accessors".

> -	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STA=
TUS) {
> +	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR)=
 {
>  		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
>  			set_bit(gpio_nr, bits);
>  	}

This isn't a bug introduced by this patch, but does this loop lack bounds
checking against the destination buffer size?

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	record_count =3D buf[3];

	for (index =3D 0; index < record_count; index++) {
		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, =
read_buff);
		if (ret < 0)
			return ret;

		if (ret !=3D ADM1266_BLACKBOX_SIZE)
			return -EIO;

		read_buff +=3D ADM1266_BLACKBOX_SIZE;
	}
    ...
}

Since data->dev_mem is only 2048 bytes, if the hardware returns a
record_count greater than 32, does this overflow data->dev_mem?

Looking at the block transfer implementation, is there a potential heap buf=
fer
overflow?

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
	struct i2c_msg msgs[2] =3D {
        ...
		{
			.addr =3D client->addr,
			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
			.buf =3D data->read_buf,
			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
		}
	};
    ...
	ret =3D i2c_transfer(client->adapter, msgs, 2);
    ...
}

Since data->read_buf is allocated as ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes=
),
if a full block is read (or PEC is enabled and max data is received), could
i2c_transfer() overflow data->read_buf by writing 257 bytes into it?

Lastly, is there a missing lock protecting the shared data->dev_mem buffer
during reads?

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read() {
    ...
	if (offset =3D=3D 0) {
		memset(data->dev_mem, 0, data->nvmem_config.size);

		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);
        ...
	}

	memcpy(val, data->dev_mem + offset, bytes);
    ...
}

Can a concurrent read at offset > 0 bypass initialization and read partially
updated or zeroed data while another thread executes memset and reads the
blackbox at offset =3D=3D 0?=20

I notice this is fixed later in the series by the commit "hwmon:
(pmbus/adm1266) serialize NVMEM blackbox read with pmbus_lock".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D1
