Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D538330E
	for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716038; cv=none; b=WMpsy/pCjmJ6RQzwkQQXWzr+M3Skdo/9hSPpyn4XPBkmyF+jX9MuKQc6DFzQZ9iuMUzWHqleTXgwjBzg1+4QWv4jFPbvey0Mi3OS5EndgLUqx6xGY8IbU9rRUSlt7hvhAZOwbzhBAyQolOwr43aBkTKXfCoqeRz7sR4Scg0z9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716038; c=relaxed/simple;
	bh=E9mJ0ZSaqPkh3BkO8yS/DfFowBkoUmjAGTIbFIbX2Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuQfIgLCe/72JrRa/SGSTlblTaOeAVFp7C7sMZCLj4Ah0eJzMh0iAublLe+oOgonoIMF7cJejG9HMfTTzQqBSToiiHWyFogMthqBYvZAQuZul6EMrM997QZUYYcK1iEWlNORukfeQvt/YCPjW0grJfOPmbUw4pqu2gHErj2x9R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSVSSdZX; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSVSSdZX"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1329fc4bf77so6961799c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779716036; x=1780320836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnFay5PIcb5rM2eujuo4gD1l7YH3IarEX6qo/MN+h1g=;
        b=QSVSSdZXMpOZsTXzmtKO2u56khRZe839rkg5G7yxDItAWI7fd4pQ4MBH/3Xb5HRqLy
         qt7u7hYFUOfV2r9J4VrnXyGI9quIsRyUi0+AKNHwoebSnnMBfu769e0vBkRWDBEKbR2N
         KCH28frXR8RXjDNmo5IUviAHaQ6bUsWNalLVCplJPJACBNs/Ay5NxXLUeQtJmpgNsA4S
         Q3GPugvDzdJwWBhaJ37m/1EhPAnaRs1ZCvlDI9USQlm8cudcUD1NL3EKJt7wU0yXMP8a
         qp610N+8tFyF0SvD/iuFstEHBkGkvqeFeNmnYsPVB2bq5oQXffZxex/Cos5yTEDTcH2l
         Lhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716036; x=1780320836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WnFay5PIcb5rM2eujuo4gD1l7YH3IarEX6qo/MN+h1g=;
        b=jaz9V1YQ8HIuUSgQ9BOKdvdnnsf5Pf6SBhIDMRb3+g9ced2QjUhS2r2+PUqu3CBsmn
         GMqHnqYtUKB6mWAiyxqt/ZXZktfKRFGPO4oPOKmDmecvFHcNCf7JF+TP8L38Cv81zr6/
         /nF80qnhXlyNgVXupjI7HR4S7uTFiEUFtQ/wPpV0WwBtnpIYJrdT+/a53dk7x/XUEHd7
         86CVZ8WNZMbw4kdEyufBtcaxNX7UBeWvmKFYnqi3KLeJnsnAugq+oF5vfbb6X/zXhaxM
         K8Hyq2C9zak00FKM8s4otKbTxIJcsZ3jDayk35+oRQKKY1Dd917mY5Q5oYdpygejYTBb
         WzCg==
X-Forwarded-Encrypted: i=1; AFNElJ8srWkK5nYAGWTzpDUyOmJsFZ32gZEDcgWkndPwHqTEg2fMp2mrGHrXgzVGw5cScnK3Ap2rgHAz/QDCtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+Y1b3uu1KA8lL9IRlfGyZvLLQ/QoXBw3xOqMhl781MBOaiuy
	Le87muDwKTEmpDetHzLxT3wHs4VsFmIL+yW7w8nU9BpmSwXmm0Z1mutr
X-Gm-Gg: Acq92OG4A0DQcj8xG1EvWD9Kh613gDI908ZYhMUZlHEAT3j2ZhWjJLC/n0vW6K95XXi
	SNS0TLF8U3pf/1Ov2e7PudmFY1x8DRTp90KMql9/nDYIN0otVdJct306POR8zieGrzK287PdlKJ
	GDcQ6HXtVMmuOFJPY7Cg7667UOsR3bA+h5cozQ36uOiFoQiPLudG5eRNQ4C2aB4IA4q1Muytchx
	aeYWBwu3OcHvBYWB0IGSPmmxz9LLg3OWj04OkaQ420ifgnOVUN8joWw5hjr+AoL+5pXW6Bp+vyX
	cFbdlBiQWmolYkuqTWXE6UTxHPjJslWYyQu2vSMjI+2XwKxqnHpf6tdLZA7NZEPMGNguBnpjzGo
	ElCYIFeDlEuN93/cVpmxxgntxQacOfIovD7eMvqvJU3HHAg/qjrnGpH4P6sAdHYL1C1L3S18LOA
	dfKLSBOtZnUTz4UClaG6Q2h5gtWqK6JsuXKeub
