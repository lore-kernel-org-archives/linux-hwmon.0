Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584554;
	b=A05wJj6GotnIXC+WhALeoei1/tjAjAlUUJygAhIW+LXfguE56DQrysAxkV5gDN46RVap
	 9b0l27+EhVUEbCDoTiWtoyCD4PDCyXGbbqLIXbpXvHmpllhPpwTLdMXxuu+SUXcV7OwSS
	 Hlnbw10gOpPbI4yhxesogV7DF521z0R1wB70OeWiI8y3l20OZ/xvqLHPt3CcKy53N1CxX
	 LOf1YbCrQILFb/GEAgro1bCAHU5UgK+ScM38mCTDN//+5VFPu8cbufNFZzzEx+0qWIT/L
	 fZu+OA90Gw/0lw9HRuDnZqPlXqhxlA6gldL4WoYJDJOUsoIPfpFOeRuok2vNIcceN9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584554;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3RyTysMufPLRbCA+1mPmcvyyFhRGAlYKI/2UaxBbcqc=;
	b=YKq9p3ONbMfQn7SZIMkzGSfid+QKIuGUzZgRYHBqASmnm+rex/J1cSnbn2b2W9kGgmm5
	 dXw1ImKX+GrRqt4lnSFJujyZkgUtHXJivpjL9p9ffcXAyKPRZjit9WEYt3z7Q5NAiSajs
	 cr5KOGR0++Rigtj9tB8x1zaSZS8ePzhzCJ4pUWeem1zvWEt9KarV+oviDMK07XOP9JZYT
	 7f7YEHN2PE5+2Wuh+WroWNRWPHgBpMHcfPwYvYFOCII2Bm6u8McaoDVOL+QbiIlG3h6g4
	 pOi5ol3NBw1RN2fdAyWXbt5N3W272sVd3X/Ghjy40u0I2slmXmxs/wLPh6hHT6glrYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STm0DADW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F6606A31A
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STm0DADW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70381F000C4;
	Wed, 21 Oct 2026 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584553;
	bh=3RyTysMufPLRbCA+1mPmcvyyFhRGAlYKI/2UaxBbcqc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=STm0DADWpQOIIJRFNBK654eHucG9O2RdMdggwtR42QagOJIgt3N2eqe8FbYJpR1qP
	 yb/8N1O0b4XG6gx3K30bcYNvECyJyL/GmYNj5yVW71nWgtKPdoffvzSyqh+FIfHP2s
	 xibREOD6qJpNQdvbi6f080NyNy5V4oaO1XRo6i2XVU9JHtuMhCpKOv3chSKLVsZ2si
	 QE5LrZSXF8WZtO3q75dw4SFnAwJzc7DdKqyzzFXAhAVjfuA+zlzvxk+GmnCCTW9S0P
	 cDP5WqC2B6IbYeKVPIhRVU6Nqyrv5TzmnOXDBPM0v9Sa9299XqYORyMtSR7HHjMnMp
	 CFVZpHDMjPAGw==
Message-ID: <sashiko-outbox-180207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) reject short status
 reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261021120408.48495-1-yaojiale02@163.com>
References: <20261021120408.48495-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:09:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The HID raw_event callback runs before HID core validates the received
> report length. aqc_raw_event() reads device-specific status fields at fix=
ed
> offsets, including multi-byte values, without first ensuring that the
> received buffer contains every field. A truncated report can therefore
> cause out-of-bounds reads and update hwmon state with unrelated data.
>=20
> The required length differs between supported devices and cannot be
> derived from the HID report descriptor. Define the minimum length needed
> by each asynchronous status format, select it while configuring the
> device, and reject reports that do not contain the last field accessed by
> that format. Keep the published length zero until probe configuration is
> complete, which also excludes legacy devices whose status is retrieved
> through feature reports.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021120408.4849=
5-1-yaojiale02@163.com?part=3D1

