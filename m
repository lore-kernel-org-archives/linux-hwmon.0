Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6C423145
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777668171; cv=none; b=gIPoqCArFI8JqlfU+eKeuIVPpAEqKc1tJAoXbbB9qffzPgTcdZBdd5DtL8tFNer7+9+5W9rGasmrZe5K4udx4kGmEYaMuEFvZD4n2KZmPV+1JUw6M/+xukAT4r9bIJ5x4wyItuUaQ41xvjt7CL+h8aF5kUjW7EHD1v3SMLCwvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777668171; c=relaxed/simple;
	bh=NzWPph8q5jHkbVZrYZ0Ugobt+yC2FLX/HvnAgbBIul0=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=tvLXDar9o7IxsyER3qAjl51rpi5l3+8Zvgvd1ZGLZQYzeaPsN2PbdoExyzxk8QYFxEwU+xoSBrfQDyrN482CpsAAIonQf38Jl3ce4qPZHmXAmk3cCR/dJrgz9wK6mS6MCkdCe0nHX7krFbRaSToNwysNf0VMWuIbFSzLeHb11iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=Va+qrXhH; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="Va+qrXhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777668155; x=1778272955;
	i=markus.stockhausen@gmx.de;
	bh=UxB6cX8X5dKfuszpQAV/Ks9sUmKC11NrMFOiV/hjBNQ=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Va+qrXhHrVzxVeLAvSYrWEiyjUI/ASC7RMgThgVK901vvwpuny4BTAkH8BLHcPDE
	 FLle4EeKkaeAXnaNqzwksYyzPr6EVMvu4hV2D9Vgsrya7yffR7uRCE7/yRrMQOZuU
	 Sd/V3hbO9NNyEH89nWD5apc5yqQL+IZtUHSDJ4q0i37N8aGQ11cnLN05M3CD2vtMC
	 yqAdRcc9szqXjKfnfYEJl2Ot/VmG0ZcTMUaicBiIwnRAP9zoVn2TN07KSHjgpuQkZ
	 PLHPeCGGPYJJSnD1/QZJlF6iHTLIDhJ7nLK8GsSHjUX9gRdC1T4OU0Y442ocrdy3W
	 x2Xmgg9/iGWmKZ0T4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1vtAd70E0g-00MM9g; Fri, 01
 May 2026 22:42:35 +0200
From: <markus.stockhausen@gmx.de>
To: "'Guenter Roeck'" <linux@roeck-us.net>,
	<sashiko@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de> <20260501124540.0C11CC2BCB4@smtp.kernel.org> <039601dcd973$bf191230$3d4b3690$@gmx.de> <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net> <b9e2db74-d2c7-4ca6-911d-0b59c68cd187@roeck-us.net>
In-Reply-To: <b9e2db74-d2c7-4ca6-911d-0b59c68cd187@roeck-us.net>
Subject: AW: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Date: Fri, 1 May 2026 22:42:34 +0200
Message-ID: <022201dcd9ab$0aba9fb0$202fdf10$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJBhqTliQrjdU864ZtiUq8f1B8xtwFPyIY7Ajaa9PgC7qH24AKgdlRgtOeayJA=
Content-Language: de
X-Provags-ID: V03:K1:rr9nsTFpBgoQNnQAD3GJdnV8JvTJhnz8e0I05ezKwQVw/u9HK+n
 Wy7A4IkvzWhSFjWzwpSwg2T0rCE5xa1EvOYUap+o02oE/HY7mbNVfAXbWZpPUJQQts/EUuE
 MWAWBQl4d07k8iE8b9ozSTvmopwWFK7qvQBF32sOvohn6T9prjxMJ4KaBUrRslKgUJRfHi9
 AN5n0Iiyi+Jxe0sKsp8AA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1gyjdChPz9s=;pqwtx0DIrzwWaWV0T9KTzlGVOly
 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

> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> Gesendet: Freitag, 1. Mai 2026 22:14
> Betreff: Re: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert =
polarity
> =20
> > So this will need separate patches:
> > 1) Fix set_mask and alert handling for AS6200 to be low active
> >     and to report the alarm correctly even if it is high active
> >     (xor config register bit 5 and 10 (translated to 2 and 13)
> >     when reporting the alarm).
> > 2) Fix lm75_write_config() to add set_mask to clr_mask to ensure
> >     that the bits which are supposed to be set are actually set.
> >=20
>
> Turns out the default value for AS6200 has more problems. It is set to
> 0x94c0 which claims to be "8 sample/s, 4 CF, positive polarity".
>
> 0xc0 reflects the samples/s. So far so good. However, 0x94 is wrong.
> It sets the single shot bit, effectively disabling the sensor, and
> it does not set the CF bits as advertised. Please change the default
> to 0x10c0 which reflects the intent more closely, except for the
> negative polarity.

Understood. I still need advise about xor during alarm report.=20
Do you talk about this code?

  case as6200:
  case tmp112:
-  *val =3D (regval >> 13) & 0x1;
+  *val =3D ((regval >> 13) & 0x1) ^ 0x1;

Mabye totally stupid but this bug and the deep dive follow up
hits my brain a little bit too hard.

Thanks.

Markus

