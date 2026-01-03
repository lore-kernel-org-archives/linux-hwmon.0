Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7F2110E
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Jan 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767444532; cv=none; b=JfA0PFbtS5FBPtTHo/k1264hfb6otCFHuKwDKiYmng+EH7U5CFi8Da2LZkzkUudG7xSalitAWNp/NTNpXaFErkHS6TZZLXtqMQipLAPSnEMj8qxsICxFyCBa19xsahMiB4X3U985x+FYMWRHPUr/3o50+AjveotqSGTrWWGvoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767444532; c=relaxed/simple;
	bh=Hu6YCUBJ21PXYhBV7GjXhva45C1KsphNBOWSvo8oN6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nE2sLkwjpn9HxURsEa+tB9R0U+Yti+as6jkxj1Q5EXK747c1Vems9CcUc5ZnVH1IGTaXtPI1ZUdjrGg43Oj9qWAAzdiBU3eb9stb2dD8AsnFQaskfgl5dE7pAqQSuC+BEY/feIyxc9a7YKByHiB6sLTHL3PCoxjirGvsDotBMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SraKKQdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SraKKQdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A5AC113D0;
	Sat,  3 Jan 2026 12:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767444531;
	bh=Hu6YCUBJ21PXYhBV7GjXhva45C1KsphNBOWSvo8oN6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SraKKQdwEwtxsifmuTt2jKjI37JeBIWVOMUX/OJAKv9CLhb0E4pOZAwnaGVXUIPuc
	 sWlxwjW9wcBfYEBaI3LFHIeTipGh/lh2lbK7mqaRPXCd54S5w7kZmEMi1NQ2/JNWlU
	 m+w9JguExstlHPdiHRYjWv16gU+cuAI+rABRWPgBuWCXpK48+uWTvWza/B/2pgFLLr
	 YjNmmB9ZpFfjnPMAml+POcxtuXEmROiygkqvn2aR1Jhnj5lFCUncUKZalt5mxgn+pQ
	 BxGrmLjcJYeL67O7LwSbHPIr0JuHplW3vmgoK4zq5snwVYbwZFyDi1tF9/udcDIwoT
	 39lyjgCOgYLNw==
Message-ID: <2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org>
Date: Sat, 3 Jan 2026 13:48:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon:(pmbus/tda38740a) Add driver for Infineon
 TDA38740A/TDA38725A Voltage Regulator
To: ASHISH YADAV <ashishyadav78@gmail.com>, linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, ASHISH YADAV <Ashish.Yadav@infineon.com>
References: <20251231105503.77881-1-Ashish.Yadav@infineon.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251231105503.77881-1-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/12/2025 11:55, ASHISH YADAV wrote:
> Add the pmbus driver for the Infineon TDA38740A/TDA38725A
>        voltage regulator.
> 
> Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> ---
>  .../hwmon/pmbus/infineon,tda38740a.yaml       |  73 ++++++

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

>  drivers/hwmon/pmbus/Kconfig                   |  16 ++
>  drivers/hwmon/pmbus/Makefile                  |   1 +
>  drivers/hwmon/pmbus/tda38740a.c               | 223 ++++++++++++++++++
>  4 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
>  create mode 100644 drivers/hwmon/pmbus/tda38740a.c
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml
> new file mode 100644
> index 000000000000..07c8eb94807e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.yaml

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> @@ -0,0 +1,73 @@
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
> +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchronous Buck Regulator with
> +  I2C designed for Industrial use.
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
> +  vout_multiplier:

Please read DTS coding style carefully.

Also, missing vendor prefix.

> +    description: |
> +      If voltage multiplier present at vout, the voltage at voltage sensor pin
> +      will be scaled. The properties will convert the raw reading to a more
> +      meaningful number if voltage multiplier present. It has two numbers,
> +      numerator ie vout_multiplier[0] and denominator ie vout_multiplier[1].
> +      Therefore, the adjusted vout is equal to
> +      Vout = (Vout * vout_multiplier[0]) / vout_multiplier[1].
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +
> +  regulators:

No need for this node at all.

> +    type: object
> +    description:
> +      list of regulators provided by this controller.
> +
> +    properties:
> +      vout:

Neither this. Just fold the child into the parent.

> +        $ref: /schemas/regulator/regulator.yaml#
> +        type: object
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
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
> +        tda38740a@40 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +            compatible = "infineon,tda38740a";
> +            reg = <0x40>;
> +            vout_multiplier = <75 70>;
> +        };
> +    };

....

> +};
> +
> +MODULE_DEVICE_TABLE(i2c, tda38740a_id);
> +
> +static const struct of_device_id __maybe_unused tda38740a_of_match[] = {
> +	{.compatible = "infineon,tda38725a", .data = (void *)tda38725a },
> +	{.compatible = "infineon,tda38740a", .data = (void *)tda38740a },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, tda38740a_of_match);
> +
> +/**
> + *  This is the driver that will be inserted

Drop, completely useless comment.

> + */
> +static struct i2c_driver tda38740a_driver = {
> +	.driver = {
> +		.name = "tda38740a",
> +		.of_match_table = of_match_ptr(tda38740a_of_match),
> +	},
> +	.probe = tda38740a_probe,
> +	.id_table = tda38740a_id,
> +};
> +
> +module_i2c_driver(tda38740a_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <Ashish.Yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon IPOL");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");


Best regards,
Krzysztof
