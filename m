Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B4333441;
	Tue, 28 Jul 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256071; cv=none; b=dQSKWFLTOafiMkl8/GapjNOjjz2o7nlEUpxDj7+LQ2RqXooGquxX8Mw8ms9onsr1ggvtE+QiCkQNXrcsUYHpRNv3DJIZe8MpF53mAOZ+zwBwGn2LbCzxfaUWKUto2fMkHWcbN8fhr6/04Rp/M4ZXJX5kYPwMYEHbtor74yQgNSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256071; c=relaxed/simple;
	bh=RHOZuDhoLOWJC9gYshJU/s3gdE8ibN2F5h9HuHwhmvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yn0ugSTZIr2nGfy3tlrhzlY3IH0bPxGR4TpOWv3n02Zv0ga7b3Q7pF58VhlROwQrYaK9wilduFJmtDdu1Kp2izZMmSrmCzRVkQJAl7cTpGy6XEnjmhLSXf+HxdbH4BzAVRZtDkV4B76Ojhnrnu4j/UVWj1xUKso8jB7VGA923D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzmJy5Ao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzmJy5Ao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42051F000E9;
	Tue, 28 Jul 2026 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785256069;
	bh=0HqGjRgUHnbpEr/DQ0zxSBU0Rz3sjZSnb5874MPeUnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzmJy5AoVqniNa/SOGtkl+4lT0d0WofTI9RjEpreT/DUP+OX0hbjF575rfiKfxJ5W
	 vhktBSeKFdJi9z5/oJfJsXJwFEzyIyZELEt0Wt133S9RO8so4+svFTmG3yo5ie+YUh
	 YsEMmTbm+n5f7WU8uO7k8nvJCxDkIhxHewAiNgyM/nK5v2Hh6CNAJrici4RN35cHLp
	 zZgHmvWj9joFtMUFIQmX1Q/J3BOLgNpKXW2Byj/e7jlLj/zxdadVW//TmUSjAZMNKv
	 KfHnORaM81nojUjejq4k57wP4/v5ZPrf+/DkenBNEAEXFJOFbzdZQYYq3M16Jwq46q
	 qH6bpyROLMXVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:27:49 +0000
Message-Id: <20260728162749.A42051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Stack buffer overflow in `pmbus_debugfs_block_read` due to unbound=
ed return value from custom `read_block_data` callback.

Pre-existing issues:
- [High] TOCTOU data race on PMBus hardware page selection during probe.
--

--- Patch [3]: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to pmbu=
s_read_block_data() ---
commit c4bd4d03203a9fd14a7a2bcff69ec842b441fa68
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()

This commit introduces a mapping function to pmbus_read_block_data() in
preparation for adding support to a device which needs to use its own
read_block implementation.

> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 3d5586c67f840..d697939ec8921 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -459,6 +459,9 @@ struct pmbus_driver_info {
>  	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>  	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>  			      int reg);
> +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
> +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
> +			       char *data_buf);

[Severity: High]
Does this API need a size limit parameter? The comment specifies the buffer
size is 34, without providing a limit parameter to the callback, which might
encourage callbacks to return values up to 34.

[ ... ]

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 7b58f71985741..ff4572c473b70 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
[ ... ]
> @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register=
(struct i2c_client *client,
>  	struct pmbus_data *data =3D i2c_get_clientdata(client);
>  	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
> =20
> -	rv =3D pmbus_read_block_data(client, page, reg, data_buf);
> +	rv =3D _pmbus_read_block_data(client, page, reg, data_buf);

[Severity: High]
This is a pre-existing issue, but can this lead to a race condition with
sysfs accesses during probe?

Looking at pmbus_init_debugfs(), it traverses pages and reads registers
without taking the pmbus_lock. This indirectly invokes pmbus_set_page()
through pmbus_check_block_register():

pmbus_init_debugfs()
  pmbus_check_block_register()
    _pmbus_read_block_data()
      pmbus_read_block_data()
        pmbus_set_page()

If userspace reads or writes to a sysfs attribute concurrently, it acquires
the lock and sets the hardware page. Could the lockless call from
pmbus_init_debugfs() interleave between the sysfs thread's pmbus_set_page()
and its subsequent I2C operation, causing the sysfs thread to hit the wrong
PMBus page?

>  	if (rv >=3D 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
>  		rv =3D pmbus_check_status_cml(client);
[ ... ]
> @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file=
 *file, char __user *buf,
>  	char data[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };
> =20
>  	scoped_guard(pmbus_lock, client) {
> -		rc =3D pmbus_read_block_data(client, entry->page, entry->reg, data);
> +		rc =3D _pmbus_read_block_data(client, entry->page, entry->reg, data);
>  		if (rc < 0)
>  			return rc;
>  	}

[Severity: High]
Can the new callback return a value large enough to cause an out-of-bounds
write here?

If _pmbus_read_block_data() delegates to the new read_block_data callback,
and that callback returns a size of 34 (I2C_SMBUS_BLOCK_MAX + 2) or greater,
would it cause a buffer overflow?

Just below this hunk in pmbus_debugfs_block_read(), the code does:

    data[rc] =3D '\n';

Since the size of the data array is 34, an rc of 34 would write past the end
of the array. Is a bounds check needed on rc before using it as an index?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-hwmon-max2=
0826-support-v1-0-224766e0acd1@analog.com?part=3D3
