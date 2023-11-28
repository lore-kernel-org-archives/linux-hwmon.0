Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F7D131;
	Tue, 28 Nov 2023 07:37:35 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1f0f160e293so3286131fac.0;
        Tue, 28 Nov 2023 07:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701185855; x=1701790655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqPPukdKRRDOFJ0XH38NzUBnL1CFQRGtC9HqIebF5H0=;
        b=a7P+hR8Zi9hAjHHbwkYOwBykeJ8U67xP3h2XZ+Mtn9J43ph75zptLk9HWo34Hs64XU
         aUmjjc3zbdpNtyiNa98jC9/ppwCBZ2JUYYcArsgeDQHGgenT3kcSQWRwBMmr/MdyIgnJ
         wsoxbsxbcFq9Ia0trgEdqXMiFoERu9KP3OGPtV0Dktn+DBQDhEXnmp2JVNtzzRaxcp6z
         rwhgzCIHMX3EfFi7w+FHjkK3GjGaPlDVmAJUeHZ9WSHEFHG0VKUon+20w8h2JGf8iJBW
         fWdLZTnnd684Xc+3hEHhVZMusg8ZvKxr5/PLOhd+TCs2hP7MJ8UyNxbWOglRm5crxnpi
         ElbQ==
X-Gm-Message-State: AOJu0YwyynMkk17akZxowDEGQFcOYVPj+rvTJyP4+4alzm9Dz6jWBR5T
	Gf1kfzyay7+8tZPvkzwP6STaB4GsUw==
X-Google-Smtp-Source: AGHT+IE4qWjOIc2NxFlnTeFsVw5RlnxltCUoN/wj0pQduTe5W4XunCFXCt5a7GpDekrE/729hVne2w==
X-Received: by 2002:a05:6870:f78f:b0:1f9:574c:b5ec with SMTP id fs15-20020a056870f78f00b001f9574cb5ecmr21392227oab.27.1701185855185;
        Tue, 28 Nov 2023 07:37:35 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id hm9-20020a0568701b8900b001fa51768610sm1082719oab.34.2023.11.28.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:37:34 -0800 (PST)
Received: (nullmailer pid 3316397 invoked by uid 1000);
	Tue, 28 Nov 2023 15:37:33 -0000
Date: Tue, 28 Nov 2023 09:37:33 -0600
From: Rob Herring <robh@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Message-ID: <20231128153733.GA3313427-robh@kernel.org>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
 <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>

On Fri, Nov 24, 2023 at 03:18:16PM +0100, Nuno Sa wrote:
> Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
> Compatible Monitoring.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/hwmon/adi,ltc4282.yaml     | 206 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 212 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> new file mode 100644
> index 000000000000..6c979f70687e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C
> +
> +maintainers:
> +  - Nuno Sa <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4282.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ltc4282
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 0
> +
> +  adi,rsense-nano-ohms:
> +    description: Value of the sense resistor.
> +
> +  adi,vin-mode-microvolt:
> +    description:
> +      Selects operating range for the Undervoltage, Overvoltage and Foldback
> +      pins. Also for the ADC. Should be set to the nominal input voltage.
> +    enum: [3300000, 5000000, 12000000, 24000000]
> +    default: 12000000
> +
> +  adi,fet-bad-timeout-ms:
> +    description:
> +      From the moment a FET bad conditions is present, this property selects the
> +      wait time/timeout for a FET-bad fault to be signaled. Setting this to 0,
> +      disables FET bad faults to be reported.
> +    default: 255
> +    maximum: 255
> +
> +  adi,overvoltage-dividers:
> +    description: |
> +      Select which dividers to use for VDD Overvoltage detection. Note that
> +      when the internal dividers are used the threshold is referenced to VDD.
> +      The percentages in the datasheet are misleading since the actual values
> +      to look for are in the "Absolute Maximum Ratings" table in the
> +      "Comparator Inputs" section. In there there's a line for each of the 5%,
> +      10% and 15% settings with the actual min, typical and max tolerances.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
> +    default: 0

Default is an integer yet the type is a string?

> +
> +  adi,undervoltage-dividers:
> +    description: |
> +      Select which dividers to use for VDD Overvoltage detection. Note that
> +      when the internal dividers are used the threshold is referenced to VDD.
> +      The percentages in the datasheet are misleading since the actual values
> +      to look for are in the "Absolute Maximum Ratings" table in the
> +      "Comparator Inputs" section. In there there's a line for each of the 5%,
> +      10% and 15% settings with the actual min, typical and max tolerances.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
> +    default: 0
