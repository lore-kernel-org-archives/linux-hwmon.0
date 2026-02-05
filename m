Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41B328B55
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325350; cv=none; b=hwWjfWBL/W7u4MxUS4r/1XuW0rM/UoHOMhR7iiDM/V/R5rJoYaT3E08HVARimg8hiVM1oXK6LB89lENS5OtwVskFtJf5MdygK53gT1klG5POlXQPOOljNNAbPbEtDsoFzCryoZDspf4hqom2gSmO6lYvbKzx4lVdGSzNhEjPv0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325350; c=relaxed/simple;
	bh=eXwQ9SgcUhDKN59vyhZtqEkgpqtPjys6BZik72szYvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmrW+W9rLKm0fy6K7bzTciHOzh9KR97iVOEy3KgpqKQsC0rqIWNY/DjbiqQ58/kWmXK5LouxMJ3Z1bQSyTsagZxEwdFXmenKbN9dz0DfIdg2RbKtGze8n6fUffejENLfnr9kGNbppmOYOCihgLU0sYRtX0Yh2HvlUE8mVgcnScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd/oMC4+; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd/oMC4+"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c713a6a6f8so168999985a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 13:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770325349; x=1770930149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiWXSjYD8iWQZkhbOZvxGQgWjvd+mTWIbvYj/f3atxo=;
        b=Bd/oMC4+tkqiqqEPZIRRIF9BVeDqsd7yWCncnEO3rxNSaq8z5CAjiIDn2xtH0iweq1
         //igQjkI285rqCPEsLdTzLmdliF9OKpg5MwUwG6GEmwajse93N6/8jTBWwwYxyZmdjZ8
         GMO6DkDg/ODlpsQgwcuDxCpLgpDn+SbpH/nEOO/YKa8ryojJ3n0o64v6HRqHK54ilqVz
         3tuuiwNoc0+ZH5lUaHqRQUVWstCdLiE+wMewsM/YRqbIPwdZgm60LybSjuMyZrEYBbj7
         0Gtfk7v6K9xxGK1LHuRcU6c4yQo7E7gWipx4KAExyNHgRL+HXG2u0TcaMXEotWVwyWA8
         tr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325349; x=1770930149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiWXSjYD8iWQZkhbOZvxGQgWjvd+mTWIbvYj/f3atxo=;
        b=d/F94E93s1oWSJGnVepDQRYjOWOSiBDqTp5h7aSMP0kvUd6gbmE0CBV45pZt4l9+ti
         mwnM7HiuxhJ0HrbFuOUfDwU7DqPnShLb5o5N8wzyrKJPqCIsL++XCXxB/TYRv9iiMZW2
         hTZGI/N5Gxm7uf9kHSiSpuV50zz7K6pFmW3UBX7Tkwr68o9oypP20QYl5w9mm+uv3rte
         rhnqLL5oxl6AMFS2wm680TAqNch9cwqkEJdDW8zCXh7mhZMFHOXUGvqUAYykw00GHwij
         /oG4e9ID1B2REXinH50J+cc60sRrwkHs0cITPNFdcDN8yl0xp5A+Ja/yo8H6f8+/2Z1P
         cI5A==
X-Forwarded-Encrypted: i=1; AJvYcCUEyC1FNqXgo0VFJj2AIKKtJnC0j6BV39Hs6MFRalmYFg2FG3E7P61CSnlqE4Bi4rlY8PWd54U04/rKpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXM5ElcLhrveLay5NExP3MXL5qOzSGQg9ipdsS0neQId/quBx
	x2jwyoS5vpWsHO9KA5wv1kXUf58a0oApcwJTx3eLi6vVugTnlb8rjJA/T6uPBRjW
X-Gm-Gg: AZuq6aJdR6gxffNXW49WLoM6mDUvXknPK6dJhqFZ93vfcoNYw9IRHMIKojTmZUJSrzC
	KiwWLjsLm2uF+6LWg5HZC7uHHnc4eAJckdvQhxQipGwvfOSSwPU6e+6ViNruLQ0r20ovJWd5aif
	OTBhHyY0Nlb/ud4OW5tgRxyruJzRhx52fBGAW6M+PVWUCQ9teKPmVU2NDyMWBGA0SOm6xdSGDqb
	LqS8bYEWn9iD3UI92XLyrFpOCPNFExdjNAgxHj3fAk4msjJKt2r3FpBYhXvc4Pv91m+Wl4QCg7A
	5rHG+T0OKpPQ+zhZZmXpbboXaK7FQ/aBMI0A1crsd9GpX8HF7MNtedGY3502pfiPPxW9wxbl8nX
	nD0poM5ixCCeLDAy+iqOheU+E/0+AZkGPFcnOT4vTZ0hVrerzMgnsds5IZeflVWkV9mBEB3b/w6
	+g7YlH8aWQC2JFsImAmddwunIt
X-Received: by 2002:a05:693c:3111:b0:2b7:a6fa:3f87 with SMTP id 5a478bee46e88-2b855d341cfmr131450eec.19.1770319108298;
        Thu, 05 Feb 2026 11:18:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c88cb4sm165396eec.30.2026.02.05.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:18:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 11:18:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <a83b48a4-76ba-48df-9aba-adb018949914@roeck-us.net>
