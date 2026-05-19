Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3EC2EE262
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 01:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779155919; cv=none; b=fCGP0d5ywDMBttGapXJBK9i20+g4uat3v6NK5AgQhRhkhlREN/eLpvSU7eRTw3fOmm5VhKw1D4qCM+0gmwcZsw3Rv0CwUBmK2i4E0b2aQRAdAnEfGol1TMLyUw7i9fxoVVq9qrRDl+yzfDrrnxu8m4UggNbtgl+/Vn7TdgIqoEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779155919; c=relaxed/simple;
	bh=dHtjhKiB318hdct302S/gVKa0hQAHYw+ImkptZABg9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b+R8KfTnDMozJsDl7jzXJBq+ilYmvuhoAoxO+7F9xDDwdmall4p95Te/X4M2rr1Uf1yPijdhgchM7L7iz2u4LL7srouJwaP9u0TQvtpXvJGIKd8kaidBQbsBDzRSG+zXJRLRHWRyFgQgK/NR5UEqMxJSU7+Di7vMpmu+9u2imCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DR+y/Vgw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DR+y/Vgw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EBEC2BCB7;
	Tue, 19 May 2026 01:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779155919;
	bh=dHtjhKiB318hdct302S/gVKa0hQAHYw+ImkptZABg9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DR+y/VgwqARkc4qCqu49btLMyc/Ik5eRlVXwqg00EBDJ46RooBwQjCoMVZxIh0Wvn
	 JqgnGza7DysWTtJdmMPWYD/otbwS9AvYZbgx3uVWDWeZIyKhnfLJi4yOwuW+ebjf4+
	 /EunYCJDui3wTzYah6kMGlhmhRMzx2nh5986jicay7H8OUkYtcHNe7FNX7MQzLRl/A
	 dOH6LBO13jxidnzsDfgIGMzfpRIch5S2gT7fJNR2c/d6G//VZ4ltB2y9A9hS6X3jT1
	 pA4dTM7hPi4T5IBTEQiVtkogyN49K1KDi39QH4a59jKSFPDS5Oe2j8nO0U+CSH9FrT
	 SPTY7vxWO8OSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] hwmon: (pmbus/adm1266) reject short block-read
 responses in the GPIO accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-3-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-3-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 01:58:38 +0000
Message-Id: <20260519015839.79EBEC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Stack buffer overflow in adm1266_nvmem_read_blackbox() caused =
by untrusted device response.
- [Critical] Heap buffer overflow in adm1266_nvmem_read_blackbox() due to m=
issing bounds check on record_count.
- [High] Mismatched buffer sizes in adm1266_pmbus_block_xfer() cause an out=
-of-bounds heap read and write.
--

commit 54bf8f3eaa13fb13d4eb4adf5a3d15d39e6a5e7a
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO access=
ors

This commit adds length checks to adm1266_gpio_get() and
adm1266_gpio_get_multiple() after calling i2c_smbus_read_block_data(). This
prevents uninitialized stack memory from being returned to userspace via
gpiolib when a device returns a short block-read response.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 4dd67c02b412e..57cb7d302cddd 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

This isn't a bug introduced by this patch, but while addressing short
block-read responses, there appears to be a related stack buffer overflow
caused by untrusted device responses:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	u8 buf[5];
	int ret;

	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf=
);
    ...
}

The SMBus block read function can copy up to 32 bytes into the buffer before
returning the actual length. If a malfunctioning I2C device returns a block
length greater than 5, could this overflow the 5-byte stack buffer buf?

This isn't a bug introduced by this patch, but there might also be a heap
buffer overflow due to a missing bounds check on record_count:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	record_count =3D buf[3];

	for (index =3D 0; index < record_count; index++) {
		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &index, =
read_buff);
        ...
		read_buff +=3D ADM1266_BLACKBOX_SIZE;
	}
    ...
}

The record_count is read directly from buf[3] without validation and used as
the loop upper limit to iteratively read 64-byte records into read_buff.

Since read_buff points to data->dev_mem, which is allocated with a fixed si=
ze
of 2048 bytes (allowing a maximum of 32 records), what happens if a device
returns a record_count larger than 32? Could the loop overflow the heap
buffer by writing up to 16,320 bytes?

This isn't a bug introduced by this patch, but there is a mismatch in buffer
sizes in adm1266_pmbus_block_xfer():

drivers/hwmon/pmbus/adm1266.c:
struct adm1266_data {
    ...
	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
};

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
		{
			.addr =3D client->addr,
			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
			.buf =3D data->read_buf,
			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
		},
    ...
	return i2c_transfer(client->adapter, msgs, 2);
}

The array data->read_buf is 256 bytes, but the read message defines its len=
gth
as 257 bytes. Will i2c_transfer() read up to 257 bytes into the 256-byte
buffer and cause a heap out-of-bounds write?

Additionally, if the PEC flag is enabled and the device returns a maximum
length of 255:

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
	if (client->flags & I2C_CLIENT_PEC) {
		if (i2c_smbus_msg_pec(0, &msgs[0], &msgs[1]) !=3D
		    msgs[1].buf[msgs[1].buf[0] + 1])
			return -EBADMSG;
    ...
}

Would the CRC validation access msgs[1].buf[256], performing an out-of-boun=
ds
read past the end of the 256-byte array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D3
