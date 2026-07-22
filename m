Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BAC1A3166
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 01:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684601; cv=none; b=YB6RQ+/8uxwOKdahbeZ9brmQ6bOBlNKrSS2C/O5oxzWlsoRmWAH+v/RjlZOXZR1CbaAmKxDNbga0DOvxWsiaxgg2EZSawEvTxClEQZhpKgqjutFIj3xy8xmDPIYaV4A1FHxTup1U7UmT9p0BgbrdGuNrP1E5gev4mdOWnRD65W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684601; c=relaxed/simple;
	bh=vOomf8elbM52Oqpiagx+2korHSoUF3IGPrIaOjmAaDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e/mwQtMFupOA1HlgUzzU52jeakqA4w5yaHjJZMkgEbEYPZEozrAEnsCcjj77nYYOqpYcftfH9yWdDh2FDa0bH+pmBT08QQEOxgGcQm/vNQke1Lzvk3YCPX9JwZPxFbjssuv/wD9PD5aIpIk5d4sVpUrHRHvA8y+qxxGULTq7sVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhsLTD9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhsLTD9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205091F00A3A;
	Wed, 22 Jul 2026 01:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784684600;
	bh=vOomf8elbM52Oqpiagx+2korHSoUF3IGPrIaOjmAaDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QhsLTD9Kdx34JXAMp0HchCBt1bDTxO8kYeLRq2OpVss2MULrezeBOOQutAo9BW0Id
	 CRSJLDmizWJmYBHhQkJ7GAJhbqkQzxdOOVVyqxt7nnF0RWZ+5rsjdqyq8tXgECmjNh
	 99GQMvkcJRdPJ1l2LF1Mh/V35gvfk9wLAhi2Y1S3pycTpBC5YcMp4c8W4vyVTLD1pZ
	 fhr0l+eHrHOxAGFOXT+V4I8bZNNal8tbkvPbmWRJbQCKyUqZ9vFumjc4RT47XRu4FN
	 RO3JaRzW5cgR6mpjddkLCs3VSOYj4dxT39rhDqWS6vXLsfCQRVYcmU7ql9xtAy0Ob3
	 oZGn2iB2SikzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/max34440): block unsupported VIN
 and IIN limit registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260722-max34451_fixes-v2-1-bbddb18ec1d6@analog.com>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
 <20260722-max34451_fixes-v2-1-bbddb18ec1d6@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:43:19 +0000
Message-Id: <20260722014320.205091F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> MAX34451 and ADPM chips do not support standard PMBus VIN/IIN limit
> registers, manufacturer specific min/max registers, or undercurrent
> or undertemperature fault limits. STATUS_BYTE and STATUS_OTHER are also
> not available. Accessing these non-existent registers during driver
> initialization triggers a CML error and asserts ALERT. Handled by
> blocking these functions during read/write.
>=20
> Fixes: 7a001dbab4ad ("hwmon: (pmbus/max34440) Add support for MAX34451.")
> Fixes: 629cf8f6c23a ("hwmon: (pmbus/max34440) Add support for ADPM12160")
> Fixes: 2e0b52f1ae88 ("hwmon: (pmbus/max34440): add support adpm12200")
> Fixes: 479bfeba2eb6 ("hwmon: (pmbus/max34440): add support adpm12250")
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Link: https://lore.kernel.org/r/20260716-max34451_fixes-v1-1-a941b27eaecb=
@analog.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-max34451_f=
ixes-v2-0-bbddb18ec1d6@analog.com?part=3D1

