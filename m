Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA629B781;
	Fri, 24 Jul 2026 04:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868606; cv=none; b=MervH6izipqDQC5GN60wb73HbnKQbI55PK7bSXHpAQ4GuAn/npSO3ln2vUc7mZwD0RwAX/UTktWt/XCEwngaj2P0TuWTmX6bC7MzYGAp1LbDpiG0EqM4tEoX8KFqGoOohKRLspKeul1B5UVj6zYjEWfKlA7vAwVmzBMGqCd6hcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868606; c=relaxed/simple;
	bh=1J2d5JopO8Y9EFT7T1j0pdmRf3xSOtQANucQDqqVEfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L8hJKxSKUB/+TWbvOaz4EkBuUka+Fafyl75oGwwd6LmbIWI2YSDAnxRceNMpTsFwFwkAYIL0WnQNCh46f7DDSPRfgUhcWz0W2mpyqfyU0n8JALikpgUEJkQUCdwsYFadGw98gQqev8jZGqlQArWktocQGOnYJxdC9Nwq5F/Om9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngjg20lq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngjg20lq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F6C1F000E9;
	Fri, 24 Jul 2026 04:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784868604;
	bh=1J2d5JopO8Y9EFT7T1j0pdmRf3xSOtQANucQDqqVEfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngjg20lqSun+B8hFni1KScGgSECMG4mJStEMkZaIUazUtRGrzKejbLmHzO6ultzWV
	 jPoPujkoF3/q8W3KEyDWuB5hgV2oUB51cGsJuVbb95AksNhPCXcW04FUhfnU4CnZWK
	 DUjBPUw99LKqOr1pr4YQplQyRA0tGX0ECYVzt3eqVHF1OWnv3Nu4azdvcl0QrNdG/y
	 VOvB8rhsDXzyHJAKipstNr/CMA0+rbQOFFuHXDDfhPE3lGCyyC0dP+SdCAkrmqkGkb
	 eXFc0ifqRWlI6LyDMqps5Ljpqq1orsuhfPzdiZTPrPgsZ890r7IW754W8lYrwvpFLk
	 T8qjuMxS2nljA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: trivial-devices: Add Kandou KB9002
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 04:50:03 +0000
Message-Id: <20260724045004.11F6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
> that reports an aggregated die temperature. It needs no device-specific
> device tree properties beyond its address, so add it to trivial-devices.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-kb9002-ups=
tream-v5-0-9523c3ffe83a@amd.com?part=3D2

