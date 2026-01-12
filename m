Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67592BEFFD
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768254161; cv=none; b=p+2pWZelQhKkI5C6JQXDCxwH4IgZZdUWAhUfnER+VxcuI+GBAwHRCF9MXjr3w8mZcLoqPwgl+B5bb76NLpIL77CWMJSBVUfy5XCL6I2Wc1C96zGfCcVeycVYqTgzudd8BbCX6cv/IWmzc9OncaRgptInEzHVJ9YySAS88bgKJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768254161; c=relaxed/simple;
	bh=dz2CmtqGglp5Xbabzn3gouFe0lBg+qGdkrzZBwpId9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwavzUlkA8J6MZxdV7mYN8fOETIE2zpoMvI5u8rNveanJweu3x0V580eOjl0y3XU/G/BwLAtV/+l8Q4rJUMZx84oA5HCipc/BGRPcOJRgvx2erjIpF3WPmIi9pMR0o4jRz67MDv4+bF4UzGJq+QCErH1fTKvGdJYtP0b5r9+eiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj449o4i; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj449o4i"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11f3a10dcbbso6214371c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768254159; x=1768858959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xoGqILNXLp9iGFwFId1fIPUgWUaCUXOdhluIYSxRCJU=;
        b=Hj449o4i17H4Qb/JLBjYZAj9YuAHs3IUa8u/yfV9ufdPKIfPYLXaao5m0Hu0rUFuOb
         ob26tyKDUfyOQm0KfdGk+CzTts4wyNnjgHNN+B/HO03CzMz/Z8w9VdNEHGtg/89QHvOJ
         CxbLEYPCrwUSLelIyjzjRx2otsAIwxMRJm4qTcVE4z3IxpWNX1QfhlGd3s81e6pHe1Jq
         +togzQI8I7LrAIuzUnsK2r7rGekqmzTfhloKK/N1KLqpsp44WwBIduZnLhBQJS5/VexW
         JB7PZBvkodtkPgedXQzKiRDcMevvLBP3UvIrc4bBPYBS7ZqBJoETT/9VIRWrpBgCNgJz
         HZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768254159; x=1768858959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoGqILNXLp9iGFwFId1fIPUgWUaCUXOdhluIYSxRCJU=;
        b=DIZCwAqzrIO5uutpbJxlk5g3Gt8jxWGhhPGJnL9o4IL0DoiGjpGVMnOjEM2GFb6kMe
         5x/7Rkb9dahHCP6UKLNFDLtt2hKmR9s5ZNcRSPD6oj4FWmymYW/uWoFaCrPP9dAp/9ho
         EdUQry3otWmv/uE95yaGeNT1n9PaOVifXxcrif2qQoZQlbO2okWrEM0buP2bNp39b/XO
         GuxpUHLjOgzNI3ZNeKHrUc3nUYMEk1Jy2g0yQ5kHABh7KeNu7GZmoYFT+56xOLR7JEQb
         NRo8jPJ0pS6Q1D2yj8RyBPgfnQEQw+YJKGvauOW8K+J3ZzqnaVThvja7xQrKN0/wr2r3
         Vcuw==
X-Gm-Message-State: AOJu0YwUe5e4pdhzwv02kJueDi8h9lqSs1L3MUY8lXCelSvvK31WgRiR
	Zh9diFAvVfD8WFq47KbLG1CNTc6F2yNDFSyBZDRkvMelDP/ZpYBTjbgE
X-Gm-Gg: AY/fxX43saCeuI0c1ddMB4OCeB8JyPcqpT7zFRFQR/1mmZ4aHDH2ekUFOwSvZeJBE4y
	+MW894OKcvXEUPRy2OkY61flBVPobh3mL8eMTBiHii9kMa5q8Pf08YC59zO+HpzkP41DHqCDVnv
	Eb18wypxbY/BasKzZFlLfyg+Lh1wtvSGv+XUCdXzEg+BlnHQtoeYaALmeKDhXpuMYbLC4kqEhYO
	rGqRuohKZTuVn8Odw1xQrshvQUX5BPcTWtDbpJShK6RPxErw6QVuNyfW+nOkNMsl2Rf14U+UbTK
	x3oU1KJSiWJWFTR4mltW3DQ37Q4Q2GI9VN+y+iQDTujry3EhWgXR845qPvm+PFPF4y2TLqMcXaP
	RXEuGLy5LdhxGzZY4GTGMlg1kvq0DaqQDWEqh9z5o+rnpPj4B0Tj11eJzt+QrYZ09dj3lLbzBTS
	gJ71rg5/oAA6deWlVWiw/IBxhNX49hgk0FD/1suJSPsz075mBpfd6KPktAwtkVrByH/le5VYI=
