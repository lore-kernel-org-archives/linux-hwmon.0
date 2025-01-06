Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589061DC05D;
	Mon,  6 Jan 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160615; cv=none; b=bF2zGCNsOU3pGoQyPodtx7+LmRYzwlQ3AN82jETRmjJRCUDk++zi8TOikO9lHpoDOoIW+0/B/3jyUAAIn4UZF3qWr7cig/4GPHIslVCgixaEX2sErfdv06QqOdvTQU/A6195wPpwYwfNj4NEO1TKfNBRXw4lI9IPWr06/eeq928=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160615; c=relaxed/simple;
	bh=7Q3i8xJswYWcNOJxpGbRWAwokUg1oDkILbkbZFce7nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VgaiikEOQyqGz/ShyaVNa1U6onoomT+foJzq00nx7tTnEFaG37NmtG0plvnXx5e0QEZ02+UsvwOSoKvEc4Whqvf/PAA/grRpiI1WaKCVbTz0SCxrmKsxhP1V6I0XaRsU6mVgJoP1b84vLy2xalb5Q5ZfqFNsyps36WDs1nN/uzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaXX1mj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaXX1mj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC75BC4CEDD;
	Mon,  6 Jan 2025 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736160614;
	bh=7Q3i8xJswYWcNOJxpGbRWAwokUg1oDkILbkbZFce7nk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gaXX1mj6Ul4iLs37rgiTGzxwmDdM1V1fN3T3je9d906IUqpHrXiump8LPgMa8EsMG
	 Yh92zlozAnfTjUMw0GEDFwxjl3UJ9c1IBrbvuaUEm57Cy/2xjoKREMLvZAA3iEB8n7
	 5+nzaSnXbN9+3WwnjmUvooTu/3ImU3LCIUQHqdCqhb18ySVQ5AsftTSmUN2lgKmd9h
	 78grX0XTrfeasCksiFp1EzoeYD078ia+AjCs73Chk6qlZxo28hyuW754uD6pZ0ej/t
	 7brrIrt6FTV7binif/V02sWaU11BOQpJMIgZ/VtZ8uNcqgAj17ZHKdAgG8ygQwwioz
	 t1JQqPinG3Ofw==
Message-ID: <abdd156e-0c9b-477f-877c-0309c84c9d5b@kernel.org>
Date: Mon, 6 Jan 2025 11:50:07 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add INA233 device
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com, linux@roeck-us.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Leo-Yang@quantatw.com, corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-2-Leo-Yang@quantatw.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250106071337.3017926-2-Leo-Yang@quantatw.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 08:13, Leo Yang wrote:
> Add TI INA233 Current and Power Monitor bindings.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
> ---
>  .../bindings/hwmon/pmbus/ti,ina233.yaml       | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
> new file mode 100644
> index 000000000000..2677c98dadd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +

Drop blank line

> +$id: http://devicetree.org/schemas/hwmon/pmbus/ti,ina233.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments INA233 of power/voltage/current monitors
> +
> +maintainers:
> +  - Leo Yang <Leo-Yang@quantatw.com>
> +
> +description: |
> +  INA233 High-Side or Low-Side Measurement, Bidirectional Current
> +  and Power Monitor With I2C-, SMBus-, and PMBus-Compatible Interface.
> +
> +  Datasheet: https://www.ti.com/lit/ds/symlink/ina233.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ina233

This does not fit existing ti,ina bindings?

> +
> +  reg:
> +    maxItems: 1
> +
> +  shunt-resistor:
> +    description:
> +      Shunt resistor value in micro-Ohms, Please refer to the actual circuit
> +      resistor used.
> +    default: 2000

Which schema brings the $ref for this property?

> +
> +  current-lsb:
> +    description:
> +	    Calculate the Maximum Expected Current(A) / 2^15 in micro ampere (uA/bit).
> +	    e.g. 30A / 2^15 = 915 uA/bit
> +    default: 1000

Missing ref, missing vendor prefix and missing actual explanation what
it is for. I don't understand the description at all.

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
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        power-sensor@40 {
> +            compatible = "ti,ina233";
> +            reg = <0x40>;
> +            shunt-resistor = /bits/ 32 <5000>;

Drop unusual syntax. Please take a look how all other bindings and DTS
is doing this.

> +            current-lsb = /bits/ 16 <1000>;
> +        };
> +    };
> \ No newline at end of file

You have patch errors.

Best regards,
Krzysztof
