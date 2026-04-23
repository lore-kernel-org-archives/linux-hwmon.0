Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFF1ACEDF
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776903805; cv=none; b=ZADLT3WVaMT4JmhUotdsQy+Is00xjrhKDMZs3FB7BivHBVanE2s7FKu/u+d+pvuNbAsbGIBsK8vlJbddDiB0UiHYIZrpgdETm80OvcBOt0DgR2dsI2YMdgxn88ojCY7/lz8HggHGWqfkAtDh9tqIth9x1DSRi6qAKX1Y5xbWG0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776903805; c=relaxed/simple;
	bh=ZhUT6cn4J7kLISTYfDzwGk7JAZbQCP+ztJ76+EjJAxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E6myBNg18VDYcscSu+y0HJ52Ynz/AXDqnhlv15S5r1oGDz2TdSsObgCeXCMNuphU/sFlC+b/cc122HVkdBWq4/wDX2BgDQjk+YhfGySi5KrvpHNkAbX6rCpT7pZN+7SXPk1898qSDnrLsSN/EvmalJB6UAP0eSlLpQwfuVoe9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvyEBkEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvyEBkEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A8FC19425;
	Thu, 23 Apr 2026 00:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776903805;
	bh=ZhUT6cn4J7kLISTYfDzwGk7JAZbQCP+ztJ76+EjJAxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hvyEBkEvV4M6onVvVZmXpqt0dvlyajJaNf/PEwTefCc4Sqtc13eL8MUQOmdI5atIy
	 PCJv0as9y3E1qFiRCbMdDs6PawunyuYjSlHHb8sQlHMqG0tTDgezLpbKlr6kCemVl4
	 bZdfWMx4YscCauQ5SuUaXOxOIDTkr8yA3lI8eWZBKYa0mdHcm+QbO40+g8PLRGQW6l
	 M7T2oF/uwuu6izzhmySIYf2v4YDfTNzEhpdkwXaF5SiSV794UviD5LaecSBUI5R0gX
	 sQblUExGJdpKlVwfd+gqsJCUr3HoBzXAA0DWGGDxIRi7V0k6g1Mo+1z9iey7pWlN8R
	 +tUqeoyZYSuww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] dt-bindings: thermal: cooling-devices: Update
 support for 3 cells cooling device
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422174305.2899095-13-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-13-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 00:23:24 +0000
Message-Id: <20260423002325.38A8FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Schema Validation Loophole: Relaxing the global `#cooling-cells` p=
roperty allows invalid device tree configurations to pass schema validation.
--

commit 4d1db5332aa8215862512cf05a640de7afe86998
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling d=
evice

This commit extends the thermal cooling device binding to support a 3 cells
specifier in addition to the 2 cells format. It updates the core
#cooling-cells property to an enum allowing both 2 and 3 arguments, and
adds an explicit constraint to pwm-fan.yaml.

> diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-de=
vices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devi=
ces.yaml
> --- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.y=
aml
> +++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.y=
aml
[ ... ]
> @@ -44,10 +44,14 @@ select: true
>  properties:
>    "#cooling-cells":
>      description:
> -      Must be 2, in order to specify minimum and maximum cooling state u=
sed in
> +      Must be 2 or 3. If 2, specifies minimum and maximum cooling state =
used in
>        the cooling-maps reference. The first cell is the minimum cooling =
state
>        and the second cell is the maximum cooling state requested.
> -    const: 2
> +      If 3, the first cell specifies the thermal mitigation device speci=
fier
> +      index for devices that support multiple thermal mitigation mechani=
sms.
> +      The two other cells are respectively the minimum cooling state and=
 the
> +      maximum cooling state.
> +    enum: [2, 3]

By relaxing the core schema to allow 3 cells globally, does this
unintentionally create a validation loophole for other cooling providers?

Many specific cooling provider bindings (such as nvidia,tegra210-emc.yaml
or CPU nodes via arm/cpus.yaml) completely omitted local #cooling-cells
constraints because they relied entirely on this core schema to enforce
const: 2.

Since the core schema now allows 3 cells, any device binding lacking an
explicit const: 2 override will silently accept 3 cells, even if the
hardware or driver only supports 2.=20

Have all other existing cooling providers been audited and updated to ensure
they have a local const: 2 constraint where needed, similar to what was done
for pwm-fan.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422174305.2899=
095-1-daniel.lezcano@oss.qualcomm.com?part=3D12
