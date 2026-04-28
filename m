Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE203750CC
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414147; cv=none; b=DUPBiVCDqBBcpvrMCoDNc5o1oRpbqcG6OBXvqcV+PA5HDR7r0iGBocnYybynBefPsVcB/4I1193P8f1ACq/Kw9fWBYHew3ZABDwiMQzJb9snWTwlaJ9x6IyS1/tfiwFG1x9zBBnDSS8tv2woe+FSBbI4Ufrhb61eF5aYKgNgTZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414147; c=relaxed/simple;
	bh=HbpTy1RwC7P5OPtcPJjE7uhxwyUT7qQw7bIlV/gFrAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MgRkuDxUrhrh4mYEM3arUbB+AjN1xQG0CsrE/7NmnIoEfswDQljZfnNuPXU1oZZ83i3PvOzm7GzRq5Gh5bjwB58oKj2mHaGYBwTYcs0p5KeM64a32feJZV8cuV0cSdNVk3N4R6rWIV8W5+jt4XdgKZa5JwtNq1H9NHgsqJFlpGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6frgd/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6frgd/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A40C2BCAF;
	Tue, 28 Apr 2026 22:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777414146;
	bh=HbpTy1RwC7P5OPtcPJjE7uhxwyUT7qQw7bIlV/gFrAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A6frgd/GNg9VXjiFobBySVbadRnCLzcWG+BeNAbH3JrH8TpuS31nnKNFSkpOKwl/r
	 SH+qQNsT2l9eToXuJDd3AZQ942dspFaE9r63zm0dRUCCB6FRCMIxZXdHmK8dtlipjY
	 3tOaZp9z43g6ckQn3MCBdJiPZUPlNlVvvSZ2qknmQ664HBezzcwMkCiA63thQUPhX8
	 dRvJID1dpYiOXuW4q7poOkzCMQwPXVgvWVLc7cFMOaMajf7Tb6H37aNmdEPgFbF501
	 2NH7m/uQv9sIFBBXAOwUDVcWTad5incbqZAV0drvZzZnU6yC2oRnMn2+dZeeBopiwN
	 xijPzEoWVBodg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] hwmon: (sht3x) Add devicetree support
Reply-To: sashiko@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <1777374569-59233-4-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-4-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Apr 2026 22:09:05 +0000
Message-Id: <20260428220906.73A40C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using enum value 0 as OF match data combined with missing I2C ID t=
able entries causes incorrect device identification and brittle fallback lo=
gic.
--

commit e029bdd9863615efb54ed7864138224170daf0d1
Author: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

hwmon: (sht3x) Add devicetree support

Add of_match_table to support devicetree based instantiation.
Specific match data is used to distinguish between temperature/humidity
(SHT) and temperature-only (STS) sensors.

> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 08306ccb6d0b..6437568aaf73 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -939,8 +939,25 @@ static const struct i2c_device_id sht3x_ids[] =3D {
> =20
>  MODULE_DEVICE_TABLE(i2c, sht3x_ids);
> =20
> +static const struct of_device_id sht3x_of_match[] =3D {
> +	{ .compatible =3D "sensirion,sht30", .data =3D (void *)(uintptr_t)sht3x=
 },
> +	{ .compatible =3D "sensirion,sht31", .data =3D (void *)(uintptr_t)sht3x=
 },
> +	{ .compatible =3D "sensirion,sht35", .data =3D (void *)(uintptr_t)sht3x=
 },
> +	{ .compatible =3D "sensirion,sht85", .data =3D (void *)(uintptr_t)sht3x=
 },
> +	{ .compatible =3D "sensirion,sts30", .data =3D (void *)(uintptr_t)sts3x=
 },
> +	{ .compatible =3D "sensirion,sts31", .data =3D (void *)(uintptr_t)sts3x=
 },
> +	{ .compatible =3D "sensirion,sts32", .data =3D (void *)(uintptr_t)sts3x=
 },
> +	{ .compatible =3D "sensirion,sts35", .data =3D (void *)(uintptr_t)sts3x=
 },
> +	{ }
> +};

Since sht3x is the first element of enum sht3x_chips and evaluates to 0, do=
es
setting .data to (void *)(uintptr_t)sht3x essentially set it to NULL?

When instantiated via device tree, does device_get_match_data() return NULL
for these entries, causing i2c_get_match_data() to incorrectly fall back to
i2c_match_id()?

If instantiated manually via sysfs without a device tree node,
device_get_match_data() also returns NULL. If i2c_get_match_data() then fal=
ls
back to i2c_match_id(), does it fail to match the STS devices because they
are missing from sht3x_ids, causing it to return NULL?

When sht3x_probe() casts this NULL back to 0, does it incorrectly identify =
an
STS sensor as an SHT sensor, exposing non-functional humidity attributes?

Would it help to offset the chip enum values so they avoid 0, and to
explicitly add the newly added string variants to the I2C id_table?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1777374569-59233-1-=
git-send-email-zaixiang.xu.dev@gmail.com?part=3D3
