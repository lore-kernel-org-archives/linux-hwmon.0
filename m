Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A092367B68;
	Fri, 19 Jun 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865948; cv=none; b=HNwM1S2en1HbSZC+Sv5wMPTjQ2yc2Bnlrl2on0c1EL2e3MxXlBKWSlcoJbqQfXcd41nUCnHjdA5NrWQsgfkqioe25+hA0AHXrP3VUUVz2lc9ODbgchOyuaxS52O2kXBW/ZkNZqULOfulfysvk/iplpXbAGGIoYjIwySXsCoy9y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865948; c=relaxed/simple;
	bh=KdXzDjTLpnxpVkWE9x9D8pJ8MayklCRx7qHaq5NphXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NX01EvNIpRVpBwMjjysqsXQfkDiz3mlqbLyXcKeUbf/T9eVfTWjOSNupvZqeTxtk+5JGKd669Dfs9dmZybZJrABfxO3Xja0mTFwhGctOsSF9/Bdhu5sLG68r/u6JXpUOs54be4cCnlBFQ/XFS27Re650/ShCrdGlUCtErYfINIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMyXRNqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMyXRNqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEA01F000E9;
	Fri, 19 Jun 2026 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781865947;
	bh=kFLxJHuZIkL7mP0MqmEZEpKAP6QIPqaToZrJqKHDVT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMyXRNqGjYGZ5BgpP50bbelM+ISXbu17Y7kOdO84NXjJyFhLmp0x1SGrZvpFISrG5
	 hEXPlSoC2h6QtXYXknX9diG23K085XXwhEuW5/EsC3/of4DcakVhc8UQNtkuZHI7RB
	 4yDYYU1GAR10WLfjX/QdJOqa9T/yxK2CkVA2Ov9pp/DHNx2JRhPCrTG6BMBpLLsaw5
	 JE6HSZ0OO9CoOvgphQ7BoEhCGBiXMxoESReRod4bHM76MNi/rMNgzx244xObMa382D
	 8ncneewXIxn0iltpkmmosnk2fG9m0arwvcpvoqxCep+/zvtENtYuhXJ8Xe6j7NofAu
	 4uyznLfDmfStQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (emc1403) Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260619103153.216444-3-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:45:46 +0000
Message-Id: <20260619104546.CDEA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Ambiguous OF match data value (0) prevents error handling for un=
supported devices.
--

commit 7ef40c1ea161b005037b0b33a8e16b1f9bf6d41a
Author: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>

hwmon: (emc1403) Convert to use OF bindings

This commit adds an OF match compatible table to the emc1403 driver
to enable device tree support.

> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
[ ... ]
> @@ -659,14 +660,14 @@ static int emc1403_probe(struct i2c_client *client)
[ ... ]
> -	data->chip =3D id->driver_data;
> +	data->chip =3D (uintptr_t)i2c_get_match_data(client);
> +

[Severity: Medium]
Will this cast silently hide error conditions?

If an unsupported device is manually bound via sysfs, i2c_get_match_data()
will return NULL (no match found). Since emc1402 evaluates to 0 in the
emc1403_chip enum, casting NULL to uintptr_t assigns 0 to data->chip. This
causes the driver to proceed as if an emc1402 device was found, rather than
safely aborting and returning -ENODEV.

[ ... ]
> @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[] =
=3D {
[ ... ]
> +static const struct of_device_id emc1403_of_match[] =3D {
> +	{ .compatible =3D "smsc,emc1402", .data =3D (void *)emc1402 },
> +	{ .compatible =3D "smsc,emc1403", .data =3D (void *)emc1403 },

[Severity: Medium]
Does assigning 0 as the match data here cause ambiguity during device match=
ing?

Because emc1402 is 0, when device_get_match_data() matches "smsc,emc1402",
it returns NULL. This forces i2c_get_match_data() to fall back to
i2c_match_id().

While this happens to succeed for valid DT nodes because the I2C core strips
the vendor prefix (allowing the id_table to match), it removes the ability
to distinguish between a successful emc1402 match and an error where no
match was found at all.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619103153.2164=
44-1-clamor95@gmail.com?part=3D2
