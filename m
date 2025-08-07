Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A95227EB9
	for <linux-hwmon@vger.kernel.org>; Thu,  7 Aug 2025 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754606716; cv=none; b=Tp6IgMp6xQfCKJOHOouwWFkoCojVAguhfKVKg+G+YiLkoRVIypoNeXh8B5wXrI4J8gTpUKqZ1geaGRs/pcwbt5xftAOGhVjHgeHmCHP1rzbRPyrL5XWGLIm1ojxyOI4fhQF3YWApi8We8YFpvbWJwBmMfJ9qUjHTbnLymhxNv3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754606716; c=relaxed/simple;
	bh=FWxQo+f14vdm5woimDw0nIzRfNP4eFlUMSHNRhja6tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROUkk3gqI71n9SjGKZbQ2RSzTWFH608ALUTTPZa3M9RrIf45yZsh7uPSmqVEwX2N3wTBUVuVE88Oet22CDvHE9h6MBIzlBPQyfaZvONzdvKvIxnt4aaUrnRc5KQ2/oIqMs2sqMdBygnAKDoljRWXZG4c8BoVZTlbJ91Qj6w+yvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7IobI09; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7IobI09"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31ee880f7d2so1844092a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Aug 2025 15:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754606713; x=1755211513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYt34NM1pKbyZAnMMclWtCFG8IIyktKFfBCa9Yd/BqU=;
        b=k7IobI099H5Vdf7jELyPPQUKOCSrSk5ZQKKc2iUX4nqGtStyWdrtxLcDzuuhkX11V3
         BXCWMk3Aga/vsup59ebjgV9iLrdlVtU++3xuD7cGRY8DumNDAFzlwmW2UlQPUdPxHGzu
         GwUD4LlAm8GIkU087exGOv8TL6xjchj8xExM+fO6DPkPv0kLtpfiSGq6Rl/X7kcCpejz
         r7Ir1XJn8KQYFqda/qTg/NKsrjBqtgUUK0ttzZbLHsjlaQOeX+8/Fpllm7tshIG85+Lx
         3uFOwrRdkW2JOgmQTW4bvKY2OwmEJzOgjTRCKxl+6Bw7w6ogH9VY6SEGaFvCS0M6rdvS
         EEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754606713; x=1755211513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYt34NM1pKbyZAnMMclWtCFG8IIyktKFfBCa9Yd/BqU=;
        b=kJOQsf5VgAistHnxNoDpgk1eTRzpzIc8gwBcb+TrFZ59gRp3t/u9X7WuEg8EX65Or9
         odPD6uqaJaLaB5Bqk9e1ysB58TcLRSg00oHQcovUjlQTUQDBRKS7rdsaqE0ORUDD/ehR
         fXI/qx+memVhQsNE9e68o4hJrp8viLsBvl5t1UyIvJ0Jf1B0PVh6muxfHldNk3yvKMZv
         CWlkNIDS/AWrgRLTjPJS/hhGAsvGcSE7USRKByJGm3+on1ytxlOCBmI2Mz+6zTuw9CaN
         2ZLH77/n+hSxUumAjG9vSwrVZge4n7WppP2YBfDS6EOk3Ma3NOtIr3vOwyK+cryJSTCN
         Zp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQNajo9ii0X4QmH30MVlI8jEaxs1a8jfd0F6O0pdV293g2mAHhpeaO2CwIoSWHGE0joT1ceVnLrlBjDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywAtGHXzentnu5/SSFWH4OP8UN252DmxX1CNE76mtL8M/oKrI5
	2D03303pN+lIYYsHbxuBgpvt/q2R1aVhcIWuBcxBItuW/AtSG7Uwonk+
X-Gm-Gg: ASbGncsZ5MwFmWK8hz+OH+vtKsqvFt3XVJCw4nsvQ3LfuqQXUqecreQXlevvUorJa8E
	LxLKDR6mZ77pOWlxjLjNYFiYQvivqYsdtJTLg4GAcKu9NmjnEjwjGT/naJpuy7duM1aSOuTdLoI
	UEcIJQbTOlLdHndKGd9RiT39LkYJMLZ3zwTA6KIwAElLr9phItryuBeDCHFW7tWNwm0Th44BBjC
	3zozwhRqH51+6LNC7yn8DkqXdXopTWpw6xwCxwBo8xaTR5s1Q62Od5E6DrlaPMbiEqJ8cpj7bj0
	AWg9xaON9r3nl5/a5iFAR57Sh00WQhsAoWDSGt5e34d002T1CThrJImIL2HvXtPLKI+dqxcVlGx
	DdhaXJEbDylanm1AiuiJShrNZlauJBncGJoWBsW31944Q7pq7wc23bBs0Ekx25i2L52/Hejs=
