Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1878A2DECCC
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965920; cv=none; b=jgJJH+mLpi9QRdoPSb3jCBKD6wO7Aq/I6pa+AS6PiZM+7dxKKdR3++rVGEPiDeb9YwIWgAXJmVaVVvhHYgMrDW5pUUOOiEzW0hqz55uhga5qbhDOT5mz/2mrCPpM5OTF1OUXbSBjbegK67jkGmP+PsHWFJ8UW+oWwETdNMLakFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965920; c=relaxed/simple;
	bh=NbDKBO97SYTqHsuvDo59zP/KWnoS2y7FJIn59Oq6AIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C/YorMQeCwE0GNjofHrbFFuZUmMtbvD3TxYikDcW4kM8DU38sbU+t7r0mbUWPymFMKZB3KE0zJZ33olyHbu2jXoiBSQdwaiCxFXT5aRg6c2oM22FfP0homROPPnEsv/g721pNyxw8A1Ab4S4k58SUHSVp2YqRZRSbDfR8UmNwwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqexOqBY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqexOqBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA86AC19425;
	Sat, 16 May 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778965919;
	bh=NbDKBO97SYTqHsuvDo59zP/KWnoS2y7FJIn59Oq6AIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pqexOqBY/xVSohk8hY/ZnQfwDY/0qXsHAklcdU5x+YZxrvsG7cljgDURS0apiH1pE
	 fI0ZWN+QTiwtRg/sqm/WnB69vXkFz0II4kaZro7ROoB5ZUiwICCcNJQaYAC+OBbyex
	 yiiepiyfIdXqEBqXyic/a02rzhY6iq6Da5cMbHzH5bqGxZ452tKjVm0D5fReeOVcD1
	 r24RHF0CZxQ4ZvOnLRz+b/bcZ2dtuNQRMqnoCqLbbDupMmNdmTBviDOEbdabjph1eZ
	 p2k0OzNskBAhS77PQxMs0WBozqVKNkQuqJ68/RjHEAJmg9jLW6wZtLlf4SVosUj/XB
	 QVgyi30ReSJQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (pmbus/adm1266) cap PDIO scan in
 get_multiple at ADM1266_PDIO_NR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-gpio-fixes-v1-1-38d9dd39b905@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v1-1-38d9dd39b905@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 21:11:59 +0000
Message-Id: <20260516211159.AA86AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Stack buffer overflow in `adm1266_nvmem_read_blackbox()` due t=
o an undersized receive buffer.
- [Critical] Heap buffer overflow in `adm1266_nvmem_read_blackbox()` caused=
 by unbounded `record_count`.
- [Critical] Off-by-one heap buffer overflow in `adm1266_pmbus_block_xfer()=
`.
- [High] Uninitialized kernel stack memory use in `adm1266_gpio_get()` and =
`adm1266_gpio_get_multiple()`.
- [High] Data race in `adm1266_nvmem_read()` and violation of hwmon locking=
 rules.
--

commit f36a779e9a35909a02c5a361bfef15bd573ddc08
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR

This commit fixes an out-of-bounds stack read and write in
adm1266_gpio_get_multiple() by changing the loop upper bound from
ADM1266_PDIO_STATUS to ADM1266_PDIO_NR.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index d90f8f80be8e0..11f9a44f4361a 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -211,7 +211,7 @@ static int adm1266_gpio_get_multiple(struct gpio_chip=
 *chip, unsigned long *mask
>  	status =3D read_buf[0] + (read_buf[1] << 8);

Earlier in this function, i2c_smbus_read_block_data() is called. It returns
the number of bytes read on success. If it returns a short read (e.g., 0 or
1 byte), could read_buf[0] and read_buf[1] contain uninitialized stack memo=
ry?

Does this leak kernel stack memory to user space via the GPIO interface?

> =20
>  	*bits =3D 0;
> -	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STA=
TUS) {
> +	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR)=
 {
>  		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
>  			set_bit(gpio_nr, bits);
>  	}

I also noticed a few other potential regressions in this file:

In adm1266_nvmem_read_blackbox(), i2c_smbus_read_block_data() can copy up to
32 bytes (I2C_SMBUS_BLOCK_MAX) into the target buffer. Since buf is only 5
bytes:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	u8 buf[5];
	int ret;

	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO,
                                        buf);
    ...
}

Could a malfunctioning or malicious I2C device returning a large block leng=
th
cause a stack buffer overflow here?


Additionally, record_count is read from the I2C device and can be up to 255.
The target buffer data->dev_mem is allocated with a fixed size of 2048 byte=
s:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	record_count =3D buf[3];

	for (index =3D 0; index < record_count; index++) {
		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1,
					       &index, read_buff);
        ...
		read_buff +=3D ADM1266_BLACKBOX_SIZE;
	}
    ...
}

If the hardware returns a record_count greater than 32 (32 * 64 =3D 2048), =
does
this loop overflow the data->dev_mem heap buffer?


In adm1266_pmbus_block_xfer(), msgs[1].len is set to
ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes):

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
}

However, data->read_buf is only sized for ADM1266_PMBUS_BLOCK_MAX + 1
(256 bytes):

drivers/hwmon/pmbus/adm1266.c {
    ...
	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
    ...
}

Since i2c_transfer() instructs the controller to read exactly 257 bytes,
does this write past the end of the read_buf array?


Finally, the hwmon subsystem guidelines state that drivers must implement
locking for attributes registered by any other means, and should use
hwmon_lock(). Since NVMEM sysfs reads are not serialized:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read() {
    ...
	if (offset =3D=3D 0) {
		memset(data->dev_mem, 0, data->nvmem_config.size);

		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);
    ...
}

If multiple userspace readers access offset =3D=3D 0 concurrently, could th=
ey
simultaneously execute memset(data->dev_mem, 0, ...) and interleave I2C
block reads?

Does this lockless concurrent mutation of data->dev_mem cause data corrupti=
on?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-gp=
io-fixes-v1-0-38d9dd39b905@nexthop.ai?part=3D1
