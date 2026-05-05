Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B60344DAA
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987324; cv=none; b=kVpvzG9iYAAq8Jir2eCIKxma8GGA5CG2VuWeHgcLEeb5AA0qm4FZhuOQEQcAdfxSwf7chossSS8c3fB+MxSgsDpJ9tXw3KwYZj7bjUqoU29JrFvJfX+XSq20ayxYrYIfM7NCsYCnN7frh88CJXO2kbNncoFalEyhrl2Wjwzc2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987324; c=relaxed/simple;
	bh=O8v+5oxbFh4eT5+okYqt+svpXK+3HTEmUls1wLQMzPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqIT0HPPQr4SXOsFZwBzApWbbi0UgdV+2W4m5QeGy8QuktjtxSfqjlJrF3zfXwRM10lsQcPYnTCLytpOJaIAlvPXipx7xu6fnGGFdH2smoCzxNaX55lUsZHxEmsI78vehwNw/5xX8/QCCFqhLQ4xKDXPbl/bghUJoGQbyMsK5kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcs/QXF5; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcs/QXF5"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so6626090eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 06:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987318; x=1778592118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD8x1Q/Xam2zhPT/cWjBJfD2xANG/MZRgfmjejPy5dQ=;
        b=gcs/QXF5ZX4LBbcZsqsT7Vbltn3jrAVTmc/ILucisWeeAdXQ1OKBySNUzFibkcIusg
         jhK78yKH0RLErs9Ga+d8rY9ogp7HHSqDXFxpPZxFUJJDxwrBJuMzTOkxRYD1r50MfyA0
         Y4TkY3t3zzMeaCYwFpWDYIwyxXPdtaKhJe2s9dm7Tr3x78XjZA1t5Gyr1D8CUxdxHGs9
         DdNropxYHlOF4cTq5lJciMyygbyYAkNEuYnTik+hpNtTU1jSU0pgrr5u7Fpc2KDViG9K
         +IWwftI/xXLyqnkotjDmLNfvmWOhaKWd2Y77VXKtfMj9PpP95DJpxL2Td0OiaQfPLbQo
         AEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987318; x=1778592118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pD8x1Q/Xam2zhPT/cWjBJfD2xANG/MZRgfmjejPy5dQ=;
        b=TfE7dKgVMUrYmyhMnURGEzlxmsTOYy9nwd2VBfX2y6dP+8+IUKrnrfYvo6fVvC3LgR
         MeMjoCvgWhPoNt/3d1yxFt8v7MqEDI59Sb1o1M9rgKEk5M59HksRahU/fGM+/in4H0ZE
         /xnlcShlvfVKauUhwBoQcTARt30DqaGnCFpkXx/PxeFXQYvdk7i+xsRruJNDHCIzAqIi
         UzMnCNNWZ6HPIkMVKryW+lwSuwMacrSldDaxshA0S4cNToKDYslLGbOnCKobWpU8Q4cR
         e4KoIY55xF/JT186rNwGh27x8IuVaDLT+2sDjP6zlOexfJ1Dbf/DTZqirywRahfwM+2z
         zsaw==
X-Forwarded-Encrypted: i=1; AFNElJ+I+Nmaa+Vk9E2oNbGpxrElSZusfisbdgbQCp2ZiVBoTlwMfZ3fu8XMB94RoDeeg+J0DGPs3bR82wBqVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKb6ZHR2higV9nkyIFEesMddgGaBkzciAPcGG0ocuHj6Kq9hJ0
	3VbE11rZVJqHAzAiDDqVy89c7s50efzklg0mfa2qZihkjFOr+Mt4ufzY
