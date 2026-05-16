Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189E2F7445
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778974729; cv=none; b=IXcyi7pEiy9U3h+IchaZREuLvOeR1E+64USYy8PAvDFt9fdGXdrC1CGh7cwLqxTtCgNyL++ouaeLjSlMhjKgY74BR4LnrZUrbSwU9kkNID2aoECLCUgsUaw1ZBxtgqTxylU/17UKsJsEHoGfJ5ARsnT7Nn6xppAS41c9BM6I8Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778974729; c=relaxed/simple;
	bh=ufw9PAAGCeJ1lTCo3B59VNsKjMSyO6wGkP//RDq1tMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=duzbZKHFtQUQGZR0pm9Mh5Rsk5SoW5H1f//CfoXWccqifp8gjU9Y5lwdx/YfGvj/FNLspvup1kFtmKjH8chCaDbOrrm9qJWJEwIchhAkOSfdEQwdEsxCV/WhtPbpkOEO2TpBXolcPPagj7lEkK9y6FOhydTAgsVJ6RKX3eOO85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpMdiJ/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpMdiJ/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690B5C19425;
	Sat, 16 May 2026 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778974728;
	bh=ufw9PAAGCeJ1lTCo3B59VNsKjMSyO6wGkP//RDq1tMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GpMdiJ/crxAkTgA1FvjNrDfpKk2vDvtIMQ0Iatpys48FRwCzenae3KcxosTw5pp/N
	 SyJrYyJgIK6wg13f5X5galnZizC8YyuV0X7RVhKPExLrn+4nCV27eLum+P9yKM+Eq/
	 sEMiBVE/PQJmE1117RkzFI4JYuTQHLLjVcxIS/nPrQ8ov2D+TnXhXRwX7oUGBPmXr6
	 w80D3Vd6s2YEdbFgKWTUf6+3sHrV4XQNvBGQilx7C3HyFTOpE6GMTcKhw+IE1oSrsA
	 9bru7wY/MIAmY56pNbuAu57jJWbNGT9Mz20D5Dqa/Yb5UiDdbUndYKRcSxQ1Euq7Gc
	 MsVuGoQZFOYjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] hwmon: (pmbus/adm1266) cap PDIO scan in
 get_multiple at ADM1266_PDIO_NR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-1-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-1-801f13debcb2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 23:38:47 +0000
Message-Id: <20260516233848.690B5C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] This problem wasn't introduced by this patch, but the adm1266_=
nvmem_read_blackbox function allocates an undersized 5-byte stack buffer an=
d passes it to i2c_smbus_read_block_data, which can copy up to 32 bytes.
- [Critical] This problem wasn't introduced by this patch, but a missing bo=
unds check on the device-controlled record_count leads to a severe heap buf=
fer overflow in adm1266_nvmem_read_blackbox.
- [High] This problem wasn't introduced by this patch, but there is an off-=
by-one heap buffer overflow and out-of-bounds read in adm1266_pmbus_block_x=
fer due to an undersized read_buf array.
- [Medium] The commit message inaccurately exaggerates the out-of-bounds ac=
cess size.
--

commit 93979e34eb30dc552b33202c40e1dcfa42e8d14e
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR

This commit modifies the PDIO mask iteration in adm1266_gpio_get_multiple()
to use the correct upper bound constant to prevent an out-of-bounds read.

> gpiolib hands in a mask sized for gc.ngpio (=3D 25 bits on this chip),
> so the iteration walks find_next_bit() up to 242, reading up to 27
> extra unsigned-long words of whatever lives past the end of the mask

This isn't a bug, but is this calculation accurate?

The difference between 242 bits and 25 bits is 217 bits, which is roughly
27 bytes.

Wouldn't this result in reading only 3 extra unsigned-long words on a 64-bit
architecture (or 7 on a 32-bit architecture), rather than 27?

While reviewing this file, I noticed a few pre-existing regressions in the
surrounding code.

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
	int record_count;
	char index;
	u8 buf[5];
	int ret;

	ret =3D i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf=
);
    ...
}

Does this overflow the buf[] array on the stack?

The i2c_smbus_read_block_data() API expects a destination buffer of at least
I2C_SMBUS_BLOCK_MAX (32 bytes) and can copy up to 32 bytes into the buffer.

The buf array is only 5 bytes long.

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

Does this loop overflow the data->dev_mem buffer?

Since record_count is read directly from the I2C device (buf[3]), it could
be up to 255.

The read_buff pointer targets data->dev_mem, which is allocated to 2048 byt=
es.

A record_count greater than 32 writes up to 16,320 bytes into the buffer.

Should we bounds-check record_count?

drivers/hwmon/pmbus/adm1266.c:adm1266_pmbus_block_xfer() {
    ...
	struct i2c_msg msgs[2] =3D {
    ...
		{
			.addr =3D client->addr,
			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
			.buf =3D data->read_buf,
			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
		},
    ...
}

Does this overflow the data->read_buf array?

The data->read_buf array is sized at ADM1266_PMBUS_BLOCK_MAX + 1 (256 bytes=
).

The length passed to the I2C transfer is ADM1266_PMBUS_BLOCK_MAX + 2
(257 bytes).

Additionally, if the device returns a block length of 255, wouldn't the PEC
validation logic access the 257th byte, causing an out-of-bounds read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-gp=
io-fixes-v2-0-801f13debcb2@nexthop.ai?part=3D1
