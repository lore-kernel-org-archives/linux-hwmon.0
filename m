Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9538236B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580279; cv=none; b=oGIaGugkqukVA6aqEBQrCfJeih38JvbhrNt2sH4+LpkIZ5/iV5nQtIE1xXrAfOJreHtOgP0rdqSo1UHJVKvaqEriDQ9LPd5JM9wYyB/loMn//CydsTBTbPMZ3dNqMgXs3JRfhd1Y2zPkclW0EXo4PTZuistce18aVk4O3NsgvfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580279; c=relaxed/simple;
	bh=FoqGomH61K68W5R1FI7QkSX12Lw5Beu1A6pPITQb32Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJYps3tudSqEPruc1nPlob8M1AuTEdBYEE2TybXu797aRXM1X9EWqCoFdebB0+qKZFXSyNUMwJ1hdiXZHchjfB3j/m7IWE/gOJQMcsu5T/0XzMdM9aOQ4xt6Q/SeySb7GDok/A9mK/E0eWsJNrR8oh+vTB/qyJRZd6Le4itWSdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnfcLNu3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnfcLNu3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso8686655ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777580277; x=1778185077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MnVwBtZbfDqdeLh5y4Pf/WbasJ8kSvMt9+xGKTa8elE=;
        b=rnfcLNu39JiMqzpngREN/fKBVYXMVhBfXCumrpLFZEDFbivQ6Rt/HD3jDWoPfq+Qos
         I253s1CEaea2nbOkeTvSebJV1w0hTt+73EpdelCthoOqa28KcA4PuveMJ26uPX2AjxyO
         o+Kv7lXfgXNI+kctNr2uGZK/jsPtxiNkSf/uk7SfnsNmz6ZGSe7Se2bKAKoLYJbHcSat
         FjnkTncHMG7QRFc8i0x55+6m0LJvPHJcunQ/+VJ++hlYlnX4C1O0/i7iNb7ppQ69cr0T
         CtknxtLx+J1+XGhKfSWbCrmXItoJec5P5ELIXi6qOjVu+cg2QNNMl0bweOLt+Cy0fdEl
         QQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777580277; x=1778185077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnVwBtZbfDqdeLh5y4Pf/WbasJ8kSvMt9+xGKTa8elE=;
        b=nUONXbg1O8hJmagQ6vgQwzJQujy6OqtAh4PQdwp9XOxR4cglr6e6e6WcKltjdr35dC
         /EfckzQUsAgpy0ice+wAWmf1dAH06XG2b5rnZ3mqoCvMX5lPU96LHcleDfFf/wMuHXgC
         Qgu8JsXPNWeLu4qLwmMJ1tlRauztSQbVADYKvfRfCwNv5Shkywmr1cO7T1U75fJWxgBJ
         k2COVNNNkXjeGND1eBTndDT6O8UZsBP3xs6ewfTgUAgcxr0GYcPP9ycTGKp1t950URv8
         DmQ+oDQkxCQHwWUm+i8xHPFBy/HIVwLZWweNim/yLtKx8S2dPOoR8FQPsKkZ3SPhWmiP
         7FtQ==
X-Gm-Message-State: AOJu0YxFx4+tMNFaKkWiRpVJiiOiIPRb0EI4+vI0HnYZdI+OmOyYf9Dg
	pQDGgnnk2AKtta8FqVAsyx4mQVvh2pV+4dfLD3QSNdXat0N3wV/JmHaJ
