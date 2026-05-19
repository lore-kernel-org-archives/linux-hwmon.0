Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611D1AF0BB
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 04:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779166493; cv=none; b=Ntu85RHDLSkosIr8+rp7Cu/xh9CfbCQzChkbOEA2qvTgN458NPsOZQLZ3rSuqIvTsvZrHmi1iUU+wq41Z2m6ux2F4Zytm15IA28KKDV2CJk4Suyz53GWbV1vYuzajIEi6au3SOinxRPhfn2QpNiXxn2WB/Bqzv7f005HHqULWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779166493; c=relaxed/simple;
	bh=+WnuVSvWRJCpd5hrFtqd/fTLEKNUooUCyRqNIsN+gGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fQW7fBcq9+/9Wpr6jrWItDfdYgpmxlYXfmOe2+HncD8k7YqRpdabD0AmnM+5g/DhjhFxygJKRZ/hNnp3Nix/VXLBgMeh2C9z2QlCcKqIuQajzBhxVMbcdRIxu+0iOHeTv1+baSiYVHJbkiSsYwFs0cGjnsBGVrJg0gx8NYkzwoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZHvRH7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZHvRH7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE45C2BCB3;
	Tue, 19 May 2026 04:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779166493;
	bh=+WnuVSvWRJCpd5hrFtqd/fTLEKNUooUCyRqNIsN+gGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OZHvRH7eEXzAqum5K/rM7/KnYhpQubIDY3K9o7t+LFaipg5vLa32hiCZJ1UsSO1pT
	 UMGkqJirTICmbMl6WIOhR6J5eB77bDK4+zhBPpA8wSwwSv0lR9HDzqSEsE3Psnkc2l
	 rTTWWL+p4eMVafXaeND5aMrVf9oVlUJw53FFfr1aLkVKkqzwZL16ETPCISmio9Uj3N
	 UcAp8RpEkXy9BfTqmijohfNHRA8y1aGq4cSzsfIp+G1cvJW/jquGdnyx5fH1CuMC10
	 1TqKQ1nD4eFb2GNmWdnabwA6MpAKbN913KaRWteMm8J6iTwteyfTFbRpHm15pinjO/
	 P/xEHrWlUl/NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] hwmon: (pmbus/adm1266) serialize NVMEM blackbox
 read with pmbus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-7-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-7-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 04:54:52 +0000
Message-Id: <20260519045453.1FE45C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Missing bounds check on hardware-provided `record_count` cause=
s massive out-of-bounds write and potential infinite loop.
- [Critical] Unvalidated hardware-controlled length byte causes out-of-boun=
ds memcpy.
- [High] 1-byte Out-of-Bounds write in I2C DMA buffer and out-of-bounds PEC=
 array access.
--

commit c22c6a63624daea0c1d482c6c2ec7dc641b3fac1
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) serialize NVMEM blackbox read with pmbus_lock

adm1266_nvmem_read() is the reg_read callback the NVMEM core invokes
when userspace reads /sys/bus/nvmem/devices/.../nvmem on this chip.
[ ... ]

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index a80fb2ea73bdb..051f4f188ec52 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -394,6 +394,8 @@ static int adm1266_nvmem_read(void *priv, unsigned in=
t offset, void *val, size_t
>  	if (offset + bytes > data->nvmem_config.size)
>  		return -EINVAL;
> =20
> +	guard(pmbus_lock)(data->client);
> +
>  	if (offset =3D=3D 0) {
>  		memset(data->dev_mem, 0, data->nvmem_config.size);
> =20
> 		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);

This isn't a bug introduced by this patch, but does this missing bounds che=
ck
on the hardware-provided record_count cause an out-of-bounds write?

In adm1266_nvmem_read_blackbox(), record_count is read directly from the
device and can be up to 255:

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
    ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, =
buf);
    ...
    record_count =3D buf[3];

    for (index =3D 0; index < record_count; index++) {
        ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &i=
ndex, read_buff);
        ...
        read_buff +=3D ADM1266_BLACKBOX_SIZE;
    }
    ...
}

Since read_buff points to data->dev_mem, which is fixed at 2048 bytes, a
record_count > 32 will write out of bounds since each block is 64 bytes
(ADM1266_BLACKBOX_SIZE).

Additionally, if the architecture has a signed char, could a record_count >=
 127
cause index to wrap around to -128, creating an infinite loop?


This isn't a bug introduced by this patch, but could this memcpy() overflow
the buffer?

In adm1266_pmbus_block_xfer(), the length of the read block is determined by
msgs[1].buf[0], which can be up to 255:

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
    memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
    ...
}

When called from adm1266_nvmem_read_blackbox(), data_r points to a position
in data->dev_mem expecting only 64 bytes. If the device returns a length > =
64,
this will corrupt memory before the safeguard check in the caller is reache=
d.


This isn't a bug introduced by this patch, but could this I2C message length
cause an out-of-bounds write?

In adm1266_data, read_buf is 256 bytes (ADM1266_PMBUS_BLOCK_MAX + 1):

drivers/hwmon/pmbus/adm1266.c: {
    ...
    u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
    ...
}

However, adm1266_pmbus_block_xfer() configures the read length to 257 bytes
(ADM1266_PMBUS_BLOCK_MAX + 2):

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
        {
            .addr =3D client->addr,
            .flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
            .buf =3D data->read_buf,
            .len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
        }
    ...
}

This allows the I2C controller to write up to 257 bytes into the 256-byte
array.

Furthermore, if PEC is enabled and the device returns a block length of 255
(msgs[1].buf[0] =3D=3D 255), does the PEC validation access index 256, whic=
h is
past the end of the array?

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
        crc =3D crc8(pmbus_crc_table, msgs[1].buf,  msgs[1].buf[0] + 1, crc=
);

        if (crc !=3D msgs[1].buf[msgs[1].buf[0] + 1]) {
    ...
}

> 		if (ret) {
> 			dev_err(&data->client->dev, "Could not read blackbox!");
> 			return ret;
> 		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D7
