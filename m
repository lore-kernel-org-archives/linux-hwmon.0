Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2A376BCD;
	Thu,  3 Sep 2026 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419664; cv=none; b=gJMH+LyN8Ezarjh6GJSSsC2RQHOCnOfA/CE0E1ubtuDPmFS/apLZfy6vG3TYIoExk0phKksK6srZMeurGHEAPvcULPkNeQom5fmNnfX1012AQEUyEUy/42l3EflXgC+I3NvRj/MzSFsIm6AWQ9w1yjVuttBnZNGm25lhuAy4C0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419664; c=relaxed/simple;
	bh=uHB9qvjbgNbxBp5ukrk9RUTK1BuUlSIaQ3YmWE1IUrg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Siu+4epL300EqsGK0HIs1lmQSLK2LobpqvzLad/sOoDtZLQH6uGq0nMdyE4GoKMofjX2+lB9NaWYRvg/ZasDQHgrq4saMmKVo3HHRb2OCwdMJJcZhTrYkv2VQ+ZBRzmy7AMGGkIAN6e3nZoPYFHgilcAHTGZFBgOXbjRJrP7BiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbodnmUy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbodnmUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668171F00A3A;
	Thu,  3 Sep 2026 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788419663;
	bh=uHB9qvjbgNbxBp5ukrk9RUTK1BuUlSIaQ3YmWE1IUrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbodnmUyfFqW7n6bfPXck9yBQAYHjzpSIDfrtEqtwNAg46gJjRp/8gUHf61EHy1/x
	 c2fi/dF/zrCY04sEQDA6AqFMbKwDIvyFk9Q1wZLhdY6yW/AgmSp6tCDImEn4sPkZOm
	 g41HfqqmesZpuF0T9M0FdyVw1tDkPuMNniLwclhEei1XvgUespfAce7C6Z5iHia45V
	 ll6FsRZhgcZejRhmkJGMlaF4rZi7YEVhqq9sp22js5bH/qX5fCQAsypwO9wqeLRmtC
	 lwRxvQMNK/7FWrSGhnOuqDQMJN4x8eJIDvp364n6R25aPsNvX7UJ3TCNKp+qkT8h3U
	 SALjM45WjFUTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:14:22 +0000
Message-Id: <20260903071423.668171F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a Devicetree binding for the temperature sensor ADC (TSADC)
> controller found on the Axiado AX3000 and AX3005 SoCs.
>=20
> The controller monitors the on-die temperature. An SoC may contain
> multiple TSADC controllers at different locations on the die, each
> represented by a separate Devicetree node.
>=20
> AX3005 uses the same programming model as AX3000 and is compatible
> with the AX3000 implementation. Therefore, axiado,ax3000-tsadc is
> used as its fallback compatible.
>=20
> Also add a MAINTAINERS entry covering the binding and driver.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-axiado-ax3=
000-tsadc-v1-0-a8a0f3b251f5@axiado.com?part=3D1

