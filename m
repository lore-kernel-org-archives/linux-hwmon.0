Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B638DD4
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Feb 2024 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355618; cv=none; b=BuZZvS0w6rSDW5fBZYoZvnb7+UGNn6IQN9n1WvOhd80ciikJs7/ax0zmXL4v1meik9HMCt0/lgCJIgXfoF8o+GipByvE8ERKVTnvbXYKCRZ3oyNCNifBUi+emqcu0Y8ynDs0wMb1hpXhwNZrBIcJUH7dz4hGP62Zn9+HKdimGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355618; c=relaxed/simple;
	bh=hVpZ/hVGevdYtgvo/XQjJj3AHvLv8nWCEz26DQWF+08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1K82XztVvcq/YbzQc0SUXflDF+ncEWnYubiJSxWvkAXYJkrFee/RBJCqKma8bx/j1MIX5gfDIRovRN5KBACsn6YeF4kwaALryLTubJ0eXbIEM+jlAsXeSEU+d+JIs2R31eG/Csld/YdyX4y9Q3kD2vsnOvRyUcld/tyBjrtBt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV+/kYxl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV+/kYxl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d7881b1843so37453505ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Feb 2024 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708355616; x=1708960416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=n9ZQkqa9998az0lESyyLYVffiOq9V51AOzKgC+yF078=;
        b=iV+/kYxllnylliLdIGEPsj7P4jlcCkue4A9ReXBptYaxdqO6GrWSwUMIS0q69vdesS
         EU3AyzNXWN0f/mP3jbs0ZQShx4r9pnFTQTBZrjnq924v4xwg/h8E8mR3oB3a1QaFOgTf
         rcYZf2PAgrFdC+8uGvdT9Rdf4nyZ6NdxJoHo0ltoxWBj1nXRPWbgNtHwWkUY15MvfDsM
         Z51rqlsBlJyP8moypTWDRvu9zmboLnnKKXLoMAtkiar8ov8+7Jo2//jA59WPFuNlEKrd
         ZxFvMJ6ZHi3FyVvK0ydjb2qX/0sCuu8LnHZm9f4fbyr+FEccJh1LjMfxE2lxviOBITNj
         AQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708355616; x=1708960416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9ZQkqa9998az0lESyyLYVffiOq9V51AOzKgC+yF078=;
        b=vtMfoakwjCsdxOXdQb2azt2qXsEsQp05+bOQmuejYPnsukFXtdMjArct1PQIPlkpL3
         YW/YUBbBcLGEXnTCAuz7Y8fZujYpLfAf5oKGdTa3t+ZVaoX3X6gXFSXqjWUr8DXJC3z6
         1wfFFXy97ufWPDeKo1UR5fj86RpEDRIOTkQyjWEmEffJ6GSHgof8AYUoSbScmjr9Ey21
         AbYnckcNO/UkpmIkmI5F21OU9unx8iRJ00FoG2CYZlaRHYXWCe2WdyvGd5hh0teghFS+
         0VyezxLEh5JtWZy71fITgn+X6IQfxpcl9UULWHHeOUJjqdxcIJYqEwoI6it4ihP/S+Ic
         Ce/g==
X-Gm-Message-State: AOJu0YyJLHmYkQoIgPGARNv8n6y5JqfmqeR8Zl0STF3xAF77Ar2WNJXu
	QcLtFqnOqoHqWX8zQJ0uUnm/nd/pJljiLJlDotlCS/w5CtycOtemUK85CTSC
X-Google-Smtp-Source: AGHT+IExTsXPDJBYtI7qcxc2j9ibTC/ovzNxETdu9qtSS9KEaPWH4A/w8JDUGCDoo+sAa3HWmtLy6Q==
X-Received: by 2002:a17:903:98f:b0:1db:b495:1391 with SMTP id mb15-20020a170903098f00b001dbb4951391mr12059287plb.36.1708355615584;
        Mon, 19 Feb 2024 07:13:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jw15-20020a170903278f00b001db5b39635dsm4486398plb.277.2024.02.19.07.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 07:13:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4265631-1835-4b9b-86a0-62b404cca5ae@roeck-us.net>
