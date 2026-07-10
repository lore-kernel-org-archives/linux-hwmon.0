Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA56408624
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687647; cv=none; b=shfF1Go/37xR48JVF453oRDisfT0JBDbQPFoR6aO1I60Bamxo1TLOQp3Mox1/E8bEJyg6S8rxBokyX7cT6dctuqH/5G7S23UNeVgZ8pPA95Znm/XnitmecGUXrSQqm5X4SVe6PARkFlkzXr1tWWvUo/MP9RJ1spjvZ5OxO2qZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687647; c=relaxed/simple;
	bh=pfmT3S4PVUdsRtpKGD8KdBQnBMPJVkZraQe0+FBgsmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cwPrU7+HEwKVsOvDuDGhegQ7gLhhGkuHtSD+NpWA5zhuWVMdytl0qxDJqQnKrtzWrAsN43yosDdXTmWwAI1oTV9FeiJSxJtEUV9RQajeSMM6PG8vVB14WVNHKl8VgVMZA8AqxWCwBjQ8wzW/Hjh6yZ2oYZG6JCT3CsiMu0YBSHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F51hu7us; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F51hu7us"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365CD1F000E9;
	Fri, 10 Jul 2026 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783687646;
	bh=US6G6SYsQdgM7o4KKwROF+Rd6q5PshmGSwwTjbh8lwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F51hu7us3LjIka4t2+3lO5StYPJyT5yT2XLgErbndws7kR95KVda51RGDkMKyeFwI
	 EDqpH/d6exXZxzCQoAGPg9Q83Oe6UO3Sdblz1gn6CHzJwDTDG4Yt9qB8uHq6EWkfml
	 K7dGt8kVjfXhXZmHb3q43tbP4k9s1YUdsazxCTMu0MMRSPvFlm2YsgapFSEC7BfKOG
	 ktyTGMskWxPRvGY1rp9ZI6ko1IOf4Jsqc9OlnhBg23d+NU7c7+0ELiy+8PL1S6L7pQ
	 2BMZ//THlL+wI31rKwwG7lDqLFII4OrEro6xXOIi59+LO1SCWvAPVcTmYxoy9Y1MhD
	 35kpnCHgUTqPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710123236.10508-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260710123236.10508-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 12:47:25 +0000
Message-Id: <20260710124726.365CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double-checked locking on `cache->valid` in `applesmc_get_entry_by=
_index()` lacks memory barriers, leading to a TOCTOU data race.
--

--- Patch [1]: [PATCH 1/1] hwmon: (applesmc) Convert to hwmon_device_regist=
er_with_info ---
commit 28324860025f1b3d6c23bec77f8d59b368d416c8
Author: Shih-Yuan Lee <fourdollars@debian.org>

hwmon: (applesmc) Convert to hwmon_device_register_with_info
   =20
This commit converts the applesmc driver to use the modern
hwmon_device_register_with_info API to resolve a deprecation warning.
It dynamically creates sysfs attributes and implements a visibility callback
returning 0 to hide a required minimal temperature channel, ensuring backwa=
rds
compatibility.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 90a14a7f2c4c0..2b10bef24d8d6 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c

[ ... ]

> @@ -1363,7 +1383,8 @@ static int __init applesmc_init(void)
>  	if (ret)
>  		goto out_light_sysfs;
> =20
> -	hwmon_dev =3D hwmon_device_register(&pdev->dev);
> +	hwmon_dev =3D hwmon_device_register_with_info(&pdev->dev, "applesmc", N=
ULL,
> +						    &applesmc_chip_info, NULL);
>  	if (IS_ERR(hwmon_dev)) {
>  		ret =3D PTR_ERR(hwmon_dev);
>  		goto out_light_ledclass;

[Severity: High]
This is a pre-existing issue, but I noticed a potential data race in
applesmc_get_entry_by_index() while reviewing this driver.

Can a reader thread observe cache->valid as true before the compiler has
fully committed the cache entry contents to memory?

drivers/hwmon/applesmc.c:applesmc_get_entry_by_index() {
	...
	if (cache->valid)
		return cache;

	mutex_lock(&smcreg.mutex);
	...
	memcpy(cache->key, key, 4);
	cache->len =3D info[0];
	memcpy(cache->type, &info[1], 4);
	cache->flags =3D info[5];
	cache->valid =3D true;
	...
}

Because this lockless read and write of cache->valid lacks memory barriers
like smp_load_acquire() and smp_store_release(), is it possible for a
reader querying sysfs attributes to act on uninitialized data, potentially
sending invalid keys to the Apple SMC hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710123236.1050=
8-2-fourdollars@debian.org?part=3D1
