Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44083C65FE
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693822; cv=none; b=YP52ayh23GQNBqwvKCh476HE6wz0TSOho9Elkb1kuYUzcAV8mTccuxBygSVO+aUDAP+q05PJ7oVBR5PloCEPvlzRrf8aDTO/Yi6W9bap1urpYFUphkZSfnLVhUG/m0lF460ZgMUgW7wOLjcarMcY49xBBA9s1SXZ0wOUXQ5HfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693822; c=relaxed/simple;
	bh=91ZwLaQa1ocOhgxc4/nR/iZPkT5ZM9n3Apo/NwdXUiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aQmkxn7jn4DA8C9ts16PWnZbzjJTWrwcZ64LaQVX91tVWDQODkRI56dxP7624uWtNxZlcMabaCPrS6LfFPgsEdKVPSf+MPKKcTtnCL9aJCXdWHLVMTF/qBf2JRnIkYBssJEDftlgVHOD5tgStRkdPG8nuIZC6yqz9FwJh/Tq2pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fna6W3JB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fna6W3JB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0DB1F00893;
	Fri,  5 Jun 2026 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693821;
	bh=nZGChvqNtJGaKHYkUVuC1ndRObW6cRBu1GI6vhIlXgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fna6W3JBmBROPdCxm/MVwEvLLLdybVFfNmQZwz83z1f5JM3FTE3WaoL8mrJvD/uZ2
	 WqcPaVjAKVPUNL9ncavFtKrhI/wbZY3+eYJzitisYKnLsgNwMesfJB0xWe+Er+F/B/
	 sCK/EEf2IAqTKatfOSPgNy1csAu9mkNxPKiyhiNu3VMyk47UYY3NO9K4W0kCKHr2Ql
	 RSalDkRpAtWb+w81bf5UKnwJ5fIeSHX5Z5czKaV0UdxMn/j1PF7qUP7jKxh5RlIft7
	 UyBO4PM60JOEcVwRfKJb3ff9lc+uGhZS09PIokA7v4snIFT+wC+I69kv9TR8u1/bdf
	 BQmaBqSGV/zLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] platform/x86: dell-ddv: Use new buffer-based WMI
 API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-6-W_Armin@gmx.de>
References: <20260605205937.530897-6-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:10:20 +0000
Message-Id: <20260605211021.4A0DB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The wrapper functions `dell_wmi_ddv_query_integer()`, `dell_wmi_dd=
v_query_buffer()`, and `dell_wmi_ddv_query_string()` unconditionally derefe=
rence the dynamically allocated WMI output buffer without validating its le=
ngth, causing a fatal ZERO_SIZE_PTR dereference if the ACPI WMI method succ=
essfully evaluates but returns no data.
--

commit 5228425f4154cf6a8a761577f1a475ca16aaf5f3
Author: Armin Wolf <W_Armin@gmx.de>
platform/x86: dell-ddv: Use new buffer-based WMI API

This commit updates the dell-ddv driver to use the new buffer-based
WMI API. This allows it to support ACPI firmware implementations that
do not use ACPI integers/strings/packages for exchanging data.

> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/=
x86/dell/dell-wmi-ddv.c
> index 62e3d060f0385..c2120d8ae2988 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
[ ... ]
> -static int dell_wmi_ddv_query_type(struct wmi_device *wdev, enum dell_dd=
v_method method, u32 arg,
> -				   union acpi_object **result, acpi_object_type type)
> +static int dell_wmi_ddv_query(struct wmi_device *wdev, enum dell_ddv_met=
hod method, u32 arg,
> +			      struct wmi_buffer *output, size_t min_size)
>  {
[ ... ]
> +	return wmidev_invoke_method(wdev, 0x0, method, &input, output, min_size=
);
>  }
> =20
>  static int dell_wmi_ddv_query_integer(struct wmi_device *wdev, enum dell=
_ddv_method method,
>  				      u32 arg, u32 *res)
>  {
> -	union acpi_object *obj;
> +	__le32 *argr __free(kfree) =3D NULL;
> +	struct wmi_buffer output;
>  	int ret;
> =20
> -	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_INTE=
GER);
> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*argr));
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (obj->integer.value <=3D U32_MAX)
> -		*res =3D (u32)obj->integer.value;
> -	else
> -		ret =3D -ERANGE;
> -
> -	kfree(obj);
> +	argr =3D output.data;
> +	*res =3D le32_to_cpu(*argr);

[Severity: High]
Can this dereference a ZERO_SIZE_PTR and cause a crash if the ACPI method
returns no data?

Looking at wmidev_invoke_method(), if the method evaluation is successful
but no object is returned (!obj), it returns 0 (success) and sets
out->data =3D ZERO_SIZE_PTR, effectively bypassing the min_size check.

The previous implementation in dell_wmi_ddv_query_type() checked for this
explicitly:

	obj =3D out.pointer;
	if (!obj)
		return -ENODATA;

Does the new code need to verify output.length before dereferencing argr?

[ ... ]
>  static int dell_wmi_ddv_query_buffer(struct wmi_device *wdev, enum dell_=
ddv_method method,
> -				     u32 arg, union acpi_object **result)
> +				     u32 arg, struct dell_wmi_buffer **result)
>  {
[ ... ]
> -	if (!buffer_size) {
> +	buffer =3D output.data;
> +	if (!le32_to_cpu(buffer->raw_size)) {

[Severity: High]
Similarly, does this unconditionally dereference buffer->raw_size even if
output.data was set to ZERO_SIZE_PTR by wmidev_invoke_method() returning
no data?

[ ... ]
> -static int dell_wmi_ddv_query_string(struct wmi_device *wdev, enum dell_=
ddv_method method,
> -				     u32 arg, union acpi_object **result)
> +static ssize_t dell_wmi_ddv_query_string(struct wmi_device *wdev, enum d=
ell_ddv_method method,
> +					 u32 arg, char *buf, size_t length)
>  {
> -	return dell_wmi_ddv_query_type(wdev, method, arg, result, ACPI_TYPE_STR=
ING);
> +	struct wmi_string *str __free(kfree) =3D NULL;
> +	struct wmi_buffer output;
> +	size_t str_size;
> +	int ret;
> +
> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*str));
> +	if (ret < 0)
> +		return ret;
> +
> +	str =3D output.data;
> +	str_size =3D sizeof(*str) + le16_to_cpu(str->length);

[Severity: High]
Like the integer and buffer queries above, does this code dereference
str->length without confirming output.data is valid?

If the ACPI method succeeds but returns no object, str could be ZERO_SIZE_P=
TR.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D5
