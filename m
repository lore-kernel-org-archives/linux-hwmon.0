Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C807199FAB
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 01:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721450; cv=none; b=h50961BgVqBQwRhJMvw4dPBLveMztWvQoVyI0Zv2etSZZie3bkafTh1WjdojLp00JXt32tMIglo/IJSOafCIXzZaA+UGOsV8ig4DPZep9jYRCFlXm1QSAOUxJw4vtB1kmeTCKK7VetAaDOFVByJQfBprxLjT7YTyJQg0Sxb0Exk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721450; c=relaxed/simple;
	bh=+0h40Tz2wOcu8+E4NDHUeq2u7eecomJlI5tJEozui5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jnFn9Hh/hNJilAasHqyph6FvtUCRaM3aC96eqrHpMGDIa5vmA3pxjmK27wFPumtHx0wC0KMqcRsi788z2W751vmulzQP7qOGQrpNArIj1Ej1wxLKkI4GeWI9kfJ1BvNMUODxJb9wni+vtCcxBdcxWiIABc935ajK7s2jYIC5LBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rA/x5RBe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rA/x5RBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891CFC2BCB8;
	Thu, 14 May 2026 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721449;
	bh=+0h40Tz2wOcu8+E4NDHUeq2u7eecomJlI5tJEozui5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rA/x5RBe9fozmaQjiEmd85vkWRfBus+KFd3xxNraCyp7IFd/wPmVYsKa9IGzvKm1H
	 eLCaslAsbyxXFM9WoXNKbcVD5Dzuj3LUFLBwii8CkULqHLXb0EqMVI1Ca5TrP635/e
	 9qBkfix40F07v8j2MBfbulZNoqEWNPcasXJwtq3+vPRbiDNk3vMJoXhA2k/iax8PuQ
	 lYt54nxux/n6+98i0RbzRf+Oc6aSreq5w/yTiL+SuCMqEiRhnmpMCoXIXW82PIIhV9
	 6paOfqGZ2f2B5l5F8RAx/EMEtzSP6CxS1PV42FMKwli6DTNBQ+Nr6xDOrv6t6dqiuu
	 318hRr59ELJoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] hwmon: (pmbus/adm1266) add powerup_counter
 debugfs entry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260512-adm1266-v3-3-a81a479b0bb0@nexthop.ai>
References: <20260512-adm1266-v3-3-a81a479b0bb0@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:17:28 +0000
Message-Id: <20260514011729.891CFC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing locking in debugfs read callback `adm1266_powerup_counte=
r_read` violates subsystem concurrency guidelines and allows interleaving w=
ith PMBus sequences.
--

commit d2c76f8ee7556a97e62b160e80fa96f155d632ed
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add powerup_counter debugfs entry

This commit exposes the adm1266 16-bit non-volatile powerup counter as a
read-only debugfs file. The live value is read using a block-read to
retrieve two payload bytes in little-endian order.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index bd3784d59a7c8..080e7dbd0c069 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> @@ -356,6 +357,31 @@ static int adm1266_firmware_revision_read(struct seq=
_file *s, void *pdata)
>  	return 0;
>  }
> =20
> +/*
> + * POWERUP_COUNTER (0xE4) is a 2-byte little-endian non-volatile counter
> + * that increments on every device power cycle (datasheet Rev. D, Table
> + * 93). It saturates at 65535 and cannot be reset by the host. Each
> + * blackbox record embeds the counter value at record time, so this live
> + * read is mainly useful for matching a record back to its boot.
> + */
> +static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
> +{
> +	struct device *dev =3D s->private;
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);

Does this lockless hardware access introduce a regression by violating hwmon
subsystem concurrency guidelines?

The hwmon guidelines specify that drivers must implement locking for
attributes registered by any other means, such as debugfs files. While a
single i2c transaction is serialized at the adapter level, a lockless
access here could interleave with stateful multi-transaction pmbus
sequences on other threads, such as setting a page register followed by
a read.

Should this function acquire pmbus_lock(client) to safely serialize the
hardware access and prevent disruption of the device internal state machine?

> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 2)
> +		return -EIO;
> +
> +	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
> +
> +	return 0;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-adm1266-v3=
-0-a81a479b0bb0@nexthop.ai?part=3D3