X-Google-Smtp-Source: AGHT+IFH4fZhqa0uW4n2Td34Gv/4DxDz1hTmRTh5aWuaXK8fP4webZHciBW26f9xqRiDy02OMsMgXQ==
X-Received: by 2002:a17:90b:4a4f:b0:321:1680:d52a with SMTP id 98e67ed59e1d1-32183e6d84bmr932888a91.34.1754606712879;
        Thu, 07 Aug 2025 15:45:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102b9022fsm8924110a91.4.2025.08.07.15.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 15:45:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <38d57e7d-bc13-4fd1-8eea-39581c4488c9@roeck-us.net>
Date: Thu, 7 Aug 2025 15:45:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (tps23861) add class restrictions and semi-auto
 mode support
To: Gregory Fuchedgi <gfuchedgi@gmail.com>, linux-hwmon@vger.kernel.org
Cc: robert.marko@sartura.hr, luka.perkov@sartura.hr
References: <20250807215037.1891666-1-gfuchedgi@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250807215037.1891666-1-gfuchedgi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/25 14:50, Gregory Fuchedgi wrote:
> This commit adds optional individual per-port device tree nodes, in which ports
> can be:
>    - restricted by class. For example, class = <2> for a port would only enable
>      power if class 1 or class 2 were negotiated. Requires interrupt handler to
>      be configured if class != 4 (max supported). This is because hardware cannot
>      be set with acceptable classes in advance. So the driver would enable
>      Semi-Auto mode and in the interrupt handler would check negotiated class
>      against device tree config and enable power only if it is acceptable class.
>    - fully disabled. For boards that do not use all 4 ports. This would put
>      disabled ports in Off state and would hide corresponding hwmon files.
>    - off by default. The port is kept disabled, until enabled via corresponding
>      in_enable in sysfs.
> 
> The driver keeps current behavior of using Auto mode for all ports if no
> per-port device tree nodes given.
> 
> This commit also adds optional reset and shutdown pin support:
>    - if reset pin is configured the chip will be reset in probe.
>    - if both reset and shutdown pins are configured the driver would keep ports
>      shut down while configuring the tps23861 over i2c. Having both shutdown and
>      reset pins ensures no PoE activity happens while i2c configuration is
>      happening.
> 
> Signed-off-by: Gregory Fuchedgi <gfuchedgi@gmail.com>

Not a complete review.

> ---
>   .../bindings/hwmon/ti,tps23861.yaml           |  78 +++++-
>   Documentation/hwmon/tps23861.rst              |   6 +-
>   drivers/hwmon/tps23861.c                      | 253 +++++++++++++++++-

Bindings and driver changes need to be separate patches.

