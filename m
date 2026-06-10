Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A2D282F1E;
	Wed, 10 Jun 2026 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080872; cv=none; b=d4hvj7r+TuPUbTUIGD4GUVssYl3xBPPVG9nMI2Kt0tvyAT+nwa9cBjtyAZtCsG85T6o26jwsd+eCSK+KiuFkAN+2RnWfl38E0rEIp687UeAJLEMb7LrwWyedfu7cmQZjany6t6qzHEziOxtx/FTPrXJFYsA20PlO5/yEydYNGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080872; c=relaxed/simple;
	bh=chkwH9OikjHq3S47d28w2oguOeW0W6Xr1m+LOETjWI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ThETny9V6I+0Wa2968p9onIYaBt0qMCnTeyDwBmFa65eRdcx7vPfqJahSZMea2AFAlTkmUXEb7UZMRO3PfQwbikhhBgHJYyWRerymQjwQSxPR+JwPgoTiVQTy+rgHtEunj+pG++1MtRe6Gn1Muc3KA8PxayqVeWpomfbw94FxOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhMZCZbX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhMZCZbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B9A1F00893;
	Wed, 10 Jun 2026 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781080870;
	bh=X9Ul1/8kQzzprS2/Q9cs03BoiFMHM+xGT1cfBNwLpbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EhMZCZbXRq31wCrRTkKy/EGDbMtedW8KDHqza9u0Aq8TE5B6nqjEjoevt5qs3JbvN
	 KeO6UBg5bAT+5Bk9tQLDmQWbY0OhRCL3wBZFkf+qtBW13fMmVAkIM8Th4Lv7YSfY1i
	 cz5jKPeqRrcr2ogv45QwlNstGo3yQlZ2ILvH+Fem4i4R/jaZr+t7il/mYOcu/gN8G+
	 TqAVK0Uv5hzJaWKWOKER/Pqw61oq/j3ojcHo60oQhRbrqTWIxif4V/I+eNy/LP1H8b
	 YDbPyMj9CA9bb+/4W9eg3tP45kyB6CJHPQ1LLEt2njgAq8WzPMj1+k83lHuYdEWFqi
	 WKCUPKB9nomsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:41:10 +0000
Message-Id: <20260610084110.95B9A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `ti,ina232` compatible string was added to the top-level enum b=
ut omitted from the existing `if-then` conditional blocks that restrict uns=
upported properties.
--

commit 3cd10611f4c71e7280e19fcd316cd7a918042ee6
Author: Martino Facchin <m.facchin@arduino.cc>

dt-bindings: hwmon: ina2xx: add ina232 compatible

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Doc=
umentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> index 009d78b308596..a30888c9156b9 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> @@ -28,6 +28,7 @@ properties:
>        - ti,ina228
>        - ti,ina230
>        - ti,ina231
> +      - ti,ina232

[Severity: Low]
Does this new compatible string need to be added to the allOf conditional
blocks further down in the schema file?

By omitting ti,ina232 from the exclusion list for
ti,maximum-expected-current-microamp, the schema might incorrectly allow
this property for ti,ina232 nodes:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - silergy,sq52206
              ...
              - ti,ina231
              - ti,ina234
              - ti,ina237
    then:
      properties:
        ti,maximum-expected-current-microamp: false

Should ti,ina232 be added alongside ti,ina231 here?

Similarly, ti,ina232 appears to be omitted from the conditional block
restricting ti,shunt-gain:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - silergy,sy24655
              ...
              - ti,ina231
              - ti,ina234
              - ti,ina260
    then:
      properties:
        ti,shunt-gain: false

Could this weaken schema validation when checking device tree nodes for
this specific hardware variant?

>        - ti,ina233
>        - ti,ina234
>        - ti,ina237

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-monza-ina2=
32-v1-0-925b0d12771b@oss.qualcomm.com?part=3D1