References: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
 <20260205-hw_mon-emc1812-v5-1-232835aefe8f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-hw_mon-emc1812-v5-1-232835aefe8f@microchip.com>

On Thu, Feb 05, 2026 at 09:09:03AM +0200, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 supports anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 supports anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 supports anti parallel diode.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/hwmon/microchip,emc1812.yaml          | 182 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..759e004eafdfc0772e110fe484767eb66a623294
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc1812.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC1812/13/14/15/33 multichannel temperature sensor
> +
> +maintainers:
> +  - Marius Cristea <marius.cristea@microchip.com>
> +
> +description: |
> +  The Microchip EMC1812/13/14/15/33 is a high-accuracy 2-wire multichannel
> +  low-voltage remote diode temperature monitor.
> +
> +  The datasheet can be found here:
> +    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/EMC1812-3-4-5-33-Data-Sheet-DS20005751.pdf
> +
> +  EMC1812 has one external remote temperature monitoring channel
> +  EMC1813 has two external remote temperature monitoring channels
> +  EMC1814 has three external remote temperature monitoring channels and
> +    channels 2 and 3 supports anti parallel diode
> +  EMC1815 has four external remote temperature monitoring channels and
> +    channels 1/2  and 3/4 supports anti parallel diode
> +  EMC1833 has two external remote temperature monitoring channels and
> +    channels 1 and 2 supports anti parallel diode
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,emc1812
> +      - microchip,emc1813
> +      - microchip,emc1814
> +      - microchip,emc1815
> +      - microchip,emc1833
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: alert-therm2 asserts when the ALERT limit is exceeded.
> +      - description: therm-addr asserts when the THERM limit is exceeded.
> +    minItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - enum: [alert-therm2, therm-addr]

AI feedback:

If interrupt names are being used to identify the interrupts, should
the interrupts property be less restrictive?

Currently, the items list in interrupts enforces a strict order:
the first interrupt must match the first description (alert-therm2),
and the second must match the second description (therm-addr).

However, the interrupt-names definition for the first item allows it
to be "therm-addr".

If the intention is to support providing only the second interrupt (therm-addr)
as the first item in the list, then the interrupts property definition
prevents that by enforcing the first item to be alert-therm2.

2nd feedback:

The interrupts property description lists two possible interrupts ("alert-therm2"
and "therm-addr"), but this definition restricts interrupt-names to a single
item.

Should this be updated to allow providing names for both interrupts if the
device is configured with both?

[ I don't know how this is supposed to work, so the feedback needs to be taken
  with two grains of salt. ]

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  microchip,parasitic-res-on-channel1-2:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently
> +      far apart that a parasitic resistance is added to the wires, which can
> +      affect the measurements. Due to the anti-parallel diode connections,
> +      channels 1 and 2 are affected together.
> +    type: boolean
> +
> +  microchip,parasitic-res-on-channel3-4:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently far
> +      apart that a parasitic resistance is added to the wires, which can affect
> +      the measurements. Due to the anti-parallel diode connections, channels
> +      3 and 4 are affected together.
> +    type: boolean
> +
> +  vdd-supply: true
> +
> +patternProperties:
> +  "^channel@[1-4]$":
> +    description:
> +      Represents the external temperature channels to which
> +      a remote diode is connected.
> +    type: object
> +
> +    properties:
> +      reg:
> +        items:
> +          minimum: 1
> +          maximum: 4

I (or, rather, AI review) asked this before:

Does this reg property need maxItems: 1?

Without it, the schema might allow reg properties with multiple items,
provided the first item is within the minimum/maximum range.

[ Presumably the _values_ should be 1..4, not the number of items ]

> +
> +      label:
> +        description: Unique name to identify which channel this is.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,emc1812
> +              - microchip,emc1813
> +              - microchip,emc1833
> +    then:
> +      properties:
> +        microchip,parasitic-res-on-channel3-4: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,emc1812
> +    then:
> +      properties:
> +        channel@1:
> +          properties:
> +            reg:
> +              items:
> +                const: 1
> +      patternProperties:
> +        "^channel@[2-4]$": false
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,emc18[13]3"
> +    then:
> +      patternProperties:
> +        "^channel@[12]$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 2
> +        "^channel@[34]$": false
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,emc1814"
> +    then:
> +      patternProperties:
> +        "^channel@[1-3]$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 3
> +      properties:
> +        channel@4: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        temperature-sensor@4c {
> +            compatible = "microchip,emc1813";
> +            reg = <0x4c>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            microchip,parasitic-res-on-channel1-2;
> +
> +            vdd-supply = <&vdd>;
> +
> +            channel@1 {
> +                reg = <1>;
> +                label = "External CH1 Temperature";
> +            };
> +
> +            channel@2 {
> +                reg = <2>;
> +                label = "External CH2 Temperature";
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6d7b697bfdba16e4f0ee5f4f0195b9d7da06dae5..85c236df781e47c78deeb7ef4d80bc94bba604c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16646,6 +16646,12 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/interrupt-controller/microchip,sama7g5-eic.yaml
>  F:	drivers/irqchip/irq-mchp-eic.c
>  
> +MICROCHIP EMC1812 DRIVER
> +M:	Marius Cristea <marius.cristea@microchip.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> +
>  MICROCHIP I2C DRIVER
>  M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>  L:	linux-i2c@vger.kernel.org
> 
> -- 
> 2.51.0
> 
