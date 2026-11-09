Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219675;
	b=MWvYJOl6Lt+49atuuKKat3TFsSZ2UR+V9yeGXedQeJNBjV6OUj9fKKdBdlwKmuUzT3aI
	 h2/oFpWOp3XBNMkC4pK1W+3fARoFO3OfxM9s0wpfrRiOA2+XXQ8girjz8HFwb5O/dKUKx
	 qKqQbUJSrwQYejNyuNo+DpY0liQQqmv5KYIIJc4sJsUvA7jrFTidDiQ1REovCgilaoY3j
	 px9DOo1Kl/CW1sR/76aNQBdnmHJXGMeCn82ErkmKfRxxc0CDVOqOOxEEfVK9eISxzLUnr
	 fB/5GVB3LtTTRpLIM71D7SbenUJR1XAB/RPneg75qXA0p1cDXlAjNR/KjDDMbfArXXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219675;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1lmnKrCRGnWdgHALE1tFYRZB2xoEDokDnUQcROUZcKc=;
	b=YVbmRBfst6YXDr56EGaPcxDgqaOb2PlkS8t+2Z+YGZvvsrLKVTaNbOm0heV7OA9R66X2
	 LkiCQQ2ZeOOVAPKn2jpHTj40zcGSITzssXr3E5N+4iKEjhlPR8g13GpVJ8JXcQMOPtffv
	 YRbrBdPu+pN23EEht8RYYgRXU2c3t3bwh/JIntEJ+lW0rtVyMsrKDnK3kDFoGbVA7ItaE
	 46NKBjk3+oK7A+kpc1Cnw0CftqgFfpdVrrCZaSES4xZVlYNIuFTr1RcynedWo+kANzCZz
	 JNmMKu8K5LJUYuof169SP+rN/iTgFYk3sZrX5nnRyn5Sy9pDQreu5ytk5qpS/qLUoyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfg1aKMd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D6606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfg1aKMd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349C91F008A1;
	Mon,  9 Nov 2026 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219674;
	bh=1lmnKrCRGnWdgHALE1tFYRZB2xoEDokDnUQcROUZcKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfg1aKMd2vz2HIIEjw+2hr0Gb9Da/CiBxrMjxMUShpVHPL2DPANkBYrhSISk0LtIA
	 p5tO5MR5AneM8p8/HM8GsnVFPjfswJ4wu/39egoqCjhquk7lWzkoAETcctCcRpxggG
	 QVaXDK27hV83pigetj2K7QR6ZFXsMtHk011QqjzH1Fj5lPL8tlB6vlg2s6w1SVkG/z
	 t090tM3Zj2r9M/cFnwnkxMXGmr7QWQ+ORrDkcIdi3hSH1mP/pH5/QqL9er/ay2hsOb
	 XxOa5alTwJamtSXylyZe+REslhw59zLA921Vni0RbOECWgmiT1Ku2eb89TuRQAwQyj
	 xLoZNowOhCBTQ==
Message-ID: <sashiko-outbox-204802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Bound 16-bit fan limits before conversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101726.16875-1-zhujun2@cmss.chinamobile.com>
References: <20261109101726.16875-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:21:13 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> FAN16_TO_REG() doubles an unrestricted positive long and adds 1350000
> before dividing. Large fan limits can overflow these intermediate values
> and select an incorrect tachometer limit. Converting LONG_MAX can select
> 0xfffe instead of 1.
>=20
> Apply the same RPM bound used by the 8-bit conversion before doing the
> arithmetic. Keep zero as the alarm-disable value.
>=20
> Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101726.1687=
5-1-zhujun2@cmss.chinamobile.com?part=3D1