X-Received: by 2002:a05:7022:4393:b0:12a:949b:b9b with SMTP id a92af1059eb24-1365fb526d4mr5122952c88.23.1779716035456;
        Mon, 25 May 2026 06:33:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm3785990c88.13.2026.05.25.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:33:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 25 May 2026 06:33:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <2571c780-7bb7-4519-92bd-52b82ae6a965@roeck-us.net>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-2-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-2-728e4b91fe81@gmail.com>

On Wed, Nov 12, 2025 at 09:16:48PM +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++

I see that the rest of this series is going to be applied. This patch
touches bindings in mfd, which I can not apply.

With the assumption that the patch will be applied through some other tree,
presumably mfd:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> new file mode 100644
> index 000000000000..2eec317bc4b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC Hardware Monitoring
> +
> +description:
> +  Apple's System Management Controller (SMC) exposes a vast array of
> +  hardware monitoring sensors, including temperature probes, current and
> +  voltage sense, power meters, and fan speeds. It also provides endpoints
> +  to manually control the speed of each fan individually. Each Apple
> +  Silicon device exposes a different set of endpoints via SMC keys. This
> +  is true even when two machines share an SoC. The CPU core temperature
> +  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
> +  Pro, for example.
> +
> +maintainers:
> +  - James Calligeros <jcalligeros99@gmail.com>
> +
> +$defs:
> +  sensor:
> +    type: object
> +
> +    properties:
> +      apple,key-id:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: The SMC FourCC key of the desired sensor.
> +          Must match the node's suffix.
> +
> +      label:
> +        description: Human-readable name for the sensor
> +
> +    required:
> +      - apple,key-id
> +
> +properties:
> +  compatible:
> +    const: apple,smc-hwmon
> +
> +patternProperties:
> +  "^current-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +  "^fan-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +    properties:
> +      apple,fan-minimum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's minimum speed
> +
> +      apple,fan-maximum:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: SMC key containing the fan's maximum speed
> +
> +      apple,fan-target:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable endpoint for setting desired fan speed
> +
> +      apple,fan-mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        pattern: "^[A-Za-z0-9]{4}$"
> +        description: Writeable key to enable/disable manual fan control
> +
> +
> +  "^power-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +  "^temperature-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +  "^voltage-[A-Za-z0-9]{4}$":
> +    $ref: "#/$defs/sensor"
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 0410e712c900..34ce048619f5 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -49,6 +49,9 @@ properties:
>    rtc:
>      $ref: /schemas/rtc/apple,smc-rtc.yaml
>  
> +  hwmon:
> +    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
> +
>  additionalProperties: false
>  
>  required:
> @@ -89,5 +92,38 @@ examples:
>            nvmem-cells = <&rtc_offset>;
>            nvmem-cell-names = "rtc_offset";
>         };
> +
> +        hwmon {
> +          compatible = "apple,smc-hwmon";
> +
> +          current-ID0R {
> +            apple,key-id = "ID0R";
> +            label = "AC Input Current";
> +          };
> +
> +          fan-F0Ac {
> +            apple,key-id = "F0Ac";
> +            apple,fan-minimum = "F0Mn";
> +            apple,fan-maximum = "F0Mx";
> +            apple,fan-target = "F0Tg";
> +            apple,fan-mode = "F0Md";
> +            label = "Fan 1";
> +          };
> +
> +          power-PSTR {
> +            apple,key-id = "PSTR";
> +            label = "Total System Power";
> +          };
> +
> +          temperature-TW0P {
> +            apple,key-id = "TW0P";
> +            label = "WiFi/BT Module Temperature";
> +          };
> +
> +          voltage-VD0R {
> +            apple,key-id = "VD0R";
> +            label = "AC Input Voltage";
> +          };
> +        };
>        };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 51942a9a9b43..6e5e219c5fe6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2422,6 +2422,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>  F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
> +F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