Date: Mon, 19 Feb 2024 07:13:33 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hwmon: (pmbus) Use PMBUS_REGULATOR_ONE to declare
 regulators with single output
To: Conor Dooley <conor@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Zev Weiss <zev@bewilderbeest.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240217-sliced-company-6c6fa2a40369@spud>
 <20240219-rigging-strive-fd54af33253c@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240219-rigging-strive-fd54af33253c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/24 06:48, Conor Dooley wrote:
> On Sat, Feb 17, 2024 at 10:00:30PM +0000, Conor Dooley wrote:
>> On Wed, Feb 14, 2024 at 11:43:39AM -0800, Guenter Roeck wrote:
>>> If a chip only provides a single regulator, it should be named 'vout'
>>> and not 'vout0'. Declare regulators for chips with a single ouput using
>>> PMBUS_REGULATOR_ONE() to make that happen.
>>
>> If we're gonna do this, we should go ahead and document each of these
>> regulators. If Naresh sends a v2 for the tda, I could do the others.
> 
> As it turns out, the infineon devices in question are not PMICs, but
> regulators themselves. I think something like the following is what we
> need. Perhaps Zev or the 9elements guys can comment.
> 
IMO The lm25066 patch should be separate.

Guenter

> Cheers,
> Conor.
> 
> commit 9cf2671c0b98c0a0dd599fe9152985d1320bf320
> Author: Conor Dooley <conor.dooley@microchip.com>
> Date:   Mon Feb 19 14:24:48 2024 +0000
> 
>      dt-bindings: regulator: promote infineon buck converters to their own binding
>      
>      These devices may need to make use of the common regulator properties,
>      but these are not permitted while only documented in
>      trivial-devices.yaml
>      
>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> new file mode 100644
> index 000000000000..bb0114f7e13f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon Buck Regulators with PMBUS interfaces
> +
> +maintainers:
> +  - Not Me.
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - infineon,ir38060
> +      - infineon,ir38064
> +      - infineon,ir38164
> +      - infineon,ir38263
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      regulator@34 {
> +        compatible = "infineon,ir38060";
> +        reg = <0x34>;
> +
> +        regulator-min-microvolt = <437500>;
> +        regulator-max-microvolt = <1387500>;
> +      };
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 9cdd5a534120..e07be7bf8395 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -130,14 +130,6 @@ properties:
>             - infineon,dps310
>               # Infineon IR36021 digital POL buck controller
>             - infineon,ir36021
> -            # Infineon IR38060 Voltage Regulator
> -          - infineon,ir38060
> -            # Infineon IR38064 Voltage Regulator
> -          - infineon,ir38064
> -            # Infineon IR38164 Voltage Regulator
> -          - infineon,ir38164
> -            # Infineon IR38263 Voltage Regulator
> -          - infineon,ir38263
>               # Infineon IRPS5401 Voltage Regulator (PMIC)
>             - infineon,irps5401
>               # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
> 
> commit 597739840d2bc95ebb884d7f5fc4f3cc206d9af6
> Author: Conor Dooley <conor.dooley@microchip.com>
> Date:   Mon Feb 19 13:29:12 2024 +0000
> 
>      dt-bindings: hwmon/pmbus: ti,lm25066: document regulators
>      
>      All devices documented in the lm25066 binding are intended for use with
>      a regulator, be that for purely monitoring purposes (lm25056) or, for
>      the other devices, as the controller of that regulator. The binding does
>      not currently allow regulator child nodes, so add one.
>      
>      Each of these devices interacts with only a single regulator and
>      documentation refers to it as "Vout", hence the choice of child node
>      name.
>      
>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml > index da8292bc32f5..4373e9c86e54 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> @@ -34,6 +34,18 @@ properties:
>         Shunt (sense) resistor value in micro-Ohms
>       default: 1000
>   
> +  regulators:
> +    type: object
> +
> +    properties:
> +      vout:
> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
>   required:
>     - compatible
>     - reg
> 

