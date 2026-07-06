Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E8373BF4
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346523; cv=none; b=Nj7ADqK9Nr66QrcQjj3oZrMhLJixgOG1EBWS7HGgo5NOjysUWWjZByCEJ0uUfkBSrIFs0XOU/0nthlA5GnLaGDxgs/3kAXDtHIHRAALiT1aQuiqV/lsPWhNWDkzVxtqs17AwdPuKZyTUASnHJ+NIxM9V5YrJyCf+BMzIY1X5rLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346523; c=relaxed/simple;
	bh=Oe/MLWXP8dChzX5k64XMZnBbFfYNd+emFyTl3KNJkIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNFAFs0a8pPVwhu1uTH19gBh4iJA8OQKZxsxgzGD6v3zRxOCDYMLQYXVHAVXEY94A4Xrgy8KRDHhBkORmq1jSGqOSus+oPBUAX2OvZcrh8ayZGN2I5PRWt39wbTExu1dI2iuMN6v6/ZtkvVmBokFlhcR5PkfiKG1KP5k5I29mbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwCJ7qny; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwCJ7qny"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cac59f8b64so36634075ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783346521; x=1783951321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8W5+jx7bPjLG+4tJL2jHIRG3oW7oM+42HpDCfJqGjPw=;
        b=RwCJ7qnyMny8Vxzcwf+qYHt8vY8Pq8QK+74PZZ8HVBNr181u+ID0pb5BzUkoIZ9TRh
         XUII5n2CbmE/2wSkC42EYhHdAziVCN49WoZX0qLqFDhzkVuUOJfF2+Gtlhjo+arygzkM
         IlZ1OnXHG9YdVJRsiHyQKOYJlkFADszaouYjhorbeUbQ3xHHuG5XISDgDCPDUKx6jQWc
         Ncytk8Vj7VkQSEm0J3cSUxK3c8a288swVcDs7bTTMdmrUySm4NlbenA4RMmoalovC/92
         bHixk0Ga15FiYPZa50PZ7g5NrPZTNCMUZeDhwHrGL6250nbxwIwdUVb3bh5dmHuQ3IPF
         H6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346521; x=1783951321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8W5+jx7bPjLG+4tJL2jHIRG3oW7oM+42HpDCfJqGjPw=;
        b=BBA+3cT4am8a2zrHZs1JUa4RgpkY23c340k1KEBiYUQfMrHkXAWeLs9Qgseo7LoYvR
         0NmaN2YSnizaWydoXN6gRFzaXOsGHDEvMdll0t5sMoqK911FGwSVa1YVWtfuqUIDmASy
         xVzav+X3FtImF30mcRZXOVo4dcbbEO78onbx3J5AJhcfUBgx328zEGtLvghRqEYptAdb
         +QYgwS1pE92EF8oB88biZzfFh5WNg6bXns9UbLgpHtj9xyk0vfbC8JsqvaeUWdWq0/H6
         Mds+lHfK/zTlzUhyzDO43n13EPRs1+Qsq0y+4L97KV9naZsLunCccny5rrGlmEczpi3Q
         5qHw==
X-Forwarded-Encrypted: i=1; AHgh+RpvD15JLGVcowuhJyoNWldPQvnmvDhbRyIOXVgrLB/6V+N11P2rRk8Uy2Xkc0GstCj87nTAWwOu4NoJwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymLAxsW5egezMZj7sZBWe8k76d8TSpyWCi82t/PMUrYvtzUUKY
	GggzdBIAGkhUQmriMaAewNZiFxllxZt6URd6otzO4e1W07NJr9e6M0P1
X-Gm-Gg: AfdE7cnTyqAAt2d2NMI4+vq6rDrkxiaXHpUnWVz+aplgVGRJuwJRvAzsINhS2teEuqw
	7pOXagIao90HkHwjDnJ1F/R1HKBwJ92JPaQ45s49vhZqb9XCbPA08pUMf38qKKCqypIOz4O7pLq
	P9cqBjsJT/enZE9LSxxGCNygGlDiPzv3GVsjpL9b04l9UaNEvng3ITyeIzIcmTzpmdNjb8YjcxQ
	yYd4+aDf6Q4J/NQPS1n1QtKnQ+yvhaI/N3mdAg0FQdps96Xn8BFqQQwk55kSHPymfv2yjJskzfE
	bBPXRJ1na17F7BL4T8InFit/gxjAKiNnbfj/ps5qY+tlzS7uZLWQF2H5we+ipgotKKRBJJvufbV
	FvjkIcHcLTASIY1OpcN0bVVEVuVGo/TT89mDSkv7MdLA23Hws5iJ2b3DR1i+OO/Y1IXhXCA7fF0
	RewWMxv1/+SmYq9d2Ntk6UBQFwhQ==
X-Received: by 2002:a17:902:e5c8:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ccbf043d9cmr5925765ad.35.1783346520520;
        Mon, 06 Jul 2026 07:02:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7894b20sm51246705ad.78.2026.07.06.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:01:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 07:01:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Message-ID: <a502e1e2-f2c3-4851-b0d5-934b18e92f84@roeck-us.net>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>

On Mon, Jul 06, 2026 at 10:08:41AM +0800, Alexis Czezar Torreno wrote:
> Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
> was not included before. Also edited examples entry to be more complete.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

I still do not see the point of these properties. The driver can extract
the power good information from its registers, and it can set the enable
value from there as well. It does not need either.
In practice the power good output is likely to be connected to an LED or
to the enable pin of another power controller. Neither would need
devicetree properties.

Again, please provide a use case. The mere presence of these pins (which
exist on pretty much all PMBus chips) does not warrant devicetree
properties for them.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index 1625dd59417f1b3ca689a9c86ca266da913d1217..f3ba6351aa5d657590d92a538910fd6b787e7a3a 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -39,6 +39,11 @@ properties:
>      description:
>        Optional 2.5V to 5.5V LDO input supply.
>  
> +  enable-gpios:
> +    description:
> +      GPIO connected to the EN (enable) pin.
> +    maxItems: 1
> +
>    pwr-good-gpios:
>      description:
>        GPIO connected to the power-good status output pin.
> @@ -53,6 +58,8 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> @@ -61,6 +68,10 @@ examples:
>              compatible = "adi,max20830";
>              reg = <0x30>;
>              vddh-supply = <&vddh>;
> +            avdd-supply = <&avdd>;
> +            ldoin-supply = <&ldoin>;
> +            enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +            pwr-good-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
>          };
>      };
>  ...
