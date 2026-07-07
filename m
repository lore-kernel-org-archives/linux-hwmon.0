Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A538D40B;
	Tue,  7 Jul 2026 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452607; cv=none; b=vDEn/Ph3dVfhCnuGZwybh8ZiOyITC6oUbgz2m7aSpSKiXfbdZ8uiTbyvZxzWLc9G7WSm3JbEEw4AcPYrywGpomdXOb7cLTs+YGjumbM19UeUnogod0quTiqzuduLs5fg8CbFx2cM/mTmzT5ieErG2TR3gH3dv55qPlbmEapPrnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452607; c=relaxed/simple;
	bh=CB+Y4Ms9vphYKvftVxqNjLeLGAcACIdAFFMUega6VDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i+ce0pI266MXed4QJr8oTv9hOILpV3PnUrzMeJMdoeQFaWQxjgl56TbumJJzS11SD9vHj64OAUMYWXbbH7slXA8F7pulAiOglryFniTqPyd8qa6Gcti0K0xVVxg8k4rm5oiXnPSxQUX8z7mCGhXkeV6wAXBMHn2ZoNMhfRbgk28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4fOIIjv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4fOIIjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEA11F000E9;
	Tue,  7 Jul 2026 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452605;
	bh=64XhVuPvDN/gBsxtlVK8mCz4xOGjTZ6PNmYgP1CqIGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4fOIIjvJkS0PP/o59y3qHVN1IZYz4wBqF9oODSJbMbIQpKxb+dty7oelm4dTdXQg
	 LmcoY9xlH/xGNIpqTN01NNycA9tcOj0UPXlQNNagVgiWgkQ1+lqrCzy5vkFDgCniQK
	 HoT+JqXRzCjhFieigkO9kW25s5T3CQFwi2gyWFZyJmFJq1cH33klDwAby6V1jkTNKF
	 pGqPr+lajkm6H7/0eIJYyKK/LgqCXUcyopH1EU1th9EaPF+uO2rBFlrkklDzMVm8o7
	 7sePFUQOxeG04fZTi8rhtqMJq58opPdKZk4fBlewBEMaLyibWqEAXdm9ZLXzk6XGqZ
	 g07njHz1myRFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:30:04 +0000
Message-Id: <20260707193005.3CEA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added '#thermal-sensor-cells' property is missing from=
 the 'required' list.
--

--- Patch [1]: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo =
ThinkPad T14s thermal sensor provider support ---
commit 48ae118884c307667e25a720a62e87b8e32443c5
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor p=
rovider support

This commit documents the Lenovo ThinkPad T14s Embedded Controller as a
thermal sensor provider by adding the #thermal-sensor-cells property. This
allows the EC temperature sensors to be referenced from thermal zones.

> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo=
,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-control=
ler/lenovo,thinkpad-t14s-ec.yaml
> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkp=
ad-t14s-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkp=
ad-t14s-ec.yaml
> @@ -26,6 +26,9 @@ properties:
> =20
>    wakeup-source: true
> =20
> +  "#thermal-sensor-cells":
> +    const: 1
> +
>  required:
>    - compatible
>    - reg

[Severity: Medium]
Should #thermal-sensor-cells be added to this required list?

When hardware gains new provider capabilities, omitting the corresponding
standard properties from the required list allows incomplete device tree
nodes to pass schema validation. Dependent thermal zones could fail at
runtime if they attempt to reference the embedded controller and the proper=
ty
is missing.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707192228.1464=
7-1-daniel.lezcano@oss.qualcomm.com?part=3D1
