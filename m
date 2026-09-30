Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC44D0A17;
	Wed, 30 Sep 2026 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777254; cv=none; b=F/NG+2Ab/anewXn1YQU/92bfWr2DQl2SAsTDO6XwM4kDRIxWWfk9+btXzvzbnHYx8d8o7CRSg4f3TG/pxH4Iwa6iT6djkiq+UkIs3XqDNxSWJCpONmcdJaVhdofYkD6Z67G+ZawE9Kqf/sIywki93nmwgrBHr8NoISebtq40ArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777254; c=relaxed/simple;
	bh=d0ialACQIbmzwR3DMYmNmIUbGqp9oywpKa48vRr8dSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YeC9uFcj4KG4NagwD2vwMcNq8ykvXEuetukTqvdLBZ4AMOEJy7fn2PmNGxPbP1VksE9FwXQZf5MIRXBde9+rSUkmOnbSnmRoWYGOq0mQ4i1QG7WzXnr1EOmVtDAFFGDPosTQWfaEiUInpGhr1I6gNQrAothsuYkNbhEvegVSVWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fq9c5P03; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fq9c5P03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E066D1F0089D;
	Wed, 30 Sep 2026 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777242;
	bh=YJSxOjZ3AjRq6BhfaaC6UDgw2WCq3WvtAzScJmo86M0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fq9c5P03tGIu6+0suNocnbOCr5e2dtc+Hgm+tb3mytemDH7wv8BH5Dd1TkyX2faSi
	 OQ/BgHw5DJkJjd9556yE4ghfo0hkwWwSLL277MZkxJ7w3H7FilPEloxunXe4VD2PIM
	 R1m11924ui9OEedNTpWgvHOjuc/SwZs6dLtklEpBJ73Ipj0gpLXd3yTLVELueZTco9
	 NgdXMoH7E/8o4XQkV+m3gm2aAN6k98AcIqm+5HmQYPKNGIMWPHmP4iggP9xaB3Tbnx
	 2BfOeeVmk+VzMiUOb90LaxKcaSsPyEpjgxoZDxYuhOZvo+P3iZ+RujTKUT1A/dQ3gs
	 O4pPH2vDFlGKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr>
References: <20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:07:21 +0000
Message-Id: <20260930140721.E066D1F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: incorrect #thermal-sensor-cells constraint for sing=
le-sensor device
--

commit e3f74468edb24a9bcc5d029cc615555210a46a78
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: hwmon: pmbus: mps,mpq8785: add #thermal-sensor-cells

This patch adds the #thermal-sensor-cells property to the mpq8785 binding
schema to allow referencing the device as a thermal sensor. It sets the
cell count to 1 to match the 1-based sensor index used internally by the
PMBus core.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
[ ... ]
> @@ -34,6 +34,9 @@ properties:
>      maximum: 4095
>      default: 706
> =20
> +  "#thermal-sensor-cells":
> +    const: 1

[Severity: Medium]
Is it correct to set the cell count constraint to 1 for this hardware?

The Devicetree specification generally mandates that single-sensor devices
use a cell count of 0, as no index is needed to identify the sensor. By
forcing this to 1, it appears we might be baking a Linux-specific driver
quirk (the PMBus core's internal 1-based index) into the OS-agnostic
hardware description ABI.

Would it be better to map a Devicetree ID of 0 to the internal hwmon index 1
within the driver code itself, rather than requiring device tree authors to
pass a factually incorrect dummy index in their thermal-sensors phandle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-for-upstre=
am-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr?part=3D1