>   3 files changed, 325 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> index ee7de53e1918..328050656ab8 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
> @@ -24,12 +24,34 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>     shunt-resistor-micro-ohms:
>       description: The value of current sense resistor in microohms.
>       default: 255000
>       minimum: 250000
>       maximum: 255000
>   
> +  reset-gpios:
> +    description: Optional GPIO for the reset pin.
> +    maxItems: 1
> +
> +  shutdown-gpios:
> +    description: |
> +      Optional GPIO for the shutdown pin. Used to prevent PoE activity before
> +      the driver had a chance to configure the chip.
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      The interrupt specifier. Only required if PoE class is restricted to less
> +      than class 4 in the device tree.
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> @@ -37,7 +59,27 @@ required:
>   allOf:
>     - $ref: hwmon-common.yaml#
>   
> -unevaluatedProperties: false
> +additionalProperties:
> +  type: object
> +  description: Port specific nodes.
> +  required:
> +    - reg
> +  properties:
> +    reg:
> +      description: Port index.
> +      items:
> +        minimum: 0
> +        maximum: 3
> +
> +    class:
> +      description: The maximum power class a port should accept.
> +      $ref: /schemas/types.yaml#/definitions/uint32
> +      minimum: 0
> +      maximum: 4
> +
> +    off-by-default:
> +      description: Indicates the port is off by default.
> +      type: boolean
>   
>   examples:
>     - |
> @@ -51,3 +93,37 @@ examples:
>               shunt-resistor-micro-ohms = <255000>;
>           };
>       };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        tps23861@28 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ti,tps23861";
> +            reg = <0x28>;
> +            shunt-resistor-micro-ohms = <255000>;
> +            reset-gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
> +            shutdown-gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <14 0>;
> +            port1@0 {
> +                    reg = <0>;
> +                    class = <2>; // Max PoE class allowed.
> +                    off-by-default;
> +            };
> +            port2@1 {
> +                    reg = <1>;
> +                    status = "disabled";
> +            };
> +            port3@2 {
> +                    reg = <2>;
> +                    status = "disabled";
> +            };
> +            port4@3 {
> +                    reg = <3>;
> +                    status = "disabled";
> +            };
> +        };
> +    };
> diff --git a/Documentation/hwmon/tps23861.rst b/Documentation/hwmon/tps23861.rst
> index 46d121ff3f31..8deaed0d532f 100644
> --- a/Documentation/hwmon/tps23861.rst
> +++ b/Documentation/hwmon/tps23861.rst
> @@ -22,9 +22,13 @@ and monitoring capabilities.
>   
>   TPS23861 offers three modes of operation: Auto, Semi-Auto and Manual.
>   
> -This driver only supports the Auto mode of operation providing monitoring
> +This driver supports Auto and Semi-Auto modes of operation providing monitoring
>   as well as enabling/disabling the four ports.
>   
> +Ports that do not have a child device tree entry will operate in Auto mode. If a
> +class restriction is defined for a port in the device tree, that port will
> +operate in Semi-Auto mode and require an interrupt pin.
> +
>   Sysfs entries
>   -------------
>   
> diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
> index 4cb3960d5170..9d0feffc2597 100644
> --- a/drivers/hwmon/tps23861.c
> +++ b/drivers/hwmon/tps23861.c
> @@ -10,13 +10,26 @@
>   #include <linux/bitfield.h>
>   #include <linux/debugfs.h>
>   #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/i2c.h>
> +#include <linux/interrupt.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_irq.h>
>   #include <linux/regmap.h>
>   
> +#define MAX_SUPPORTED_POE_CLASS		4
> +#define INTERRUPT_STATUS		0x0
> +#define INTERRUPT_ENABLE		0x1
> +#define INTERRUPT_CLASS			BIT(4)
> +#define DETECTION_EVENT			0x5
> +#define POWER_STATUS			0x10
> +#define PORT_1_ICUT			0x2A
> +#define PORT_1_ICUT_MASK		GENMASK(2, 0)
> +#define RESET				0x1a
> +#define RESET_CLRAIN			0x80
>   #define TEMPERATURE			0x2c
>   #define INPUT_VOLTAGE_LSB		0x2e
>   #define INPUT_VOLTAGE_MSB		0x2f
> @@ -102,6 +115,10 @@
>   #define TPS23861_GENERAL_MASK_1		0x17
>   #define TPS23861_CURRENT_SHUNT_MASK	BIT(0)
>   
> +#define TPS23861_TIME_RESET_RANGE_US	5, 1000
> +#define TPS23861_TIME_POWER_ON_RESET_MS 23
> +#define TPS23861_TIME_I2C_MS		20
> +
>   #define TEMPERATURE_LSB			652 /* 0.652 degrees Celsius */
>   #define VOLTAGE_LSB			3662 /* 3.662 mV */
>   #define SHUNT_RESISTOR_DEFAULT		255000 /* 255 mOhm */
> @@ -110,10 +127,27 @@
>   #define RESISTANCE_LSB			110966 /* 11.0966 Ohm*/
>   #define RESISTANCE_LSB_LOW		157216 /* 15.7216 Ohm*/
>   
> +struct tps23861_port_data { // From DT.
> +	const char *name;
> +	/* Maximum class accepted by the port. The hardware cannot be
> +	 * preconfigured to accept certain class only, so classification
> +	 * interrupt handler is required to for power-on decision if class is
> +	 * not MAX_SUPPORTED_POE_CLASS. */
> +	u32 class;
> +	/* true if the port is disabled in the DT */
> +	bool fully_disabled;
> +	/* true if the port shouldn't be enabled on driver init */
> +	bool off_by_default;
> +};
> +
>   struct tps23861_data {
>   	struct regmap *regmap;
>   	u32 shunt_resistor;
>   	struct i2c_client *client;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *shutdown_gpio;
> +	int irq;
> +	struct tps23861_port_data ports[TPS23861_NUM_PORTS];
>   };
>   
>   static const struct regmap_config tps23861_regmap_config = {
> @@ -205,13 +239,18 @@ static int tps23861_port_enable(struct tps23861_data *data, int channel)
>   	regval |= BIT(channel);
>   	regval |= BIT(channel + 4);
>   	err = regmap_write(data->regmap, DETECT_CLASS_RESTART, regval);
> -
> -	return err;
> +	if (err)
> +		return err;
> +	return regmap_write(data->regmap, RESET, RESET_CLRAIN);
>   }
>   
> -static umode_t tps23861_is_visible(const void *data, enum hwmon_sensor_types type,
> +static umode_t tps23861_is_visible(const void *input_data, enum hwmon_sensor_types type,
>   				   u32 attr, int channel)
>   {
> +	const struct tps23861_data *data = input_data;
> +	if (channel < TPS23861_NUM_PORTS && data->ports[channel].fully_disabled) {

Why would it be necessary t check "channel < TPS23861_NUM_PORTS",
and why would it make sense to declare attributes as valid if they
are for a channel >= TPS23861_NUM_PORTS ?

> +		return 0;
> +	}
>   	switch (type) {
>   	case hwmon_temp:
>   		switch (attr) {
> @@ -325,10 +364,14 @@ static int tps23861_read_string(struct device *dev,
>   				enum hwmon_sensor_types type,
>   				u32 attr, int channel, const char **str)
>   {
> +	struct tps23861_data *data = dev_get_drvdata(dev);

Please run checkpatch --strict and fix what it reports.

>   	switch (type) {
>   	case hwmon_in:
>   	case hwmon_curr:
> -		*str = tps23861_port_label[channel];
> +		if (channel < TPS23861_NUM_PORTS)
> +			*str = data->ports[channel].name;
> +		else
> +			*str = tps23861_port_label[channel];
>   		break;
>   	case hwmon_temp:
>   		*str = "Die";
> @@ -371,7 +414,7 @@ static const struct hwmon_chip_info tps23861_chip_info = {
>   	.info = tps23861_info,
>   };
>   
> -static char *port_operating_mode_string(uint8_t mode_reg, unsigned int port)
> +static const char *port_operating_mode_string(uint8_t mode_reg, unsigned int port)

That seems like an unrelated change.

>   {
>   	unsigned int mode = ~0;
>   
> @@ -392,7 +435,7 @@ static char *port_operating_mode_string(uint8_t mode_reg, unsigned int port)
>   	}
>   }
>   
> -static char *port_detect_status_string(uint8_t status_reg)
> +static const char *port_detect_status_string(uint8_t status_reg)

Same here.

>   {
>   	switch (FIELD_GET(PORT_STATUS_DETECT_MASK, status_reg)) {
>   	case PORT_DETECT_UNKNOWN:
> @@ -424,7 +467,7 @@ static char *port_detect_status_string(uint8_t status_reg)
>   	}
>   }
>   
> -static char *port_class_status_string(uint8_t status_reg)
> +static const char *port_class_status_string(uint8_t status_reg)

and here.

>   {
>   	switch (FIELD_GET(PORT_STATUS_CLASS_MASK, status_reg)) {
>   	case PORT_CLASS_UNKNOWN:
> @@ -449,12 +492,12 @@ static char *port_class_status_string(uint8_t status_reg)
>   	}
>   }
>   
> -static char *port_poe_plus_status_string(uint8_t poe_plus, unsigned int port)
> +static const char *port_poe_plus_status_string(uint8_t poe_plus, unsigned int port)
>   {
>   	return (BIT(port + 4) & poe_plus) ? "Yes" : "No";
>   }
>   
> -static int tps23861_port_resistance(struct tps23861_data *data, int port)
> +static unsigned int tps23861_port_resistance(struct tps23861_data *data, int port)
>   {
>   	unsigned int raw_val;
>   	__le16 regval;
> @@ -502,17 +545,155 @@ static int tps23861_port_status_show(struct seq_file *s, void *data)
>   
>   DEFINE_SHOW_ATTRIBUTE(tps23861_port_status);
>   
> +static inline bool tps23861_auto_mode(struct tps23861_port_data *port)
> +{
> +	return port->class == MAX_SUPPORTED_POE_CLASS;
> +}
> +
> +static irqreturn_t tps23861_irq_handler(int irq, void *dev_id) {
> +	struct tps23861_data *data = (struct tps23861_data *)dev_id;
> +	struct tps23861_port_data *ports = data->ports;
> +	struct device *dev = &data->client->dev;
> +
> +	unsigned int intr_status, status, class, i;
> +	unsigned int det_status = 0;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, INTERRUPT_STATUS, &intr_status);
> +	if (ret || intr_status == 0) {
> +		return IRQ_NONE;
> +	}
> +	if (intr_status & INTERRUPT_CLASS) {
> +		regmap_read(data->regmap, DETECTION_EVENT, &det_status);
> +		for (i = 0; i < TPS23861_NUM_PORTS; i++) {
> +			if (tps23861_auto_mode(ports+i)) {
> +				continue;
> +			}
> +			if (!(det_status & BIT(i+4)))
> +				continue;
> +			ret = regmap_read(data->regmap, PORT_1_STATUS+i, &status);
> +			if (ret)
> +				continue;
> +			class = FIELD_GET(PORT_STATUS_CLASS_MASK, status);
> +			if (class == PORT_CLASS_0) {
> +				/* class 0 is same power as class 3, change 0 to
> +				 * 3 for easy comparison */
> +				class = 3;
> +			}
> +			if (class == PORT_CLASS_UNKNOWN ||
> +			    class > MAX_SUPPORTED_POE_CLASS) {
> +				continue;
> +			}
> +			if (class > ports[i].class) {
> +				dev_info(dev, "%s class mismatch: got %d, want <= %d",
> +					 ports[i].name, class, ports[i].class);
> +				continue;
> +			}
> +			regmap_read(data->regmap, POWER_STATUS, &status);
> +			if (status & BIT(i)) {
> +				continue; /* already enabled */
> +			}
> +			/* Set ICUT and poe+ according to class. Values in ICUT table happen
> +			 * to match class values, so just set class. */
> +			regmap_update_bits(data->regmap,
> +					   PORT_1_ICUT + i/2,
> +					   PORT_1_ICUT_MASK << ((i % 2) * 4),
> +					   class << ((i % 2) * 4));
> +			regmap_update_bits(data->regmap, POE_PLUS,
> +					   BIT(i + 4),
> +					   class > 3 ? BIT(i + 4) : 0);
> +			dev_info(dev, "%s class %d, enabling power",
> +				 ports[i].name, class);
> +			regmap_write(data->regmap, POWER_ENABLE, BIT(i));
> +		}
> +	}
> +	regmap_write(data->regmap, RESET, RESET_CLRAIN);
> +	return IRQ_HANDLED;
> +}
> +
> +static int tps23861_reset(struct i2c_client *client)
> +{
> +	struct tps23861_data *data = i2c_get_clientdata(client);
> +	unsigned val;
> +
> +	if (data->reset_gpio) {
> +		gpiod_direction_output(data->reset_gpio, true);
> +		/* If shutdown pin is defined, use it to keep ports off, while
> +		 * turning the chip on for i2c configuration. */
> +		if (data->shutdown_gpio)
> +			gpiod_direction_output(data->shutdown_gpio, true);
> +		usleep_range(TPS23861_TIME_RESET_RANGE_US);
> +		gpiod_set_value_cansleep(data->reset_gpio, false);
> +		msleep(TPS23861_TIME_POWER_ON_RESET_MS);
> +		if (data->shutdown_gpio)
> +			gpiod_set_value_cansleep(data->shutdown_gpio, false);
> +		msleep(TPS23861_TIME_I2C_MS);
> +	}
> +
> +	/* Check the device is responsive */
> +	return regmap_read(data->regmap, OPERATING_MODE, &val);
> +}
> +
> +static void tps23861_init_ports(struct i2c_client *client)
> +{
> +	struct tps23861_data *data = i2c_get_clientdata(client);
> +	struct tps23861_port_data *ports = data->ports;
> +	unsigned i, mode;
> +
> +	for (i = 0; i < TPS23861_NUM_PORTS; i++) {
> +		mode = ports[i].fully_disabled       ? OPERATING_MODE_OFF :
> +		       tps23861_auto_mode(&ports[i]) ? OPERATING_MODE_AUTO :
> +		                                       OPERATING_MODE_SEMI;
> +		regmap_update_bits(data->regmap, OPERATING_MODE,
> +				   OPERATING_MODE_PORT_1_MASK << (2*i),
> +				   mode << (2*i));
> +		if (ports[i].fully_disabled)
> +			continue;
> +		if (ports[i].off_by_default)
> +			tps23861_port_disable(data, i);
> +		else
> +			tps23861_port_enable(data, i);
> +	}
> +}
> +
> +
>   static int tps23861_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct tps23861_data *data;
> +	struct tps23861_port_data *ports;
>   	struct device *hwmon_dev;
> +	struct gpio_desc *gpio;
> +	struct device_node *child;
>   	u32 shunt_resistor;
> +	int ret;
> +	unsigned i;
> +	bool need_irq = false;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> +	ports = data->ports;
> +	for (i = 0; i < TPS23861_NUM_PORTS; i++) {
> +		ports[i].name = tps23861_port_label[i];
> +		ports[i].class = MAX_SUPPORTED_POE_CLASS;
> +	}
> +
> +	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
> +	if (IS_ERR(gpio)) {
> +		devm_kfree(dev, data);
> +		return -EPROBE_DEFER;
> +	}
> +	data->reset_gpio = gpio;
> +
> +	gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_ASIS);
> +	if (IS_ERR(gpio)) {
> +		devm_kfree(dev, data);
> +		return -EPROBE_DEFER;
> +	}
> +	data->shutdown_gpio = gpio;
> +
>   	data->client = client;
>   	i2c_set_clientdata(client, data);
>   
> @@ -521,6 +702,56 @@ static int tps23861_probe(struct i2c_client *client)
>   		dev_err(dev, "failed to allocate register map\n");
>   		return PTR_ERR(data->regmap);
>   	}
> +	ret = tps23861_reset(client);
> +	if (ret) {
> +		return -ENODEV;
> +	}
> +	for_each_child_of_node(dev->of_node, child) {
> +		ret = of_property_read_u32(child, "reg", &i);
> +		if (ret || i >= TPS23861_NUM_PORTS) {
> +			dev_err(dev, "node %s must define 'reg' < %d\n",
> +				child->name, TPS23861_NUM_PORTS);
> +			continue;
> +		}
> +		if (!of_device_is_available(child)) {
> +			ports[i].fully_disabled = true;
> +			continue;
> +		}
> +		ports[i].name = child->name;
> +		ports[i].off_by_default = of_property_read_bool(child, "off-by-default");
> +		of_property_read_u32(child, "class", &ports[i].class);
> +		if (ports[i].class > MAX_SUPPORTED_POE_CLASS) {
> +			dev_err(dev, "%s invalid class, disabling\n", child->name);
> +			ports[i].fully_disabled = true;
> +			continue;
> +		}
> +		if (ports[i].class == 0) {
> +			/* class 0 is same power as class 3, change 0 to 3 for
> +			 * easy comparison */
> +			ports[i].class = 3;
> +		}
> +		need_irq = need_irq || !tps23861_auto_mode(&ports[i]);
> +		dev_info(dev, "%s: max class: %d, %s by default\n",
> +			 ports[i].name, ports[i].class,
> +			 ports[i].off_by_default ? "off" : "on");
> +	}
> +	if (need_irq) {
> +		data->irq = irq_of_parse_and_map(dev->of_node, 0);
> +		if (!data->irq) {
> +			dev_err(dev, "failed to configure irq\n");
> +			return -EINVAL;
> +		}
> +		ret = devm_request_threaded_irq(dev, data->irq, NULL,
> +						tps23861_irq_handler,
> +						IRQF_TRIGGER_FALLING,
> +						"tps23861_irq", data);
> +		if (ret) {
> +			dev_err(dev, "failed to request irq %d\n", data->irq);
> +			return ret;
> +		}
> +		dev_info(dev, "irq successfully requested\n");
> +		regmap_write(data->regmap, INTERRUPT_ENABLE, INTERRUPT_CLASS);
> +	}
>   
>   	if (!of_property_read_u32(dev->of_node, "shunt-resistor-micro-ohms", &shunt_resistor))
>   		data->shunt_resistor = shunt_resistor;
> @@ -536,7 +767,9 @@ static int tps23861_probe(struct i2c_client *client)
>   				TPS23861_GENERAL_MASK_1,
>   				TPS23861_CURRENT_SHUNT_MASK);
>   
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +	tps23861_init_ports(client);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, dev->of_node->name,

Changing the name of the device may impact existing userspace code. On top of that,
this change makes devicetree support mandatory. I didn't check the rest of the code,
but mandating that dev->of_node is not NULL is simply unacceptable.

Guenter

>   							 data, &tps23861_chip_info,
>   							 NULL);
>   	if (IS_ERR(hwmon_dev))

