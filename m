Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C31A239A
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783879654; cv=none; b=EVvhyMG9m/J24RjPFKJaK0s3cHSqZj3PN24rfw0PyHtK/lnuIXlgYjIoL8SXm8xrnmd7qtMEBfOUm4PHDM/JQ6GNbZYhnRhC5PPAx3eJbnrVO8I/GqspB7WvOYzG9VtlKfvDxs1EjZpwOfdXtqJL/8wVzLdVdyBmfwI6rWu5/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783879654; c=relaxed/simple;
	bh=TvtAY4WHFICtxMyia+VVoxpX4FqTabIau3HwWBNiSps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HxbV4E+jmq2ctAxXB0MQbUzHJMhYoSTJucF9d2ZC2dopYc6uaQKzsZqU0PHiMjH35Wk87ISM0Fgr0HgvpwHwiZLopjMhud2fuQBjcWRnjH0noYX+sAAhCBeTa6oYyJK6L8cIX0r//0OtoGNiwGHjIgCI0lOK7x40iROTFGgqPEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQYyvr2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQYyvr2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5938E1F000E9;
	Sun, 12 Jul 2026 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783879651;
	bh=DLka1unGQOP1e9jObQz00kdYMHsDYISLl0mX8pHGfFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XQYyvr2qXBYJz7ou1JwCxMj9d4X/or3DckWVvfpxZ3eqUz+aguRv/vD8rLx8ttw5h
	 SpDATWCxFzCzwlngqxBAQSQIOa2oV/VSBOSe6HEHx2Okub49YXX2fPtcPNianAZ673
	 kupw/O15BVvPbxEcC4X9vFwk2vX2fTAp3nyZSZP4PcZC3pevBanHEEia1azrUfMEou
	 3k0rZPZSjX4BgT8ajpZ8KDe3mjqBeFMYGgUhthwfG4h2wn+cuqyW3zAbaxr/tm0uQe
	 wPsd7vtnjSTO1yLagK7bjg8gHtXKGroy1quzpYBhA+6PwuyXc8fQAlO8tH+Myb3dsL
	 ZG1YESxsy3+pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dme1737) Replace ternary operators with
 str_yes_no()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260712-add-string-choices-dme1737-v1-1-9c2b1f31db28@gmail.com>
References: <20260712-add-string-choices-dme1737-v1-1-9c2b1f31db28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 18:07:29 +0000
Message-Id: <20260712180730.5938E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C read error codes are truncated to u8 and returned as valid reg=
ister data.
- [High] Unchecked return value from platform_get_resource() leads to NULL =
pointer dereference.
--

--- Patch [1]: [PATCH] hwmon: (dme1737) Replace ternary operators with str_=
yes_no() ---
commit 21dfdc10dea95969dd673217e2bf3491b63acd86
Author: Joshua Crofts <joshua.crofts1@gmail.com>

hwmon: (dme1737) Replace ternary operators with str_yes_no()
   =20
Remove the ternary operators and use str_yes_no() from string_choices.h
instead. No functional change.

> diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
> index 7e839308e58fa..f28a9cfced556 100644
> --- a/drivers/hwmon/dme1737.c
> +++ b/drivers/hwmon/dme1737.c

[ ... ]

> @@ -2314,13 +2315,13 @@ static int dme1737_init_device(struct device *dev)
> =20
>  	dev_info(dev,
>  		 "Optional features: pwm3=3D%s, pwm5=3D%s, pwm6=3D%s, fan3=3D%s, fan4=
=3D%s, fan5=3D%s, fan6=3D%s.\n",
> -		 (data->has_features & HAS_PWM(2)) ? "yes" : "no",
> -		 (data->has_features & HAS_PWM(4)) ? "yes" : "no",
> -		 (data->has_features & HAS_PWM(5)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(2)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(3)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(4)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(5)) ? "yes" : "no");
> +		 str_yes_no(data->has_features & HAS_PWM(2)),
> +		 str_yes_no(data->has_features & HAS_PWM(4)),
> +		 str_yes_no(data->has_features & HAS_PWM(5)),
> +		 str_yes_no(data->has_features & HAS_FAN(2)),
> +		 str_yes_no(data->has_features & HAS_FAN(3)),
> +		 str_yes_no(data->has_features & HAS_FAN(4)),
> +		 str_yes_no(data->has_features & HAS_FAN(5)));
> =20
>  	reg =3D dme1737_read(data, DME1737_REG_TACH_PWM);

[Severity: High]
This isn't a bug introduced by this patch, but since dme1737_read() is
called here, I noticed a potential issue in how it handles errors:

drivers/hwmon/dme1737.c:dme1737_read() {
    ...
    s32 val;
    ...
    if (client) {
        val =3D i2c_smbus_read_byte_data(client, reg);
        ...
    }
    ...
    return val;
}

If i2c_smbus_read_byte_data() fails and returns a negative error code like
-EIO, won't val be silently truncated into a large positive unsigned value
because the function returns a u8?

Could this result in the caller interpreting the error code as valid sensor
data, potentially causing abnormal hardware state interpretations during
initialization?

[Severity: High]
This is another pre-existing issue unrelated to the patch, but I noticed a
potential problem in dme1737_isa_probe():

drivers/hwmon/dme1737.c:dme1737_isa_probe() {
    ...
    res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
    if (!devm_request_region(dev, res->start, DME1737_EXTENT, "dme1737")) {
    ...
}

Is it possible for platform_get_resource() to return NULL here?

If a privileged user manually binds the driver to a device node lacking this
resource via sysfs, would dereferencing res->start cause a NULL pointer
dereference panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-add-string=
-choices-dme1737-v1-1-9c2b1f31db28@gmail.com?part=3D1
