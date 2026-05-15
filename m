Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67EF3F99E0
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 23:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889191; cv=none; b=ht0XyYRerbpBxCoHN1o83P9E0IU25maEtCwPQSpCcPDHjW0mcEjhKaU+7CJEmyQmbxKtJrreoY0hBSBTTZOL0lvrcNBycPQr7w3uIonlWPnLnZsY/QumR7Uu3GW7414UMwFEsBHvTNWhkTUbaXpHcAhtpRXFlBiOkjSvzZpgg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889191; c=relaxed/simple;
	bh=uw9S5FrUzhnV3cnow9Lq25NL+pS4SP9ADT+QCjGraMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sliqJF/WemHv/DYsblraps9/ejXph73f6Uz+SyPzd2wBia35BncVFn5w+pHDcvpdz+Kw42aWL3RB2VKjZhzYNPr+UOW+hEMN5R1n+e68ZZh8Hyu5jl2m4Qk7E6C2MHDEB2RI4hEe2X7JggkFEbotkcY4RNdELP+wOujN/QGEFMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1CnIVWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1CnIVWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC5FC2BCB0;
	Fri, 15 May 2026 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778889190;
	bh=uw9S5FrUzhnV3cnow9Lq25NL+pS4SP9ADT+QCjGraMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=q1CnIVWShsU84Z4HfHzpNQotzTOkEE08drF4c+iD+v7jtCsphV6pzS2zhsbj/vrpz
	 8gCN66EnZ5VqRP5oMcjppdJNOq5ZgFjUgmrY2dKjfAYc74UNGtDjsMdFafB2AGkA/L
	 H8xzqUQST443iywX21tXFl9nnLqWznO8Gpc4BZIM/zNb5w+KC00gBSad5FNW6fRUBv
	 fja+kFf8pTBZi2v0TnMO3LYgf0Fu7CE4qSGlMGtGAgd2BdCiaJgL/mRyk3yvH9goxG
	 NJQefbtynlZoM5pFUpj/IyC51FcwTEW075gDpGxVStsFXPWbwnbBvJ45Qb/sPoIR1K
	 baRXmHRql7eQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] hwmon: (pmbus/adm1266) include PEC byte in
 pmbus_block_xfer read buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515-adm1266-fixes-v1-4-1c1ea1349cfe@nexthop.ai>
References: <20260515-adm1266-fixes-v1-4-1c1ea1349cfe@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 23:53:09 +0000
Message-Id: <20260515235310.5EC5FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Out-of-bounds memory accesses in `adm1266_gpio_get_multiple` due t=
o incorrect macro usage.
- [High] Data race and subsystem guideline violation in `adm1266_nvmem_read=
` due to lack of locking.
--

commit 8a595dba5a711f725b08f3b2d988dc3dd5b53c2e
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) include PEC byte in pmbus_block_xfer read buffer

This commit increases the size of the read buffer in the adm1266 driver by
one byte. This allows it to hold the length byte, up to 255 payload bytes,
and the PEC byte, preventing an out-of-bounds write and a subsequent
out-of-bounds read during PEC comparison.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 43d9e74077954..5c68e3177f64e 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -61,7 +61,7 @@ struct adm1266_data {
>  	u8 *dev_mem;
>  	struct mutex buf_mutex;
>  	u8 write_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
> -	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
> +	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 2] ____cacheline_aligned;
>  };
> =20
>  static const struct nvmem_cell_info adm1266_nvmem_cells[] =3D {

While reviewing this code, I noticed a couple of other issues in the file.
This isn't a bug introduced by this patch, but does the loop in
adm1266_gpio_get_multiple() read past the end of the mask array?

drivers/hwmon/pmbus/adm1266.c:adm1266_gpio_get_multiple() {
...
	*bits =3D 0;
	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_STATUS=
) {
		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
			set_bit(gpio_nr, bits);
	}
...
}

Because ADM1266_PDIO_STATUS is a PMBus command constant (0xE9 or 233), the
size evaluated is 242 instead of the expected ADM1266_GPIO_NR +
ADM1266_PDIO_NR (25).

Since the mask and bits arrays supplied by gpiolib are sized only for ngpio
(25 bits), find_next_bit() will read up to 242 bits from mask.

If any of that memory has a bit set, could the loop execute
set_bit(gpio_nr, bits) and overflow the bits array?

Additionally, this isn't a bug introduced by this patch, but is there a
missing lock in adm1266_nvmem_read() that could cause a data race on
data->dev_mem?

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read() {
...
	if (offset =3D=3D 0) {
		memset(data->dev_mem, 0, data->nvmem_config.size);

		ret =3D adm1266_nvmem_read_blackbox(data, data->dev_mem);
...
}

The hwmon subsystem guidelines require drivers to implement locking for
attributes registered by other means, such as the NVMEM core. However,
adm1266_nvmem_read() accesses and mutates the shared data->dev_mem buffer
without acquiring any driver-level lock.

When called with offset 0, it zeroes out the memory via memset() and then
repopulates it via multiple slow I2C reads.

Because the NVMEM subsystem does not serialize reg_read operations, will
concurrent reads via the sysfs NVMEM interface result in multiple threads
interleaving their memset operations and I2C block transactions, returning
corrupted or partially-populated data to userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-adm1266-fi=
xes-v1-0-1c1ea1349cfe@nexthop.ai?part=3D4
