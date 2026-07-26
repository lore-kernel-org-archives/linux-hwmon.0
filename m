Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B13BCD2C
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080279; cv=none; b=FYHZ9fSgDuoqyZlJ7fsStv7j3vId1IZHcM+3KGe8v8afs67EnkC0y2H7Up6LC+GPDIfGqXsof9wgn30dFyzZVc+3RVaPPYARFNFl4zBy1+jGg3ErktrmC5gyEMTScs0CqULaZusSQU57184sYafjLdj91/uwCqID9Wo/GpSh2GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080279; c=relaxed/simple;
	bh=2WZER4o6v0Hx8PfdeNj46jlYkr2QO/bQWZIQs/AAsUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2T/0ZxAdc3mkkea4lZoefuX4qD92nC3oP6rr0RA8WQ15y/1GTnO+qQqsIGDEOHk4rgVAyoTsfml0cPKcJhQFwZiC2dymKj+7hjwmgWxaIWWThiK71Tj+Fq0RzjQtpzl1GheZosvWP/du+DQslCr49gV5Wkh5is9xEDQSbRAcWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cJI9l0pA; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cJI9l0pA"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4a45b3f0becso934738b6e.1
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785080273; x=1785685073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iZf44bRNZi4EavQ0T3yVwCCro6xvtHUrPxwZYFjPgs=;
        b=cJI9l0pATcynKd0FnHdTvt58QaGanpa7zhfpT9JbR/3PyFqq/n+dgpoC44CP3RRfuv
         4dm/u81lTsBSi9d/S/sg3BmYgO1siDok2r5u3U8cVPwiWFu12AyGugqmfT8cEiLQRDvy
         Kx6jv8x4joKoyEQi9WViAxMuBRiIrQ9hWiNQq0ZU5Cm5M5+x7OH5RkZJ6746DjzlbX9B
         KFItqqjGO992904srSXcZYISB1Dwsk8Vq0Z8cPngACVR+/qy5L0ZQsYtjskxMr4tYiyK
         ANe8e597li4UGuQNlwjFkLybFT92XLWbAVvMu5++SNjtyEbmk1meZBP/qi3bomLgQS2L
         PvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080273; x=1785685073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iZf44bRNZi4EavQ0T3yVwCCro6xvtHUrPxwZYFjPgs=;
        b=rK0mTRSW17Vc8zLL9LyJ2RwdZStbAkDeFitDRXcMm+zQSrZJj4pMS7lM7SiVBBDz/o
         eugyHc/z5Uovu5TBgUxifn06PqusDhcdJ63N803W/jVOqoemsoL5qoBg4BFN3VL3gaZo
         jBk5+WFi3Amc5Q96Sk3FmQff6fffdjuVLbMXWtwKyy2PKQr5Ssuw2EYucUongYGTolmL
         IJGNHXBrPXojvobhisCBWcuRClOjdz/9eLgoX1fZbkCA+6HCC2MLhMydv50Gj/K9rDtA
         gW+VCEcBRIYdPywQlqR20KqD3F/MeDlbTfYBzpl4BylXE3evLs5yGH7eldpCgQSqoQ6R
         TnHQ==
X-Gm-Message-State: AOJu0YyTMNP6kv6N80EAyD6btKc5JGoV5IxX/mLzA4zF8xCIrrlCPHXh
	ZgxPj6ZsMKfKgnBJBbz7Y1kAP44PLkp/zNzUSx3Whryf15bHtP5ESwVvWaDV63pFNeo=
X-Gm-Gg: AR+sD10h5mOXMqn/iSVdaOrdmMt0w/FEiRqcEoI1BqnF3cvtqxFi1hJY40ue9X/NbTE
	GpRdwbnyBw3FmtGZOTOljU6KBF8J/65I03KRLdoLgF4H2/PNFZcqVX8z+JxTJeX+8Svz4gKMND3
	IPyyEqAHzzyhY5pHKL0pMP+ed52r8jid3QuZgFbWLe0g9L5f0JFp907u1pOGD8XNESli6zT2xyd
	G0CV3/daGtV/PJNtAeT6jBOLZog7KhcOCkvF6ARtj4495pbyUTgCBmA2Wwwqpnf/Ezoz2/0kUsq
	sY7aoRoR1WaGkGsoI7xknxHdwDKzX0xuSf8kvQWSciuz2E6FTgi5SyGnVTn4XZLZp699ciAwoyB
	MlXMZ14L24Xslss68/f9pKZLxxYp+g1NL0uQ+FSPm3KzZdgF0pcF8m/3HEUDMnvxnP16PVH1Dfm
	76+BI+HaE1nKNuaO7rMZ2MggSBSTqx7eT8iCyPaDI9om195eAfAWmUDJKg0Q==
X-Received: by 2002:a05:6808:3190:b0:4a2:ca6b:4214 with SMTP id 5614622812f47-4ab6a298532mr4860974b6e.29.1785080272888;
        Sun, 26 Jul 2026 08:37:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:105e:29ca:45cc:c7? ([2600:8803:e7e4:500:105e:29ca:45cc:c7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab3505ac2bsm7308907b6e.10.2026.07.26.08.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 08:37:51 -0700 (PDT)
Message-ID: <39bac146-227f-4155-a80a-78b84a89ef20@baylibre.com>
Date: Sun, 26 Jul 2026 10:37:49 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: add maxim,max40080
To: Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jic23@kernel.org, andy@kernel.org,
 nuno.sa@analog.com, linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ciprian.hegbeli@analog.com, siratul.islam@linux.dev,
 u.kleine-koenig@baylibre.com
References: <20260723065036.2683075-1-stefan.popa@analog.com>
 <20260723065036.2683075-2-stefan.popa@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260723065036.2683075-2-stefan.popa@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 1:50 AM, Stefan Popa wrote:
> Add device tree bindings for the Maxim MAX40080 bidirectional
> current-sense amplifier with a 12-bit ADC and an I2C/SMBus interface.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  .../bindings/iio/adc/maxim,max40080.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> new file mode 100644
> index 0000000000000..170bf4eff8706
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/maxim,max40080.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX40080 bidirectional current-sense amplifier
> +
> +maintainers:
> +  - Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> +  - Stefan Popa <stefan.popa@analog.com>
> +
> +description: |
> +  The MAX40080 is a high-precision, bidirectional current-sense amplifier with
> +  an integrated 12-bit ADC and an I2C/SMBus interface. It measures the voltage
> +  across an external shunt resistor and the input bus voltage, and stores the
> +  results in an internal FIFO.
> +
> +  Datasheet:
> +    https://www.analog.com/en/products/max40080.html
> +
> +properties:
> +  compatible:
> +    const: maxim,max40080

adi, (the part is owned by ADI now)

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Value of the current-sense shunt resistor connected between the IN+ and
> +      IN- inputs. Used to scale the reported current.
> +

Missing vdd-supply for power and interrupts for ALERT_ output.

> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@20 {
> +            compatible = "maxim,max40080";
> +            reg = <0x20>;
> +            #io-channel-cells = <1>;
> +            shunt-resistor-micro-ohms = <100000>;
> +        };
> +    };

