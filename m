Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DB50A6B
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Mar 2024 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709886061; cv=none; b=dmOpuqOc6nN/i7msu+3KI8VpDvOdd9dbBW59h2VO15izHb94LamW3CF3JKjoSy/FwKgS7m5oyFNsasDbM3VoGySW9Ea9KkC4ArUHhx6KKCtNDjc9/Mvjtg09bGfm94OuNIFUuxRg2Vppfcv5amoOR9MXOR5Vimu/c9U/7qZstpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709886061; c=relaxed/simple;
	bh=ahz3YcOF9uofhZKTfORfD/1+Zk/OaoO+ZVgJj60bTyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAXb1hhpbZ/33HHIQaL3TyGP5ddv1i0IxxHrgujeXtHUIkq3e0HCH8+djOWmIzBOWiciri9J8S84Tlk6FofE+0SM5AC32PxotneT9tCBKQIwkMl+N730MTgfUDYn4aDo9Q8POSxxXbS+Y515qb+a7jsQ71gK/wCihx0jmYqzR+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoxxPdBS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoxxPdBS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so699159a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Mar 2024 00:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709886057; x=1710490857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cy7p55riA5rAdpVJWdY5ZK1dkusaFnFRNha6fpyj6wM=;
        b=WoxxPdBSJrAcBQbga8LE9hakULUWKR8p5WUVNc+Zxwp5We54rRacRIzR1Jb+lpQb2Z
         HtiX+NLqFuFYkn1lbD1+3SPlW1PS452zu2ZxCZ8KlFGCN4wtVP/1J53rHswaQ2fEZjgT
         UKT5ZvLG8YH5Q7a+C/gQqBzIsUOWye6MT/Nl/q1vZwJCRp/DtHeDLbkQ8s4xeAt2N9oM
         NesS78l4Mfh/zFRw8t00oe271D7qqG876L/snN3bOA01OBC8/3ER+iU0Dx0Tvg7lsomu
         CBfXQubuk9ddMxjPDN6r7RU80vkghDZC76gfBlAlAVw1C80fPInKanDGYCo+zI4dcMTW
         WUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709886057; x=1710490857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cy7p55riA5rAdpVJWdY5ZK1dkusaFnFRNha6fpyj6wM=;
        b=NpzJaQCcZeIG1JjStyFo4CYY4ZnrhLJ5cbrayEL6asVnCmHfv/oZgHV2K3dxC/sqa2
         p6S3IMfBYd6U1P+Z6+Qk+pSjAVNA7LV433TmaqsgY6uCRx5M/INFqI5sB2/WXkXaZ8m5
         tXiyiZBRJ5qDlih4OXIFnSbad5ubCrIPB6DRSyTFvAHpl+/pvAipJFfvWQ102zeEJ5sK
         J2f2ec0HrT4M3QF4giK8SzqnvL+Aq+lcdrwoWhoiUGVY/82pmOmdb5Sul6suL40Ep21X
         xoXbpcbUKiGBNv0rEhaXXFUm9Ss+cSeJl59UzJhKmOC45aywvCC/addkFmsgvQySUGBL
         5/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Jul/lfAHrjKd0mTGpeXDoEDdL2xd4lpnzFy1nuBpaRs+3SLoRF88dSrvUmhbwkSnXopM4kkUKvR/qRzjnoPU6wVAYNz10WsCXng=
X-Gm-Message-State: AOJu0YzB43ZEfoJSCrtBRi8+VPgoGFx7l9NIHtJWpdupl/b7KllP0vRb
	tWdO/ILFY7OGV6qVLi6kWcC6y87sQ7tSZII8eRrxlByyWfgMDNCpnleEmG1Ev64=
X-Google-Smtp-Source: AGHT+IGz3KP5Z/Uh2wHZOU4HGJ7+sCE4Q28XysZhwDx7VdSq1gnlfxM59qd8HfhVNUDvT17vLXXrzA==
X-Received: by 2002:a50:cd1e:0:b0:566:5ea2:1257 with SMTP id z30-20020a50cd1e000000b005665ea21257mr1431238edi.16.1709886057096;
        Fri, 08 Mar 2024 00:20:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id m13-20020aa7d34d000000b0056486eaa669sm8924209edr.50.2024.03.08.00.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 00:20:56 -0800 (PST)
Message-ID: <a7f7eb88-24da-4b8b-a5e2-65c475dc2f4b@linaro.org>
Date: Fri, 8 Mar 2024 09:20:54 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: Convert APM X-Gene hwmon to dtschema
Content-Language: en-US
To: Sujal Bhor <bhorsujal@gmail.com>, "jdelvare@suse.com"
 <jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 hotran@apm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Daniel Baluta <daniel.baluta@nxp.com>
References: <CAHzG0Eu=Uqw3mBKV4wiBPvSQ-HBRGkE7NcA9v0Xt8pMpByL3Tg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAHzG0Eu=Uqw3mBKV4wiBPvSQ-HBRGkE7NcA9v0Xt8pMpByL3Tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2024 21:05, Sujal Bhor wrote:
> This patch converts the APM X-Gene hwmon bindings to DT schema (yaml).

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Sujal Bhor <bhorsujal@gmail.com>
> ---
>  .../hwmon/apm,xgene-slimpro-hwmon.yaml        | 36 +++++++++++++++++++
>  .../bindings/hwmon/apm-xgene-hwmon.txt        | 14 --------
>  2 files changed, 36 insertions(+), 14 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/hwmon/apm,xgene-slimpro-hwmon.yaml
>  delete mode 100644
> Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
> 
> diff --git
> a/Documentation/devicetree/bindings/hwmon/apm,xgene-slimpro-hwmon.yaml
> b/Documentation/devicetree/bindings/hwmon/apm,xgene-slimpro-hwmon.yaml

Malformed patch. I have doubts it is possible to apply it. You can try
and apply it via b4 by yourself...


> new file mode 100644
> index 000000000000..0ef9dd0c4bba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apm,xgene-slimpro-hwmon.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/apm,xgene-slimpro-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: APM X-Gene hwmon driver

Drop driver. Bindings are about hardware.

> +
> +maintainers:
> +  - Hoan Tran <hotran@apm.com>
> +
> +description: APM X-Gene SOC sensors accessed over the "SLIMpro" mailbox.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - apm,xgene-slimpro-hwmon
> +
> +  mboxes:
> +    maxItems: 1
> +    description: >
> +      Use the label reference for the mailbox as the first parameter.
> +      The second parameter is the channel number.

That's not entirely true. It depends on mbox cells, so drop description.

> +
> +required:
> +  - compatible
> +  - mboxes
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwmonslimpro {

hwmon or sensor (depends on what this is)


> +      compatible = "apm,xgene-slimpro-hwmon";
> +      mboxes = <&mailbox 7>;
> +    };

Best regards,
Krzysztof

