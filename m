Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B047FB0C
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163171; cv=none; b=tEjmE/Rjb+/YOhIdRhTP2p2+Wqi+dMtmC7cusqs36fvBlmQsTWUkXctwQECUG6iYiw/WYrLlSLFg7U0o/0Su9BriKH/pveNpyWe2EgvwR3EZmAerj7GWWB2IR8Iw9fZlx/DUQzRJS9Wlme9d6ES8yemFMPJv2rYUv6WRNgDCBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163171; c=relaxed/simple;
	bh=a1Af4MiDH+uTFG03V32hvMKo5z/SrSIzYTuXmtlsRgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nxfl7wp4kJidT9ZOxNq8rHpQUSCQmmkw+oWiiE92fjTBa7JP3N1xIyrtKJbdb1TPfex9YNfHg7hE+wMdX+yrgYj1dAO9Uumn80v+nE94OlmDQuoe7Yd0QHGBsFfKP0ZpyGdHEzCrJSLaSxP6xJ6xzYkyGnsLHyXQGXI6zaLBsWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB4YiHTY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB4YiHTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BA61F000E9;
	Wed, 19 Aug 2026 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787163169;
	bh=a1Af4MiDH+uTFG03V32hvMKo5z/SrSIzYTuXmtlsRgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XB4YiHTYCCkksxgcsd6ST6r9r3SJvFntoen64oWyZhe7g3ph/vpcw4Zar2qE6CiVw
	 7snPlrMfhHwxHCJUVNS9JIHDxxIYm1+QJ85Ie7Zf+aPZG/yffwBG/5nkHf89jE3EWR
	 0tvqlpiQxtItV9BR9Tu5hGYSk7Ui6iKaCO9Ui4Yumup2xJYnGucQHSXi5/IWjdtyKy
	 SBwZ5/h6t/hY2Jbz1bsmRv966ZrS53Y7Ing91v9c/4HkUpkzyNjIP0wiWfg/d627Ea
	 LrMRZ7k1y0hgsdz+NPoE4y6H8ORbQRkwqo8RKiGnUOFGFHLhYGns933IGTiH1eipCI
	 L2KOabQfy2UaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (mcp9982) Propagate one-shot polling errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikhil Gurudasani" <nikhilgurudasani314@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260819180701.34797-1-nikhilgurudasani314@gmail.com>
References: <20260819180701.34797-1-nikhilgurudasani314@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 18:12:49 +0000
Message-Id: <20260819181249.96BA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> When a device is in standby, the driver starts a one-shot conversion and
> polls the BUSY flag before reading temperature, alarm, or fault data.
> The poll result is currently ignored. Therefore, a timeout or a
> status-register read failure can be hidden by a later successful read,
> causing stale data to be returned as valid.
>=20
> Return the polling error before reading the requested attribute.
>=20
> Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819180701.3479=
7-1-nikhilgurudasani314@gmail.com?part=3D1

