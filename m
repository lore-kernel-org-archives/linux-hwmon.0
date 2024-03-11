Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A551C44
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2024 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176213; cv=none; b=EWSvBg74C8rgNS6L3+OH06VAeU1seyF0DN2MkmVLrSYq4hEPVPgiCQvJspRRDmLt8yuXCY72m0WSy2h+Yvnh1vMhkZ5pwYcwpY1isHh+NWYDU0Ne5mO9cMSwBMCMEoqCkfMML9iqOvzUhI+MqmnD0/9jTmrLGNcyncNNuSYgdok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176213; c=relaxed/simple;
	bh=CvU7qCeTpG7KMcFO9oR+4213j+58o2lmj9+2WJtDaRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sr+ygfq3EKmH+U+NS2mvWgFdaAJti4R8g1AShN/0KcBZA+95K1HmOUyLtFg90ko6Jh+GZ8DlxS6KUv6JLXbVaPyDhIWp+fUnBWXkZ5Ck6C2Exf06quR/eW1Ssksz6nFiuahDPdkBpGmb03ozEid8HvkgqLm+yEsVGUETAbHuFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3G9acE6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3G9acE6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4132600824bso8567235e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2024 09:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710176209; x=1710781009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POVZyByE2roYdGBce+KP4kDgLZKqrR9XbHc9Ku9ZFv4=;
        b=a3G9acE6djR/jTVusDMc7M4JQFt4yml/0XdeY/svwNc/if9ld0Q/Sit+44itEFZub2
         Nqr02YcgLvT3huF0DEI77K1choGEF9qXqt0j+b+2EwvqiUpmIevIIMuvPpmeuyBlc9/y
         ThHrCTIjSeDUcUpqrZic/uNAICzhzXScuLEG5eOKn3IHopAGlZiWUVCnQ+6ilzw2fe2F
         c2BhMyw1RmmALPh9+VjwW8cdQVxXg/bs48DIkO4OEJcmsmkZNyNzZSSO3WhkhH3BGN29
         RaLoHxWH1AnwBjWPDDleaHqpKjj5RTonkQp+A54+bmdQFHStZc8I8h5pwB5jtogg2urf
         DJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710176209; x=1710781009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POVZyByE2roYdGBce+KP4kDgLZKqrR9XbHc9Ku9ZFv4=;
        b=BTxxytmrKLgTgco5jJgPfa3PT54FcHnmaCGT/J5eGJaoc9yipo2um0i6MLS39wP2Nt
         PUsv7On1NBNVm6vusrUCeBdYe/udgQWvrsJT6Js151oRMke7D0qTJPvwMp2EGXGYIryS
         9hkJ5nqGgFEE9uxKNbGfZWZGrxsdrvaIh6FBEgLbBcw3TAujqKymZFF8WYRaqXNlwiSL
         Bljrx680MajfrXSaO5vWOW5+ZMxZopMu5DLD+aNQzgvRxTQ0mvowZ1WhWIAqpKGu5dii
         iRS+j5tOUtBTiGDkYKQ9oUBReo7DX/dmjh7o0VO+3YPjQjI08vM0RJWUWe5o3wQGxOsC
         DTUA==
X-Forwarded-Encrypted: i=1; AJvYcCU+EHm48iULtxYuD7aw94SAVQBTc3e/nZ8y+LUGtvWl4dNeUFD/GyWLXMkNaHakbyKNl1h546jzm2F/6otcOpWAJ+BS2RJHjNyvh9o=
X-Gm-Message-State: AOJu0YxDaBb/NLpukBcq5KPAY3GwkD9oDudBbOkCxgQBUIudCcspXeRx
	UY6OWCJ4B3l4srqpFCw+Ifhx/QJP8rRZNv5QFHY7teAzPk6Izb9tgrs/KV5kjEU=
X-Google-Smtp-Source: AGHT+IGhmGyiqfbfTnfPzC5CDX0RiX7IZtPwSwbmSNRDNBk6wfFxwNHbS08qkGideIw3WHZtzVsvOg==
X-Received: by 2002:a05:600c:1c12:b0:413:3059:a823 with SMTP id j18-20020a05600c1c1200b004133059a823mr679308wms.30.1710176209186;
        Mon, 11 Mar 2024 09:56:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b00412f428aedasm16278722wmp.46.2024.03.11.09.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 09:56:48 -0700 (PDT)
Message-ID: <9d1207f1-4941-4f2a-99d6-371f5b4709f5@linaro.org>
Date: Mon, 11 Mar 2024 17:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
Content-Language: en-US
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240311111347.23067-4-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2024 12:13, Chanh Nguyen wrote:
> Add pwmout-pin-as-tach-input property.

Why is this split from original binding? This does not make much
sense... Add complete hardware description.

> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
> index 5a93e6bdebda..447cac17053a 100644
> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
> @@ -25,6 +25,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  pwmout-pin-as-tach-input:
> +    description: |
> +      An array of six integers responds to six PWM channels for
> +      configuring the pwm to tach mode.
> +      When set to 0, the associated PWMOUT produces a PWM waveform for
> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input

No vendor prefix, so generic property... but where is it defined?


Best regards,
Krzysztof

