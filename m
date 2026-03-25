Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F93DDDDA
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448103; cv=none; b=BLiz3zqDFBCBZWR++YHB2Qk0L1RM4D4QW2BhMJkKq804CKTzfxzruudz3HrEOUb29czakvG/ENGV1pciUkwY5OCLV5pprb7Is8r99fSUkkgKOJfSWd3F2pvX10GGZPf/wYwXs6ksaXzHBqLtDMVMF2yq/Z9MLb+0ZxSmBxZ4AFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448103; c=relaxed/simple;
	bh=ndRGJhASfV/L3jTg7ReiuFcxx6gZ79D9Btx0MKrmdc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcFTKgDyfQmOphUKII7W73xCFuge+3xk8MR/uz58IKkh0RJtlYm0Vw6gNfEjSxdCODC0INjZuksAvie9ndp9TAZnZywBH0rnDXXpsdYbsmZBPRLqt5aBVVHbTri+pSrBN9/8LqKVeaE0erXva4yPRH1y1o2m3SS7UaJdGC6/Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl56ZxuE; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl56ZxuE"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c1092cc08cso304792eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448100; x=1775052900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p/oHQQntdvJrq3bem71WhkRlm6GlLE1KCuSOKiT0mY=;
        b=Nl56ZxuE/vBA7ncQKV5IpGpVBuLR54k8YT3LyWdnZzhpCnK0GZhTyafsPGXpwuXSt7
         LDpHwwx2c2LV0BKJfwSMIe/mrrVJSCd2Ff67J57vIcBTtwNKEKbyHbN9Yf2PnuZZYnsO
         M+B+tqN8C/96P22VVCXNp2xOHJyXjpkbKWVJGUpnnBNaPAd9tgPoSKPuYDa4AdI9uYM2
         kwlgNdwO7sdVlxGWRKl18kT05x9emL5T1lRR8jZFoHoH8cHlNpHPiQU6QL+bfwKHX2sr
         vV0oX8t+TqFgyl/YPeK1t7505+knVhOIOKOYzuzypn/iow8msIKwJg+tK+6/ECPpW6h/
         jZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448100; x=1775052900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/p/oHQQntdvJrq3bem71WhkRlm6GlLE1KCuSOKiT0mY=;
        b=NflsIG/1YrC0Y+uGgAhrS0IwpfYrwhlCawE/u7jAl9jDfeqGkYKfrJsS0eEx1VOaMy
         PLz6+1oXrs4xJ45W4uckHssi5MySdlfMwLLSeeaRgbldUOOvcTk0h456ayyq7F5V0wE/
         WYmPfo3aditzKiNmS4ncagPO7aUH0NPv2dx8VoIXg/4xAVGvNI0fjgHP9K0ky7WKiuhc
         NrNhDUGDWAul31PO5IcXd7fQo8Z/XhLJtx4HINW5PLzoiSZ6Smmu3oS2vYfZ/Fkj1c1O
         oSGqUW71/1dq0h4Aw5Z7VRfYapnvTMW64MpQJV1uShJ7oB1jDsLJsqgEg/G/j4M0gihK
         g8pw==
X-Forwarded-Encrypted: i=1; AJvYcCVWmQfLJpjKK8MMquIJkAgLLnhmIeThdmD8RU2nAwdoLbjRpf69YUfV6wYpFHV5Va6MR+pOztbLUiNSjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWoBCaBd2xiuY6izXSebVx9w2LyoD66M0O8TEzsiqsjmu/mU2P
	Tz2C2Pv9OsjMvTCHfzUjobjvtKsbNueRsebjxkKKC5wVok/Sg0ZdY3aJ
X-Gm-Gg: ATEYQzwu0xvAEMn0ZNr5iSrZGQ/M+u3chH42sea7svUrj5ASaRLh6QviC/jOUkgzjlQ
	GWmVXkWzN2hiSzlWngWutc61ewdckKp51VbJXvvvMl0Pe2+algZt6t2DiR3rIRaxZQZVN/BPXot
	dZIseUh6xnWhYOuNZlSirSRcHdAMVj51vWY4JVsyBmO4AuarH4NWfsvDk5mpAE2YypB7wSQFgDE
	npmROFSevrr1Qh/nuuvv7jdyr9qe1kBeW2uWZo/F39hPOE3hp6iTBSuW2ZXMheZaL4ATHYAFq9U
	m8bdGlF6c5+qx1zDRolmGAvKTbY3Ee8Zd1dgv6x4FMW5UYHbsYAys6RVqtuxtuJm+kzsPeB122D
	CIrNl60DY5BWAc8ZFXVIab6hO33zgZnh+6yRyixEXWBaI8fuenPGjp9Cu+9cDmxFkLDxAOWg0dt
	S6u7MH052H5Y2o+QMoUAioPMwDzRwcWD6zGP1qbohkn20+RY0=
