Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002493016E7
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981954; cv=none; b=JderLvx1ISSP1nhUcz29Ru0RvbfLYh+usIEnIAWb4EgPdu5bka1HjLU91fp50lHyHwxNn9xM/jgcfWtlNIj0jL69engnOiHdlcywPXUIGy6Ug6KKfwTppKQrYts/HnKHfN+jPHaKDvYJwWH4RQ26ejBvmUBtx60mphzQ4KEBSmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981954; c=relaxed/simple;
	bh=lVyJHPb2Xqv63w+BF5utPWOBIyAbdiiGZyfJfoJaA2s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CyAx67+ZRWbi257ob6w5lp2jzVi9kaqZ/gy23lkv/elXT1Jpu7qR8ALrk9bGyvBfiLrcomP975Tv8O16VNiqWk+OHw+3D1HflCz7oZfqw0FlheF2l7/wYCurdPJlXqss9SVrz162oZhVqLgbFJErEbBtnZBwYyFF6A/ks26wjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+4EVNOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+4EVNOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF81C19425;
	Sun, 17 May 2026 01:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778981953;
	bh=lVyJHPb2Xqv63w+BF5utPWOBIyAbdiiGZyfJfoJaA2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R+4EVNOkwD+T1XZUPXwM4UenC6YivPtP+55ZYj9obrIbB6d73y6gY60lo4pMOcNdG
	 gtExG6+Kyw4aRbwePGtx/QfNaAaEj7trEPNECjbRkqwMgXJUZP0weAqoW3JB0EnoXd
	 hj1OXamCVXlrsh7jGxOjLVFMAO+z03iAxGucrtm9XzeEsQI86eM57l7ZJW+nnjGwlh
	 xc9Uz/sLHSgRduJ3x1WfEcs4zbiHVbu867zAcqa0utTO1VOfn9OtWWMDkAj64kXUzk
	 hmgSSAiWR39C5aOLiX2NtvQrr4pfp15TcqjpVTZj26hEqi4bSl7tSl0aKmdIjHSsYi
	 hgUh5mDD1YJAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] hwmon: (pmbus/adm1266) serialize GPIO PMBus
 accesses with pmbus_lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-5-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-5-801f13debcb2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 01:39:13 +0000
Message-Id: <20260517013913.8AF81C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Pre-existing Stack and Heap buffer overflows in `adm1266_nvmem=
_read_blackbox` from untrusted device input.
- [High] Incomplete Fix: NVMEM and debugfs accessors are left unlocked, and=
 probe ordering prevents safely locking them.
- [High] Pre-existing out-of-bounds write and read in `adm1266_pmbus_block_=
xfer` due to off-by-one buffer size.
--

commit d839d29e2c4f90780c618b15f0a81b58788bc399
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock

This commit takes pmbus_lock at the top of GPIO accessors via the scope-bas=
ed
guard() to serialize PMBus accesses and avoid corrupting the device state
machine.

> adm1266_gpio_get(), adm1266_gpio_get_multiple(), and
> adm1266_gpio_dbg_show() all issue PMBus reads against the device but
> none of them take pmbus_lock.  The pmbus_core framework holds
> pmbus_lock around its own multi-transaction sequences (notably the
> "set PAGE, then read paged register" pattern used by hwmon
> attributes), so an unlocked GPIO accessor can land between a PAGE
> write and the subsequent paged read in another thread and corrupt
> either side's view of the device state machine.

Are adm1266_nvmem_read() and adm1266_state_read() also vulnerable to this
interleaving race condition? They issue PMBus reads directly against the de=
vice
and can be triggered concurrently by userspace via debugfs, so it seems they
might also corrupt the device state machine if left unlocked.

If pmbus_lock is added to the NVMEM path, is the driver's probe sequence sa=
fe?
Currently, adm1266_probe() registers the NVMEM device before calling
pmbus_do_probe() which allocates the clientdata. If an early NVMEM read occ=
urs
before pmbus_do_probe() completes, it seems i2c_get_clientdata() would retu=
rn
NULL, which could cause a panic when dereferencing the lock.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index b91dcf067fa6d..2e9ae03ab64b0 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

> @@ -235,6 +239,8 @@ static void adm1266_gpio_dbg_show(struct seq_file *s,=
 struct gpio_chip *chip)
>  	int ret;
>  	int i;
> =20
> +	guard(pmbus_lock)(data->client);
> +
>  	for (i =3D 0; i < ADM1266_GPIO_NR; i++) {
>  		write_cmd =3D adm1266_gpio_mapping[i][1];
>  		ret =3D adm1266_pmbus_block_xfer(data, ADM1266_GPIO_CONFIG, 1, &write_=
cmd, read_buf);

Does adm1266_pmbus_block_xfer() write past the end of the data->read_buf ar=
ray?

The read_buf array in struct adm1266_data is declared as 256 bytes:

	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;

But adm1266_pmbus_block_xfer() initializes the I2C read message with a larg=
er
length:

static int adm1266_pmbus_block_xfer(...)
{
	...
		{
			.addr =3D client->addr,
			.flags =3D I2C_M_RD | I2C_M_DMA_SAFE,
			.buf =3D data->read_buf,
			.len =3D ADM1266_PMBUS_BLOCK_MAX + 2,
		}
	};
	...

Could this cause i2c_transfer() to write 257 bytes into the 256-byte array?

Additionally, if I2C_CLIENT_PEC is enabled and the device returns a max len=
gth
byte of 255, could the PEC validation logic perform an out-of-bounds read at
index 256?

While reviewing this file, I also noticed two other regressions in
adm1266_nvmem_read_blackbox().

First, it passes a local 5-byte array to i2c_smbus_read_block_data():

	u8 buf[5];
	...
	ret =3D i2c_smbus_read_block_data(client, ADM1266_READ_BLACKBOX_INFO, buf);

Since i2c_smbus_read_block_data() copies up to I2C_SMBUS_BLOCK_MAX (32) byt=
es
into the destination array based on the length returned by the device, coul=
d a
device returning a length greater than 5 overflow the buf stack array?

Second, it reads record_count from the device response:

	record_count =3D buf[3];

Then it uses this in a loop:

	for (i =3D 0; i < record_count; i++) {
		...
		read_buff +=3D ADM1266_BLACKBOX_SIZE;
	}

Since data->dev_mem is allocated with a fixed size of 2048 bytes, and
ADM1266_BLACKBOX_SIZE is 64 bytes, if the device returns a record_count gre=
ater
than 32, could this loop write past the end of the data->dev_mem array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-gp=
io-fixes-v2-0-801f13debcb2@nexthop.ai?part=3D5
