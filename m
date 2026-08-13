Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051FF3B42E1
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613113; cv=none; b=M9P8gFnWzynhlhkCZ4eKxbtkVVJuqCkj05rn0UvqV8rhdK8/v71FRHmh1sWQba3DG6uqMyn/i3dAnnsJIptz/MYRWPoSmOOEHhR14pnRplqennqByqwZqDdUTNDgpHq/SoHeFuzuV5tMHsYOcdWbIp+WKq8iNQrtVGT8xZhm0TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613113; c=relaxed/simple;
	bh=tLAygqs/QWAnQClhLs3SGOm428D6nPASkPv1LaymrzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NcOUgiAKeXn+TANr8uRifRvBwJPGtVTT0Mz0WuCGzmU8Q7x6H6Ylm2/KU0AzPI2bnYwKqrZAMCXdiXfixOcDL6W55o24cLbq6mh2PRVhzRPxnyEyItcOKFgvv6SW3wwNPiqjDAPxKVt8ywW+LrF1nSY+3KMYi7YBoLn0iCL0DSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBYFTU+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBYFTU+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8BB1F000E9;
	Thu, 13 Aug 2026 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613111;
	bh=tLAygqs/QWAnQClhLs3SGOm428D6nPASkPv1LaymrzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JBYFTU+GwQei6vBcOh9Zu96QKfv3NUOg1B4jY1RwUTMzAzBByiFzgAV0rlQRweVRk
	 CGDIL443d2LM2yjWaP727LpeuXkZo60eCcL6qDlNT/H5Ic+ypBWnhuWBuMQgxPNZV9
	 Rtwt+OM+IoyEv9NzRkz1auU2f90RxR67rdYOE+jtCESA6cUMgvIQD8H6CrBxT4cZEW
	 iplcUD9p8Wwfmt2v0ngnKjmLcQZsQXtodxYTJcuWGHcrRfxNByIyo7YbA1F/c+kB4Q
	 qUeVk+yTvUkraR+rGkp/sjCBwU5OJUvGIfJHyd1reuJF4fGpFPBVC5EGT/mUv0cgo3
	 Hky4wHCE9ISzA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2] hwmon: Add fan monitoring support for HONOR
 FMI-XX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Dubrovskih" <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260813091411.1186193-1-testname142@gmail.com>
References: <20260812192242.859307-1-testname142@gmail.com>
 <20260813091411.1186193-1-testname142@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 09:25:11 +0000
Message-Id: <20260813092511.6F8BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
> It returns a status byte and a 16-bit fan speed in RPM for either of two
> firmware channels.
>=20
> Add a DMI-restricted, read-only hwmon driver using that firmware
> interface. The driver deliberately exposes no fan control or direct
> Embedded Controller access.
>=20
> The interface was validated on firmware 1.09 with fan channel 0
> reporting approximately 2500-2800 RPM. Channel 1 is readable and
> remained at 0 RPM during idle and a short CPU load.
>=20
> Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813091411.1186=
193-1-testname142@gmail.com?part=3D1

