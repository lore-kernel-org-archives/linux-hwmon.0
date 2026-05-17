Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B610F2
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778977335; cv=none; b=mfZlPPTmxJ8HhQk+epLJuVqZfju5+2EcOrBcXSOjiM5VHeLDfULGH9jhLOpNJBrIixhqwXFetrWjiWMCaBoAnsh0208ri0LeEOQeFLu0WptJ5yTgfrISz3lbqKzel536qCd2vYg793MMOQR22UyRgin35daOIZuuQKrTbdw+PaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778977335; c=relaxed/simple;
	bh=8Dz3HYWl1L+gvzhqm0GuJcTaxxDA5shhfpIJvPiwvuU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f259c+pkMCXk2IVcHLV2S4Rmq9z9OS9+6YI7XjmSyCdD27muuKDdn3R73mDMu4EU2qllMLbkwkeBoTjeW3kiv1kOp+cgXxS2q7VkaxoiD323GBvpcNpLsVrA163Wq+L1roGe5b/UibGiMfkR8GpEysEqPTmmCHNlB+VlO+3VCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFWqYEh6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFWqYEh6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA06C19425;
	Sun, 17 May 2026 00:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778977334;
	bh=8Dz3HYWl1L+gvzhqm0GuJcTaxxDA5shhfpIJvPiwvuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CFWqYEh6fbISISG8aeaLDpC7E+ZWxwDTv/gQ4eLdNVaCeRYl8kEJ5hV7udZSsa+7p
	 JH0vvUhndfzbwyX65MA/uFjErmlBZaf2JDoIeK9r0aPDcCsCZII+kfmQybpfTxgE3x
	 2ygLPFNfVdxA9N2Tld5cnQwNZMZoQeLEUOooox0PVlOTS5LZak/NzbN+EdpTFEKmSR
	 H9Lsm3Zoc0nXd8mOK+R0GuYiYT5BxdlrAlgmnaSYturyFH0JKD7RAhKBXvcfpqMv1l
	 8E44K3NxRyedOwSRYMz3iIMDZnPPRwtHUIhIXvXAu0wRlKSkqI2CEqHubtDVy6ioGE
	 gcV/vc7yBCL6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] hwmon: (pmbus/adm1266) reject short block-read
 responses in the GPIO accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-3-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-3-801f13debcb2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 00:22:14 +0000
Message-Id: <20260517002214.CCA06C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Missing bounds check on device-provided `record_count` causes =
a kernel buffer overflow in `adm1266_nvmem_read_blackbox`.
- [Critical] Unbounded memcpy using device-provided length in `adm1266_pmbu=
s_block_xfer()`.
- [High] Off-by-one out-of-bounds write in `data->read_buf` during I2C tran=
sfer.
--

commit 2ccb49606c1a135ef7b78f2e34a995b5bd8652e5
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO access=
ors

This commit adds a length check for block-read responses in the
adm1266_gpio_get() and adm1266_gpio_get_multiple() functions. It addresses
an issue where short block-read responses of 0 or 1 bytes could result in
reading uninitialized stack memory.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 4dd67c02b412e..57cb7d302cddd 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

While reviewing this code, I noticed a few pre-existing issues in this file.

Could this cause a kernel buffer overflow? In adm1266_nvmem_read_blackbox(),
record_count is read directly from the I2C device and never validated again=
st
safe bounds:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf=
);
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

The loop advances read_buff (which points to the dynamically allocated
2048-byte data->dev_mem buffer) by 64 bytes on each iteration. If a
malfunctioning or malicious device returns a record_count greater than 32,
it will write past the end of the data->dev_mem buffer.

Additionally, because the loop variable index is a char, on architectures
where char is signed, a record_count of 128 or more will cause index to
wrap to -128, resulting in an infinite loop of out-of-bounds writes until
the kernel panics.

Does adm1266_pmbus_block_xfer() perform an unbounded memcpy() using a
device-provided length?

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);

	ret =3D msgs[1].buf[0];
	mutex_unlock(&data->buf_mutex);

	return ret;
}

The length parameter msgs[1].buf[0] is controlled by the I2C device and can
be up to 255. While this is safe for callers providing a 256-byte buffer,
adm1266_nvmem_read_blackbox() passes a pointer inside the 2048-byte
data->dev_mem buffer and only expects 64 bytes per transaction.

A device returning a length greater than 64 will cause an immediate
out-of-bounds write beyond the expected 64-byte block, and if it occurs near
the end of the 2048-byte buffer, it will overflow the kernel heap.

Can this result in an off-by-one out-of-bounds write during an I2C transfer?

drivers/hwmon/pmbus/adm1266.c {
    ...
struct adm1266_data {
    ...
	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
};

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

The read_buf array in struct adm1266_data is declared with a size of
ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes). However, the I2C read message
length is set to ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes) to accommodate
the length byte and an optional PEC byte.

If the hardware responds with the maximum block size and PEC is enabled,
the I2C controller will write 257 bytes into the 256-byte read_buf.
Because read_buf is the last member of the dynamically allocated struct
adm1266_data and no trailing padding exists to absorb it, this would write
1 byte out-of-bounds on the kernel heap.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-gp=
io-fixes-v2-0-801f13debcb2@nexthop.ai?part=3D3
