Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4155538A72B
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 05:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339017; cv=none; b=iAwnFXKfv6Yv2bVt8pfs8lId4PmILh5DN8YMpPa3Ygg4Ba9pP2+E+VnG1ecFlzBJYT+W6pQtYlWPuWFmGqnaJDCzaTniio8+Wsn1eIlg409ctIIv2kfmT4LXikJK30/Y5CNZ8XoSBE95OWvXj2CBrK4hAqUAE3vrlht3H2EfhG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339017; c=relaxed/simple;
	bh=e6NoT6bVAlOoC//R2t5HdM6ulRAF/dS2Lh7AnI81Gag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gH3z1Bwgd4bhMfJoLkdIy/6ZpZEyl9/EiARo3w92EviIpxrKgcRrAl3kAGOc3PAD9sOy/lP6JCmfiABTNFxwOziM0Ex+Rc5zfPQltvwq9fnDRuKA5a3yVvVUvifGR3D/NErI5KTccSpeg7hFtZqDLcJgzQo0pMhEeAmMXjjbLmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQHiLB45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQHiLB45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BB81F00A3A;
	Mon, 10 Aug 2026 05:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786339016;
	bh=vTeZrXnnLLlTEs3hPOcAzUydTs97aylizhBFUG0ElJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQHiLB45nuz8SNxLhG+h5ssmFKuZAFT6UMF1URfAoP4tsNXtwK68zJUc3SNEpINnp
	 MqH8fMfYO0aJhRsvBLGL9eMOXcEdz4DBq/gM5aU+TZv9pT4b0FAJCB6eb/dzJNqm7+
	 l51uvHaKvqyyqw4sk25sb0CQXTMKC95gn8Z3NN0Nn2IeyTrcJmc/mZky+WxqPksmcL
	 w0PdhQpcVE7jUimCgXjlIm+VAMuInAbXW1klE+IOTiYje4Wrt6a/t/xL5fPqH4Ps7Y
	 lPMHA0nY7RBUVTTeVGhW9z6EtaRELX6kskxATYw1IDZ29SnmXpgfgPEdCL8BC21LiW
	 o+i9qfOWMpOrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (max6621) fix negative temperature offset
 and crit readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <ad0baddbd6163cf73545c8e9273258136718585c.1786334038.git.congnt264@gmail.com>
References: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
 <ad0baddbd6163cf73545c8e9273258136718585c.1786334038.git.congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 05:16:55 +0000
Message-Id: <20260810051655.C2BB81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] The `hwmon_temp_crit_alarm` read path ignores the `channel` para=
meter and unconditionally clears global alerts, causing alarms to be misatt=
ributed and lost.
--

--- Patch [2]: [PATCH v2 2/2] hwmon: (max6621) fix negative temperature off=
set and crit readings ---
commit 0116e27b3257c1efaee364113dfc90d35d8fb869
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (max6621) fix negative temperature offset and crit readings

This commit fixes a bug where negative temperature offsets and critical ale=
rts
were read back as large positive numbers due to missing sign extension. By
casting the register value to s16 before scaling, the read path now preserv=
es
the sign encoded during writes.

> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> index 16a3a61d25326..1a644d7871431 100644
> --- a/drivers/hwmon/max6621.c
> +++ b/drivers/hwmon/max6621.c

[ ... ]

> @@ -254,7 +254,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_ty=
pes type, u32 attr,
>  			if (ret)
>  				return ret;
> =20
> -			*val =3D regval * 1000L;
> +			*val =3D (s16)regval * 1000L;
> =20
>  			break;
>  		case hwmon_temp_crit_alarm:
>  			/*
>  			 * Set val to zero to recover the case, when reading
>  			 * MAX6621_TEMP_ALERT_CAUSE_REG results in for example
>  			 * MAX6621_ALERT_DIS. Reading will return with error,
>  			 * but in such case alarm should be returned as 0.
>  			 */
>  			*val =3D 0;
>  			ret =3D regmap_read(data->regmap,
>  					  MAX6621_TEMP_ALERT_CAUSE_REG,
>  					  &regval);

[ ... ]

>  			if (regval) {
>  				ret =3D i2c_smbus_write_byte(data->client,
>  						MAX6621_CLEAR_ALERT_REG);
>  				if (ret)
>  					return ret;
>  			}
>=20
>  			*val =3D !!regval;
>=20
>  			break;

[Severity: Medium]
This is a pre-existing issue, but does this hwmon_temp_crit_alarm read path
in max6621_read() ignore the channel parameter?

When userspace reads the tempX_crit_alarm sysfs attribute for any channel,
this code reads the global MAX6621_TEMP_ALERT_CAUSE_REG and unconditionally
clears it via MAX6621_CLEAR_ALERT_REG if an alert is active.

Could this result in misattributed alarms where a read on one channel
incorrectly reports an alarm belonging to a different channel, and causes
subsequent reads on other channels to miss their alarms because the global
alert state was already cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/9d3a4f1895a47794bb3=
59a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com?part=3D2
