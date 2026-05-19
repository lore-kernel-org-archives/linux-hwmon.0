Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809FF28CF5D
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164310; cv=none; b=PjlVehZtp8wVlYhuJ0ktY75JFDnXNVC4X//Cnvw5EU2WOqiuPwR7sMiXc0LhABkkGsF96qmwALsZ1ZlvVthp13u8S4Wst5Ld1JqyA13u8YjRNmcg+29x1eOWUvRR91TjU3E6Ho7LkAK7jxRFsVp1pmkNSr/CRzwBWMvckozDXNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164310; c=relaxed/simple;
	bh=EJe2LpL3uUhw1GnO8YZMiNpGhgSLfN5BNNTS/uqMPKA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rlt7tygY5r3+et7AE27Zmum376MENSKAbUSkAeEt5D/a5G7KeMh77+R46nX8GdoDU62J4YqAK8uVbKTcTywfSTtlbdkYqEg6L/tfI6uZFTsk7myliix/PZyxMdDeW2g7XJ4o+XhkY1Uldjf3YchNw5yGCe8iZpIWsVt0VsS+Uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTyEuefx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTyEuefx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0338FC2BCB3;
	Tue, 19 May 2026 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779164310;
	bh=EJe2LpL3uUhw1GnO8YZMiNpGhgSLfN5BNNTS/uqMPKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PTyEuefxQA0LCf2y7XfiwUatlulIiJLl/Yrno2w8TysV+/jh0doNG4wHKy9LvfXur
	 4HsLsCr4ZDSuad9UfsaDHqfes056mdskGBzBY3zb9RkMUzvZTlQOUTBbIRu1L0s9w3
	 +rNL2eJsFIASWT2kqIlAwWpuXNa5c2uT0XJvqwyuwx+aCmqJrxv9Dmn20zqc1ytmsa
	 U0HCwLUeRnN2RGbzeJb/lfcZv+C0nMVlbpWWTElBxt4TM0n1FPfg0etRq3HTPH6z3n
	 EwUoHhPsziFy71TYkGNjI+90Rr4Hy4e0KI56xtmRByA5sMizbxLvjam/wLGY7tJvmi
	 +ExuVdT/7kujw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/8] hwmon: (pmbus/adm1266) serialize GPIO PMBus
 accesses with pmbus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-6-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-6-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 04:18:29 +0000
Message-Id: <20260519041830.0338FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Heap buffer overflow and infinite loop in adm1266_nvmem_read_b=
lackbox() due to unvalidated device input
- [Critical] Out-of-bounds read and write in adm1266_pmbus_block_xfer() due=
 to undersized read_buf
--

commit 72c9d4f76b145894590481f2c71edfe0ff2e57c9
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock

This commit adds guard(pmbus_lock) to GPIO accessors in the adm1266 driver.
This ensures the pmbus_lock is held during multi-transaction sequences,
preventing other threads from corrupting the device state machine.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 8b9fbb99a4bda..a80fb2ea73bdb 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -235,6 +239,8 @@ static void adm1266_gpio_dbg_show(struct seq_file *s,=
 struct gpio_chip *chip)
>  	int ret;
>  	int i;
> =20
> +	guard(pmbus_lock)(data->client);
> +
>  	for (i =3D 0; i < ADM1266_GPIO_NR; i++) {
>  		write_cmd =3D adm1266_gpio_mapping[i][1];
>  		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_GPIO_CONFIG, 1, &write_=
cmd, read_buf);

This isn't a bug introduced by this patch, but could this call to
adm1266_pmbus_block_xfer() trigger an out-of-bounds read and write due
to an undersized read_buf?

In struct adm1266_data, read_buf is sized at ADM1266_PMBUS_BLOCK_MAX + 1
(256 bytes):

struct adm1266_data {
	...
	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
};

However, adm1266_pmbus_block_xfer() constructs an I2C read message with a l=
ength
of ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes):

	struct i2c_msg msgs[2] =3D {
		...
		{
			.addr =3D client->addr,
			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
			.buf =3D data->read_buf,
			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
		}
	};

If the I2C device returns the maximum allowable payload, will the I2C contr=
oller
write 257 bytes into the 256-byte buffer and corrupt adjacent memory?

Additionally, during PEC verification, the code evaluates the length byte:

	if (crc !=3D msgs[1].buf[msgs[1].buf[0] + 1]) {

If the device returns a length byte of 255, this calculates an index of 256.
Does this cause an out-of-bounds read of the 257th byte?

Also not introduced by this patch, but does adm1266_nvmem_read_blackbox() h=
ave
a potential heap buffer overflow and infinite loop?

The function reads record_count from the I2C peripheral without bounds chec=
king:

static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_=
buff)
{
	int record_count;
	char index;
	u8 buf[5];
	...
	record_count =3D buf[3];

	for (index =3D 0; index < record_count; index++) {
		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, =
read_buff);
		...
		read_buff +=3D ADM1266_BLACKBOX_SIZE;
	}
	return 0;
}

Since record_count can be up to 255 and each iteration writes 64 bytes
(ADM1266_BLACKBOX_SIZE), wouldn't a record_count greater than 32 overflow
the 2048-byte data->dev_mem destination buffer?

Furthermore, index is declared as a char. On architectures where char is si=
gned,
if the device returns a record_count between 128 and 255, index will increm=
ent
to 127 and then wrap around to -128.

Since -128 is less than the positive record_count, does the loop condition
remain true forever and lead to an infinite loop of sequential out-of-bounds
memory writes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D6
