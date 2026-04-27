Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD03B6C17
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288511; cv=none; b=khXDaB7GjrmYsUmeTo9YminpPYv3yXQJ7aIXLgTIrfVZ9MIFLtGdX6tdkjajyo/kq5tcEQ2o05YFAlcf1AYCeB/RUHFsufpqAPpxcEsGR/E6TNAxUwvQjR3Xazh2r1f+98ed0xXHJkguQY5qhUuz9titwy3R/RCKUYd3E8lhThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288511; c=relaxed/simple;
	bh=S5v5a2xILTFOuUeOI4/ZHldfWBXVtIB51PyRpwW4Xuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7hQKRTIZF6y7JHm539VML8DnK+Q5pCaFzOXIZCVOGYRUABV3sXBYNc0HEJqMqYR+zJm5DoAzci9Xcql4yRkkayRbTZ5LznVMs6Yz8waOPmY7Kk7SOcDzABGunUqcTzYOKH157aLWhwydB5709iFA1v5ls8hCiv8c8lBYQVwlAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=L91vQEj1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="L91vQEj1"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so5128557a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1777288507; x=1777893307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj51DoniKArwyiQTRmeeRmOZITT30YvMqLl9YIyYIsU=;
        b=L91vQEj1bSom3oomISEnGlu52fE4Sbkg2C3X8tSHqb/wnxP8yrNyal80RDmquANPJw
         c0Uk6hGHDnmH3m2Hg1D5CKOcqdtTO27z+T++RCiS21VftXRnTZcA/QMvnaPbcNF2MowJ
         /bgP2L5ibYKDzFNrj8H8skqrLEcmb3OFvctWrQRsMcppiLRP9OnKZXUR76AFsKNBREYW
         VLm+cw3CljrT+YNvSqMSqqYxTYq3bXh7n29FEPGGIhzqUIJZnR5lQxBd9sVTq8QIS01H
         a7i09BXGuINfZJXzXAx1kG58/+RxHqRU2TvByGm2rGTq5bQF4jHEBBpRu3XRRsVHXlB/
         7ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777288507; x=1777893307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rj51DoniKArwyiQTRmeeRmOZITT30YvMqLl9YIyYIsU=;
        b=rYqUHmdrZim//SdeC1e/LrOVLi7B9g6Al6AyGd/Wd6hto5OWty1mZEs70nhPU3mn+a
         v5CL2XSmtguNsjWZcOgDtSOFeLuuDUKvKlK0nPOZVEyu7fsNNVKCRfp0Zdaq2grZZH+D
         1PKkJ9hc3Xy/Ckt4NgriRmvwDqPFsL8WVw4GHdsNoLob7AXhfVC2R0NuN1tZtvX33m0a
         7JfoR82mEpOn/kjeo7SQrmDUeG/g6vme8V7rHAFLn37fqCwUznUymka3K94fFVWjNJNH
         2H5h9RurLZownY5h+xEGcOWgC4Vuq8s3b7ED4DZIJxXeQoi4u5ABnSjHkVFFQEmgA5MM
         Pc1A==
X-Forwarded-Encrypted: i=1; AFNElJ+3/4BtL30DpKGvqcHaCx2/+w+BtM1oBMeEdKZu+9NfkrDtrq8K90uk9sze8kZpAoLbcKR5KHSs23nUIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDDNUM8UOuXiPMjrODvVEYFyp6m03jj29PnbwQQn6a29rVb9+J
	Ih78NECPcmTNuH6wt0P2Ty0K8D2/OjVaoL04OxdLUYf2wHooj0jrv3nXRbVKifTK4Qs=
X-Gm-Gg: AeBDiesxvsRQKhAANTosaYqAwVrtD8pCgMnq9lrj3WsJPHEID029wnDRHC549UCoATL
	JRXLH2eFr3SDfeFzjusKBRu/+n/KbJKOLuhycPhqfX5h+5ZFFrCw3UL8igIg7TPa3nFjWqKeeB3
	Pn4tswoDmUgAG7itYtcFlS5fy+V6yMTrs09S0q/3j1K/3I6xI1eKni8XUByAEZoR52bX0TOOJPv
	0PVQw/ACXNsAOxLVB+ujD/h1q6kyoWmCQ3VQ5zfujmiNyGr9GewoaHId5Bb+c7xJ/JLY/j+zC+y
	gTovCzQS8kWD5ZG+QrsjHuWtfISJTCl8+TWR1bpgKZtzZk+oWc0yOsPcNAt8Hf2vEI6LDbO655W
	/8TU1fXhoqTDSsJy3yv5PLpjxgVAdE0VUKFzoN/BAu46NQEvy2/vsbeKnpIMf/HtNoZ0qe3Lx8h
	C61kvY5sfg4lhf7bHHxEiSocw9xwVIfjWTZWtoKbShmpNqaIJ6gePAANeZNs++74/byXKf7eYiI
	bVA4iw=
