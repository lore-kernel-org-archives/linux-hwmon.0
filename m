Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95673FFD
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162269; cv=none; b=UJHmPCJX2w2vMki8apbBImq4NjrDPsCWtMWau9oheDKZF7Ap47A7LhQxVi4q1EMlxnNuI1eqdiyOof+klCDJDdSW5GyFu7MgoiDaOdXFiwDMm3wJ5JTTeMyvQnxeSzvrwjX/9q4jlb0T4Yvm7k7KsCmZDmXl6M56/4i+ec7MF6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162269; c=relaxed/simple;
	bh=qpi2VKf1CCGZP0u16IIp7JeMzvjLO+r/ToNRXwQwfvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jGsrrxl5jpJww7BAhpUs6Zyd0QOZDhQNDyDgpRs+7NEpDpT1qgjSn8UM6p4mb21R8NBpzoP7dK/GQXMkqHAbpbjzazvurngEiwL9FnuarxUE2V/MPuomY2QR6xj48G0LrFUXJJ8aTE/sY2UASO6zYcm4xfXewscm+vrDH73cBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rx0HNieL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rx0HNieL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2B31F000E9;
	Thu, 16 Jul 2026 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784162268;
	bh=eSkKMsVE/ZcYmmFnR5pFl0Brqq9VIIXoDZvefAmGokY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rx0HNieLP5s/y1JizgJLQHHWMVnVVd8fLr3XUjKuj49g/MjVa8cC/+0Ju2VvJj+ay
	 RTibPqWg8HjjdrulmS/H3h0M2q67sBVI4i4YZuX158ESxzd9m/M6uZkIbG0kOEYSRk
	 7umRI0NkGfjJE7dwof6MJIcSIhAPWRSKrUSfER90UsEYmRXqGZzR5fmyptmUMenHBH
	 s8TquVYiIzNutbHXYrxqyrzosZvBe3G5bTmSZEw7NxF3auNY9oqCsIFCvagOKBHI62
	 LY5td7Pdn/nLWpYAEz2kpVLrWjaDojIVjrUF2S+41ZCG2ZEdDDgC839WkBlz5F1KWn
	 CU2pUwKa5+ASQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: emc1812: reject channel index 0 in device tree
 config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivy Lopez" <skunkolee@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260716002543.26711-1-skunkolee@gmail.com>
References: <20260716002543.26711-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 00:37:47 +0000
Message-Id: <20260716003748.0A2B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Rejecting channel index 0 (`reg =3D 0`) breaks Devicetree ABI =
backward compatibility and prevents probing of valid, existing device trees.
- [Low] When reading the `reg` property fails, the error message logs an un=
read, stale `reg_nr` value, misdirecting debugging efforts.
--

--- Patch [1]: [PATCH] hwmon: emc1812: reject channel index 0 in device tre=
e config ---
commit f33e5fdce14729c5f30dbfaad69487c1d7f783de
Author: Ivy Lopez <skunkolee@gmail.com>

hwmon: emc1812: reject channel index 0 in device tree config

This commit explicitly rejects channel index 0 in child nodes to prevent
the internal diode label from being overwritten. It also updates the error
message to include the invalid index.

> diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
> --- a/drivers/hwmon/emc1812.c
> +++ b/drivers/hwmon/emc1812.c
> @@ -809,9 +809,10 @@ static int emc1812_parse_fw_config(struct emc1812_da=
ta *data, struct device *dev
> =20
>  	device_for_each_child_node_scoped(dev, child) {
>  		ret =3D fwnode_property_read_u32(child, "reg", &reg_nr);
> -		if (ret || reg_nr >=3D data->chip->phys_channels)
> +		if (ret || reg_nr =3D=3D 0 || reg_nr >=3D data->chip->phys_channels)

[Severity: Critical]
Does adding reg_nr =3D=3D 0 break Devicetree ABI backward compatibility?

If there are existing device trees that specify a child node for the intern=
al
sensor (channel@0), emc1812_parse_fw_config() will now return -EINVAL during
probe and fail to load the driver.

>  			return dev_err_probe(dev, -EINVAL,
> -					     "The index is higher then the chip supports\n");
> +					"Invalid channel index %u\n",
> +					reg_nr);

[Severity: Low]
If fwnode_property_read_u32() fails and returns a non-zero error code=20
(ret !=3D 0), is it safe to print reg_nr?

If the child node is missing the reg property, fwnode_property_read_u32()=20
leaves reg_nr unmodified. The error message would then log a stale reg_nr=20
value from the previous iteration of the loop, which might misdirect=20
debugging efforts.

>  		/* Mark channel as active */
>  		set_bit(reg_nr, &data->active_ch_mask);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716002543.2671=
1-1-skunkolee@gmail.com?part=3D1
