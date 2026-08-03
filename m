Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62AB3A7D7A
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786461; cv=none; b=rx8HlLBO7+NMyCPU1kfff8PqkZHerqS5UiFngUDnhiV4mAIdHkOnia23aiqqJBLF1XK/MNphO2vbjMRcilaDt4tinHAlDFIA4hIBx2Qyaca7Qwipkj6kE1jhH/3sx47ugZheqjr+0UdrDuQb9o0ddQyvgSM5I+itCaw+WDFedY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786461; c=relaxed/simple;
	bh=QXNGKYCywpiaaenjwKOIn3940gowlZAKeqILWEEXII0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hRQ0jX/zF36EuEtiemgbw6PesL59y4R7pOvgz5A4Cm+Z+UQqjdA961J5BD345oLzvVMbG9+tS5cm1oJ0libilIBR7TtEvxe+dXdMDDzTOPtK0NOg3e0Pgv7xd3sTpQlAOxXIT43bVoMutBcil9ovx6M3o2cxHEhrxgmuBnUlYxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnLuMQPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnLuMQPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C38A1F00A3A;
	Mon,  3 Aug 2026 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786459;
	bh=kKgkB6NHHR2qkSbXydnnw0FxCmGnqYr8USD3dOPRWEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TnLuMQPm81otSUJ72xQHa6aJbvT6EqTZyiZeoG63GjnFStfddmETacJ18hqGFRPM1
	 PE8xzn2zfURL+fZ60ZHQR8/jxPik2TRY7TCIpRoKciWN/IDSndAZR0iuzR/mPxM5a0
	 clOZ8cCD5Om7A9e0xeA7UDyM1SDFm5TqhrdfiquANRHjHXRFf34bbeWXSsEOEMMXNL
	 NQtnTkB1wORJ3WoqSeb0bfQNEb0ZJqAxhwEs3vv19LhPdnxNBewYygSzTlE7904BLU
	 igs/OX5Nbm799xmEralkoqHzwcmHa5/Q/xfM+9+l17vtOxn+8nZLYutRc4gqTMYtQW
	 Gy7dQfgK9z6Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] hwmon: (pmbus/core) Introduce
 pmbus_read_smbus_i2c_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803193535.2286578-2-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:47:38 +0000
Message-Id: <20260803194739.5C38A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The hwmon device is exposed to userspace before the driver probe i=
s fully complete, causing a race condition on I2C page state.
--

--- Patch [1]: [PATCH 1/5] hwmon: (pmbus/core) Introduce pmbus_read_smbus_i=
2c_block_data() ---
commit 80dbae6dc3a3ada2ae6512549c713faf3d025f76
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (pmbus/core) Introduce pmbus_read_smbus_i2c_block_data()

PMBus drivers need support for reading SMBus block data. Unfortunately,
not all i2C controllers support this command.

Implement pmbus_read_smbus_i2c_block_data() which first tries to use
i2c_smbus_read_block_data(). If not supported, try to emulate it by calling
i2c_smbus_read_i2c_block_data(). Export the new function for use in PMBus
drivers.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index ba3e9e9fc8bcc..df2409c89a840 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition
during probe in pmbus_do_probe().

When devm_hwmon_device_register_with_groups() is called, the hwmon device
is exposed to userspace immediately:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_do_probe() {
    ...
	data->hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, name,
								 data, data->groups);
	if (IS_ERR(data->hwmon_dev)) {
		dev_err(dev, "Failed to register hwmon device\n");
		return PTR_ERR(data->hwmon_dev);
	}

	ret =3D pmbus_regulator_register(data);
	if (ret)
		return ret;

	ret =3D pmbus_irq_setup(client, data);
	if (ret)
		return ret;

	pmbus_init_debugfs(client, data);
    ...
}

Userspace (like udev) can immediately issue sysfs reads or writes, which ho=
ld
pmbus_lock and call pmbus_set_page().

Concurrently, the probe function continues execution and calls
pmbus_irq_setup() and pmbus_init_debugfs().

Both of these functions execute unlocked I2C operations that also call
pmbus_set_page(). Because pmbus_set_page() does not internally hold a lock,
the hardware I2C page state can become desynchronized from the software
data->currpage state.

Could this result in I2C operations being sent to the wrong page?

Since PMBus devices are often power supplies, if a sysfs write is directed =
to
the wrong page due to a race, could it change the voltage or limits on the
wrong power rail and potentially cause hardware damage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803193535.2286=
578-1-linux@roeck-us.net?part=3D1
