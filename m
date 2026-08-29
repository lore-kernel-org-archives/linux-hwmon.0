Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B481E2AD2C
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024032; cv=none; b=rCDrS0cZo9F94B5qu4dHQjIkmiu6Ns8nJOkqy2aqJJY/kVmaQjKaeRyydk3lFTNoNQcWhA3p3en40jaSaRTl17TSYka3d+fE9Otan3m14ip+KE5bfQevHILilCOkJlmyetReQagZlowxJ/hpJ5szD7HTrV+y/1DWs/tYtuozDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024032; c=relaxed/simple;
	bh=hcEnCg5dGPMDpkRiYKp9SL0hCP46O3INI8WJrcUxQTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=no11eAGC3P+/odfsoAz30TwBlKvFzif3rZ32qSy2cuh7bOH6mqwuBStrfZBaHICalb8i7PqqGSf+MvjbJobbV1MV/wfwdXxSU42/IKdxN7BQRsqolN4sMLgugG62dd8gYwrRutRGH3Ohem22d/PhTbjVUugAyZYqppxTnhBd/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d91VWAXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d91VWAXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7750D1F00A3D;
	Sat, 29 Aug 2026 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788024031;
	bh=e8vpNVB40jFuAQgY3/eAkTIezUnCwF0wqUhxIspzIE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d91VWAXeKJFLP8VQwfMRwCpbOnydESi4lk3SuHU4V6i0pVh6/NVBSgPJUUKScig7A
	 0qx5aXgYSDue7/CwtGrY6OIw8nFD3kKtPanzBXxFceTgox1jfV38HDdHM4KZKHs8V9
	 Dp5JAinn/7A8HmDmL/tEm8dPxZuLhyzliBQFKBekXYI4wqXcpaEV395GFHsjey7jmK
	 GoSpZdYZaZSIN6K0XIWypQ1wbgjqDOW9dhlZlQtTnysQlVeBACo0eVZt5YyuNe4gBH
	 Dxthli23HoFk3IUus2dK+Csw29ObqA3gWHVChHzxCEnOoH8Wi/q2UmmZSuDc5ofZeN
	 hDjVj8LuP+VGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] hwmon: it87: describe per-chip temperature
 resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829170545.33401-2-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829170545.33401-2-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 17:20:31 +0000
Message-Id: <20260829172031.7750D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused macro NUM_TEMP_OFFSET.
--

commit 8f31c77fc165d2fa01f14da71c4de721a4613e71
Author: benoit.masson <yahoo@perenite.com>

hwmon: it87: describe per-chip temperature resources

Add per-chip temp limit/offset/map counts and wire the driver to use them.
This keeps existing chips on the previous defaults while allowing newer chi=
ps
to advertise larger resources.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 87edb1b6048bb..1c77f6c97fc36 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -282,7 +282,6 @@ static const u8 IT87_REG_AUTO_BASE[] =3D { 0x60, 0x68=
, 0x70, 0x78, 0xa0, 0xa8 };
>  #define NUM_VIN_LIMIT		8
>  #define NUM_TEMP		6
>  #define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
> -#define NUM_TEMP_LIMIT		3
>  #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
>  #define NUM_FAN_DIV		3
>  #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)

[Severity: Low]
Is NUM_TEMP_OFFSET still needed? It appears its only usage was replaced by =
the
dynamic data->num_temp_offset parameter in it87_update_device(). Should this
be removed along with NUM_TEMP_LIMIT?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829170545.3340=
1-1-jerome.tollet@gmail.com?part=3D1
