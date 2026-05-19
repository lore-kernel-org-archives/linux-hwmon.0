Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA2F2DCF74
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 03:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779162150; cv=none; b=fXpJYQ2LukJQaQFObR2742zpAJu3H9rrchnMfTGUZCzS+DE9jUFKM6IIhXsF75KYepLAo4XXwUx/Xbe8ZVDDz3Yo6O9UwzAynKHm3eFQJNd96KxfiDcHnNa468DIBnBa+DZ6peCGGfZQYmca6ByfgpTHT4cIl6I83B+1Ozsp5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779162150; c=relaxed/simple;
	bh=EqHkzndzSVD5hD8r+WcceCpq/j7Lx8aXtOc+uy1EJfY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hopSimKfybPlz72F3osZ+FH9rMy/Tafx3X4foTHiMX4ILfQxuCGVeVvJP6kOv8wLfO8pCHGv1YjAKq5AeVSgZfWSYcGrbYcD6WoAWSAZnlKEP1VxCuogD1bxdwlIFsXPc51oyztTOIZPoKF/vHSTYCfpXZDq7KA5N2T7e3tXqCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRfI31lI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRfI31lI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F70C2BCB3;
	Tue, 19 May 2026 03:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779162149;
	bh=EqHkzndzSVD5hD8r+WcceCpq/j7Lx8aXtOc+uy1EJfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GRfI31lIIWDvY1fe50Fqt/87ib8/ziH0EhO2nm2HXvNqMIRJmB/zZ5blJ+Zrc8bsO
	 EbOQ9m7zzINTvF/aHHViyGKTWAx7DpufiQmFsnBPyF7KwTINZoJf7kUJcMAtSjd87Z
	 wyRz5Z6vuShUtRg/wPMF0DpxKYtNSN4DTClpt8Bc+EnPqV/LkVR1uNzt20JoLe4nZk
	 Nu6fHiD0EeQYgB6PdVb7ctMQQrjXow7IDhw1bz47zabrAKGHS8uIeQZ6Dy1H4CVPgQ
	 z9bqgIPStyntqSTYvO8QOFGUrpY6dWwMon8Si6Tnon1mbGezsjITGUh476ljbOaBQk
	 NmOV2RRCQ0nBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] hwmon: (pmbus/adm1266) register the nvmem device
 after pmbus_do_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-5-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-5-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:42:28 +0000
Message-Id: <20260519034229.B2F70C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Unbounded loop in adm1266_nvmem_read_blackbox allows a heap buffer=
 overflow triggered by an untrusted I2C device response.
- [High] Length validation in adm1266_nvmem_read_blackbox occurs after memc=
py, leading to heap corruption.
- [High] 1-byte static out-of-bounds read/write on the heap during every ad=
m1266_pmbus_block_xfer I2C transaction.
- [High] NVMEM reads at non-zero offsets skip device reads and return unini=
tialized or stale data.
--

commit 1d749e51ad745af23cd77d7854a264e1e6247407
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) register the nvmem device after pmbus_do_probe()

adm1266_probe() calls adm1266_config_nvmem() before pmbus_do_probe() has
initialised the per-client PMBus state. This moves adm1266_config_nvmem()
down past pmbus_do_probe() so the nvmem device isn't reachable from userspa=
ce
until the PMBus state is fully initialised.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index b91dcf067fa6d..8b9fbb99a4bda 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -471,14 +471,14 @@ static int adm1266_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D adm1266_config_nvmem(data);
> -	if (ret < 0)
> -		return ret;
> -
>  	ret =3D pmbus_do_probe(client, &data->info);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D adm1266_config_nvmem(data);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret =3D adm1266_config_gpio(data);
>  	if (ret < 0)
>  		return ret;

While reviewing this patch, I noticed some pre-existing issues in the NVMEM
handling and I2C transfers.

Could this loop in adm1266_nvmem_read_blackbox() cause a heap buffer overfl=
ow?

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

The function reads record_count directly from the device response, which ca=
n be
up to 255.

It then loops record_count times, appending 64 bytes into data->dev_mem.

Since data->dev_mem is allocated with a fixed size of 2048 bytes, could a
record_count greater than 32 linearly write past the end of the buffer and
corrupt kernel heap memory?

Additionally, does the length validation happen too late?

Inside the loop, adm1266_pmbus_block_xfer() copies up to 255 bytes into the
current position of read_buff.

The length check (ret !=3D ADM1266_BLACKBOX_SIZE) is performed after the co=
py.

If read_buff is near the end of the 2048-byte buffer, could copying up to 2=
55
bytes silently overflow the heap before the error is caught?

There also appears to be a 1-byte out-of-bounds access in
adm1266_pmbus_block_xfer():

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
		if (crc !=3D msgs[1].buf[msgs[1].buf[0] + 1]) {
			mutex_unlock(&data->buf_mutex);
			return -EBADMSG;
		}
    ...
}

The read_buf in struct adm1266_data is allocated with a size of 256 bytes
(ADM1266_PMBUS_BLOCK_MAX + 1).

However, the i2c_msg requests a length of 257 bytes. Doesn't this instruct
the I2C master to write up to 257 bytes into the 256-byte buffer,
overflowing it by 1 byte?

Also, if the device returns a length of 255, the PEC validation logic
accesses msgs[1].buf[msgs[1].buf[0] + 1], which reads index 256. Does this
result in an out-of-bounds read?

Finally, could adm1266_nvmem_read() return uninitialized or stale data?

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read() {
    ...
	if (offset =3D=3D 0) {
		memset(data->dev_mem, 0, data->nvmem_config.size);

		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);
        ...
	}

	memcpy(val, data->dev_mem + offset, bytes);

	return 0;
}

If a user performs a read starting at an offset greater than 0, the device
read is skipped entirely.

Since data->dev_mem is allocated with devm_kzalloc, doesn't this return pure
zeros if no prior read at offset 0 has occurred, breaking standard
random-access file semantics?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D5
