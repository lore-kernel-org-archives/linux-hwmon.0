Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055232222AC
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023825; cv=none; b=iSkgpXOum+a5JNxkFWjgUzdJISL7N+cOBC66KFHWCgf9YTOjnRzpw5p45P/DNqKUrojuppTeFKdyjj1iy6Pv5+1X/79dcn3zYs2qfiQtJAmNhoHvxIK4Nn8dhgFbSHX/ESTd7DeBHaGXLZfBwGI+cS4moDcKAowHMPXgXfVmeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023825; c=relaxed/simple;
	bh=hXT1/1hmYgnzzlCG0CGWiogQxQO6EVO13P2xPeu1peA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RRnhej6S/fqKNjAjxYtRkLTjhWGxYBli2rMJ9lg6Rxd4cZNJepAqltXOn11RQ9mUc9FkQ9yCMFwRg14R/AN4y+gjXsbEjAhwg8FqcNwCXsZGIHOoigYhm4QrJbfrlmC0+BpLs6j7haFMGBxjeZwzEM9HSrKGo8CQpIIqyt871Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+NtLVXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+NtLVXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886FC1F000E9;
	Sat, 29 Aug 2026 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788023823;
	bh=RadXNoSgBGXs6PG8P8WGdGirxwIJ90PZogYMmGBGPm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q+NtLVXbs+o8byw2VmpEG47DewVwzwhFACvswFcGxN0gWac8MPf1lrYMCkxnFcSqN
	 EO6gS8CD2qgE8+th+PaKfjV/HeFFrtwm9eyGkvSUFkWvq6K9Wa6fjxd4RbZY5HfRMk
	 tTDm5D3ZNxmyOXJwvUSVU5pchfrUJb+KDNiuLUupw1jijD2rDjxSOoswoik5A4H0kx
	 DJn/iYvpS0aCi1MZeOD2apf3PMzKdgwcRjsj+xRfN7iUtMKgdOHIpkDFqP5ha5fDj3
	 3RE4L2jI34m+Kv9RDT5y5C2JZpD/WZdnFwF8MDF4tXuUb1yep9eVat3gv9Wx0gN5vi
	 ArVKeAM9t3dVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: it87: expose additional temperature
 limits
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829170545.33401-4-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829170545.33401-4-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 17:17:03 +0000
Message-Id: <20260829171703.886FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Writing to newly exposed `temp4_type`, `temp5_type`, or `temp6_typ=
e` attributes results in out-of-bounds bit shifts that silently corrupt the=
 configuration of sensors 1-3.
--

commit 799ba3c032a9c2e42d2a88d4c0b5a095915c09f1
Author: benoit.masson <yahoo@perenite.com>

    hwmon: it87: expose additional temperature limits
   =20
    Expose extra temp min/max/offset/type/alarm attributes when a chip
    reports more than three temperature resources.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e077adbb30911..e44ec65c76f03 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c

[ ... ]

> @@ -1476,6 +1494,12 @@ static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO | S_=
IWUSR, show_temp_type,
>  			  set_temp_type, 1);
>  static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
>  			  set_temp_type, 2);
> +static SENSOR_DEVICE_ATTR(temp4_type, 0644, show_temp_type,
> +			  set_temp_type, 3);
> +static SENSOR_DEVICE_ATTR(temp5_type, 0644, show_temp_type,
> +			  set_temp_type, 4);
> +static SENSOR_DEVICE_ATTR(temp6_type, 0644, show_temp_type,
> +			  set_temp_type, 5);

[Severity: High]
When userspace writes to the newly exposed temp4_type attribute, nr will be=
 3.
Looking at set_temp_type(), it seems to destructively modify bits belonging=
 to
sensors 1-3 when nr >=3D 3:

drivers/hwmon/it87.c:set_temp_type() {
    ...
	reg &=3D ~(1 << nr);
	reg &=3D ~(8 << nr);
    ...
}

Can this corrupt the configuration for the other sensors?

Additionally, when configuring PECI (val =3D=3D 6) for temp4_type:

drivers/hwmon/it87.c:set_temp_type() {
    ...
	else if (has_temp_peci(data, nr) && val =3D=3D 6)
		reg |=3D (nr + 1) << 6;
    ...
}

Because reg is an 8-bit u8, does (3 + 1) << 6 (which evaluates to 256)
overflow the register limit?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829170545.3340=
1-1-jerome.tollet@gmail.com?part=3D3
