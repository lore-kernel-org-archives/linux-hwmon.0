Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691BD409E0A
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686111; cv=none; b=fJ0r2GzoWsYxdXuuEFd9gi/72GxRbEFYT/+CNgBVoZTmrF0ZBYgxKBkJ1YexdSCiNEda41AS/UzbrTx2T8wTTx4AxnvRC5WYYQAppP5JsOKCrAZGaj3ZyDb//iICoCL+Z7+cNRi0BGHBDZT5zxhBAtFbKn/+x4z9ZF29BYnOcBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686111; c=relaxed/simple;
	bh=Y/Na9Gmk3Wd/Gt0/0mdbEtIYATx73hliQRw2Wk5XHoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WXz1J6JentASkkBybjLqRN+avKlHLY+qityppVnjK+UvpkBX6W5HYhR7vR0YJB2UjaaZeB5og3GreocmJEZZ0zMF9K4qpejYfxb8IeACfV4WD1b+7xg1+kwNf7/prZDuV6ckjJyzLRjVDISsPWFKWotk4eINkkv1oPtgTrgMVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7FOWqla; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7FOWqla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0D81F00893;
	Fri,  5 Jun 2026 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686106;
	bh=MJh9414+mmde2DarDvT5I0be/nOZIxCMpMdxH8OzA88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e7FOWqla7vQ8OTZFXatHUEqxkHg3UPVrdTlbGXU46E86JmX2VdWN5IIOqIApWf6K7
	 lyjBugaE9TKkwN70EdMhBYzXUzbqm3RsEnkpCK7kwRxPzIxueiLR6lY6pIyKs+ZvRN
	 t9At9HnMyscjlxhUtlhwG9HqE33rGfqK3OtZDSnvyQ8/rIHOUn/UIANoYgVybhnHjd
	 8MreX6QfAB7xoXMTeqMMtWoNosB4SI7A+fiKM5+QlSIpkeZIELPXdm3RinwhB5QXrt
	 0mp/M1QTMFiUe74zd6fpcmwgllvEx0pK/Lw0sIewwyr+irtx+VjAkN5gGC1TWjfgo5
	 pWIJmEaMh6BJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/9] platform/x86: dell-ddv: Use new buffer-based WMI
 API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-6-W_Armin@gmx.de>
References: <20260605181433.188847-6-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:01:46 +0000
Message-Id: <20260605190146.9A0D81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] WMI query wrapper functions crash when the underlying ACPI method =
returns no data (ZERO_SIZE_PTR dereference).
--

commit 9a4b15969c05e28f24a154f47da550f56ba01716
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-ddv: Use new buffer-based WMI API
   =20
Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI intergers/strings/packages
for exchanging data.

> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/=
x86/dell/dell-wmi-ddv.c
> index 62e3d060f0385..c2120d8ae2988 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
[ ... ]
> @@ -158,105 +164,96 @@ static const char * const fan_dock_labels[] =3D {
[ ... ]
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
Can this result in a ZERO_SIZE_PTR dereference?

If wmidev_invoke_method() evaluates the ACPI method successfully but it
returns no object, it returns 0 (success) and sets output.data to
ZERO_SIZE_PTR. Since this function only checks if ret < 0, does this
unconditionally dereference ZERO_SIZE_PTR if the firmware returns no data?

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
Similarly, does this dereference buffer->raw_size when buffer is ZERO_SIZE_=
PTR
if the underlying ACPI method returns no data?

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
Could str->length crash here for the same reason, if wmidev_invoke_method()
returns 0 but sets output.data to ZERO_SIZE_PTR?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D5
