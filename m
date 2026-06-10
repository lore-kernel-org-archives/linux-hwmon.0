Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E821B9F6
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124443; cv=none; b=u6Wuc9BLoedSrV+sciCUgBSfCLNTaksXqOZ/TLqbGT5fm7QXVpdhzqqzYb0OuXnqWxWjredyKGk7nK5g7kAOod0ZJZU2TAf9sZLLrt/2VBCdO9UMaGtOLxjw9zypKhmZ6NV4/KtIkrwTKXHmvJ1/3sq0S+i0Sh6YhAH81CHfPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124443; c=relaxed/simple;
	bh=Ul/E45W2B253MiLaJWrFHBUXw+HVu8M0k5oipKVSMh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJ58CXD+nx4KVtOHCuQob1ONC/VtzB9z7l+0INJ66MIRImoDCMIHfaNLRmaSIBHxMVzQB7sEoOVNGT7vx+eCVy6vJUpb0TMg+a+0ETR7w0AArGwso1AZKy4yTpqjkfYpnFCQqnxDyhtYcM71D1Nk7JRZnhcQeuSeZzzsJ7cPtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHGNIxC4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHGNIxC4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF751F00893;
	Wed, 10 Jun 2026 20:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124442;
	bh=jQGblWrGvEpdO5LwhlAYNIC7clzDwUwEQhCW+dguB0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHGNIxC4JC9pQzSz8Cs3Q2oheSincDJmmzMNcGdZ+03kTw4JEYjuEpYKZbNR1++PB
	 izjb1C/BB9sD3QRiNHuyzJFz7TLs5nf8myOJxHO92ltcbD2fdB8M8/JjWoD2QGxWqU
	 +809fMffL2QPXkRcD8Pvkre+M2mBkXST7oT57/ApHWP3BXbtHkvkSasarjSxpvcNIh
	 lhDxBHRd1lCLYUldsLM402r6pzjKLXEdqEDhQhhLOnV1VKn2Q2Z4RyuoZ0/Batpi9Q
	 kfJigIKKrm2UJpTsMEnfMtwHag64Rq/0PcS54PBm4dSkHC0lRCzYEduvdTe1GOduVm
	 Qpps1AUCqArig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] platform/x86: dell-smbios-wmi: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-4-W_Armin@gmx.de>
References: <20260610203453.816254-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:47:21 +0000
Message-Id: <20260610204721.CFF751F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If the ACPI WMI method successfully evaluates but returns no outpu=
t object, `wmidev_invoke_method()` returns success and sets the output data=
 to `ZERO_SIZE_PTR`, bypassing the `min_size` constraint. `run_smbios_call(=
)` then unconditionally executes `memcpy` from `ZERO_SIZE_PTR`, leading to =
a kernel panic.
- [High] Use-After-Free (UAF) in the ioctl and read paths because the chara=
cter device is unregistered using a devm action, allowing file operations t=
o execute after the underlying device memory is freed.
--

commit ab9678fa1e5f61b73fc8e1705045d35055367552
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-smbios-wmi: Use new buffer-based WMI API

This commit updates the dell-smbios-wmi driver to use the new buffer-based =
WMI
API. It transitions the driver to support ACPI firmware implementations tha=
t do
not rely on ACPI buffers for SMBIOS call results.

> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfo=
rm/x86/dell/dell-smbios-wmi.c
> index a7dca8c59d602..64d0871b706e5 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -50,38 +50,32 @@ static inline struct wmi_smbios_priv *get_first_smbio=
s_priv(void)
> =20
>  static int run_smbios_call(struct wmi_device *wdev)
>  {

[ ... ]

> -	status =3D wmidev_evaluate_method(wdev, 0, 1, &input, &output);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -	obj =3D (union acpi_object *)output.pointer;
> -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -		dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
> -		if (obj->type =3D=3D ACPI_TYPE_INTEGER)
> -			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
> -				obj->integer.value);
> -		kfree(output.pointer);
> -		return -EIO;
> -	}
> -	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
> +	/*
> +	 * The output buffer returned by the WMI method should have at least th=
e size
> +	 * of the input buffer.
> +	 */
> +	ret =3D wmidev_invoke_method(wdev, 0, 1, &input, &output, input.length);
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(input.data, output.data, input.length);

[Severity: High]
This is a pre-existing issue, but can this memcpy() cause a kernel panic
if the WMI method successfully evaluates but returns no output object?

If wmidev_invoke_method() in drivers/platform/wmi/core.c encounters a
missing ACPI object (!obj), it returns 0 and sets out->data to ZERO_SIZE_PT=
R:

    status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, &aou=
t);
    ...
    obj =3D aout.pointer;
    if (!obj) {
        out->length =3D 0;
        out->data =3D ZERO_SIZE_PTR;
        return 0;
    }

Since wmidev_invoke_method() returns success and bypasses the min_size chec=
k,
the memcpy() here would attempt to read input.length bytes from ZERO_SIZE_P=
TR,
leading to an invalid memory access.

[Severity: High]
This is a pre-existing issue, but does the character device unregistration
sequence allow for a use-after-free during device unbind?

The driver registers a character device via misc_register() and uses
devm_add_action_or_reset() to unregister it. It also allocates the priv
and priv->buf structures using devm_kzalloc() and devm_get_free_pages().

When the WMI device is removed (e.g., via sysfs unbind), the devm cleanup
actions call misc_deregister() and then free the priv memory. However,
misc_deregister() does not revoke existing open file descriptors.

If a userspace process holds the character device open while the device
is unbound, it can subsequently call ioctl() or read(). These operations
would dereference filp->private_data in dell_smbios_wmi_ioctl() (which
points to the freed priv struct) and access the freed priv->buf memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D3
