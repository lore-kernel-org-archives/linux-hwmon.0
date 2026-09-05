Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E92744F
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615853; cv=none; b=fm3ozTuB7mBb1WhRg7GDMSyLoDfJxtI6LxoZk5sLmw5TN/wrXdJP1DQ9Gj3qikkeTn8yJs/9d5SJgmTHjhor7vU7DihNe7SHrlruCu/3DFZ8LJivHhYyqusAvJmIp4rRcR9gp5qN2TZuPaW+DN9OxhGakQpN0+TNxlmffbykWOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615853; c=relaxed/simple;
	bh=IawtjIhnUn8r8b0gZe0MQldWaEQVlX/jPI5tslyMpRs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jEOBwOtyXrvpP0kuwM8GkMOvevlVR+/jVYJO2jd9pF44Wx1jjl57juD7nS9AUDzMJh/abeCx8ZEqczd/PgKHbArlSxkEfao+aUB6i+PJ/mN87WaaifdQoEXHREOc7JJFsxbs7tAyhSUiyDVf13vRRPVuwHBR9CRaCd/mJ1ZWWyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqehuWnn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqehuWnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164601F00A3D;
	Sat,  5 Sep 2026 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788615852;
	bh=XIKOtlvy2sDzje+GzBUZnR/a7Rjl/13p0yankYQhZg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqehuWnnvveABVXJCeMROq7DIj+W+Y1oHqkQw/KLdKyDFY9QWFaL01whw9Xg23GJR
	 Q7KJtUuyfawnIsz2D4aik//2nnSR7prP/ZFu0jhCEf7M9a0uYIJYlJ7qsaZzBuZJeg
	 1hveg4/ExClNexngAO991jjpo4+cwg4OwPmD07FUBE/jmagLC5kvSywpTrk++m2gzS
	 o43JWp/gK6MGi7LVmpz3YNypj7sfWIxrjfw3uBw0lLOfVU6nHPN5aJrGSg4cq7IDPl
	 wpq7WhvF14/mFgm7kkCSEfCMvYnMfUD1bybkbvV+Ij2yK3w+mG1hdfc1A8rs3x9r6l
	 EEKdY4iDnmyOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (mp5990) Publish the OF module aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: hpp.iscas <hppiscas@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260905133721.65588-1-hppiscas@163.com>
References: <20260905133721.65588-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 13:44:11 +0000
Message-Id: <20260905134412.164601F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe fallback matching logic causes a NULL pointer dereference w=
hen probed via ACPI PRP0001.
--

commit 8c03c546eec5de58e0c8478c39f38b64125e7713
Author: hpp.iscas <hppiscas@163.com>

hwmon: (mp5990) Publish the OF module aliases

MP5990 and MP5998 Device Tree clients are matched through mp5990_of_match. =
Only
the I2C ID table is currently published, although Device Tree clients emit =
OF
modalias events.

> diff --git a/drivers/hwmon/pmbus/mp5990.c b/drivers/hwmon/pmbus/mp5990.c
> index f8a5d1b42ff7a..d5143956d4780 100644
> --- a/drivers/hwmon/pmbus/mp5990.c
> +++ b/drivers/hwmon/pmbus/mp5990.c
> @@ -213,6 +213,7 @@ static const struct of_device_id mp5990_of_match[] =
=3D {
>  	{ .compatible =3D "mps,mp5998", .data =3D (void *)mp5998 },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mp5990_of_match);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential NULL
pointer dereference in mp5990_probe():

drivers/hwmon/pmbus/mp5990.c:mp5990_probe() {
    ...
	if (client->dev.of_node)
		chip =3D (uintptr_t)of_device_get_match_data(&client->dev);
	else
		chip =3D i2c_match_id(mp5990_id, client)->driver_data;
    ...
}

If the driver is probed via an ACPI PRP0001 node, client->dev.of_node is NU=
LL.
The probe function will fall back to the else branch and call i2c_match_id(=
).

Because the client's name is derived from ACPI (e.g., 'PRP0001:00') and is
absent from mp5990_id, i2c_match_id() will return NULL.

Could the unconditional dereference of ->driver_data cause a kernel panic
in this scenario?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905133721.6558=
8-1-hppiscas@163.com?part=3D1
