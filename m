Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF873769F5;
	Tue, 21 Jul 2026 04:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607919; cv=none; b=OoJrzwbuoqkknwcN2WYnhKBR4xEqKqVbKCRdQXK2qA5Zi81N+EefQW10LCFPc3q99CuxrtKlz0qQS2w1EhCj1mY8doW2TpQXqMod7cSKjhtyh6ZzdlknAf0NhpZfogDwGr+5YIoHaj+a0KeOB/WOgyDT63bTeA11irb/hI3khZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607919; c=relaxed/simple;
	bh=syxqgBek8SlSnen0yuAOQ5cVoxUV4ktjsKi5+0pycbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qN+eNvdcNnnUW+v06PQkDcSxU+KqbnovPLOa6QxF/Z0UDRdvywvckLhWYGglP0YSigcJ4sx27xoiG7YxoK7DC5K20Eo8g4g5OrHTiIOOtEcj+Z69HkJur250BEaogcLmOBHDtQvre3Vz5FUAZe/FtX7aKmQfye4pMkZQFaSLMfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5jgO0Xv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5jgO0Xv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847D51F000E9;
	Tue, 21 Jul 2026 04:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607917;
	bh=syxqgBek8SlSnen0yuAOQ5cVoxUV4ktjsKi5+0pycbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5jgO0XvYnsfC6VcH8nW4u9dmPoD0sIuaQt43XJJj0bxaZADuvTVyZommLoE41DGN
	 mPCI0N6R84xW/6HCuwhXceTZRaEsJsGcHgSfYTJXaF2sFNK++xt0HRbO4M/ra1uRkC
	 rHPIKIhRmZBomeQQZb7YPMq6rlT0McO7PMrRAghX1i8fA8kbdEToX+sXhEGhafxecu
	 siBJyHjPeFgIkkUpMLPDemt2kfeCRUljFpeC8PhMb3gMu491SalMQFgGpobfKhIC4Q
	 FPmjpHOGoMc234LrQphJFi08r+d3Yw6KbzrURyRFODODxxy3HgZZfegjcpv9+R89Y/
	 BojpuCUqKWN0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/12] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721040805.1696503-11-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:25:17 +0000
Message-Id: <20260721042517.847D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out that I3C does not require reading the Legacy Mode register,
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections that support 16-bit addressing and prepare the driver to
> support I3C appropriately.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D10

