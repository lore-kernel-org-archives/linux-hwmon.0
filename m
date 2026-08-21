Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019644C66C;
	Fri, 21 Aug 2026 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304599; cv=none; b=Hg2tma4wDni2xkdVoZEOdi6CzaLwbahtuCK4qHxmFj+MSzulkyzp8Kg0reV14IPdYZyD/zpezqDvej6IlxOQQ4jF3KvDB6jilung5RoIH4Qb2NfpUWHrEZ3r9/HcIsvkzwh8qFRqgdtAft936t3q+XLqXMKJOfyH7sxPTOCHNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304599; c=relaxed/simple;
	bh=3GEY+wenFAYW3xgfA92zFSmBS14gORvcX9UMqsG1Zh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nJY3ORSdX9yccGZHVnkG+rMcRzFYsWOi9XRmR+ngPVrgpF8/v8fA0+2x1Mkw0+rLRK/XkV/PvML7oZoyZP/WT5jgWilqLgfIvKQaywOSeStaoTa6+73cAmfzg2VzO8ooMSFUqWmxn6lwhWko0Qr22DUH9wWa+95cKMeWHzBrt3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3qQhA5U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3qQhA5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1511F000E9;
	Fri, 21 Aug 2026 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787304588;
	bh=GDato5UJMlqV6pekRDM2rry3PV0Hd7Xdxyz7lHSwjms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q3qQhA5UsbptCgJYstoS13JNMKMCqvAk4LMRwdL4K6uNELZ5ca5uQUwLRvxgzX1lG
	 6T9J9jHw1PlxQOfMlJtMG5Ne9JY2PQqgFH6l/x1UAqQqIsfL6t8/bEmWB8c+g/frWR
	 p+d/3Oed68+0axfgvkj7Wd9cLxXRGNWzGPniy7vssetwJRlUIQyWTBF16q62LW7OIk
	 rgA81tto6IQ3YV8Nr3CsRQzsvXte0Z5pLwDET2ski82nJJhDCpw31FATLNZ8ox0hpI
	 h+NyCrGncjiYLKPOW8E2ad6gTis3FYUeQ3NIHnnLvlBbH7CqL8eUmnUbi0aG27Ci9W
	 sYEnB2IwU4plQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (sht4x): Add support for Sensirion STS4x
 temperature sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821091924.18975-3-alessandro.zini@siemens.com>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
 <20260821091924.18975-3-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:29:47 +0000
Message-Id: <20260821092947.CB1511F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sysfs heater attributes registered via extra_groups lack required =
hwmon locking, causing data races and I2C command interleaving.
- [High] `heater_enable_store` incorrectly returns 0 on success, triggering=
 user-space write loops and false `-EBUSY` errors.
--

--- Patch [2]: [PATCH v2 2/2] hwmon: (sht4x): Add support for Sensirion STS=
4x temperature sensors ---
commit 19dd0dd408d1f2465639b63b05819b57f722bbcb
Author: Alessandro Zini <alessandro.zini@siemens.com>

hwmon: (sht4x): Add support for Sensirion STS4x temperature sensors

The Sensirion STS4x series is the temperature-only variant of the SHT4x
family. It shares the same I2C command set, conversion formulas, CRC
checksum, and timing with the SHT4x, but only returns temperature data.
Add support for the STS4x series by dynamically adjusting the read
response length and suppressing humidity and heater sysfs attributes.

Link: https://sensirion.com/resource/datasheet/sts4x

> diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
> index 9cace0e8acdab..daca24cfbcd52 100644
> --- a/drivers/hwmon/sht4x.c
> +++ b/drivers/hwmon/sht4x.c
[ ... ]
> @@ -418,19 +444,21 @@ static int sht4x_probe(struct i2c_client *client)
>  							 client->name,
>  							 data,
>  							 &sht4x_chip_info,
> -							 sht4x_groups);
> +							 groups);
> =20
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }

[Severity: High]
This is a pre-existing issue, but registering heater attributes via
extra_groups here escapes the hwmon core serialization.

Are the heater sysfs callbacks (heater_enable_store, heater_power_store,
and heater_time_store) exposed to data races without the hwmon lock?

If a user-space process reads hwmon data while another process enables
the heater, heater_enable_store() executes without holding
hwmon_lock(dev). This can interleave I2C commands and mutate shared
state (data->heating_complete and data->data_pending) concurrently
with sht4x_read_values(), leading to corrupted I2C sequences.

[Severity: High]
This is also a pre-existing issue, but could the return value in
heater_enable_store() cause an unexpected write failure in user-space?

When the heater is successfully enabled, the function returns 0
instead of count:

drivers/hwmon/sht4x.c:heater_enable_store() {
    ...
    data->heating_complete =3D jiffies + msecs_to_jiffies(heating_time_boun=
d);
    data->data_pending =3D true;
    return 0;
}

Returning 0 signals to VFS that no bytes were processed. Standard
user-space tools will retry the write with the remaining bytes. On the
retry, time_before(jiffies, data->heating_complete) evaluates to true,
and the function immediately fails with -EBUSY.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821091924.1897=
5-1-alessandro.zini@siemens.com?part=3D2