X-Gm-Gg: AeBDieuC94goK/x+jqYfEJd98MfGmnVnnwno3W43G5xBOop5ioPqEXRFgbdasr5Gt1H
	FyOD6M07w10zuhgkdcmP9NIUJhQmDHlbs48e6jpVT/XUtQ/4cJETKTr9kUUqujJ0C8CqBghgfA1
	EqgtmqMpY2cpL0hZtAIy8XPGAtILY8M4ej8LjTkf9huZcgLNw1qnE7CMQT5muIm2gEUHCMA1DMW
	TNi51ORm2/U/701+hJZ45unJZgqGDLey0Gsvqs1o/kJfk4uQ+b5BqZntTYz20lhVpRZoNbiU5AX
	ULFGe8E3Gh01nFPuAjWVDurVHGtNMiN5LX0Xxo++/2NqLuWicQs842G/2vOqw9OnnoX+RCj16gf
	QwQSMH2/yUaxcftsDDvtQQb/nemjjq+FXufsWoXOpzxXi+Q02pCz35BbZ6N3jEgNU3VoBqYtL8r
	hiOzzdKccIMJNL3zzhCKzTlwn+YDebyV6qr/mACGwTyONJsUllpbAWTPvtSbTu/l+u0SJhK+iez
	ifO0tZcpYg=
X-Received: by 2002:a17:903:5cf:b0:2b0:7225:d2c0 with SMTP id d9443c01a7336-2b9a2504c12mr28102235ad.30.1777580276999;
        Thu, 30 Apr 2026 13:17:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae3b169sm4413285ad.63.2026.04.30.13.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 13:17:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0fc8d540-2498-4e3c-a07e-273cdbd9546a@roeck-us.net>
Date: Thu, 30 Apr 2026 13:17:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hwmon: (pmbus) add support for Delta E50SN12051
To: u8813345@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Colin Huang <colin.huang2@amd.com>
References: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
 <20260430-add-e50sn12051-v3-3-f6d4e043ec7c@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260430-add-e50sn12051-v3-3-f6d4e043ec7c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 23:16, Colin Huang via B4 Relay wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add the pmbus driver for Delta E50SN12051 600W Non-isolated
> 1/8th Brick DCDC Power Modules.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/pmbus/Kconfig      |  9 +++++++
>   drivers/hwmon/pmbus/Makefile     |  1 +
>   drivers/hwmon/pmbus/e50sn12051.c | 52 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 62 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 8f4bff375ecb..4fbfcbc4a9c5 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -161,6 +161,15 @@ config SENSORS_DPS920AB
>   	  This driver can also be built as a module. If so, the module will
>   	  be called dps920ab.
>   
> +config SENSORS_E50SN12051
> +	tristate "Delta E50SN12051 Power Modules"
> +	help
> +	  If you say yes here you get hardware monitoring support for Delta
> +	  E50SN12051 Power Modules.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called e50sn12051.
> +
>   config SENSORS_INA233
>   	tristate "Texas Instruments INA233 and compatibles"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 7129b62bc00f..fc910bf34fe3 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
>   obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
>   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>   obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
> +obj-$(CONFIG_SENSORS_E50SN12051) += e50sn12051.o
>   obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
>   obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
> diff --git a/drivers/hwmon/pmbus/e50sn12051.c b/drivers/hwmon/pmbus/e50sn12051.c
> new file mode 100644
> index 000000000000..efb4d62b2603
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/e50sn12051.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for E50SN12051
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info e50sn12051_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static const struct i2c_device_id e50sn12051_id[] = { { "e50sn12051", 0 }, {} };
> +MODULE_DEVICE_TABLE(i2c, e50sn12051_id);
> +
> +static const struct of_device_id e50sn12051_of_match[] = {
> +	{ .compatible = "delta,e50sn12051" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, e50sn12051_of_match);
> +
> +static int e50sn12051_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &e50sn12051_info);
> +}
> +
> +static struct i2c_driver e50sn12051_driver = {
> +	.driver = {
> +		.name = "e50sn12051",
> +		.of_match_table = e50sn12051_of_match,
> +	},
> +	.probe = e50sn12051_probe,
> +
> +	.id_table = e50sn12051_id,
> +};
> +
> +module_i2c_driver(e50sn12051_driver);
> +
> +MODULE_AUTHOR("Kevin Chang <kevin.chang2@amd.com>");
> +MODULE_DESCRIPTION("PMBus driver for E50SN12051");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
> 