X-Received: by 2002:a05:7300:ac90:b0:2c1:778:d897 with SMTP id 5a478bee46e88-2c15d43ba66mr1797423eec.21.1774448099826;
        Wed, 25 Mar 2026 07:14:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c757sm18183035eec.18.2026.03.25.07.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:14:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Mar 2026 07:14:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Message-ID: <7d2c44e8-b831-4f83-9158-c157ae7bde9e@roeck-us.net>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
 <20260325090208.857-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325090208.857-2-dawei.liu.jy@renesas.com>

On Wed, Mar 25, 2026 at 05:02:07PM +0800, Dawei Liu wrote:
> RAA228942 and RAA228943 are Renesas digital dual-output
> 16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
> driver configuration. At the PMBus hwmon interface level,
> they are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

> ---
>  .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 93 ++++++++++---------
>  1 file changed, 50 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index ae23a0537..8216cdf75 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -16,49 +16,56 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - isil,isl68137
> -      - renesas,isl68220
> -      - renesas,isl68221
> -      - renesas,isl68222
> -      - renesas,isl68223
> -      - renesas,isl68224
> -      - renesas,isl68225
> -      - renesas,isl68226
> -      - renesas,isl68227
> -      - renesas,isl68229
> -      - renesas,isl68233
> -      - renesas,isl68239
> -      - renesas,isl69222
> -      - renesas,isl69223
> -      - renesas,isl69224
> -      - renesas,isl69225
> -      - renesas,isl69227
> -      - renesas,isl69228
> -      - renesas,isl69234
> -      - renesas,isl69236
> -      - renesas,isl69239
> -      - renesas,isl69242
> -      - renesas,isl69243
> -      - renesas,isl69247
> -      - renesas,isl69248
> -      - renesas,isl69254
> -      - renesas,isl69255
> -      - renesas,isl69256
> -      - renesas,isl69259
> -      - isil,isl69260
> -      - renesas,isl69268
> -      - isil,isl69269
> -      - renesas,isl69298
> -      - renesas,raa228000
> -      - renesas,raa228004
> -      - renesas,raa228006
> -      - renesas,raa228228
> -      - renesas,raa228244
> -      - renesas,raa228246
> -      - renesas,raa229001
> -      - renesas,raa229004
> -      - renesas,raa229621
> +    oneOf:
> +      - enum:
> +          - isil,isl68137
> +          - renesas,isl68220
> +          - renesas,isl68221
> +          - renesas,isl68222
> +          - renesas,isl68223
> +          - renesas,isl68224
> +          - renesas,isl68225
> +          - renesas,isl68226
> +          - renesas,isl68227
> +          - renesas,isl68229
> +          - renesas,isl68233
> +          - renesas,isl68239
> +          - renesas,isl69222
> +          - renesas,isl69223
> +          - renesas,isl69224
> +          - renesas,isl69225
> +          - renesas,isl69227
> +          - renesas,isl69228
> +          - renesas,isl69234
> +          - renesas,isl69236
> +          - renesas,isl69239
> +          - renesas,isl69242
> +          - renesas,isl69243
> +          - renesas,isl69247
> +          - renesas,isl69248
> +          - renesas,isl69254
> +          - renesas,isl69255
> +          - renesas,isl69256
> +          - renesas,isl69259
> +          - isil,isl69260
> +          - renesas,isl69268
> +          - isil,isl69269
> +          - renesas,isl69298
> +          - renesas,raa228000
> +          - renesas,raa228004
> +          - renesas,raa228006
> +          - renesas,raa228228
> +          - renesas,raa228244
> +          - renesas,raa228246
> +          - renesas,raa229001
> +          - renesas,raa229004
> +          - renesas,raa229621
> +
> +      - items:
> +          - enum:
> +              - renesas,raa228942
> +              - renesas,raa228943
> +          - const: renesas,raa228244
>  
>    reg:
>      maxItems: 1
