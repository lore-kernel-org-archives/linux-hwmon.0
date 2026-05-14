Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887AA2F0C48
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 00:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719670; cv=none; b=Zd7ePhWpcPJ+glb0cO/FxYfImOTXOL9MPUBTUGdipFBop3Gsk/tX76VsMo3fP5f8ex3hcaqAZj9EeAZEhzjDN3HIgm/qVhQdFTNlpgQlUk1MbB98SGm4urEP4+8uTiBibwAwWv2EEAnjAZFDCk0ny3m6hNxv9LcF7Qf3B6bD1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719670; c=relaxed/simple;
	bh=NYh77a42ZfUmDM0rYmu9Ji4df4rFg7OUQt93wwtXLLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hYD3AsCwiIrrKGZ8mOTYHKDjwezk9A0dpW9m6HgJ3bJd8OSx1iHYFyFvK8GkgkkYWWbEr9eSlNl099ek8H7t8gA77kpqYp+8Ip62uS0x//M7qc7WMaopvyfzQ/kSNhQxSwGDxV00boGWb38YLbOttb7Wxksu7vMmN5LIXF4glBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS0gYLNP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS0gYLNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B3FC19425;
	Thu, 14 May 2026 00:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719670;
	bh=NYh77a42ZfUmDM0rYmu9Ji4df4rFg7OUQt93wwtXLLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fS0gYLNPwv3yq0ML+EWqxmfi3UXPeJoaCYV7SKt9Wj960pXd5p9exu+q5/iTVpzo6
	 b0Bgnb9PuZqnK4mwZPFgHv2yh0YBSicYxvwhOU31GamDsygzaQZ6ho/k57dUUWJAFp
	 GXZRl1/VaKpY4GHmDRDo5yh6shajlMLI98qnANWbaSe3dWl6ZDWq4+YInew3Iz9sNN
	 9GyHiR21W0Wf/a54aSFMK8G3hZDoFev0TFGyNpszvCITmRqRfvV2H8eWGKb8knyHPq
	 CGgBUynwntuSMRsR1OZ3lVRz0nQj9kikZxHoNkHXxuy+kCMCtGngGiwte/Q0/7BblQ
	 lxixyL4VNrb6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260512-adm1266-v3-2-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-2-a81a479b0bb0@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:47:49 +0000
Message-Id: <20260514004750.10B3FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] The shared buffer `data->dev_mem` is modified and accessed in =
`adm1266_nvmem_read()` outside of any lock, leading to data corruption on c=
oncurrent nvmem reads.
- [Critical] Stack buffer overflow in `adm1266_nvmem_read_blackbox()` cause=
d by an undersized buffer passed to `i2c_smbus_read_block_data()`.
- [Critical] Heap buffer overflow in `adm1266_nvmem_read_blackbox()` due to=
 blindly trusting the hardware-provided `record_count`.
- [Critical] Out-of-bounds write in `adm1266_pmbus_block_xfer()` due to uns=
afe `memcpy` using an untrusted length from the I2C device.
- [High] DMA read buffer bounds mismatch in `adm1266_pmbus_block_xfer()` ex=
poses an out-of-bounds write vulnerability.
--

commit 2afefd44ddcfcdd2fe5f8721e42653261b4e9ff0
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry

This commit adds a write-only debugfs file to clear the ADM1266 blackbox
buffer. Writing to the file issues a 2-byte block-write command to the
device. It also adds a pmbus_lock guard to adm1266_nvmem_read_blackbox()
to prevent concurrent read/write operations from interleaving.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 7b8433226176f..bd3784d59a7c8 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -379,10 +415,11 @@ static int adm1266_nvmem_read_blackbox(struct adm12=
66_data *data, u8 *read_buff)
>  	u8 buf[5];
>  	int ret;
> =20
> +	guard(pmbus_lock)(data->client);
> +

While this patch adds a guard here, does adm1266_nvmem_read() also modify
and access data->dev_mem without taking this lock?

If two threads read the nvmem device concurrently, could one thread's
memset() execute during another thread's memcpy(), causing corrupted data
to be copied to userspace?

>  	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, =
buf);

Can this call overflow the buf array?

Looking at i2c_smbus_read_block_data(), it blindly copies up to
I2C_SMBUS_BLOCK_MAX (32) bytes into the provided buffer based on the
length byte returned by the hardware:

drivers/i2c/i2c-core-smbus.c:i2c_smbus_read_block_data() {
    ...
	status =3D i2c_smbus_xfer(...);
	if (status)
		return status;

	memcpy(values, &data.block[1], data.block[0]);
	return data.block[0];
}

If the I2C device returns a block length greater than 5, would this
memcpy() overflow the 5-byte buf array?

>  	if (ret < 0)
>  		return ret;
> -
>  	if (ret !=3D 4)
>  		return -EIO;
> =20
> @@ -392,7 +429,6 @@ static int adm1266_nvmem_read_blackbox(struct adm1266=
_data *data, u8 *read_buff)
>  		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &inde=
x, read_buff);

Does this loop have a bounds checking issue?

The record_count loop limit is read directly from buf[3]. If the device
returns a record_count greater than 32, will the loop advance read_buff
past the end of the 2048-byte allocation for data->dev_mem?

Also, could this call to adm1266_pmbus_block_xfer() cause an
out-of-bounds write?

In adm1266_pmbus_block_xfer(), the memcpy() uses a length from the I2C
device:

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
    ...
}

If the device returns a length up to 255, could this write past the
expected 64 bytes (ADM1266_BLACKBOX_SIZE) allocated for read_buff?

Additionally, does the DMA read buffer size in adm1266_pmbus_block_xfer()
expose an overflow regression?

The read_buf array in struct adm1266_data is sized
ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes). However, the i2c_msg length is
set to 257:

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

If the hardware sends a full 257-byte response, will the controller
write 1 byte past the end of data->read_buf?

>  		if (ret < 0)
>  			return ret;
> -
>  		if (ret !=3D ADM1266_BLACKBOX_SIZE)
>  			return -EIO;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-adm1266-v3=
-0-a81a479b0bb0@nexthop.ai?part=3D2
