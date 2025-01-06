Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB9978F4F
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184683; cv=none; b=uherwQApskTTy26RRAEZNTgx32KWpaV0NpDvRVyckeNBRfjJzT1LBM/1l+iiWxRGeZbWFD6jNRMWVOpMZ4Ns9vJOdPwF/fGF1zo8qsLKrKHYNOvjLl7aCxoYVdFXrbQOVK4SDE1MGMZRixK022+7hIDNtEnc0az99OegKdumNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184683; c=relaxed/simple;
	bh=WG/M7c7D/qYLRRKRjHzqLWc4vlvXeqsTlm3zHdQP8R4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OLtCj3+fLMebRQg9hd8umHnUjIBsIitU/7p1X7CGYw/vre0NkF/TRbj/1RV/q+jaEValJk+TsnkN0feot3j/+zvPBkq/DYQBLy8lWBLbME2wWaau83Ov8pBFvBNsNRyiQv+ZFTIEwkq5UmPwu8i3pwd6ZF4Sdx7OPVLMzDoVySk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LQoocN5y; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LQoocN5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=wg7dljkrpzhp7bojzttmm4zc4a.protonmail; t=1736184664; x=1736443864;
	bh=WG/M7c7D/qYLRRKRjHzqLWc4vlvXeqsTlm3zHdQP8R4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LQoocN5yp5IEF6ufEbusS5ROsPq5qiw2YMWTp7yLwLf1TjStQ6+GtAX2yjCtzMiRr
	 oT3E4V/GCyZjIIX+FfW0Nrr1pp9yhCA53tUTUwV5LkKSZ4V1SNO04cLMB2obPrWkUs
	 SgZgp7LhgJdn9L0+ycwRrNARGsPCeFmwjRy+MrBzyarSJt/2RYXWXCKpZZYeYHw82C
	 kwreh0uBuRSLkm2z7bS64bNSWvWQZEgReBO/E568ItRuyPUzqG937Zztggf4q0MzSc
	 ruDHWvUpvZtSMhL4bL9PCWBUzzuC4cUu2Ja9kbobJsOKUc0agwVR6clEaE60pHQUtD
	 wYNAigcLZVrzw==
Date: Mon, 06 Jan 2025 17:31:00 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: John <therealgraysky@proton.me>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
Message-ID: <zw2UJN123_RVNb7oaPDKfZjROMOGtEoLGZN9xK1Ha-p7Nqi-f2a682LoKaHhj498dDGqbuApHa5VYNWoB8GLlUhI4cAdj213hU95zEmzxPk=@proton.me>
In-Reply-To: <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net>
References: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me> <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 06bb77ec0a7986d180dcadee332f09d37f0dae1d
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Many thanks for the detailed reply, Guenter. I will resubmit using git send=
-mail from another email provider who supports it.

On Monday, January 6th, 2025 at 11:55 AM, Guenter Roeck <linux@roeck-us.net=
> wrote:

> On 1/1/25 06:15, John wrote:
>=20
> > The attached is my attempt to add support for a new MSI motherboard wit=
h a NCT6687D on board. I do not know why one of the sensors it reads gets r=
eported at -40.0 however. Calling sensors multiple times shows that -40.0 v=
alue seems to bounce around from "Thermistor 0" and "Chipset B."
> >=20
> > Feedback is appreciated.
>=20
>=20
> Documentation/process/submitting-patches.rst
>=20
> describes the canonical patch format. It also includes a chapter
> "No MIME, no links, no compression, no attachments. Just plain text"
> explaining why patches need to be submitted in plain text. This reply
> is a perfect example: It does not include the patch itself, making
> it all but impossible to provide comments on to actual code.
>=20
> Please resend. The patch itself is almost ok, except I'd suggest to repla=
ce
> "The value" with "The new customer ID" or similar in the patch descriptio=
n.
> Also, please define the customer ID as "0x20d" (no leading 0) to be in li=
ne
> with the other MSI customer IDs.
>=20
> > For reference, I attached a sample output of sensors for the new chip w=
ith this patch applied:
>=20
>=20
> This and the output would be useful after "---" in the actual
> patch. It provides the context while avoiding sending the patch as
> attachment.
>=20
> Thanks,
> Guenter
>=20
> > nct6687-isa-0a20
> > Adapter: ISA adapter
> > VIN0: 1.01 V (min =3D +0.00 V, max =3D +0.00 V)
> > VIN1: 1.01 V (min =3D +0.00 V, max =3D +0.00 V)
> > VIN2: 1.30 V (min =3D +0.00 V, max =3D +0.00 V)
> > VIN3: 672.00 mV (min =3D +0.00 V, max =3D +0.00 V)
> > VIN4: 1.01 V (min =3D +0.00 V, max =3D +0.00 V)
> > VIN5: 2.03 V (min =3D +0.00 V, max =3D +0.00 V)
> > VIN6: 464.00 mV (min =3D +0.00 V, max =3D +0.00 V)
> > VIN7: 1.52 V (min =3D +0.00 V, max =3D +0.00 V)
> > VCC: 3.28 V (min =3D +0.00 V, max =3D +0.00 V)
> > VSB: 3.33 V (min =3D +0.00 V, max =3D +0.00 V)
> > AVSB: 3.33 V (min =3D +0.00 V, max =3D +0.00 V)
> > VTT: 2.03 V (min =3D +0.00 V, max =3D +0.00 V)
> > VBAT: 3.18 V (min =3D +0.00 V, max =3D +0.00 V)
> > VREF: 1.79 V (min =3D +0.00 V, max =3D +0.00 V)
> > fan1: 747 RPM (min =3D 0 RPM)
> > fan2: 745 RPM (min =3D 0 RPM)
> > fan3: 0 RPM (min =3D 0 RPM)
> > fan4: 0 RPM (min =3D 0 RPM)
> > fan12: 0 RPM (min =3D 0 RPM)
> > fan13: 0 RPM (min =3D 0 RPM)
> > fan14: 0 RPM (min =3D 0 RPM)
> > fan15: 0 RPM (min =3D 0 RPM)
> > fan16: 0 RPM (min =3D 0 RPM)
> > AMD TSI Addr 98h: +49.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C) sensor =3D AMD AMDSI
> > Diode 0 (curr): +56.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C) sensor =3D thermal diode
> > Thermistor 15: +52.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C) sensor =3D thermistor
> > SMBus 0: +56.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C)
> > SMBus 1: +56.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C)
> > Thermistor 0: -40.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C) sensor =3D thermistor
> > Thermistor 15: +52.0=C2=B0C (low =3D +0.0=C2=B0C)
> > (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=B0C)
> > (crit =3D +0.0=C2=B0C) sensor =3D thermistor
> > intrusion0: ALARM
> > beep_enable: disabled
