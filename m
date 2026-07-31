Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C9381B0E;
	Fri, 31 Jul 2026 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498177; cv=none; b=LKa6/0z2I6UHuGib+mf8bU6Dckj5e40ol4PYa1geRpejs8qinY2mtz7tzbOgsQBiERsemRJ1PYPLsVudGJpKt68xFrQhMeTLzy6F9B6qxJflWeCn1y/aifU/GRfW0o/xLv82LoMbAaCQx9kPcoZDuovWTukB20fv7UkjgRC5B84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498177; c=relaxed/simple;
	bh=wdNKCjACD38n4XPMHFkGxjFksGgvJWvF6bSKId6TdTA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/AGfpa28EQn0nw2KYOWQCSmy4r1dEQ77tfuKQ66oCsGEfPPpgsgHwW8E3ZWDNkxcYqAnuWzixja5lV8V6NJQ7+txUGkeq4a6QBk6GsEOj1HqKwrRE63OguER0IYwUTyt20FCDxNPKaFYn2BlnlZya0BZVF5gvAx5HWtewnku+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkigvcZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkigvcZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E175D1F000E9;
	Fri, 31 Jul 2026 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498176;
	bh=ofWj8oNH3vGN+KN3dtNp5IyYVff6izMtUknjVnqbTSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fkigvcZCc5lWVLfo7PvY/I23A5CPLlvVLRMZ6gy6aDYkhCdXEvaZkb6MrqQYTvm+d
	 QNZIX6+avL2Rz4U4ouHT8tjZ31ztYkn4KvMPyq8u7WPRbkyhmxpXsLrLddUfXGIAb5
	 1VgZdNCCohEAn5fWABP7yKD0q7OQXf1fOPxt9DLAeN0uWseCY0CG79tMNypBj9pMi/
	 JfR3tcRKKSI3oeYfG1J7JML6ZwPVJcjIzY8ufX5IFeL/S1oTlJYTPusbaOEVlegpD1
	 6/PkrapgPJHtG9uCLc0jysT47WeIUAVwWqbgeov9ffIaZ1Y8h3AKwGcrqJA6Iutvgi
	 1F1ZN8cyYKn3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731113007.145322-2-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 11:42:55 +0000
Message-Id: <20260731114255.E175D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema Constraint Bypass via incorrect `items` nesting for `reg`=
 property bounds
--

--- Patch [1]: [PATCH v4 1/3] dt-bindings: hwmon: Document SMSC EMC1402/140=
3/1404/1428 ---
commit 370ec6fbb759eebe7152f9544892c617f0745163
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428

This commit documents the basic hardware layout of SMSC (now Microchip)
EMC1402/1403/1404/1428 thermal sensors and introduces a new YAML device tree
binding schema.

> diff --git a/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml b/=
Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
> new file mode 100644
> index 0000000000000..d7873a37c3295
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml
> @@ -0,0 +1,203 @@

[ ... ]

> +patternProperties:
> +  "^channel@([0-7])$":
> +    type: object
> +    description: Represents channels of the device and their specific co=
nfiguration.
> +
> +    properties:
> +      reg:
> +        description: The channel number. 0 is local channel, 1-7 are rem=
ote channels.
> +        items:
> +          minimum: 0
> +          maximum: 7

[Severity: Medium]
Does nesting the minimum/maximum bounds inside items for the reg property b=
ypass
dt-schema validation?

Since dt-schema decodes reg into an array of regions, numeric bounds placed
under items like this apply to the array element itself and are ignored.
Could these bounds be specified differently so they are correctly enforced
during make dtbs_check?

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - smsc,emc1402
> +    then:
> +      patternProperties:
> +        "^channel@([0-7])$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 1

[Severity: Medium]
Will this stricter bound also be ignored during schema validation due to the
items nesting?=20

This could allow an invalid device tree, such as one defining channel@5 for
smsc,emc1402, to silently pass validation checks.

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - smsc,emc1403
> +    then:
> +      patternProperties:
> +        "^channel@([0-7])$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 2

[Severity: Medium]
Does this maximum bound for smsc,emc1403 suffer from the same nesting issue?

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - smsc,emc1404
> +    then:
> +      patternProperties:
> +        "^channel@([0-7])$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 3

[Severity: Medium]
Does the maximum bound for smsc,emc1404 also need to be adjusted to avoid
being ignored by dt-schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731113007.1453=
22-1-clamor95@gmail.com?part=3D1
