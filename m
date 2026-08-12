Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1959B360EE1
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563171; cv=none; b=gD9Hw4TMYM5FkyhNefhylf+7srMy5uLbJnyXEG+Z4v2JbRTdk1ug4otOixgnbUfYXsJi5SFVgZM8gxuaK00ooRiYEgaqy7HWacyb1BxZnoO9oisdZPpWyPSJBP7gIyZPEB1/DALR4DNUS8ypA7C1L8tc2RGqzr33oVUCcZYgqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563171; c=relaxed/simple;
	bh=rd1jxjmjmLcgd/QVHN1MrLugU4DwTtVKwGA6RwHRTHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LFTUPTERESxQj9AUbAgFXJEYSrd3eUgS+7XhO1jcS/lEHQ//r0Ad48LrxK+8vzWVxWVtlwckDf86xMzV0csxAZ3QD+qkh8IvaWkjh6OXD8Sb2mcgM1fEqBF0EkmCtbZK1Wm9KMtr0oHeoPoSMstgNrg58fQ5csCsRrvjfqeslDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRHpVRnh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRHpVRnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FBF1F000E9;
	Wed, 12 Aug 2026 19:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786563169;
	bh=oVQVaBwvDxZQ13ohIjqk/TYQu+hVvmZK2DSOdF8aq84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aRHpVRnhJrxyKq9lJkaBBgy+GUQYCmgJjG/kuApc/VvgdkdkcIiJ4CzaUdfBWNL/f
	 S2LaHc3rmW+jcLAy2FmFvSadQDUe6gU+NtE/vWvDoW7TT49OR2KAqF0HMg9aGCqkwu
	 UtZ+KIN1K4fQ7eBVmXoJj6dGsAsv2HHOmrZQazGGpt88v+iGrUaWbdKHb9rx7ZRxlf
	 Cga04rD9s0oYgKhv17SzS5+yqFEywKbOiwlmEfFu7kzjza6B72fNUxyDzPHua/XMmc
	 lCLGXnRvNBbQH3bYDNhTlIy/ld67+PFXC8kRZQtAGhuEYRPhWnfq40QKRYuGXAKi3q
	 CNYybUey5Tq9A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] hwmon: Add fan monitoring support for HONOR FMI-XX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Dubrovskih" <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812192242.859307-1-testname142@gmail.com>
References: <20260812192242.859307-1-testname142@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:32:49 +0000
Message-Id: <20260812193249.83FBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The function `honor_fmi_read_rpm` illegally mixes `goto`-based erro=
r handling with a scoped `guard(mutex)` lock.
- [Low] The new entry in the MAINTAINERS file is inserted out of alphabetic=
al order.
--

--- Patch [1]: [RFC PATCH] hwmon: Add fan monitoring support for HONOR FMI-=
XX ---
commit 8d90c25d369a88a7d4700de11f8a23c2eaf15bbc
Author: Nikita Dubrovskih <testname142@gmail.com>

hwmon: Add fan monitoring support for HONOR FMI-XX

This patch introduces a read-only hwmon driver for HONOR FMI-XX laptops.
It queries fan speeds using the firmware-provided \GFNS ACPI method and=20
exposes the results via sysfs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f8253ed..d7355db80288e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11854,6 +11854,13 @@ F:	lib/test_hmm*
>  F:	mm/hmm*
>  F:	tools/testing/selftests/mm/*hmm*
> =20
> +HONOR FMI-XX HARDWARE MONITOR DRIVER
> +M:	Nikita Dubrovskih <testname142@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/honor-fmi.rst
> +F:	drivers/hwmon/honor-fmi.c
> +
>  HONEYWELL ABP2030PA PRESSURE SENSOR SERIES IIO DRIVER

[Severity: Low]
This isn't a bug, but should this new entry be placed after HONEYWELL?

Alphabetically, "HONOR" comes after "HONEYWELL" (O follows E), so inserting
it here breaks the alphabetical order of the MAINTAINERS file.

[ ... ]

> diff --git a/drivers/hwmon/honor-fmi.c b/drivers/hwmon/honor-fmi.c
> new file mode 100644
> index 0000000000000..225066e9add5f
> --- /dev/null
> +++ b/drivers/hwmon/honor-fmi.c
[ ... ]
> +static int honor_fmi_read_rpm(struct honor_fmi_data *data, int channel,
> +			      long *rpm)
> +{
> +	union acpi_object input =3D {
> +		.buffer =3D {
> +			.type =3D ACPI_TYPE_BUFFER,
> +			.length =3D 3,
> +		},
> +	};
> +	struct acpi_object_list arguments =3D {
> +		.count =3D 1,
> +		.pointer =3D &input,
> +	};
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *result;
> +	u8 input_bytes[3] =3D { 0, 0, channel };
> +	acpi_status status;
> +	int ret =3D 0;
> +
> +	input.buffer.pointer =3D input_bytes;
> +
> +	guard(mutex)(&data->lock);
> +	status =3D acpi_evaluate_object(data->gfns, NULL, &arguments, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	result =3D output.pointer;
> +	if (!result || result->type !=3D ACPI_TYPE_BUFFER ||
> +	    result->buffer.length < HONOR_FMI_GFNS_RESULT_SIZE) {
> +		ret =3D -EPROTO;
> +		goto out_free;
> +	}
> +
> +	if (result->buffer.pointer[0]) {
> +		ret =3D -EIO;
> +		goto out_free;
> +	}
> +
> +	*rpm =3D result->buffer.pointer[1] |
> +	       (result->buffer.pointer[2] << 8);
> +
> +out_free:
> +	kfree(output.pointer);
> +	return ret;
> +}

[Severity: Low]
Does this function mix goto-based error handling with scope-based cleanups?

The cleanup subsystem guidelines request that guard() helpers and goto-based
cleanups are not mixed in the same function.=20

Could the output buffer be managed using __free(kfree) to completely
eliminate the out_free label?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812192242.8593=
07-1-testname142@gmail.com?part=3D1
