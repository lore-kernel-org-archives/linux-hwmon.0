Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24BF4AF159
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361212; cv=none; b=ajNlGGGx9GcIcl7N1x9xNEu3d64fGBfBPRFOhTvFnHUkTFPqG53aU8wtbzd+uG8dsc5/6ZCw+MmlavlxP5xdhoyvcWkG22t6UUQWtViXx1cUSIssW0LIvZad4xbcN63iQxFknNRckqzZOiBR+hUcH0QoE2G0z+9HOsu/ijBiDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361212; c=relaxed/simple;
	bh=OsB4UgbpwZUkMMaekG0LTD8YFYP7nMBlxBDmBd4c6v0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D9DkkM9D7kCQVqpEAYruMlQQHiDLTphkqCSvK1/2LFLd7GfKNwsbI3D5YKiD1ydcB8FLOcDtP+E+rHCzEZOOGMt6P3tqkCvTzTHgsQ3ICeiX9rzsMFup1TphA5ROAJtZskq4CkUdDDXNRdaD8fA7gRKwZvJJ/XRDFMJbX6aBHak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePKPRRkD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePKPRRkD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAC91F000FF;
	Fri, 25 Sep 2026 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790361208;
	bh=CmmL8ZZzzGYZ4e25kN+Mt8PEph/80jmirys9AfLb0T8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePKPRRkDM2hqz/wZUbsESIbIDTQ6htnZCDyMyXkCIFSr/Jp/0IWHBaF9txrWwetxx
	 hIYQvmZEQzwehF6/uwozz+4SngYGRSR+COogdjhmVG7kWumdeMBj+HXVCW7UlRWzHG
	 +dfslK+2dzP920P+dshnXMcK9h+6wdrRZPNwOmrcsvjPQFytZTuicNvFEVKtjHe4RD
	 9Rzt3oXjyBA+yuI40rEF6eNHOb2SOpGHg/moQ/sXCCKFYO4beVJyBp/gDZweA7bHxd
	 6miTXR5FGoBLeIPcYFApV4KtXWxDZoSW900gic+KNfiMQBhxxAd5eHFdcjQsHAQ2/g
	 V2kn2Qdksq4lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (sht4x) Fix jiffies wraparound in
 heater-ready check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tom Verdonck" <tom.verdonck@inspiral.be>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
 <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 18:33:27 +0000
Message-Id: <20260925183328.3BAC91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: (sht4x): torn read of heating_complete in heater_enable_s=
how()
--

commit 90157fd25e4d294f6299c304227e07d23632d8e9
Author: Tom Verdonck <tom.verdonck@inspiral.be>

hwmon: (sht4x) Fix jiffies wraparound in heater-ready check

This commit changes the heating_complete field to a 64-bit jiffies
value to prevent wraparound issues after ~248.5 days on 32-bit systems.
It updates usages of this field to use get_jiffies_64() and
time_before64().

> diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
> index a97dda9e92dc5..da2b6130fca7e 100644
> --- a/drivers/hwmon/sht4x.c
> +++ b/drivers/hwmon/sht4x.c
[ ... ]
> @@ -237,7 +237,7 @@ static ssize_t heater_enable_show(struct device *dev,
>  {
>  	struct sht4x_data *data =3D dev_get_drvdata(dev);
> =20
> -	return sysfs_emit(buf, "%u\n", time_before(jiffies, data->heating_compl=
ete));
> +	return sysfs_emit(buf, "%u\n", time_before64(get_jiffies_64(), data->he=
ating_complete));
[Severity: Medium]
Since heating_complete is now a 64-bit field, does this read in
heater_enable_show() need to be protected by hwmon_lock?

If a user-space read to the heater_enable sysfs attribute runs concurrently
with a write via heater_enable_store(), it would race with the update to
data->heating_complete which is done under the lock.

Could this result in a torn read of data->heating_complete on 32-bit
architectures, causing an incorrect boolean value to be emitted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790358356.gi=
t.tom.verdonck@inspiral.be?part=3D3
