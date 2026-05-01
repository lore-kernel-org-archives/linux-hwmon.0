Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54FEEEC3;
	Fri,  1 May 2026 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777672414; cv=none; b=MHb46ZYqMs2bzK79tzQ0HlKqRk3g1RKnAMoDhg4uZq8ZU15q4W739TdOFagVLK983V4CopEplTvGWzb4mvaPlbCOd2/aJ+sUIz0TKiQ12Av4Rtu/GYpaON7imCaD/fEeW/C3F2S4JMFzq9SNtFPVUK4rWfjoTs4iYIwi3ZMQRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777672414; c=relaxed/simple;
	bh=FLjfmgYp3HEkmYkyLWIj99995Y2G6PJWAFtDRXnk9ug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBpR+BQpLrZh+0dL/DsFRtQ2lYWdHkCJ8BZnbQ6ypgm8oisdFrweBmHRbQBJtq1RNqTUES1a7UDWnQjymw6KPqs8lshf69OW9+o4Yiyj247CY8LLBMMFQTQ6jrxZcDyPa2KZJpcayL7hu97GpSDkQ0dc6ByxgLhwb3oNUdQduLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baker-net.org.uk; spf=pass smtp.mailfrom=baker-net.org.uk; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baker-net.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baker-net.org.uk
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [212.227.15.153]) with ESMTPSA (Nemesis) id 1MXp1O-1vpIVD3ApI-00UDdk; Fri, 01
 May 2026 23:53:23 +0200
Received: from [192.168.0.132] (gromit.baker-net.org.uk [192.168.0.132])
	by wallace.baker-net.org.uk (Postfix) with ESMTPS id BA42B5980367;
	Fri,  1 May 2026 22:53:22 +0100 (BST)
Message-ID: <56d985c5-e795-4108-9045-c7b3ab8f71ae@baker-net.org.uk>
Date: Fri, 1 May 2026 22:53:22 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: zyxel,nsa320-mcu: convert to DT
 schema
To: Manish Baing <manishbaing2789@gmail.com>, linux@roeck-us.net,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260501102116.8275-1-manishbaing2789@gmail.com>
Content-Language: en-GB
From: Adam Baker <linux@baker-net.org.uk>
In-Reply-To: <20260501102116.8275-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:W4YXjXRfdXVdyyMRU3PR1+U+EDpYSuYxx0jGvoUmwiXDYbdWKZC
 DXaJYB+Tl7aao/RlogNDtia4Mp6YaCXcjXWftcP25TUBMpecWgbUBGgH35Do700kGqJfQDL
 a/jx72NEsSZ970RtRxqBvquf24qXLebBvfPFXzBGFHiemp3teBq4nPLT20+SlROOh6U9Dgv
 J+cuPKHZOjPG90a+rn3mg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G6MZQ0C5Dps=;XT6TpJcNjCGTmSElnVM3qjJdNH8
 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

Acked-By: Adam Baker <linux@baker-net.org.uk>

On 01/05/2026 11:21, Manish Baing wrote:
> Convert the ZyXEL NSA320 MCU bindings from text format to YAML schema.
> 
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
>   .../devicetree/bindings/hwmon/nsa320-mcu.txt  | 20 -------
>   .../bindings/hwmon/zyxel,nsa320-mcu.yaml      | 54 +++++++++++++++++++
>   2 files changed, 54 insertions(+), 20 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt
>   create mode 100644 Documentation/devicetree/bindings/hwmon/zyxel,nsa320-mcu.yaml
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

