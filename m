Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBAB3D1CB4
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996950; cv=none; b=Egxi+mIn/+TsYdhLeHf6HC5prW01MBRfm2L8lRcOigADETHZJ1CFFaJFCyJ3Rre7uHHJeUjgZdKTG3tVdQ5ex1RZ2JDI4vGSNoWMZA2Gs72K7dvX4tUeDUkwT3kv58T4/9evZQ/MDzcBEHOMPcbZOtw2e1QZP59wSONNCRo/nts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996950; c=relaxed/simple;
	bh=rcxqgC8VWVd9LOQBNm6pf+Bn/uMWsih4/ftKUQNgP8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PO421YuY2k0ZqAZwdKfmEpqFEtIowv/VBKiwfsO5bhwi8uzU4Uyssh9/zlOz79aIRPMOLx8w/RVwxU3Lzb8NI6XvvKyfIaXKoJ3E9pKedjzq07zQCZM6df3XxwmBYjL50lSfCbVx+wv9eenZeG47B/tEfKFG6SKHoJw2200Q+bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7AqYSbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7AqYSbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493E61F000E9;
	Thu,  6 Aug 2026 06:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785996949;
	bh=rcxqgC8VWVd9LOQBNm6pf+Bn/uMWsih4/ftKUQNgP8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B7AqYSbXDuCOROH4hrjYGAYCKcdt719HlXojakie67igcG1XKqZ6CcpomYbB4kXII
	 jh9GDlt7X3LPA6NrjNULbQG35fsAvReZE6umsyBI2Zxtr9CPxGuVxfuhld5A5JxSG9
	 GjsECoe7i0L4i7mtGwxK29j6OM52rd7xzzObD7FArJETrMEisZEHtMg7iERDTSu51/
	 cwY1wSMBwAX9znC6XFfKAz+bI6yUFbZMezWQRtSOfCZJol3jfCZJtB9v5Urkwlhe7R
	 ux1t016+wC2OURqL/w1KAtCvJfmKeVp48jcD1aajEUonW5n5/StzESCtH4ernw6nNF
	 ZsU22l+SlHe/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (core) Use const APIs for the dynamically
 allocated sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-2-22fee8b85509@weissschuh.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
 <20260806-sysfs-const-attr-hwmon-v2-2-22fee8b85509@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 06:15:48 +0000
Message-Id: <20260806061549.493E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The non-const sysfs attribute APIs are going to go away at some point.
>=20
> Switch to the const variants to prepare for that.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-sysfs-cons=
t-attr-hwmon-v2-0-22fee8b85509@weissschuh.net?part=3D2

