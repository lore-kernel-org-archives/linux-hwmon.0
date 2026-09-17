Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6916C4E06D9;
	Thu, 17 Sep 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646883; cv=none; b=Aqf9CTAJ0nJr0iNeON2EkRvC1RjKeEFwJYiTPG3a5+ObnzQfEHYQzB6F70pw1lEzLhLWjEOUD+Z3v1tEKOzcy9GazCTC4DM8QPQ7mpcc+uFmsfIeUOPth7dNk4eCgyw2xA+t18c+/cz0x67sRZ1aKguP+7wKqgw2pCkzcUuRasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646883; c=relaxed/simple;
	bh=nxSNZhdIMgwAZC7IF+OIrxWertJoTZXLhFAyzs3PCgI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UQJWRphO7gZWcvZoyTrbIeqBeLrC5Fx4S8D4Vg/yAob9sw9XKnRBhDjoUxoAqi+hegn8O0I8+/Jz4zmA64EwFWnGjihFRgfNhXMatEoCoz8dKE91DvmRWWT449vHWgFASXg0HS99x5qeO08DWidJwJEg62JMMcgQARHdZ8WyOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM82i5C1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM82i5C1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4D21F000FF;
	Thu, 17 Sep 2026 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646871;
	bh=lBfpMv2unqo4FFtUis32HKzFNTyVUo9Jne9hbWifvb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AM82i5C1WL8x/+SIRT8qTGTi7ZuBpEQ6AdI9TxXUMMCGvMEB9dHpMOkOAhcMDgkCU
	 K/3FIYVA8P74RJmpbArFDvPIFoOh9YZzi2yg7EgGbKmhV3hP9YBqWe5QhuVi+hJbva
	 jR6lscffGN32IuEE9tJz7XC8D+1flkbrg9KrgYE17FkU48PyLv+cfzDVALgNJGAXM+
	 1t/wJvXcfFM7i0HuISply2Dhw9S4+eKXm69TEM4QbpLcQ2u2XUDar9hiNy9A3iUtrB
	 uQBHavuE06Ng7hcjGORxO50h/rG6FpqPmJOoyYA+SbJ12oW+FXh9MDaZ6DKhznLKLB
	 di25p/pdzVTLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: vexpress: drop the obsolete hwmon
 and regulator text files
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917115818.540344-2-quchaosheng000406@163.com>
References: <20260917115818.540344-2-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:07:50 +0000
Message-Id: <20260917120751.7C4D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing required properties regulator-name and regulat=
or-always-on
--

commit a3c16ba2973ce68a883eb4ccf0647aefc328d59f
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files

This commit removes obsolete text bindings for Versatile Express hwmon and
regulator nodes. A note regarding fixed supplies is moved into the existing
vexpress-config.yaml schema before removing regulator/vexpress.txt entirely.

> diff --git a/Documentation/devicetree/bindings/arm/vexpress-config.yaml b=
/Documentation/devicetree/bindings/arm/vexpress-config.yaml
> index 41c53e3acc12c..b04e8e0521815 100644
> --- a/Documentation/devicetree/bindings/arm/vexpress-config.yaml
> +++ b/Documentation/devicetree/bindings/arm/vexpress-config.yaml
> @@ -139,6 +139,10 @@ patternProperties:
> =20
>    "^regulator-.+$":
>      $ref: /schemas/regulator/regulator.yaml#
> +    description:
> +      If regulator-min-microvolt and regulator-max-microvolt do not both
> +      define a range, the supply is treated as fixed and only its voltage
> +      can be read.

[Severity: Low]
The commit message states:
"The regulator node refers to regulator.yaml, which covers the generic
regulator properties the second file lists, and all 13 in-tree
arm,vexpress-volt nodes set both of the properties it calls required."

However, the deleted text file Documentation/devicetree/bindings/regulator/=
vexpress.txt
explicitly listed these two generic properties under "Required regulator pr=
operties":

- "regulator-name"
- "regulator-always-on"

While regulator.yaml defines these properties, it does not enforce them as
required. By removing the text binding without adding regulator-name and
regulator-always-on to the required list for the "^regulator-.+$" block her=
e,
won't device trees omitting these properties now silently pass schema valid=
ation?

Should these properties be appended to the required list of this node to
maintain the strict constraints previously enforced by the deleted text bin=
ding?

>      properties:
>        compatible:
>          const: arm,vexpress-volt

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917115818.5403=
44-1-quchaosheng000406@163.com?part=3D2
