Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B8346AFD
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677053; cv=none; b=D0jTn4ayzQbjrgC7GDpwNazFoyNuiDseaTo2rALJt33um474pID/45YUlOrt+Vz+pidDHBmqmYgkLPybUHzdGtLqZ58r88Z+g/+y6gmV+km47tVMnweHJEpLbOnlWVw/b/dL77YoeK3qjVjK9y4czmQvNRtM6JhMc9nrecTz+88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677053; c=relaxed/simple;
	bh=3ZrzxlcoQDj+rBmTlYV7mbsQxsG3tNXEGNmlg+YArtg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lmVIPZkHII67sOAMUYwKUCcxw6aQR1+jn9x8qBqDLY7R290VZci33PBJSmEJndGDRfomdJCs8JIBzUGNx3sZIijJLs8ev4tzhPI97CY2n1KFwqWptiw75JwSbcVENd9vEqRewVwQ99t1aYZkCrvHvJBSj4CRtALf8CH2IELjpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az+v97B5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az+v97B5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE811F000E9;
	Sun,  2 Aug 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785677051;
	bh=KTwN7qP6tlTDMUg40cVZhTiTr5uJoAp9yI0UzWgKF98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Az+v97B5gkN77CijDyGCw1e4ndT/eC0K+XEXaxr0k9VEWL6Z74gKZ23Qiv80t2Y5R
	 hx9uIehVnjWS8biVNZtbY+bnIgpoVshlt9cGAn4WJycg1i28ZUk/VqiouYjp00Vi+L
	 5an4zBu8jSSFX1ukhjsYbb8iRM/WgamuhVo/KDiMMJnB4rjoyO0ZH/YF8cZ4A6rjM+
	 7kY53GsSrOiIRLPvIM5SNSeKEWpVyauBAnO5sdSv/4nsYK+8hcpbtFCo0kDKJ42HXq
	 Vvata4yIooGcaPSXHvuqRcbA+expR9fvAuLGx1C9sxSUQnVL/GDbcSlvjAkz+3hjPr
	 RRumZOzRmDk7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sg2042-mcu) reject short uptime reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Ahmet Memis" <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260802130728.25721-1-ali@iusegentoo.com>
References: <20260802130728.25721-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 13:24:11 +0000
Message-Id: <20260802132411.ADE811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Architectural and locking model violation: custom sysfs attributes=
 are registered directly on the I2C device rather than through the hwmon co=
re.
- [High] Arithmetic overflow when converting user input to degrees in `sg20=
42_mcu_write` allows bypassing maximum limits.
- [Medium] The I2C probe function checks for `I2C_FUNC_SMBUS_BLOCK_DATA` bu=
t the driver requires `I2C_FUNC_SMBUS_READ_I2C_BLOCK`.
--

--- Patch [1]: [PATCH] hwmon: (sg2042-mcu) reject short uptime reads ---
commit bcdb3b0b98b7a3e73302e366dc592d3472a7ff7b
Author: Ali Ahmet Memis <ali@iusegentoo.com>
hwmon: (sg2042-mcu) reject short uptime reads

This commit updates uptime_show() to ensure it receives exactly two bytes
when reading the uptime register. It rejects short reads to prevent
uninitialized stack memory from leaking into the sysfs output.

Cc: stable@vger.kernel.org

> diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
> index 591f5f572fe4c..10292417e7661 100644
> --- a/drivers/hwmon/sg2042-mcu.c
> +++ b/drivers/hwmon/sg2042-mcu.c
> @@ -79,6 +79,8 @@ static ssize_t uptime_show(struct device *dev,
>  					    sizeof(time_val), time_val);

[Severity: Medium]
This is a pre-existing issue, but since this function uses
i2c_smbus_read_i2c_block_data(), could the adapter functionality check in
sg2042_mcu_i2c_probe() be incorrect?

drivers/hwmon/sg2042-mcu.c:sg2042_mcu_i2c_probe() {
    ...
    if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
                                                  I2C_FUNC_SMBUS_BLOCK_DATA=
))
        return -ENODEV;
    ...
}

It checks for I2C_FUNC_SMBUS_BLOCK_DATA instead of
I2C_FUNC_SMBUS_READ_I2C_BLOCK.

Does this allow the driver to probe on adapters that support I2C blocks but=
 not
SMBus blocks, or fail to probe on adapters lacking SMBus block support?

>  	if (ret < 0)
>  		return ret;
> +	if (ret !=3D sizeof(time_val))
> +		return -EIO;
> =20
>  	return sprintf(buf, "%d\n",
>  		       (time_val[0]) | (time_val[1] << 8));

[Severity: High]
This is a pre-existing issue, but does sg2042_mcu_write() have an arithmetic
overflow regression when scaling user input?

drivers/hwmon/sg2042-mcu.c:sg2042_mcu_write() {
    ...
    int temp =3D val / 1000;
    int hyst_temp, crit_temp;
    u8 reg;

    temp =3D clamp_val(temp, 0, MCU_POWER_MAX);
    ...
}

If a user writes a sufficiently large 64-bit integer (e.g., > 2.14 * 10^12)=
 to
a threshold file, does the division result in a value that overflows the 32=
-bit
signed int temp?

If it overflows into a negative number, wouldn't clamp_val()
evaluate the negative integer against 0 and clamp it to 0 instead of the ma=
ximum
limit, incorrectly bypassing hardware safety limits?

[Severity: High]
This is a pre-existing issue, but are custom sysfs attributes registered
directly on the I2C device rather than through the hwmon core?

drivers/hwmon/sg2042-mcu.c:
    static const struct attribute_group *sg2042_mcu_groups[] =3D {
        &sg2042_mcu_attr_group,
        NULL
    };

    static struct i2c_driver sg2042_mcu_driver =3D {
        .driver =3D {
            ...
            .dev_groups =3D sg2042_mcu_groups,
        },
        ...
    };

By registering these directly on the I2C device, does this regression bypass
the hwmon subsystem layering?

Additionally, since these attributes only have access to the I2C device poi=
nter,
does this make it structurally impossible for them to use hwmon_lock() for
serialization, violating the subsystem locking guidelines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802130728.2572=
1-1-ali@iusegentoo.com?part=3D1
