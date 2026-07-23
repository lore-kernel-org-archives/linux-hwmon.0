Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B64D990F;
	Thu, 23 Jul 2026 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812232; cv=none; b=uzcfmJ5lFt3iHPm3Il8U9838j1GTEfPv78Te6git/kYj8AEjDyN4C0JpY4G0EzsPIR5cxp45gRVhBoDhNgcJ9/puev6mzJhLprzb/lOQCfLdsaegyH5h5xiv5yVYOEm2U7q3LhIwSCmBe4PxacWSiPH0mwk/um1rzWT42BltRB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812232; c=relaxed/simple;
	bh=d6hycfMjrJGuW03A/RGWsigaOJ7dgm46chsjz/6RnpQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OXRQGJpg7rF528kBMJkYomBEGfCd4banbx2ya5sDE/K8qLaDhjSqkBRd2omzTrVl9CrPcDpyDs8blxdtUGvBrWk/3zdDdtJu25XKHCpV9NI67xoKvE5YfI98lOASMiaWDcS4Moeb+8DUI+675L8jHWFVe/p0TScB5quvMJqwSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3b6h42p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3b6h42p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D601F000E9;
	Thu, 23 Jul 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784812228;
	bh=d6hycfMjrJGuW03A/RGWsigaOJ7dgm46chsjz/6RnpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3b6h42p5cwv/OUKE3W8AB2UGydimevZhShh/7UV7U+sxAe6vZHXr3rDrmzTc1D6M
	 yQFt2+aGEc3UPnK3EYfBrF5CsCsEBtC6g6VfRHiL38ZJcqYihGaqH3/l94dO4iavBG
	 MoF4OtWeSqA5E6k2tWAFgDdGkHUCUy7blLtxZTv5iamsa64BqGX271woe1LNET7Zrs
	 z6FOPfn162NPghCvPmNAtgp4ZJNMMGau+R96GvqBG/on5v3+A77FOya1oLyHgoQCbH
	 psRoE2Zd1WMUul8FpAB9bS0/xuriF98FqvoADlj7Xqg1FyqDvrJ+3ZSctTmbPkexeq
	 l62fmI0UUhs6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v1-2-14363c75916f@free.fr>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-2-14363c75916f@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 13:10:19 +0000
Message-Id: <20260723131028.12D601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the commit message: 'devince' instead of 'device'.
--

--- Patch [2]: [PATCH 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646 bindi=
ng ---
commit c7fc54e46661f7a5734e54acacdd691c61f83c83
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: hwmon: pmbus: add MPS MPQ8646 binding

This commit adds a device-tree binding for the Monolithic Power Systems
MPQ8646 step-down converter as a PMBus device.

> Add a device-tree binding for the Monolithic Power Systems
> MPQ8646 step-down converter as a PMBus devince.

[Severity: Low]
This isn't a bug, but there is a typo (devince instead of device) in the
commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v1-0-14363c75916f@free.fr?part=3D2
