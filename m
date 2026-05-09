Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313E2F8E8D
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 01:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291301; cv=none; b=Del3r4LOPy5j+u7NCquTSLiW0Q5P6gMLmi4Mc4lfc+qFJbmdAFMCqNUVR5xWRAeeSNlmRATYyAAiox0ur1r4/H3AuX2byDqNL5Ggr+e9mIxyWIbSkEFp99czii3Oevwjqzqp0sVD9gk9j2sUukDyotyK+3YgBgb9dGfpWSYdZNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291301; c=relaxed/simple;
	bh=xX+/VOSPYCv51grwtjA3ftuzd0RRSBZbP9dJy4Ay+Jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gHJSfjPwWb0vCK1EA0rTR0CK7tSnYSSR1Y1u3dx5hB+vwulTa60ajXLnnV38QyLGO8ZVKtmTpNGJY31Bq88F+k0tD7MIegcvDDzvIeMTsw/BceG6OhOMS8o1c1HKHLKMfvznqDt6a86Gy9CLSZ2oYZeSqtAGHH1+lFH0i5BTkQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUfWmZNW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUfWmZNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD84FC2BCB4;
	Sat,  9 May 2026 01:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778291300;
	bh=xX+/VOSPYCv51grwtjA3ftuzd0RRSBZbP9dJy4Ay+Jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jUfWmZNWrwBXy59xjIg9YI+TaiDebmXMra0WJGXqU/P/JFJg0Md4eRLwCg+c5fnPu
	 4cjT4ZcC+9UWOUZEiU6Pa5d4/zcLcvepZAjDq0+uitD3mMx1j4E4YAEEBKVmeDo8YW
	 DF5CYQUaJqwL5GYKQS4m8ftPOFpO+uTvzADe8uFzAQG8NSYL+PMz7IQ60OXXQsFa35
	 3RuHnj0udC3PJMgRqhbBpurkgAggs39/fR5D6m8BVQlWcVoJQLUI8Fh2nJdIM0eFNY
	 BMbIaUSl4V0jIOmgcr8nD8ozQZ5IDeeFF5gher9ZPjY8B7liDLfGczh93J5ZsjQ6Qa
	 /SCEPSzDnEg4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] hwmon: (pmbus/adm1266) add powerup_counter debugfs
 entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508-adm1266-v1-5-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-5-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 01:48:20 +0000
Message-Id: <20260509014820.AD84FC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Use-after-free (UAF) during device removal due to conflicting =
devm and I2C core debugfs cleanup.
- [High] The debugfs attribute read function does not use hwmon_lock() to p=
rotect the hardware transaction.
--

commit b318aa9245d6d04f4ea8a9408b54190c4f30c67d
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add powerup_counter debugfs entry

The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
that increments on every power cycle and cannot be reset by the host.
This patch exposes it as a read-only debugfs file.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
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

The hwmon subsystem guidelines mention that drivers should use hwmon_lock()
and hwmon_unlock() for attributes registered outside of the core hwmon sysfs
operations.

Since this debugfs read issues an I2C transaction, should hwmon_lock() be
acquired before calling i2c_smbus_read_block_data() to avoid racing with
concurrent sysfs or internal device operations?

> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D 2)
> +		return -EIO;
> +
> +	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
> +
> +	return 0;
> +}
[ ... ]
> @@ -400,6 +426,8 @@ static void adm1266_init_debugfs(struct adm1266_data =
*data)
>  				    adm1266_state_read);
>  	debugfs_create_devm_seqfile(&data->client->dev, "firmware_revision", da=
ta->debugfs_dir,
>  				    adm1266_firmware_revision_read);
> +	debugfs_create_devm_seqfile(&data->client->dev, "powerup_counter", data=
->debugfs_dir,
> +				    adm1266_powerup_counter_read);

Can this sequence lead to a use-after-free during device removal?

According to the I2C subsystem rules, the I2C core cleans up debugfs entries
attached to the client after the driver's remove function finishes, but
before releasing devres resources.

If the I2C core removes the debugfs tree and frees the dentries first,
wouldn't the subsequent devm cleanup for this seqfile try to call
debugfs_remove() using an already-freed dentry pointer?

>  	debugfs_create_file("clear_blackbox", 0200, data->debugfs_dir, data->cl=
ient,
>  			    &adm1266_clear_blackbox_fops);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-adm1266-v1=
-0-ec08bf29e0ce@nexthop.ai?part=3D5
