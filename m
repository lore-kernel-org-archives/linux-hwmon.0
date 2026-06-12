Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F3D1F91D6;
	Fri, 12 Jun 2026 03:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233730; cv=none; b=urAfrV53NK57aV/jXwnEgHUdnaVhLcULIQ7zyE3hhgSNizzyEXdUT5AEtOB9cchgq30sB+TryEgaNliFW85+0gEqEqUDRLb+z87CZxj0OFupLv+UvQNgMsFhxWWXW6JJOTkK0Tr1irrGZumFH9SSDei/5lqrT9ZXSp6TBGrdBTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233730; c=relaxed/simple;
	bh=IUCdBT1RHDdnOU5Ymgefh3lSiBYmm8ptUnsSfE9f81U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fLxffjv6Sm2nGH9bssu4+1y6uVi1/NCyVbTWuO2fo4sFXGSD50OZBLqcaB/PtnZl0NP/r7N9mJRndSnDvL8prXadV7g/Wgj8fpdCU62PDLoJXmdTDJK64dQpevJYhf1KuAa3YMN5EQWABBQ5doNzKgxota0R/LvMu8Gom89aS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwi4QO4N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwi4QO4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C931F000E9;
	Fri, 12 Jun 2026 03:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781233729;
	bh=IUCdBT1RHDdnOU5Ymgefh3lSiBYmm8ptUnsSfE9f81U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwi4QO4Nr0Sl25eJqno5CRLfqS31XmpzYHLR2wzBf5w0DwwMjMibeKSN+q7WC4y3i
	 ziaSlHtJ82KAVc+jXEKYndAshl58eTS8lGBXYLpnFUFkgTOXeDv2BaKbBqFwSzS3FB
	 rbfIARbCcaUz1IgqR6DWa5C4iVum4dUmY5TGDjeoNtBCrWGrJtPyanGJKNE2+6mEjI
	 x60ZdX/lWVVlWQM6QRgIz/A7I7EaQ8a7sRBguUBZNrZIIyrRE1B9kUkv/hnIgLLQl/
	 TKQfTei3F2tVxatJKL/4zAyfnXFqFBlxxDhuDq9UnVhWEd7e5atEzWnq/uazpp3NFC
	 CSzCnoSawjbuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: Add documentation for SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612030304.5165-4-zmzhu0630@163.com>
References: <20260612030304.5165-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 03:08:48 +0000
Message-Id: <20260612030849.46C931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612030304.5165=
-1-zmzhu0630@163.com?part=3D3

