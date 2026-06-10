Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C140D568
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124432; cv=none; b=qxqiBRzdLayWV0kuRL/HhEI1+lzWmLZ9W9aWMQ1A4h7tfLOt3TQQS7sX1sQmyG/WLolMcWP0MvVid9r+QES+L9Np86wNuS2QO6iHaeKDcwILsx5xFrHKLxyDbMMb5rXSwC6uHXi05iqdJ0EUafgpWTcKsdv86QQV8IpYZIkGtdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124432; c=relaxed/simple;
	bh=BV4yFutiYjF08tddMNA6Du0yCL6iBxjsR4K5Zq7AsIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TrRpq3qIasfGY4PlpUh/rA+SsRSVPQlNdn6mY92pKtngs4pL/dnQE6jx+gKVH/NirKUxgjMiwqe1wL49boW4WstcT76ju++MC6xV+eoYgy6eyKOu+8CTEBxR1s5+uJqh0v1ddPa5OEerqJYptYROkxFCKGCdKYSy8UMkelifAkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmKOrL3b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmKOrL3b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB871F00893;
	Wed, 10 Jun 2026 20:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124431;
	bh=D5jTXHp5bPdcyCZYefvqvQVHPxt3X94zvl6LGazkIpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kmKOrL3bDex1HfDDWy2K3vJzFYCvsJKev73DkHaUZm3ZbCCzn0yncn4pOD/2aGnYD
	 wPgKOS4sCDjJhTxyCeBIcUtCRTK0KTUGIEwmxD8mVR5aKMPP2NyxRW3kM8+CScidKy
	 +0lyxCO/59NcHcU8mrHtAGQJefT/iZqdKTzIQTfKpSzlMYOFJ+rGLpG4QkCEBjCrYE
	 Y9lJ0/rjYr3WhUw5iliKeCWW1lfoprTXBs4ZCsH/45owmDQDsD88eXHbmHqHS3kOwk
	 5k8d1aiXN+YiAlkl73R1GZSE+0d1q90MgZ3XlishtlxWXGK6ZSrgsPl62wRzM14Vc1
	 FmAWNI30j42lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] platform/x86: dell-ddv: Use new buffer-based WMI
 API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-6-W_Armin@gmx.de>
References: <20260610203453.816254-6-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:47:10 +0000
Message-Id: <20260610204711.3EB871F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Kernel panic due to dereferencing ZERO_SIZE_PTR when WMI methods r=
eturn an empty result, bypassing length validation.
--

commit 1a33f1fa92cf5d49dd49bba56bde6f9f8debd47d
Author: Armin Wolf <W_Armin@gmx.de>

    platform/x86: dell-ddv: Use new buffer-based WMI API
   =20
    Use the new buffer-based WMI API to also support ACPI firmware
    implementations that do not use ACPI intergers/strings/packages
    for exchanging data.

> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/=
x86/dell/dell-wmi-ddv.c
> index 62e3d060f0385..736d9b1fdcfbb 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c

[ ... ]

> @@ -158,105 +164,96 @@ static const char * const fan_dock_labels[] =3D {
> =20
>  static int dell_wmi_ddv_query_integer(struct wmi_device *wdev, enum dell=
_ddv_method method,
>  				      u32 arg, u32 *res)
>  {
> -	union acpi_object *obj;
> +	struct wmi_buffer output;
>  	int ret;
> =20
> -	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_INTE=
GER);
> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(__le32));
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (obj->integer.value <=3D U32_MAX)
> -		*res =3D (u32)obj->integer.value;
> -	else
> -		ret =3D -ERANGE;
> +	__le32 *argr __free(kfree) =3D output.data;
> =20
> -	kfree(obj);
> +	*res =3D le32_to_cpu(*argr);

[Severity: High]
If the ACPI evaluation succeeds but returns no object, wmidev_invoke_method=
()
returns 0 and sets output.data to ZERO_SIZE_PTR.

The old code explicitly checked for this:
    obj =3D out.pointer;
    if (!obj)
        return -ENODATA;

Does this code now dereference a ZERO_SIZE_PTR since we don't verify
that output.length > 0 before accessing *argr?

> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static int dell_wmi_ddv_query_buffer(struct wmi_device *wdev, enum dell_=
ddv_method method,
> -				     u32 arg, union acpi_object **result)
> +				     u32 arg, struct dell_wmi_buffer **result)
>  {
> -	union acpi_object *obj;
> -	u64 buffer_size;
> +	struct dell_wmi_buffer *buffer;
> +	struct wmi_buffer output;
> +	size_t buffer_size;
>  	int ret;
> =20
> -	ret =3D dell_wmi_ddv_query_type(wdev, method, arg, &obj, ACPI_TYPE_PACK=
AGE);
> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*buffer));
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (obj->package.count !=3D 2 ||
> -	    obj->package.elements[0].type !=3D ACPI_TYPE_INTEGER ||
> -	    obj->package.elements[1].type !=3D ACPI_TYPE_BUFFER) {
> -		ret =3D -ENOMSG;
> -
> -		goto err_free;
> -	}
> -
> -	buffer_size =3D obj->package.elements[0].integer.value;
> -
> -	if (!buffer_size) {
> +	buffer =3D output.data;
> +	if (!le32_to_cpu(buffer->raw_size)) {

[Severity: High]
Does this also cause a ZERO_SIZE_PTR dereference if output.length is 0 and
output.data is ZERO_SIZE_PTR?

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
> +	struct wmi_buffer output;
> +	size_t str_size;
> +	int ret;
> +
> +	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(struct wm=
i_string));
> +	if (ret < 0)
> +		return ret;
> +
> +	struct wmi_string *str __free(kfree) =3D output.data;
> +
> +	str_size =3D sizeof(*str) + le16_to_cpu(str->length);

[Severity: High]
Similarly, does this code trigger a ZERO_SIZE_PTR dereference of str->length
if wmidev_invoke_method() returns 0 with no object?

> +	if (str_size > output.length) {
> +		dev_warn(&wdev->dev,
> +			 FW_WARN "WMI string size (%zu) exceeds WMI buffer size (%zu)\n",
> +			 str_size, output.length);
> +		return -EMSGSIZE;
> +	}
> +
> +	return wmi_string_to_utf8s(str, buf, length);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D5
