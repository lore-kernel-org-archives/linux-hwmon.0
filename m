Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B8C17BEBF
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778983195; cv=none; b=tmN0ltEQoG/ZmF22CUkGXuxrtgtGlo1F4AKvsbAreiqAZmJ/MST5kJgs7J3j6Gfm6qilnWQV//asTuMzlYzP9NPDTvVK1IJO25Eg40f613mU4PWt+nHAVOyL5pqwugKm4jpgjKY0itCfAkh9CpQgvjnkGqur8euJZgNANJ2EdgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778983195; c=relaxed/simple;
	bh=4ecGC4wR+OHYFrWojo7coszLY10GBSM/WkCwahV72u4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YeBo0IO7ENMEcxZ4L8HmflqS+XNUx76OouFzKgCrbna+0LpoXKdR6rQ6FjkfdW2uH/UseCCmzqU0tDYZyZlQC0KrSy/qwER9kpZRhkadglfXE9wdqekrgHsZKT0Zt7wvnWJTqRauoguJ9fJkzmlv7dQ+eKduIK+zH2ISqp1jyDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrFS6+5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrFS6+5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BA7C19425;
	Sun, 17 May 2026 01:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778983195;
	bh=4ecGC4wR+OHYFrWojo7coszLY10GBSM/WkCwahV72u4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UrFS6+5/D2nFxZxXhWVnVeUp97DrOJ0dOKvPD/mRHtuvY0jpnGgBN8TOQkHntIt5Q
	 V75PMOOsdwu0xcRJt5eotvtb+Bp1NZdkr0r9q8iwYG55wwuAd7NncM/do+iFf4TPiD
	 JScTg+ii6YKMbqCz6EhmhYoFDDobTRL7MIxu7pskJidpvm+baVLSPK41FXZ8STl/VY
	 aiY0j9riXLtd+5U0vXQq3ehPVdzTESZYRAeR6ZWurxSI7KenCBqDuAGxCaHpfk+XfE
	 7c+H0/1/0WL7OYbV8wwlfxw2oLUytvwdmK8lYS9CK0iRILxfOP0ZdoDBC+D4QWzflk
	 GqNP71ql9QoxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-v4-1-1f8df4797258@nexthop.ai>
References: <20260516-adm1266-v4-1-1f8df4797258@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 01:59:54 +0000
Message-Id: <20260517015955.15BA7C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Heap buffer overflow in adm1266_nvmem_read_blackbox() via unvalida=
ted record_count read from I2C.
- [High] Out-of-bounds write in adm1266_pmbus_block_xfer() due to blindly t=
rusting I2C block read length.
- [High] Out-of-bounds write in adm1266_pmbus_block_xfer() caused by mismat=
ch between buffer capacity and I2C transfer length.
--

commit 0afcc14abebf60e90db3728285512325b57755bc
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry

This commit introduces a clear_blackbox debugfs entry for the ADM1266
device to allow clearing the blackbox recording buffer. It issues a
2-byte block-write using the READ_BLACKBOX command under the pmbus_lock.
The commit also acquires the pmbus_lock in adm1266_nvmem_read() to
serialize blackbox reads and clear operations.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index d90f8f80be8e0..9f4709bc85afe 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

> @@ -355,7 +390,6 @@ static int adm1266_nvmem_read_blackbox(struct adm1266=
_data *data, u8 *read_buff)
>  	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, =
buf);
>  	if (ret < 0)
>  		return ret;
> -
>  	if (ret !=3D 4)
>  		return -EIO;
> =20

This regression wasn't introduced by this patch, but pre-dates it. Can the
unvalidated record_count read from I2C cause a heap buffer overflow?

The function reads ADM1266_BLACKBOX_INFO into buf and uses buf[3] as
record_count:

	record_count =3D buf[3];

It then loops record_count times, appending ADM1266_BLACKBOX_SIZE
(64 bytes) to read_buff on each iteration. Since read_buff points to
data->dev_mem, which is allocated to 2048 bytes (32 records), could
an I2C device returning a record_count greater than 32 cause an
out-of-bounds write into adjacent heap memory?

> @@ -365,7 +399,6 @@ static int adm1266_nvmem_read_blackbox(struct adm1266=
_data *data, u8 *read_buff)
>  		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &inde=
x, read_buff);
>  		if (ret < 0)
>  			return ret;
> -
>  		if (ret !=3D ADM1266_BLACKBOX_SIZE)
>  			return -EIO;

There is another regression that wasn't introduced by this patch, but
pre-dates it. Does blindly trusting the I2C block read length in
adm1266_pmbus_block_xfer() lead to an out-of-bounds write?

In adm1266_pmbus_block_xfer(), the first byte of the I2C response is used
as the transfer length for memcpy():

	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);

The caller adm1266_nvmem_read_blackbox() anticipates 64 bytes per iteration
and offsets the data_r pointer by 64 bytes per loop. If the I2C device
returns a block length greater than 64, could the memcpy overwrite
subsequent records in the buffer and write past the end of the 2048-byte
allocation?

Additionally, another regression pre-dates this patch. Does a mismatch
between the buffer capacity and I2C transfer length cause an
out-of-bounds write?

The data->read_buf array is declared with a size of
ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes):

	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;

However, when preparing the I2C read message in adm1266_pmbus_block_xfer(),
msgs[1].len is set to ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes):

		{
			.addr =3D client->addr,
			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
			.buf =3D data->read_buf,
			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
		}

Because the I2C_M_RECV_LEN flag is absent, could the I2C controller
unconditionally attempt to read 257 bytes into the 256-byte read_buf,
writing past the end of struct adm1266_data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-v4=
-0-1f8df4797258@nexthop.ai?part=3D1
