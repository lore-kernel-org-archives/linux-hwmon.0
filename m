Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520303546E3;
	Tue, 16 Jun 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605858; cv=none; b=PIuDFjxzA7jSgtcFSIO3uxYnySuDEehyj2IRk8iBekqdUmq5Qtiu3LRVoSNNXRTgPz/X07qQSadZCrXZMeYjAGFPfgwp4A8QIX5JXPV37/SRI5zVLSJWHbFuy6yKAmRgJnRWFNUgZkXz+iBf2NlgxAulUsTDTNFkgvflvdmC5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605858; c=relaxed/simple;
	bh=FwC59B4n0rf5OGJgDzl9cyHnls6ke/WWYBAyLmv+7gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QR7krIkGRBEfQEr3+fH1SqGYV/1ZIRm7S+j512QyIIf/TatoaAmkTqPexl2hSIsx9ywP5+AvcA7pj+EpEOss8qJ9LjrKa5NpolDWE7NJ7cck9otpwdoO+IZsEkeh4WhopxUa+lGUleiO2BeIFG3a5NLWan8PGSerNRnz04LyGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0phtaJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0phtaJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6161F00A3D;
	Tue, 16 Jun 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605856;
	bh=FwC59B4n0rf5OGJgDzl9cyHnls6ke/WWYBAyLmv+7gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H0phtaJn/lZL+Gaioo/8scIgU1c0Y5hrikbqp9MQK7l2HUt6tS0inRk4Ir6u9u+aP
	 5WqqB0/f9ttMvqFTZV8rebA911Su7EDHqbNe6tM7GX0GErN8sshLvTbsvjDRAqs3sP
	 7yHElXO1GdySkuqT+gGcys1kURHh/DLkK0GXM/V4ZQ68ltgnz4swwM5sOXatVH7psy
	 xnRHCd3enQkBUVVt86R5GM8Pwc60OPyE7l574leThLexMTrJvmRknvMG1zP58OSbXY
	 PZyWFcXhaKaVLUv19c+aTNo3xQlxfwiFZ+IOTkt5mLPC7giQbu4McI+SobGucc2Utw
	 yaQsM79qQfDvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/12] hwmon: spd5118: Add I3C support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:30:55 +0000
Message-Id: <20260616103056.6F6161F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a regmap config and a probe function to support I3C-based
> communication with SPD5118 devices.
>=20
> On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
> require an ACPI or device tree entry. Device matching is hence through
> the OF match tables only and does not need an I3C class match table. The
> device identity is verified in the type registers before proceeding to
> the common probe function.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D11

