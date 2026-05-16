Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFF91A285
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 00:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778891431; cv=none; b=ZxtZUY7z4zGEjC5haPAFUqBVgDLgoE/5mF2ZU1SbARKGYu6nzLerHUuaaIk68erho/jTCB1ijKrIPRCIUoFwH/CcScJ4hKP3u2NP+dx4ySxYGJfpa2C8Yc27Z3xMLd5tCCb8ntrtRoVgowo+a65tUJlHv/s2v8cjoY3/ab+6lbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778891431; c=relaxed/simple;
	bh=Jv+77Tp+taaX89Nh10SI8pvLVZqu1opyxPgG1ziNx6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DLAayR2WEfBIXzd+/q1OqRTIRu7zF4YL/qE173+fAxgnpjsh4/LchEcWsAegi7YN0s5XpSsdoUN5O/8uu200Z3iPX460xq/w5HHa0awnxEm2nABaNrugSWQbB+oMESQATq0WPzCbgNVO9nofiVueid6W3f7NRfzUM05KWu0Kv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2R2/ixK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2R2/ixK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83137C2BCB0;
	Sat, 16 May 2026 00:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778891430;
	bh=Jv+77Tp+taaX89Nh10SI8pvLVZqu1opyxPgG1ziNx6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=n2R2/ixK6kJXDNHN+unnzPNBRl+YG6jA+OgLQ5+adIVsgeVqSYZrhyoVr4ToqgYHm
	 hZ16PMfzxMz/uvomvJiAikxpmpic/Fa0NFvsiN3OMLKbqcCqFPX1cFbI8TT7dG4tvf
	 viTt5tUBC7Nj+pZXm7S1o9tCWJAFAjVgw1g/tq7mlXYZ9N8CpaziEnJ5fJN7VGtxUB
	 QagR+967sk3XbcRFYLIatjps4nruAbnIpCwFk1c4PNFMJ4S4xwnDnK+qsP0VHIFYcc
	 rlbMj/G3YhanSV1yaHXV1u3SugdfIR+i2ottoqOvVc7n7eXPoYqEjbm1hwCmXVHfYU
	 1h5ic1LoFbmRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] hwmon: (pmbus/adm1266) bounce blackbox records
 through a protocol-sized buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515-adm1266-fixes-v1-5-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-5-1c1ea1349cfe@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 00:30:30 +0000
Message-Id: <20260516003030.83137C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] This problem wasn't introduced by this patch, but the NVMEM read c=
allback `adm1266_nvmem_read` lacks required locking, violating hwmon subsys=
tem rules and causing a data race on `data->dev_mem`.
--

commit ec2121ec78bbb218045b0a4130c3ed16fa6c9a66
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) bounce blackbox records through a protocol-sized buf=
fer

This commit modifies adm1266_nvmem_read_blackbox() to copy records into a
local bounce buffer before writing them to the destination. This prevents
an overflow since the device can return up to 255 bytes while the helper
previously wrote directly into 64-byte strides of the buffer.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 5c68e3177f64e..ea1edb89d2a0c 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -348,6 +348,7 @@ static void adm1266_init_debugfs(struct adm1266_data =
*data)
> =20
>  static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *re=
ad_buff)
>  {
> +	u8 record[ADM1266_PMBUS_BLOCK_MAX];
>  	int record_count;
>  	char index;
>  	u8 buf[I2C_SMBUS_BLOCK_MAX];
> @@ -365,13 +366,14 @@ static int adm1266_nvmem_read_blackbox(struct adm12=
66_data *data, u8 *read_buff)
>  		return -EIO;
> =20
>  	for (index =3D 0; index < record_count; index++) {
> -		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &inde=
x, read_buff);
> +		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1, &inde=
x, record);
>  		if (ret < 0)
>  			return ret;
> =20
>  		if (ret !=3D ADM1266_BLACKBOX_SIZE)
>  			return -EIO;
> =20
> +		memcpy(read_buff, record, ADM1266_BLACKBOX_SIZE);

This isn't a bug introduced by this patch, but does the NVMEM read callback
adm1266_nvmem_read() lack required locking around data->dev_mem?

The hwmon subsystem guidelines state that drivers must implement locking
for attributes registered outside the hwmon core, such as using hwmon_lock()
and hwmon_unlock().

Since the NVMEM core does not serialize reads, could concurrent user space
reads race in adm1266_nvmem_read():

static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, s=
ize_t bytes)
{
	...
	if (offset =3D=3D 0) {
		memset(data->dev_mem, 0, data->nvmem_config.size);

		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);
		...
	}

	memcpy(val, data->dev_mem + offset, bytes);

	return 0;
}

If Thread A reads at offset =3D=3D 0, it zeroes data->dev_mem and repopulat=
es
it via adm1266_nvmem_read_blackbox().

If Thread B concurrently reads at a non-zero offset, it might execute the
memcpy() and return torn, zeroed, or corrupted data to user space.

Additionally, if both threads read at offset =3D=3D 0, they could simultane=
ously
clear and write to the same buffer, destroying the integrity of the cached
blackbox data.

>  		read_buff +=3D ADM1266_BLACKBOX_SIZE;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-adm1266-fi=
xes-v1-0-1c1ea1349cfe@nexthop.ai?part=3D5
