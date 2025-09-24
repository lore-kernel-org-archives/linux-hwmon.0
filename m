Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998B3128D4
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729599; cv=none; b=XLnGlQysLgw6rVwtCk+6lvporBQCiUhl/LwIzO8/WhNuu2s33eHFxggtms2/1kRJnWSJHPzkUsamaULTs7NBDgouC/bVOYuEWrwAYLWNqJzNmWlHnkY9s9dScHmywYOdQIVTUKoQzAb5+RoXh/HqemFxKJx8k+sdCdBcIOcIgOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729599; c=relaxed/simple;
	bh=cPOvD0RWj5XRQ1X63jkqRBqkK//fpnkcUP8Ht39fsXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZZTKWU8NY55Qh25zBy+SFv7xEd47yRfgG3TZN6WJCUEnbALG7MxPdbcrp+4su9XG2umTE/y/GFc0CwjGBJVbqE0zaaqS3FZW3KFsIofBWpb3JZSYiC36CGwvF/YfhkkNdugu+kNiAyhsT4KZ/z7b+U5OI/P1O2YfB5fjXnmto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5A5t1l/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5A5t1l/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso5399389b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729598; x=1759334398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=;
        b=I5A5t1l/oeHQ3jm2MrtgudbzVZ3tOzIUVKTDMnspUEvR9XVault9+dDI9CmDDWTBkT
         DsOWdjtd2JHLSa1jin3mqnb+gkj2cR4om6MMRSpYtpdHG7YpeNvzrGnAaSpYiCAylOch
         HBW5Gr0g2JcxdEi2p8Rv6xHsSDpS8SLH5T8b0B0+s8Vd74zvzk6SHnCnRKsy1p6uAbSf
         TFpytHUNyWeU6L8XxvkoagPwbkvfvkEeEK1U/3WRGeIxCXyRFZTyhkayG0lvwwT6jabB
         W+Ncys1X1TmkLLs2LUbtshCTKwnlgYDCOxARiWNRSztbwArtCqL4nCcuENQhZQ3hbbOV
         kEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729598; x=1759334398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=;
        b=p89NHmmqMRXkpLD8iZKvWWeyy7VL2wNwntmA8KDhsIp1vPsdGRrpCnDFngLPqCWw8U
         TcBMArVeZoHdtYze9uLAI8sbOH9W6KOBonL/wQe03o2JQg2Oh3R0t5MYvq115fTyiTNI
         Ua/FBUtw9mz0vJFMerz01MxZtNbGR4C3ehjUHvelIS8H/QpLNzQd8QixiJ97N3K+Z0dG
         JKA4FcldGq+JZsixm8b6dz0e9CjC5I0oDpZX5GTTH9SlQ1+NDD8ykroQTaY+GngevZHL
         5W6+/gP/5QPBOAI1Y6Ebl1ZEQNoVgyzAib/6In/4OVGn4mv3XVhW8mNRo1FoFXQCrpBQ
         d4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWef6PjrXFG3F/ZYa7Slfvp+oh2pOxfQBnldzfoJFBY75PhL2xrTh1DHs3BJ9ASC7QFICbjWxZ1wN1CVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKuFoRjNPmYzxSXkXhL99kwzgetvKYPfyjGqANoZdJpYugfR+
	dUJylOEkV41Bbl+mHw4d6U6bEJq36nWvNsAmA3wnCC2Bwg1Q423/UDOy
X-Gm-Gg: ASbGncvrXL3knP5vblZBlxo+x7FdsI69pMgHGtMlrfvmv4zY+V/SZVOxpy0m1DJkj2/
	2EOOvet5bD+FT4Oe2kmVi27rVZd40xoRCVbsvFrG25nuHMlMjsXHn3x/iJk7hN4MaKf6UGiybdG
	X5vF7uhS/WQ8xEYcvqydY2o8FJVjtRjhcsWGh2kxeIFwdQB6eNqMNclRXDsP5Yj/Z8yUcM5HG3F
	mAVrDdc3HiHtUCEZwdULS2c6keo7I6bJzpEhBvCPF6KEFREt8pcXShaZib+TTTUmMkyt76RC9id
	de0J8DxoIkfkBJntgyio42vxOWpm+RyWOdWOT2jHj78+JKI7CCISUWIeanJ9KldFqJAssuAiIHx
	85DQ6jRI1byAHtnHBIKh2FIiNyzntHiXpy38=
X-Google-Smtp-Source: AGHT+IEaXCmea0lHklJdK2j0b9lkEP9FEm4EgHcCJQjQymM5qCQpNWQ5k2IXyH2sa8ZgsZ0NbBXZyg==
X-Received: by 2002:a05:6a00:3983:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-780fce1f0a6mr534663b3a.12.1758729597476;
        Wed, 24 Sep 2025 08:59:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-780fc88c823sm416136b3a.54.2025.09.24.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:59:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 08:59:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: watchdog: add SMARC-sAM67 support
Message-ID: <93fa6a60-1a12-47b6-b777-0f6f7775d49c@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-6-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-6-mwalle@kernel.org>

On Fri, Sep 12, 2025 at 02:07:43PM +0200, Michael Walle wrote:
> The SMARC-sAM67 board has an on-board uC which has the same register
> interface as the older CPLD implementation on the SMARC-sAL28 board.
> Although the MCU emulates the same behavior, be prepared for any quirks
> and add a board specific compatible.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> index 872a8471ef65..0821ba0e84a3 100644
> --- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> @@ -18,7 +18,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: kontron,sl28cpld-wdt
> +    oneOf:
> +      - items:
> +          - enum:
> +              - kontron,sa67mcu-wdt
> +          - const: kontron,sl28cpld-wdt
> +      - const: kontron,sl28cpld-wdt
>  
>    reg:
>      maxItems: 1