X-Google-Smtp-Source: AGHT+IFBqTJ1Om0TiFmR3UMFcq6ybfet+uH2iZtl6JLYYKVjMKSvkjPV1HFnXhhRI3hh2JK8R3HIdw==
X-Received: by 2002:a05:7022:927:b0:11b:9386:826b with SMTP id a92af1059eb24-121f8b9cf08mr17914494c88.48.1768254158927;
        Mon, 12 Jan 2026 13:42:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b21dasm18420909eec.27.2026.01.12.13.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 13:42:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89927834-9e3c-4076-83c3-add8bbfdf187@roeck-us.net>
Date: Mon, 12 Jan 2026 13:42:37 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon/pmbus: Add Infineon TDA38740A
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <20260107144507.46491-2-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260107144507.46491-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:45, ASHISH YADAV wrote:
> Document the TDA38740A/25A device tree binding.
> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> 
> ---
> Changes in v2:
>   - Review comments address:
> https://lore.kernel.org/all/2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org/
> 

That is not a change log.

Guenter

> Driver code in review process:
> https://www.spinics.net/lists/kernel/msg5985470.html
> ---
>   .../hwmon/pmbus/infineon,tda38740a.yaml       | 81 +++++++++++++++++++
>   1 file changed, 81 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> new file mode 100644
> index 000000000000..cd4102350a15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator with I2C
> +
> +maintainers:
> +  - ASHISH YADAV <Ashish.Yadav@infineon.com>
> +
> +description: |
> +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchronous
> +  Buck Regulator with I2C designed for Industrial use.
> +
> +  Datasheet:
> +  https://www.infineon.com/assets/row/public/documents/24/49/infineon-tda38740a-tda38725a-datasheet-en.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,tda38725a
> +      - infineon,tda38740a
> +
> +  reg:
> +    maxItems: 1
> +
> +  infineon,vout-voltage-multiplier:
> +    description: |
> +      TDA38740/25 pin strap parts are available in two flavors of 1:1 & 1:2
> +      vout scale loop.
> +      For the 1:1 vout_scale_loop version, there is no need for any resistor
> +      divider as output voltage sense pins are directly connected to
> +      the output.
> +
> +      For a 1:2 scale loop version, it is recommended to use 499 ohms each for
> +      top and bottom across the feedback path.
> +      However, in some applications customers tend to use an intentional
> +      resistor divider across the output with a different divider ratio other
> +      than 1:1 or 1:2 to alter the actual output voltage.
> +
> +      For example, if pin strap part is set to Vboot of 0.7V,they use a
> +      resistor divider to generate 0.75V using the equation provided in
> +      Section 13.3 of the datasheet.In this case, as there are only two
> +      vout_scale_loop options of 1:1 and 1:2 that the IC can identify,
> +      Read_Vout would still read as 0.7V in the telemetry and the baseboard
> +      management controllers would use this telemetry data to monitor the
> +      rail parameters leading to false tripping of the system.
> +      This multiplier is used to offset the telemetry output voltage Read_Vout
> +      so that the telemetry data is reported correctly to the monitoring
> +      controller,in this example the multiplier would be 0.75/0.7 = 1.071.
> +
> +      This multiplier is required only for any external monitoring of the rail
> +      output voltage. All the other Vout related parameters are used
> +      internally by the IC and there is only a slight impact on the fault
> +      thresholds.The impact can be calculated using equations in Section 13.3
> +      of the datasheet.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hwmon@40 {
> +            compatible = "infineon,tda38740a";
> +            reg = <0x40>;
> +            infineon,vout-voltage-multiplier = <75 70>;
> +        };
> +    };

