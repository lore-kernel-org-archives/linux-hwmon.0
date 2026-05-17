Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473C64A8C
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778979711; cv=none; b=nTDvA43KynNMEyi274R8M/7UTMk9Ab9tCXLHdyLwmRbGp0+D+vHycHyoybyRGLn1AvlyDL7YZJa9nj1vu/mxdUcON7qt6OI6Mcid6BmO/Gy+IAaG5wXLnk+DOQgnXKZQstEwKHzludlwS4YcevgKG8M3Z71LbRZH51IwOdZ5m1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778979711; c=relaxed/simple;
	bh=NGEsYCAxSor95PbrPDQ/HSqrq4RamkBAok6C1PaQx4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P8amohjCn6uyiwUlCIPiZddzZjM4ZhqbyyMEBdIzcPnWKwAp7JUzDYh3tOOJOyLCdAXiXLqnNqyApDglFiBDLfwGB6D6XUyJyeI1lbHKqN1VCtkBA/gUIsfP2Fushi8dA1hS/HGuq2tpMZ8kcWopMCGRFLdIP8Bhlw3ppuzT6t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXoa2tL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXoa2tL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D46C19425;
	Sun, 17 May 2026 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778979711;
	bh=NGEsYCAxSor95PbrPDQ/HSqrq4RamkBAok6C1PaQx4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CXoa2tL88JqLLziFIx2IDN2g2RiqSPRJQEuTXaPcBslpvht/VnjQH7A6zEUxq/toz
	 tSVNRA6jwg/VfhxRUyOH+oWzjSQeaWLh6ay49JONB+WmBeJiGFgG9/lYntM1NkHNc5
	 vMVqOLCTR2RirI4oRUL9cOpc78bswIYQa3DqJ4D5gR+Q4jqpuYzaiuPEwKF4ablAtl
	 MByWcI7wq86wfUz6X4lsitz8egyQRdhcXqMM/v3RoNyYO+j3J6rfmuLiySYtJ7S1RD
	 1j/0bhLvPuiZIvfFGb3EEzzy6rqndMjMw3ED5jc1BscLsn5LlFvpH2FUi6BWTMpo6B
	 UszHsPjYixsLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] hwmon: (pmbus/adm1266) register the gpio_chip
 after pmbus_do_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-4-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-4-801f13debcb2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 01:01:50 +0000
Message-Id: <20260517010151.01D46C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Out-of-bounds write of 1 byte in adm1266_pmbus_block_xfer() du=
e to I2C transfer length exceeding buffer size.
- [High] Missing PMBus core locking in NVMEM accessors violates hwmon subsy=
stem guidelines.
- [High] Incomplete fix: NVMEM device is exposed before PMBus initializatio=
n completes, preserving a probe race condition.
--

commit bdaeceda1ad3acf1f5f9bb0ddda1a61a58a5c7f9
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()

adm1266_probe() calls adm1266_config_gpio() before pmbus_do_probe() has
initialised the per-client PMBus state. This latent hazard allows a sysfs
read from a user space agent to race pmbus_do_probe()'s own device
accesses. Move adm1266_config_gpio() down past pmbus_do_probe() to avoid
this race.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 57cb7d302cddd..b91dcf067fa6d 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -467,10 +467,6 @@ static int adm1266_probe(struct i2c_client *client)
>  	crc8_populate_msb(pmbus_crc_table, 0x7);
>  	mutex_init(&data->buf_mutex);
> =20
> -	ret =3D adm1266_config_gpio(data);
> -	if (ret < 0)
> -		return ret;
> -
>  	ret =3D adm1266_set_rtc(data);
>  	if (ret < 0)
>  		return ret;

[ ... ]

> @@ -483,6 +479,10 @@ static int adm1266_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D adm1266_config_gpio(data);
> +	if (ret < 0)
> +		return ret;
> +

Does this code leave the nvmem device exposed before PMBus initialization
completes?

While adm1266_config_gpio() is moved down past pmbus_do_probe(),
adm1266_config_nvmem() remains above it:

static int adm1266_probe(struct i2c_client *client)
{
	...
	ret =3D adm1266_config_nvmem(data);
	if (ret < 0)
		return ret;

	ret =3D pmbus_do_probe(client, &data->info);
	...
}

This means the nvmem device is immediately exposed to userspace before the
PMBus core is fully initialized. A concurrent nvmem read could trigger
adm1266_nvmem_read() and perform I2C accesses without serialization,
recreating the identical hazard this patch aims to fix for GPIOs.

Additionally, do the nvmem accessors implement the required locking?

The hwmon subsystem guidelines state that drivers must implement locking
for attributes registered outside the core. adm1266_nvmem_read() triggers
I2C transactions independently via adm1266_pmbus_block_xfer() without
taking pmbus_lock(). This could allow concurrent nvmem reads to interleave
with the PMBus core's multi-step sequences, potentially breaking device
state.

Could this lead to a memory corruption issue during I2C transfers?

While not introduced by this patch, it appears the read_buf array in
struct adm1266_data is allocated with 256 bytes and is exactly cacheline
aligned:

drivers/hwmon/pmbus/adm1266.c:
struct adm1266_data {
	...
	u8 read_buf[ADM1266_PMBUS_BLOCK_MAX + 1] ____cacheline_aligned;
};

If adm1266_pmbus_block_xfer() sets the read message length to
ADM1266_PMBUS_BLOCK_MAX + 2 (257 bytes), wouldn't the I2C master controller
clock out and read exactly 257 bytes from the bus, resulting in an
out-of-bounds write of 1 byte past the end of the heap-allocated structure?

>  	adm1266_init_debugfs(data);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-adm1266-gp=
io-fixes-v2-0-801f13debcb2@nexthop.ai?part=3D4
