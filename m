Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0287364949
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274520; cv=none; b=HbZg8/IVXxBXEIi6gNWzgpb/1JhSgKGtdZ3N4hR5iReosjO5VzCkXe09ydhEh+TZneM1dzlLvHle7keiGJY6u4wb2BJfwDfWgptA9TXb9yeg/n3j4+M7L0cakm/RCTW4mqoLymRGZBjNQLRK7eokoaIxoTNKUyNRDKvTUQdOJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274520; c=relaxed/simple;
	bh=eAhCfmh1T/nETfNs6YKQihopaI5pvM+C899Xfhr7es8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UOUs3AuSJ1TjhyqVJwweFOV3woVzFXYAcwtYenCVjfUrTujCNzJ2pe3ilADcqjA8/q+TwhJS10+p2qhF5mvwbl5nbbNgRtLZL07uRxAB7ZpwUVyN/N+/o62Oyj7nUz9CLPlU6x6Uuq48hE91hJA3Eewoq7clDBTByX+BNW7nHSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLkQZV+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLkQZV+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1D3C2BCB4;
	Mon, 27 Apr 2026 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777274520;
	bh=eAhCfmh1T/nETfNs6YKQihopaI5pvM+C899Xfhr7es8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PLkQZV+G2Heqd0ZMngU9x53tPexfzVXXvedG7XeCDXOifH+io6u+4eJL2yH+mNYHn
	 ywZVLMPTR4AzIpdhxdiGAOdelNwCPRW2kBcbRCvinXzg/uz6GMQa+XfQpEa9KN9PVu
	 ot671s1Fr9FD+yLNJjTpJlychAqZMl8bUjeqD6g+yWDdoccpBPmJbXZmvvwGlgrgxJ
	 m5fhcckx6Llv7YcOLuK3Y4+MdpOq5iWMoguStbbGLDf8LLsJaqDdcVRPGv/dF629Qt
	 IRH3q20ematpb/txbWy8iT5SO8Yvs0ZRS6fbNBrBuB9zhgcXYSSZd9piAHB8UaWeII
	 raS8Eh8QB3zdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Reply-To: sashiko@lists.linux.dev
To: "Brian Chiang" <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-2-ffa77bfa65e7@inventec.com>
References: <20260427-add-support-for-q50sn12072-and-q54sn120a1-v6-2-ffa77bfa65e7@inventec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Apr 2026 07:21:59 +0000
Message-Id: <20260427072200.4B1D3C2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 4 potential issue(s):
- [High] Denial of Service due to holding hardware lock while copying from =
user space
- [High] Use-After-Free of `psu` context due to incorrect devres initializa=
tion order
- [High] Hardware write protection is permanently disabled upon debugfs wri=
te
- [Medium] Guideline Violation: Use of incorrect lock for debugfs attributes
--

commit d199d1aceab7c176fa10e4adf36411621ba1481b
Author: Jack Cheng <cheng.jackhy@inventec.com>

hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

This commit adds support for the Q50SN12072 and Q54SN120A1 power modules
to the q54sj108a2 driver. It introduces new driver information structures,
device match tables, and debugfs entries for the supported hardware.

> diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj=
108a2.c
> index d5d60a9af8c5..b59cfee861f2 100644
> --- a/drivers/hwmon/pmbus/q54sj108a2.c
> +++ b/drivers/hwmon/pmbus/q54sj108a2.c

[ ... ]

> @@ -83,73 +113,77 @@ static ssize_t q54sj108a2_debugfs_read(struct file *=
file, char __user *buf,
>  	char *out =3D data;
>  	char *res;
> =20
> +	rc =3D pmbus_lock_interruptible(psu->client);
> +	if (rc)
> +		return rc;

The hardware monitoring subsystem guidelines state that drivers must implem=
ent
locking for attributes registered by other means (such as debugfs) using
hwmon_lock() and hwmon_unlock().

Is pmbus_lock_interruptible() the correct lock to use here, or should this =
be
using the standard hwmon subsystem locks?

[ ... ]

> @@ -184,25 +224,29 @@ static ssize_t q54sj108a2_debugfs_write(struct file=
 *file, const char __user *bu
>  	int idx =3D *idxp;
>  	struct q54sj108a2_data *psu =3D to_psu(idxp, idx);
> =20
> -	rc =3D i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
> +	rc =3D pmbus_lock_interruptible(psu->client);
>  	if (rc)
>  		return rc;
> =20
> +	rc =3D i2c_smbus_write_byte_data(psu->client, PMBUS_WRITE_PROTECT, 0);
> +	if (rc)
> +		goto unlock;

This isn't introduced by this patch, but this code unconditionally disables
hardware write protection.

Does the driver ever restore the PMBUS_WRITE_PROTECT register to its
original state? It looks like the power supply module might be left
permanently unprotected against unintended I2C writes.

>  	switch (idx) {
>  	case Q54SJ108A2_DEBUGFS_OPERATION:
>  		rc =3D kstrtou8_from_user(buf, count, 0, &dst_data);
>  		if (rc < 0)
> -			return rc;
> +			goto unlock;

Could calling kstrtou8_from_user() while holding pmbus_lock_interruptible()
introduce a denial of service risk?

If a user provides a buffer managed by userfaultfd, they might be able to
indefinitely pause the page fault. Because the PMBus mutex is held, other
tasks attempting to acquire the lock for this device could hang.

Can the user input be copied and parsed into local variables before acquiri=
ng
the hardware lock?

[ ... ]

> @@ -341,6 +395,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
>  	if (!psu)
>  		return 0;
> =20
> +	psu->chip =3D chip_id;
>  	psu->client =3D client;

This isn't a new issue, but there appears to be an existing use-after-free
risk during device unbind.

Looking earlier in q54sj108a2_probe(), pmbus_do_probe() is called before
allocating the psu context:

	ret =3D pmbus_do_probe(client, &q54sj108a2_info[chip_id]);
	if (ret)
		return ret;

	psu =3D devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);

Since devres actions execute in reverse order of addition, psu will be
freed before the PMBus core cleans up the debugfs directory.

Does this leave a window during removal where debugfs files are accessible,
but any read or write will dereference the freed psu pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260427-add-suppor=
t-for-q50sn12072-and-q54sn120a1-v6-0-ffa77bfa65e7@inventec.com?part=3D2
