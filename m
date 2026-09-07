Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8400E3E6DEB;
	Mon,  7 Sep 2026 03:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751991; cv=none; b=PustV8uOq8Tvpx2U4fnxsvYTc/5i8XYfD47lHUh1IxftEQ1lXq7GnU9K3JZEXe8L+B7wHPQKl2Fl14vmZmtARHKB9365N0VzrJWZ9a1vtMW+zFLCsMxcoD75k0ouZng1+RKkiiLYprafzFq/YjdHEyXmbwseu7Q9zib3XbxiyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751991; c=relaxed/simple;
	bh=kqFkIoZDFJ/1a0GmpI1hT1bxDn8O+PHAWTeA+A7rU94=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i0j89c4EDFlxpiz+EoLzrPaYv4agreYJr+zGAF1zZocPggGVBdRxKpngkpCY7X+00nfdMpMP/IFQ9zEQEsdHMfZ3mI7ILe9Y5vbP/rzqn9lGOGihHAWU448GERSsohKI/gUJhO/t6ogyZvhA/fqhublLuypbhFBDCA0uAHKb5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjZGhVqM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjZGhVqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1D31F00A3A;
	Mon,  7 Sep 2026 03:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788751990;
	bh=kqFkIoZDFJ/1a0GmpI1hT1bxDn8O+PHAWTeA+A7rU94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SjZGhVqMpYZ5lWlz/qZY5BrScTzy3rCbjg6k3ffhS3Tjtadn6ZXA2GxM9mfhWSAkn
	 BXl4nj2Vyq4Hb7TkpLT2vTKaGG06eYWnjFY+CpLT0w9vpQIYnZmHpkx1AJddJxGok7
	 k8D8vrcz+Rutt4U7oNW48h/4RRM/tsfAbUcri9ZKCCWTLBjZKYWpxR1bXZ1ORv7Owl
	 NPEiJ4RgvtiZO6HrSvXv/1tCjb2QngTFsdbtEw8ZK+MeTEhz/6rDzedrmVd0zgFMVn
	 998mwMNCtEReK92Kvtw6xld1vzmnTEU1tnls6KpJUwch3Ej41ZAroBwjH3ZmV7H2iC
	 xLqw/92u2j+mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-add-tda38740-and-tda38725-v1-1-e2db1b2566b1@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com>
 <20260907-add-tda38740-and-tda38725-v1-1-e2db1b2566b1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 03:33:09 +0000
Message-Id: <20260907033309.BA1D31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `$id` and `$schema` properties use the `https://` protocol i=
nstead of the required `http://` prefix.
- [Low] The mandatory `maintainers` property is missing from the top-level =
schema.
--

commit 394e1f6fb8099cdca94075856e1923221cb81dae
Author: Colin Huang <u8813345@gmail.com>

dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725

This commit adds devicetree bindings for the Infineon TDA38740 and
TDA38725 synchronous buck regulators. The hardware uses a PMBus interface
and the binding documents custom properties such as vout scaling.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38=
740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.=
yaml
> new file mode 100644
> index 0000000000000..02380c09c5f55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: https://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> +$schema: https://devicetree.org/meta-schemas/core.yaml#

[Severity: Medium]
Does using the https:// protocol instead of http:// for the $id and $schema
fields break the schema cross-reference system? Modern dt-schema validation
tools rely on exact string matches for these URIs, and an incorrect prefix
might cause dt_binding_check to report misleading errors or silently skip
validation.

> +
> +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator

[Severity: Low]
Is the mandatory maintainers property missing from the top-level schema?
Device tree schema files validated against core.yaml are required to specify
a maintainers array (typically right after the title or description), and
omitting it will likely cause dt_binding_check to report a validation
failure.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-add-tda387=
40-and-tda38725-v1-0-e2db1b2566b1@gmail.com?part=3D1
