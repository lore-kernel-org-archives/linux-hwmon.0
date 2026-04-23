Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415E3DE450;
	Thu, 23 Apr 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776933681; cv=none; b=oS/7DgMoyBe9HUXWCtuyIqFLWBCVCybJzj2GF1OmpSRdnSEXeQNPUkbgctqRl8Qe+A8yQH7SWOd/MCGuEp2QvevVTzCvhZaTnuCwlQ8QuNmhN9lMpMb5ByuG51nMtSD6Qg0gxDn4Gmw8tgaYoIql7A31EY7o2pF0oa9uGDrgVT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776933681; c=relaxed/simple;
	bh=agRKMXy9ctCLpZ9fGvDgyOD6rYo42OEd3ThhJ4Q04bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tya8ixUkGyrnN/OvyMTKXceX2B4GCGCYtcMwR3bifZ+7n8m9ICryTd+Ov1WENRx8uxPktnKiVTA6fGKhh0Uh1LOz3z4XBRk/6JSiAsFJdGUf4LSvfHuyNNXcS2TXliz5S/We05+Kq7fHguN8BwCxt24+Yo8MuDyX5II6ASogPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQjaZBUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQjaZBUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E95C2BCB2;
	Thu, 23 Apr 2026 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776933681;
	bh=agRKMXy9ctCLpZ9fGvDgyOD6rYo42OEd3ThhJ4Q04bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQjaZBUUtqKHPNlTTYgFy5n0o1FPGzfq7ltWypaNPOyL9zejUOFQoj+D+kZ5pYSl/
	 FGe5w26o2AatKyGdvpzyMpSN8hGZNoEZhspkDRRy34qC4LHz7/pXzrT5lqeJW/nQH9
	 d/gLn9vY+/SoU20F9z/VxJIyKZ9+OzR4B/TUz0cyBG5y4UfIxBT7vQycFPJnyFik2r
	 oOBBCmoPKLQptbVYYR2NBar7xkyAJ6fiqx93u0W8U2XBYW/lGpeEwepZBoshJEHKpI
	 4bO5BThkM5TRh4Acy+5Oc7b1HlW0rlgsmT8xOp1biJ121rjk/8wGyDqEaFd0yOzori
	 v5l93rPPreT/Q==
Date: Thu, 23 Apr 2026 10:41:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
Message-ID: <20260423-free-blond-boobook-ceae7e@quoll>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
 <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>

On Wed, Apr 22, 2026 at 12:06:15PM +0000, Brian Chiang wrote:
> Add device tree bindings for the Luxshare LX1308, a high-efficiency
> 12V 860W DC/DC power module with PMBus interface.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
> ---
>  .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      | 49 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>  MAINTAINERS                                        |  8 ++++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
> new file mode 100644
> index 000000000000..a8d92447508d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop blank line here

> +$id: http://devicetree.org/schemas/hwmon/pmbus/luxshare,lx1308.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Luxshare LX1308 Digital DC/DC Power Module
> +
> +maintainers:
> +  - Brian Chiang <chiang.brian@inventec.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
> +  digital DC/DC power module. The module operates from a 40V to 60V DC
> +  primary bus and provides a 12V regulated output voltage. It can deliver
> +  up to 860W continuous and 1300W in transient.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - luxshare,lx1308lch
> +      - luxshare,lx1308nch
> +      - luxshare,lx1308sch
> +      - luxshare,lx1308ldh
> +      - luxshare,lx1308ndh
> +      - luxshare,lx1308sdh
> +      - luxshare,lx1308

What are all these devices? What are the differences?

Especially, what is the difference between lx1308sdh and lx1308?

> +
> +  reg:
> +    maxItems: 1

No properties? Looks like suitable for trivial bundings.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      power-module@60 {
> +        compatible = "luxshare,lx1308";
> +        reg = <0x60>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ee7fd3cfe203..67fb1592daaa 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -967,6 +967,8 @@ patternProperties:
>      description: Shenzhen Luckfox Technology Co., Ltd.
>    "^lunzn,.*":
>      description: Shenzhen Lunzn Technology Co., Ltd.
> +  "^luxshare,.*":
> +    description: Luxshare-ICT Co., Ltd.
>    "^luxul,.*":
>      description: Lagrand | AV
>    "^lwn,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..58fa595cff6a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15175,6 +15175,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
>  F:	drivers/iio/light/ltr390.c
>  
> +LUXSHARE LX1308 PMBUS DRIVER
> +M:	Brian Chiang <chiang.brian@inventec.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml


> +F:	Documentation/hwmon/lx1308.rst
> +F:	drivers/hwmon/pmbus/lx1308.c

There are no such files

Best regards,
Krzysztof

