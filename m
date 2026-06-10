Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2C331EC2
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124352; cv=none; b=CCFkROD5E/iKdtsiHlL03kWcElHR1BE+0LnxdlP+Utlqe0O85p/QN335DF4rxTOw8MZGPt24Ta4Ad3p+YIA9WI5acfkoHPoDEMRt8ladBmUpyCli+/I/12vWCg3bdq5aKAaW+CKoY7ppr7fz2+tjIVh75dLNy11BAqSwYohQq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124352; c=relaxed/simple;
	bh=a6q+sXQnScHanpVg6xaPrULdd773KzG2iuVbWLLSUGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nUEs7zz2yMzGq/MpUdhEF0D34FJXEdqte7h4gGgHR6uKo16Jv2SuN2t6J/GoaTF0h68Jocg1GxTz9EdW5i21pqmgDJHC+MOFbSmPjMnrkqUEyzmgLAF+bvE7JeH+0ZV/EwwRaDdD4KhriXBYmTzstNzbsPmCmcgiC0SYLaat22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIKdIMoS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIKdIMoS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853551F00898;
	Wed, 10 Jun 2026 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124349;
	bh=b7fKPrvsBgdMklfYRYWEhyncflaf8ZVTcsEIVZ6M/gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VIKdIMoS1BJP1ep/LrlzvRe6VyaAmhn47becs89XQ6egvKY8J7p/ukrsDBme8DO/l
	 /nM2Gn/rkyef+9c8CpOo7WU5kivrj9HLexB9zC9PfuJjg86mzHQwZ7Sga6NppLZyCT
	 tBXSWU98ErN7gKMxcRI2ep5uVhpEyocfY/C2ATxfdizSnvVgJwnJ1CIRdirdNQdwG/
	 5eo7GR+v2c3Xnv4KyhOwG/9o7qoNAb6OT0R3Isn8tA/YnoxotCTTcCWuZ+HWNijoZZ
	 TM1ytqo5mkKwFj+JPSPAfmnvD8X5dvtT1h4O/SMOZf7VdFWnbYLm7SZ3P5DXL2Tt67
	 oKNSKjLXmSyyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-7-W_Armin@gmx.de>
References: <20260610203453.816254-7-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:45:49 +0000
Message-Id: <20260610204549.853551F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] wmi_parse_response incorrectly fails with -ENODATA when the firmwa=
re returns fewer than 4 registers, breaking support for valid short SMM res=
ponses.
--

commit 5defcd15874af970946561c0d13ad1b0850d56ca
Author: Armin Wolf <W_Armin@gmx.de>
hwmon: (dell-smm) Use new buffer-based WMI API

This commit updates the dell-smm-hwmon driver to use the new buffer-based W=
MI
API. This allows the driver to also support ACPI firmware implementations t=
hat
do not use ACPI buffers for returning the results of a SMM call.

> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmo=
n.c
> index 038edffc1ac74..6ca2ea4bfe7d3 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -261,22 +263,19 @@ static int wmi_parse_response(u8 *buffer, u32 lengt=
h, struct smm_regs *regs)
>  		&regs->ecx,
>  		&regs->edx
>  	};
> -	u32 offset =3D 0;
> +	size_t offset =3D 0;
>  	ssize_t ret;
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
>  		if (offset >=3D length)
>  			return -ENODATA;
> =20
>  		ret =3D wmi_parse_register(buffer + offset, length - offset, registers=
[i]);
>  		if (ret < 0)
>  			return ret;
> =20
> -		offset +=3D ret;
> +		/* WMI aligns u32 integers on a 4 byte boundary */
> +		offset =3D ALIGN(offset + ret, 4);
>  	}
> =20
> -	if (offset !=3D length)
> -		return -ENOMSG;
> -
>  	return 0;
>  }

[Severity: High]
Does wmi_parse_response() incorrectly fail with -ENODATA when the firmware
returns fewer than 4 registers, breaking support for valid short SMM respon=
ses?

Based on the changes, it appears the parsing loop previously allowed a short
response to be fully consumed (where offset =3D=3D length), eventually veri=
fying
it and successfully returning 0 while leaving any unprovided registers
unchanged.

With the updated code, if a BIOS legitimately returns a valid WMI response
containing 1, 2, or 3 registers (e.g., 8, 16, or 24 bytes), the loop parses
the provided registers and increments offset to equal length. On the
subsequent iteration, it evaluates offset >=3D length as true.=20

Instead of succeeding, will this now fail the entire SMM call with -ENODATA?

Could this functional regression break hardware monitoring (e.g., fan speed,
temperatures) on Dell systems whose BIOS provides short WMI SMM responses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D6
