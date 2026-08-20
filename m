Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8988537E5D8;
	Thu, 20 Aug 2026 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238543; cv=none; b=nPlK4JMw3NQGMR/VF7iEOVFKj/2uut7e/uukbrJ8x7ZlqzKLo6ELLLNOOXJN50nvm2kL+NDNfrbPoYgPusV5emJRUllyn4St0WQLw+4rqE+fyCm6uhvwrurN7CVCivTO6Xlm9c2wVaVLclccvzanOnHWaIcXI3bH9cUIryQepGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238543; c=relaxed/simple;
	bh=pH+k6Xb9qAvw2HGzthuPZSd2DwJgROtNE/yZ7tFUch4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KhpGJ70yMmR2bAYYyKKbTA3y20gfgsr03IYloCKKK6g3/GQ4COn4z2Kq3ErTGFaufD3q1Vmr5H7NY91V3/MyaaoWojyfJkPGFikjUkxpzfmyEW09phMz5UyjZ2S83iX2F6D+C0CADysv/+etmx21cYdpIp27r+yg2SlbV0NxFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHflIBAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHflIBAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0541F00A3D;
	Thu, 20 Aug 2026 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787238540;
	bh=4CYo8Ra7ycydfrviCp/okTFu6Fn423lyadS+DsiXfC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHflIBAlbQFKtLwl64yy8gL1byptxD3nMGMgrvasGSDtYJrC7NSUOzUWKdwemRZkx
	 XKwpF1pWVqXCiV5OKv07kMfeK+izWeNVh78mQA8gcXhVLr8vGXZZpD4PotOwf+R7UE
	 qt4VUdEH03ScBOhlaMGK9shRP+ywIdDlgf9OhsKyK4zSYBHc+pT1fCRST/FSn7Q8CJ
	 BiqW62hIdIqiR23XOityPESvcdyTXLE0eGVRAhhwT+bt1XYUwpig96emeJRNMshdfi
	 Wruzd4LzOgyWwxuh7g7d6XydKd2dXZyapw8KbhAIni4CjKuofprLUqmKIc/GeC2i35
	 mxztPA2lG5Evg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (sht4x): Add support for Sensirion STS4x
 temperature sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260820145946.35468-3-alessandro.zini@siemens.com>
References: <20260820145946.35468-1-alessandro.zini@siemens.com>
 <20260820145946.35468-3-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 15:08:59 +0000
Message-Id: <20260820150859.CD0541F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Uninitialized `heating_complete` timestamp causes sensor reads to =
block for up to 5 minutes on boot.

Pre-existing issues:
- [High] Lack of driver-level locking between hwmon core attributes and cus=
tom heater attributes leads to I2C race conditions and data corruption.
- [High] `heater_enable_store` incorrectly returns 0 on success, breaking s=
tandard userspace write operations.
- [High] Unit mismatch when evaluating timeout with `data->update_interval`=
 leads to HZ-dependent I2C errors.
--

--- Patch [2]: [PATCH 2/2] hwmon: (sht4x): Add support for Sensirion STS4x =
temperature sensors ---
commit ab4b49384ea571fb866537cfb0dea5a4f4296ef8
Author: Alessandro Zini <alessandro.zini@siemens.com>

hwmon: (sht4x): Add support for Sensirion STS4x temperature sensors

The Sensirion STS4x series is the temperature-only variant of the
SHT4x family. Add support for the STS4x series by dynamically adjusting
the read response length, suppressing humidity channel attributes when prob=
ed
as STS4x, and omitting heater sysfs attributes.

Link: https://sensirion.com/resource/datasheet/sts4x

> diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
> index 9cace0e8acdab..d2b0d79bb7fe0 100644
> --- a/drivers/hwmon/sht4x.c
> +++ b/drivers/hwmon/sht4x.c
[ ... ]
> @@ -400,11 +420,15 @@ static int sht4x_probe(struct i2c_client *client)
>  	if (!data)
>  		return -ENOMEM;
> =20
> +	data->chip_id =3D (uintptr_t)i2c_get_match_data(client);
>  	data->update_interval =3D SHT4X_MIN_POLL_INTERVAL;
>  	data->client =3D client;
> -	data->heater_power =3D 200;
> -	data->heater_time =3D 1000;
> -	data->heating_complete =3D jiffies;
> +	if (data->chip_id !=3D sts4x) {
> +		data->heater_power =3D 200;
> +		data->heater_time =3D 1000;
> +		data->heating_complete =3D jiffies;
> +		groups =3D sht4x_groups;
> +	}

[Severity: High]
Since data->heating_complete is bypassed for the sts4x chip, it defaults to=
 0.

In sht4x_read_values(), the code unconditionally checks this:

	curr_jiffies =3D jiffies;
	if (time_before(curr_jiffies, data->heating_complete))
		msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));

Since jiffies is typically initialized to a large negative number at boot, =
it
evaluates as logically "before" 0.

Will this cause any userspace read of the temperature within the first 5
minutes of system uptime to hang while msleep waits for 0 - curr_jiffies?

[ ... ]

While reviewing this patch, I noticed a few pre-existing issues in the driv=
er:

[Severity: High]
This isn't a bug introduced by this patch, but it looks like the driver lac=
ks
a local mutex to protect I2C transfers.

The hwmon subsystem core only serializes sysfs operations for attributes
registered via the info parameter.

Custom attributes registered via extra_groups (like heater_enable) are not
protected by the hwmon core lock.

If a user writes to heater_enable, it triggers i2c_master_send():

drivers/hwmon/sht4x.c:heater_enable_store() {
	...
	ret =3D i2c_master_send(data->client, &cmd, SHT4X_CMD_LEN);
	if (ret < 0)
		return ret;

	data->heating_complete =3D jiffies + msecs_to_jiffies(heating_time_bound);
	data->data_pending =3D true;
	...
}

Can this run concurrently with sht4x_read_values() doing its multi-step
I2C transfers?

drivers/hwmon/sht4x.c:sht4x_read_values() {
	...
		ret =3D i2c_master_send(client, cmd, SHT4X_CMD_LEN);
		if (ret < 0)
			return ret;

		usleep_range(SHT4X_MEAS_DELAY_HPM, SHT4X_MEAS_DELAY_HPM + SHT4X_DELAY_EXT=
RA);
	}

	ret =3D i2c_master_recv(client, raw_data, response_length);
	...
}

If so, could this interleave and corrupt the I2C state machine or cause
measurement aborts?

[Severity: High]
This isn't a bug introduced by this patch, but heater_enable_store() returns
0 on success instead of the number of bytes processed (count):

drivers/hwmon/sht4x.c:heater_enable_store() {
	...
	data->heating_complete =3D jiffies + msecs_to_jiffies(heating_time_bound);
	data->data_pending =3D true;
	return 0;
}

Since standard userspace tools interpret a 0 return from write() as no bytes
consumed, will they loop to retry the write, which will immediately fail wi=
th
-EBUSY because data->heating_complete is now in the future?

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a unit
mismatch when calculating timeouts.

In sht4x_read_values(), data->update_interval (which stores milliseconds)
is added directly to data->heating_complete (which is in jiffies):

drivers/hwmon/sht4x.c:sht4x_read_values() {
	...
	if (data->data_pending &&
	    time_before(jiffies, data->heating_complete + data->update_interval)) {
		data->data_pending =3D false;
	...
}

On systems with HZ=3D100, could adding 2000 (the default update_interval)
evaluate to 20 seconds instead of 2 seconds, causing the driver to skip
sending the measurement command and jump straight to i2c_master_recv(),
resulting in I2C NACKs?

Should this be converted using msecs_to_jiffies()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820145946.3546=
8-1-alessandro.zini@siemens.com?part=3D2
