Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387D30FC1C
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158145; cv=none; b=X4sJeGIC4KCka3jt+0XyKNS5uQi7PoNz9pA35XeoyfucN2tC6WNHMJ6o4u+YyBr+77u4Mqi8BWMiKzP6Si4o6hU5dmzXiKJVrqq/t3IAMQ2AVT8cRSYe1/2Zaq62bcqIiPcG+XVTsRDYVKhntI8B/yOPoTyVDjBCZ/xV/Vdsq+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158145; c=relaxed/simple;
	bh=WD3hTjrShxbqh4rAqwybvVWfJ8scTDLyjUNUfn+yOJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i3lkIhUxkNDxrZV5A5IRbvLUJKt5exf2suOniuhlV+VMNmd6sK9cO15q3K+1FeVyDC6IPxgM4hXotHJY2A+nQWpNm09X8Xm0BEQByCs0jWmKeNWuQ3E4mG8lRsqdqTiEgcPYTPOvq4IeNyUXxldL80W9kKMVV3ZyrF0B0PAh2Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+oJeUWV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+oJeUWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870EBC2BCB7;
	Tue, 19 May 2026 02:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779158145;
	bh=WD3hTjrShxbqh4rAqwybvVWfJ8scTDLyjUNUfn+yOJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=f+oJeUWVix7o5cOPF1Gbk+w4rmT0VsZGYWZmsCCAeW+f/dxSl+to1DH3pvpCELkz3
	 sfKS/byppF87rkDNqr2ZJ/byEXcmSfCNHe4lfU4NRp+O+ewbfEtIKewmc9NPYYe2OU
	 SVcxrmliBGBDnYO8Z2p656wEElZoxT4DzM/SaQjqeAkt00f9/47ROhb7wiOGwJaMeP
	 4ZS8aUdZFgLbOc/uPf5CM3uHn1H/LMpYw5hFTJGgojxHARXZ80u9V/1me3VtzKJYMg
	 Js7CThMEDvQrD7+n0MjGbj0go0stIpCs1SkdBPQR+UEBBlaTeglRdPwPtl7+JSJDjA
	 oznA0JjUA7POQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] hwmon: (pmbus/adm1266) register the gpio_chip
 after pmbus_do_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-4-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-4-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 02:35:38 +0000
Message-Id: <20260519023545.870EBC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Massive heap buffer overflow in adm1266_nvmem_read_blackbox() =
via untrusted record_count.
- [High] Deterministic 1-byte heap out-of-bounds write in adm1266_pmbus_blo=
ck_xfer() due to mismatched buffer sizes.
--

commit 1aa8682477a4237d507fab67a50b6b1b23c803b4
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()

This commit changes the order of operations in adm1266_probe() to register
the gpio_chip only after pmbus_do_probe() has fully initialized the PMBus
state. This prevents a race condition where userspace could access the
uninitialized PMBus state via gpiolib.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 57cb7d302cddd..b91dcf067fa6d 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

This problem wasn't introduced by this patch, but can a malfunctioning or
malicious I2C device returning a large record_count cause a heap buffer
overflow here?

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

The record_count is read directly from the I2C device into buf[3] (an 8-bit
unsigned value, up to 255). The function iterates record_count times without
an upper bound validation, advancing and writing 64 bytes to read_buff on e=
ach
iteration.

Since read_buff points to data->dev_mem which is exactly 2048 bytes,
could this write up to 16,320 bytes and overflow the buffer?


This problem wasn't introduced by this patch, but is it possible for this I=
2C
transfer to write past the end of data->read_buf?

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
...
	struct i2c_msg msgs[2] =3D {
		{
...
		},
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

data->read_buf is defined with size ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes).
However, msgs[1].len is hardcoded to ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes=
).

Because this is a raw I2C_M_RD transfer, the I2C adapter will blindly write
exactly 257 bytes into data->read_buf.

Since read_buf is the last member of the devm_kzalloc-allocated adm1266_data
struct, could this unconditionally corrupt adjacent heap memory on every
block read transfer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D4
