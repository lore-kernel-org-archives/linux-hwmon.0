Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AE1E260C
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 01:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779154537; cv=none; b=pbcHmTMD198P1f/LS0RygcQq3z+WolhVYcc9DqQexevl6DyfES0wyEu80rfuM4CQFwG5cRKJhaf60wbQf8Ls4mnJoXuxTaqn9QIiWe1RAY6MGTTcCLo9btPf9QT7SuGXYtmTj7xY6qfPYi8VDr/jBqYV4Cwdt56LMOTCyVmEFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779154537; c=relaxed/simple;
	bh=1I4GspYdxVqhAuLY0hDDv4k579oXPoOx6GKOTg4lLis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n7Tcs3IH061hf006DDvxyKaexvBHW506pJ8feukFI26lZzOfhKRtWKn0BL3aQOdyHbuH73lcZO+hxoC25VB80I/r0NT+uXynluKPO0TyIITsOQk3hmBCiOFDpO4MuusNB7BxfL5xqR7qY5jlYHlr8RcAG94p4cWvga1tNMUyhEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4+iXbnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4+iXbnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229EAC2BCB7;
	Tue, 19 May 2026 01:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779154537;
	bh=1I4GspYdxVqhAuLY0hDDv4k579oXPoOx6GKOTg4lLis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=G4+iXbnvML9CwGki+nPhOxbyf4O4Sg1OH9CK35zEutUpFpOu98P/ywrMd0shmk+Z4
	 9nvPaEcw9lk7K7dbe3Dss3CEJUTj7X+46x4z9HusFWaHp92ir2T1ZpTO0tl7b6qMWU
	 c0f2rM4OC6X5c/XBR4Ap7GtWhr3L8uf3L7coKL45xdlBeM0JDJysFDjisNENUjFDO4
	 HZwJIzmQSYH9N+owfvdVw3MHtRmq3yimVVxDJMDIfPIXam1YwGjyDpJqxseK47OEyF
	 o3ctBBC6TeDq+l4O2gLHpB1GW14T7vTTD29RjbRVbl8tkVyN2NHawA8WrT4bL1/UsZ
	 dUF9oKhHmWV6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] hwmon: (pmbus/adm1266) don't clobber GPIO bits
 before PDIO read in get_multiple
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-2-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-2-e425e4f88139@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 01:35:36 +0000
Message-Id: <20260519013537.229EAC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Uninitialized stack memory use on short I2C block reads
- [High] Missing required locking for PMBus hardware accesses
--

commit feacc189ff4113f817d364f381e4726e168838b1
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_mult=
iple

This commit prevents the pdio loop in adm1266_gpio_get_multiple() from
overwriting previously populated gpio bits by dropping a redundant assignme=
nt.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 11f9a44f4361a..4dd67c02b412e 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -210,7 +210,6 @@ static int adm1266_gpio_get_multiple(struct gpio_chip=
 *chip, unsigned long *mask
> =20
>  	status =3D read_buf[0] + (read_buf[1] << 8);

i2c_smbus_read_block_data() returns the number of bytes read on success.

If a short read occurs and fewer than two bytes are returned, does this
result in using uninitialized stack data for read_buf[1]?

I note this regression is fixed later in the series by a commit regarding
short block-read responses in the gpio accessors.

Additionally, the hardware monitoring subsystem guidelines require drivers
to implement locking for attributes registered by other means.

Can these unlocked pmbus reads in adm1266_gpio_get_multiple() interleave
with multi-message transactions from other threads, potentially corrupting
the active page state?

I see this regression is also resolved later in the series by a commit
that serializes gpio pmbus accesses with pmbus_lock.

> -	*bits =3D 0;
>  	for_each_set_bit_from(gpio_nr, mask, ADM1266_GPIO_NR + ADM1266_PDIO_NR)=
 {
>  		if (test_bit(gpio_nr - ADM1266_GPIO_NR, &status))
>  			set_bit(gpio_nr, bits);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-adm1266-gp=
io-fixes-v3-0-e425e4f88139@nexthop.ai?part=3D2
