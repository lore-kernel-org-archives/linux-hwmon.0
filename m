Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B1432BDC
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786055; cv=none; b=OF2m9wDV94p9HOWSmIthizbba2OKr4TC8Wz+UJNf2+euMmLjSRl3c8hzmCNSLw6qAeyQyHtoebQeUzJjlo0Ym+L8brL3Uql4s+3k0NQy5YG4yc1q7Gv0ZS7BUuKM2lOt0xwE05HJsXQRWHv4tsJGgTcTJSn+S0mYUK8gylxOFRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786055; c=relaxed/simple;
	bh=qyUAPkUynhIrBkl64/zyQ/xbw8RBqjNtGSrPYwX/Vi8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tzjE6qL3QLass/b/8LOKwtYjLVGuDVMkMLy+0mzSvUpM58SfTuPgdGasRpSw3pGsjz6BWGdC6ooPep2QW8dm0jJvRUMyHv9IXAgtn3weRqrvPX9ZOjQve6Fq4fTjOT2trasKKqHUkhQNzx9NSMtmGqG5lDCGlDd0jwohbawMkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzekm7tF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzekm7tF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11161F000E9;
	Mon,  3 Aug 2026 19:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786053;
	bh=qyUAPkUynhIrBkl64/zyQ/xbw8RBqjNtGSrPYwX/Vi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzekm7tFPhJEDlkKlwodA0TLihlwk326AHUif1nIPKsB3/DG937rPeGoQZd1qqNVr
	 4XJ6M9vS5seHkV5vVD/g3XD7pYzLDt3OTbB8QUnQ7iUSSTlWtsQ5zIrNfY1vRHq5Su
	 Ws5xAxBakRLtLNASPCH+l9iYiHfe5jITTPCbitGE+EYImu8u+5JaJZ2un0XqcglgEu
	 ct297AB99jqRlCIQmDMwcIo10i22zsBWy3T34qXoFU6J6nf+0outhWe2vCcGBEqgAg
	 1Z1nxFLjxQC+xxiWDIooiKJn19MQyqdQQrhVVImVdI/Yq+7ZXKDUKnQB88FP8KxBAH
	 Bft54RV4kWuYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) Avoid race condition during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803193033.2285332-1-linux@roeck-us.net>
References: <20260803193033.2285332-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:40:53 +0000
Message-Id: <20260803194053.B11161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> pmbus_write_smbalert_mask() is not guarded, which can cause race conditio=
ns
> with concurrent sysfs attribute accesses.
>=20
> Similar, PMBus accesses in pmbus_init_debugfs() are not guarded, also
> resulting in potential race conditions.
>=20
> Add guards to both functions to prevent the races.
>=20
> Fixes: 221819ca4c36e ("hwmon: (pmbus/core) Add interrupt support")
> Fixes: 1e069dfd96dfe ("hwmon: (pmbus) Add debugfs for status registers")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803193033.2285=
332-1-linux@roeck-us.net?part=3D1