X-Received: by 2002:a17:90b:380c:b0:35f:bc9f:e1b6 with SMTP id 98e67ed59e1d1-3613ffce9b0mr33845874a91.1.1777288506885;
        Mon, 27 Apr 2026 04:15:06 -0700 (PDT)
Received: from TAO-BU2-SWA-3 (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410bac6dsm31270802a91.14.2026.04.27.04.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:15:06 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:15:02 +0000
From: Brian Chiang <chiang.brian@inventec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
Message-ID: <bnyp2ct63m2p2ln52lnmrxjrh7bgwfcelekeptbj6j3vgygpae@og4y7ul7gumz>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
 <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
 <20260423-free-blond-boobook-ceae7e@quoll>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260423-free-blond-boobook-ceae7e@quoll>

On Thu, Apr 23, 2026 at 10:41:18AM +0200, Krzysztof Kozlowski wrote:
>On Wed, Apr 22, 2026 at 12:06:15PM +0000, Brian Chiang wrote:
>> Add device tree bindings for the Luxshare LX1308, a high-efficiency
>> 12V 860W DC/DC power module with PMBus interface.
>>
>> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
>> ---
>>  .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      | 49 ++++++++++++++++++++++
>>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>>  MAINTAINERS                                        |  8 ++++
>>  3 files changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
>> new file mode 100644
>> index 000000000000..a8d92447508d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
>
>Drop blank line here

Will fix in v2.

>
>> +$id: http://devicetree.org/schemas/hwmon/pmbus/luxshare,lx1308.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Luxshare LX1308 Digital DC/DC Power Module
>> +
>> +maintainers:
>> +  - Brian Chiang <chiang.brian@inventec.com>
>> +
>> +description: |
>
>Do not need '|' unless you need to preserve formatting.

Will drop the '|' in v2.

>
>> +  The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
>> +  digital DC/DC power module. The module operates from a 40V to 60V DC
>> +  primary bus and provides a 12V regulated output voltage. It can deliver
>> +  up to 860W continuous and 1300W in transient.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - luxshare,lx1308lch
>> +      - luxshare,lx1308nch
>> +      - luxshare,lx1308sch
>> +      - luxshare,lx1308ldh
>> +      - luxshare,lx1308ndh
>> +      - luxshare,lx1308sdh
>> +      - luxshare,lx1308
>
>What are all these devices? What are the differences?
>
>Especially, what is the difference between lx1308sdh and lx1308?

Thanks for catching this. The suffix letters encode purely
mechanical/packaging options with no software visibility:

   1st letter - pin length    (S=0.11", N=0.145", L=0.17")
   2nd letter - pin assignment (C=pin14 IShare, D=pin14 NC,
                                S=pin9/14 used as Vo sense)
   3rd letter - HSP option    (H=HSP, O=open frame)
   4th letter - output cap    (blank=600uF, C=2000uF)

All variants share the same PMBus register map, scaling, and behavior.

>
>> +
>> +  reg:
>> +    maxItems: 1
>
>No properties? Looks like suitable for trivial bundings.

Agreed. Since there are no device-specific properties and software-wise
this is a single device, I will drop the standalone binding in v2 and
add a single entry to trivial-devices.yaml:

   - description: Luxshare LX1308 12V/860W digital DC/DC power module
     compatible: luxshare,lx1308

The mechanical variant information will be documented in
Documentation/hwmon/lx1308.rst (sent in patch 2/2) so integrators can
still find it, without polluting the ABI.

>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      power-module@60 {
>> +        compatible = "luxshare,lx1308";
>> +        reg = <0x60>;
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index ee7fd3cfe203..67fb1592daaa 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -967,6 +967,8 @@ patternProperties:
>>      description: Shenzhen Luckfox Technology Co., Ltd.
>>    "^lunzn,.*":
>>      description: Shenzhen Lunzn Technology Co., Ltd.
>> +  "^luxshare,.*":
>> +    description: Luxshare-ICT Co., Ltd.
>>    "^luxul,.*":
>>      description: Lagrand | AV
>>    "^lwn,.*":
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c3fe46d7c4bc..58fa595cff6a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15175,6 +15175,14 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
>>  F:	drivers/iio/light/ltr390.c
>>
>> +LUXSHARE LX1308 PMBUS DRIVER
>> +M:	Brian Chiang <chiang.brian@inventec.com>
>> +L:	linux-hwmon@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
>
>
>> +F:	Documentation/hwmon/lx1308.rst
>> +F:	drivers/hwmon/pmbus/lx1308.c
>
>There are no such files

These files are added in patch 2/2 of this series:
https://lore.kernel.org/lkml/20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com/

I will note the series ordering more clearly in the v2 cover letter.

>
>Best regards,
>Krzysztof
>

Thanks for the review.

Best regards,
Brian

