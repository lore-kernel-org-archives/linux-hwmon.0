Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D938203710
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 00:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546078; cv=none; b=o/4eOpkVAVy8FVEMPeWD0KTSzTmeVRoTaVv8cqQ8uOCBO8KJSieWSOivD6zCkf+BRXsON8gi3ctp6WzNYY3p8FHGM8P9QTlCz536XvdW4oVac0yC8rc0q3GmV7d1oOcOTGGUY4IlkD1i2VIh41fYTqm6Z2rj2NDc8YYNtl2adkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546078; c=relaxed/simple;
	bh=NyzOeffzI8j/TQyhDB1ficrnOIdohhBz47R2n9l3JhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r37ypN6nmnSYTf8qnObMHsc9dW0h3m/TL1tih2zRCaYj4hm0wb1jHoWO0HQzIYb7pCc+lU83CU1EedtanqPKo8SwYbzPMefa4S88Z/dR89Q2oGYxntquKZkWsRqujXVQgrNE+KlPBYcgSDJZyZ6eD4M7CRA735xaPM4AzdN/KYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNPQsuxK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNPQsuxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DDBC2BCB0;
	Tue, 12 May 2026 00:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546078;
	bh=NyzOeffzI8j/TQyhDB1ficrnOIdohhBz47R2n9l3JhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nNPQsuxKEBb4QMsQvA3Q5UU8eZdcCYhVD5xofJn+CQtqU61rpwCB6GQZ03nghmD78
	 y86hxI+sLRcS3vK+6c/TsVZtkQ/eIcNBd0UKd1t8+94qYg3L/8sMd9k8tsFLRkFCEZ
	 wdmEcrt3QSpWQ+VGSB46ojcitt6KDQwIRIUybELyvMbd5H+l3ZfuMzOBlDYmV9hOVB
	 Ks8Li/FoWgDSgq5PqIvjvHd0d6pFJrsrYOfldR4ekX1S4L3hytezp6jAFW8uWO4IUJ
	 JQbYVZ+Il5mf0SorK6k3CFnUD84TtAjV6S3YWrH/+AjVhH+56SIABUaX3+OPcWNa+k
	 QJlKFp2DS0LOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] hwmon: (pmbus/adm1266) add powerup_counter
 debugfs entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260510-adm1266-v2-3-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-3-3a22b903c2f1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:34:37 +0000
Message-Id: <20260512003438.37DDBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The debugfs read function adm1266_powerup_counter_read() lacks m=
andatory subsystem locking.
--

commit 7f6c699c3d3803ae6836691f51cc018599b04811
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add powerup_counter debugfs entry

This commit adds a read-only debugfs file to expose the ADM1266's 16-bit
non-volatile powerup counter.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 31aefa8fc75f5..99e92a8365fb7 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c

[ ... ]

> +static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata)
> +{
> +	struct device *dev =3D s->private;
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf);

Does this debugfs read need to be protected by a lock?

The hardware monitoring subsystem guidelines state that drivers must
implement locking for attributes registered outside of the core info
struct, typically using hwmon_lock() or pmbus_lock().

Without synchronization here, could this I2C read interleave with multi-step
PMBus operations from other sysfs attributes or interrupt handlers and break
command atomicity?

> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 2)
> +		return -EIO;
> +
> +	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adm1266-v2=
-0-3a22b903c2f1@nexthop.ai?part=3D3
