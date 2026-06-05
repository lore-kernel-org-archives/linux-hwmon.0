Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120B199385
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694027; cv=none; b=Zahc0A88rLu1vtdQkJ1ojZ/ME0nPMEP+pd2REZbIIIyNO+VDSirdH9ZC+GNrV1r/lWhfiloIEt1XWQgVpkaxaX2mPoQYHG7JKPS/XAI14df6tnXB7WhiFRXGoRvv4fMvgyVpEteooscoGnloS5wz6Q0bEdtswLvyK6XG9ukRA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694027; c=relaxed/simple;
	bh=xr/Oxf74f+BFMo8gCY2g3y+x+HTZIlH8SJP4vPZQf+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FJOE05BxY4WMMon9oZbyepeucc017pU1XQDD59368uXDuRRW5S4IhJmKvyQ/KesRMER3otkFBqlNfA6z0MIqd5abrOZWmJV60HKEp1SsOWMUr8ZZyxaswOfeSU4zx8+dtzig/CRWrMMwu8su0smBZWHuJBtW0uzfXNJpkrPvBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGgJrgZn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGgJrgZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E9E1F00893;
	Fri,  5 Jun 2026 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780694026;
	bh=bz4BSOnjqqzuOwaI81LdVPAn4fsJR8TyelwnKvepcXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGgJrgZnKu4foHEQpmkK6LBgxfcVTrZtTr7kmQZfNBsdp1pR0dOjeaMuhGdFdDfuq
	 EeUamo8ZaHNkvsqEfNNAkky8Cxlb+cVQZzvHbahB+5cBcxpQIJ3SLamxLc+0pm89x6
	 Apee1reYFTHEleeka2X/zgcOMILZsA6BouDPXi3pv9bKJk3QjHkDYuT3mopSm3Gy5A
	 64zRwrbzFiZxvjZNTLPrvzsQDW/gRJrGNr7l9s9x4/I8teEhIXGUU9I9OwBvB5abm2
	 R6FHobHYdv+DGUycyVQwRol2x2UTwOyQwsXN+l6cl9A+4f0WQeJV5gPI9ImViBHhca
	 uK+UuDWqSxiiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/9] platform/x86: dell-smbios-wmi: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-4-W_Armin@gmx.de>
References: <20260605205937.530897-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:13:46 +0000
Message-Id: <20260605211346.53E9E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The driver silently drops SMBIOS integer error codes and changes=
 the returned error from `-EIO` to `-ENODATA`.

Pre-existing issues:
- [High] If the ACPI WMI method evaluates successfully but returns no objec=
t, `wmidev_invoke_method` returns success (0) and sets `output.data` to `ZE=
RO_SIZE_PTR`. The `dell-smbios-wmi` driver then blindly dereferences it in =
`memcpy` using `input.length` (which is > 0), causing an immediate kernel p=
anic.
- [High] User space open file descriptors can trigger a use-after-free on `=
priv` and `priv->buf` after the WMI device unbinds.
--

commit 16e2a3995c7578613ee091087b9699433b85564f
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-smbios-wmi: Use new buffer-based WMI API

This commit updates the dell-smbios-wmi driver to use the new buffer-based
WMI API. It replaces manual ACPI buffer handling with wmidev_invoke_method()
to better support various ACPI firmware implementations.

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

[Severity: Medium]
Will this change cause the driver to silently drop SMBIOS integer error cod=
es?

Previously, if the BIOS returned an integer error, the driver explicitly lo=
gged
"SMBIOS call failed: %llu" with the specific error code and returned -EIO.

Now, wmidev_invoke_method() unmarshals the integer into a 4-byte buffer,
fails the length < min_size check, and returns -ENODATA.

Does this loss of precise error codes hinder debugging, and could the chang=
ed
errno break userspace tools expecting -EIO?

> +
> +	memcpy(input.data, output.data, input.length);

[Severity: High]
This is a pre-existing issue, but can this memcpy() cause a kernel panic if
the WMI evaluation returns no object?

If a buggy or malicious ACPI BIOS returns no object for the SMBIOS WMI meth=
od:

drivers/platform/wmi/core.c:wmidev_invoke_method() {
    ...
    if (!obj) {
        out->length =3D 0;
        out->data =3D ZERO_SIZE_PTR;
        return 0;
    }
    ...
}

wmidev_invoke_method() will bypass the min_size check and return success.

Since output.data is ZERO_SIZE_PTR and input.length is strictly positive,
does this memcpy() directly dereference ZERO_SIZE_PTR and trigger a fatal
page fault?

> +	kfree(output.data);

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
vulnerability during driver unbind?

The driver allocates resources using devm_kzalloc() and devm_get_free_pages=
()
in dell_smbios_wmi_probe():

drivers/platform/x86/dell/dell-smbios-wmi.c:dell_smbios_wmi_probe() {
    ...
    priv =3D devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv), GFP_K=
ERNEL);
    ...
    priv->buf =3D (void *)devm_get_free_pages(&wdev->dev, GFP_KERNEL, count=
);
    ...
}

It uses devm_add_action_or_reset() to call misc_deregister(). While this
removes the device node, it does not revoke existing open file descriptors.
During unbind, devres subsequently frees priv and priv->buf.

If a user space application holds an open file descriptor, could a concurre=
nt
or subsequent ioctl() access the freed structures here?

drivers/platform/x86/dell/dell-smbios-wmi.c:dell_smbios_wmi_ioctl() {
    struct wmi_smbios_priv *priv =3D filp->private_data;
    ...
    ret =3D dell_smbios_wmi_do_ioctl(priv, input);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D3