X-Gm-Gg: AeBDieuN9I3x5yT7CehsaBSi3kT5q5xqvkNgY8ydoBJHNjdYjCsH31xBX7S9VO+Nshl
	6PfIrcNikNhoJOBjzMn1ZLXuOTBExYsYRZbQESbVl5+6rb6RPIBEnM0bpMOui+NMeikzVU9aif+
	JpSqLRsGhYcwhpP7bmtVTwWSDykg8/Ps59Cnm94tSklevCsolFc2gRPpaS3ziS41g42Ssm7SX4Y
	HFjsBqgLHHKQlFYmqxTx6H7XNnU80O2Ptdalspya8Ba6S2RXP7PI+la/fMzTrGZbWrLB1Dm5evd
	sJi0jxRg/Iu13uZ0JbyAb+O2+Ohk7p2NkZYoYAV1AFA5zR7iCH//2MmgkcccN/lffVdMz8mEUj/
	P1pWzmFlant6xBwJWM0GwcVT7jB8pYI7epymvZj0e/13vzWY/xWTqxRvtS9wbn+cC985brp/PRn
	B6fklJT/aEhzAYR/nJFlM3w8vrYwV6mX0EinHwobYZPUmUpeE=
X-Received: by 2002:a05:7300:578d:b0:2d1:9b35:4ed3 with SMTP id 5a478bee46e88-2f40a09561fmr1290615eec.28.1777987318256;
        Tue, 05 May 2026 06:21:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm24278756eec.9.2026.05.05.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:21:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:21:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: linux@baker-net.org.uk, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: zyxel,nsa320-mcu: convert to DT
 schema
Message-ID: <f3f1f99c-4433-4a5a-bbee-934c6d78380f@roeck-us.net>
References: <20260501102116.8275-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501102116.8275-1-manishbaing2789@gmail.com>

On Fri, May 01, 2026 at 10:21:16AM +0000, Manish Baing wrote:
> Convert the ZyXEL NSA320 MCU bindings from text format to YAML schema.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> Acked-by: Adam Baker <linux@baker-net.org.uk>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, after fixing Acked-By: -> Acked-by: as above.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/nsa320-mcu.txt  | 20 -------
>  .../bindings/hwmon/zyxel,nsa320-mcu.yaml      | 54 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt b/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
> deleted file mode 100644
> index 0863e067c85b..000000000000
> --- a/Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Bindings for the fan / temperature monitor microcontroller used on
> -the Zyxel NSA 320 and several subsequent models.
> -
> -Required properties:
> -- compatible	: "zyxel,nsa320-mcu"
> -- data-gpios	: The GPIO pin connected to the data line on the MCU
> -- clk-gpios	: The GPIO pin connected to the clock line on the MCU
> -- act-gpios	: The GPIO pin connected to the active line on the MCU
> -
> -Example:
> -
> -	hwmon {
> -		compatible = "zyxel,nsa320-mcu";
> -		pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act>;
> -		pinctrl-names = "default";
> -
> -		data-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
> -		clk-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
> -		act-gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
> -	};
> diff --git a/Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml b/Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
> new file mode 100644
> index 000000000000..a111f8125e09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/zyxel,nsa320-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZyXEL NSA320 MCU
> +
> +maintainers:
> +  - Adam Baker <linux@baker-net.org.uk>
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +description:
> +  The ZyXEL NSA320 uses a dedicated microcontroller to manage system-critical
> +  functions like fan speed and power monitoring. It is connected to the SoC
> +  via a GPIO-based serial protocol.
> +
> +properties:
> +  compatible:
> +    const: zyxel,nsa320-mcu
> +
> +  data-gpios:
> +    maxItems: 1
> +    description: GPIO pin connected to the data line on the MCU.
> +
> +  clk-gpios:
> +    maxItems: 1
> +    description: GPIO pin connected to the clock line on the MCU.
> +
> +  act-gpios:
> +    maxItems: 1
> +    description: GPIO pin connected to the active line on the MCU.
> +
> +required:
> +  - compatible
> +  - data-gpios
> +  - clk-gpios
> +  - act-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    hwmon {
> +        compatible = "zyxel,nsa320-mcu";
> +        pinctrl-0 = <&pmx_mcu_data &pmx_mcu_clk &pmx_mcu_act>;
> +        pinctrl-names = "default";
> +
> +        data-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
> +        clk-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
> +        act-gpios = <&gpio0 17 GPIO_ACTIVE_LOW>;
> +    };
