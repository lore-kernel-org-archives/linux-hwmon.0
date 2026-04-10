Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D903D9DAA
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836300; cv=none; b=oP4umjeOAGcVlkJQHFuwv+z8oeD3dobPY9DuUYUgl3sPsqAkMqYmOPNCiO107LNSsisVyGSaNhk8utl4MXbsDVazYSu6cLa+b9DnjFb6CjFx3wiHmH8f5xTdUGU+rg9fIpTyARP+CWZjmLjeE8rf3yFiaN0nBCMbQw/VA10pKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836300; c=relaxed/simple;
	bh=3LQfonLQ6oQh/iQdITFeM/huuu7kEGKK/0YlFr8Zfdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6MYHrypBg3a+FS07JTgwrhIRt/y/ZQL8EsNJH5AET257H7Df4WMy6wCuV2OAmFECT9uH/S3KLRHGUBekze5RRaYjUKuV/LTWwWGiab4+xAskONR9EQ4hZuDLDrsVCQ3pzp9S8g5SzeNgB8fnK+dheigfjvpXcfVAWTofkjBCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwV4SLqr; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwV4SLqr"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c56aa62931so3550660eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775836295; x=1776441095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AJv0LGb+9ZG2U1NmhhTKErAnJqDXklx024/ud5+KlaM=;
        b=PwV4SLqrpc+NbV8DJRZA8lj0Ujdpox/XgrHKXFbx7uAgOhD/9r/U1VokqplezvVY9D
         DdPoRlRg8EeMlUVM17vvu6J4d1h+6Dg6vV9UiD9blmQjeXyKHLQ86KCyR10IjM43E3pc
         rUG9Z0tS678UsUv1eah4repZ/2/ASuFH8mydF/O8Th+SD8Kd/CBsWy8Gig+mcWM8pUEy
         DLGui21pO6we8pbT0pLtcgjpDnl5M+lHBVcpZM76nOOGNje6iA/5BQsA62UstNg+0ZKY
         9w8F2iCVGjZQw5TvEl5Uo3Z9+uv29qn4OwYUoA+35mPBbAfJqruFxXkxwZcPxGMVizWD
         iR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836295; x=1776441095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJv0LGb+9ZG2U1NmhhTKErAnJqDXklx024/ud5+KlaM=;
        b=C6qPlqFqiCdBcVk7GZSOf5mDfuvVvXFr0v4401pjMjl8/uNHeNsES+3738veMIQf3X
         OK0o/+QlVgqXtKRJmbcqF3dun1ORntc3FyH/q+dLphL16F1OQpypAe2SAnJg+gNbGJdy
         EFDxMSc1hvMjAQ/0mQiDxBuFzBKoq2BViCmdR0dYSXCaCNeiFRL/Y5L6ZZVd4u99HIEd
         4bJGKn9MJLjA9f4UDveCYFy/12PL+NuYCeBsGfNDM6E9MGHXwwKOmArdC5il9jlDqXlH
         ikjNgo4VBKKgpRVsB1iKiGQruiLk2rRUs1IGlUBdK38gIF5UUOLVAxmmzMsHKyFO+xXn
         ZSRg==
X-Gm-Message-State: AOJu0YzwGOpV2zZwd9hq+EoTMLZGMbuf02Mj2ffF0XAspOeEz8a2QDNU
	vL1El36OdB/CQF0XYdUwhyDJsZqc6Ibvcru7kBYG2JdE9RIOx/Bwxnd6
X-Gm-Gg: AeBDieudEcQbkDiekdxwCnNvxTOzcwE85SghuP5hxQ0YUk9BBHyQwGR7uZSDj6kiPPI
	BXAkyCwOBhkxUMyZsoWmlLAC2lLLv9k99v8/TDJLA2q6fvIg5f5C5i0/nQAjMztnZo8bGid2Mxn
	N7xyoTvmNK+Zmh2oXzWP4SLQQB+x0oPV2pBETyIGtkj9z8/9xYfsw2823xkaroQWB2HKLeFpKc0
	XVyJtcxD0phDDl1KHVmnVgdGav1WJ0DhtxQUZdhVrfX+MnpLAxhIFVBjOMz+dhV2u2GfS+gez2e
	6BpaX8hYrrycI6LxekWPWGproUsSH6cp23JjIYf7WKd4OqbWzLVGaZE3K+FtiUR44bEv4PIfpae
	1paJ+Kn7OUZmNp16iLgJcjhFQAsamURh8CoE0rmaXnrIkvAUNQ4pA8k6tylkzchgPTjwrExeKHu
	/rp5zrXvsEjgOCgjd9MJydxSKQND6h2t3rxOu7LqnKYnxDDDchyF9yOS1F1T5GwK4mwoYH15Qk/
	jFkkJXwQZ8=
X-Received: by 2002:a05:7300:ed0f:b0:2bd:c285:2fe with SMTP id 5a478bee46e88-2d587e7d192mr1915642eec.9.1775836295227;
        Fri, 10 Apr 2026 08:51:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm4839362eec.0.2026.04.10.08.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 08:51:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dcc14537-2975-4c93-89ec-78e1a0e807f1@roeck-us.net>
Date: Fri, 10 Apr 2026 08:51:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Add support for Microchip EMC1812
To: Marius Cristea <marius.cristea@microchip.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260403-hw_mon-emc1812-v9-0-1a798f31cf2e@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260403-hw_mon-emc1812-v9-0-1a798f31cf2e@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/26 05:39, Marius Cristea wrote:
> This is the hwmon driver for EMC1812/13/14/15/33 multichannel Low-Voltage
> Remote Diode Sensor Family. The chips in the family have one internal
> and different numbers of external channels, ranging from 1 (EMC1812) to
> 4 channels (EMC1815).
> Reading diodes in anti-parallel connection is supported by EMC1814, EMC1815
> and EMC1833.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Sashiko still reports numberous issues which I consider valid:

https://sashiko.dev/#/patchset/20260403-hw_mon-emc1812-v9-0-1a798f31cf2e%40microchip.com

Please fix.

Thanks,
Guenter

> ---
> Changes in v9:
> - improve the wording in the Documentation/hwmon/emc1812.rst file
> - add const to variables in the driver
> - initialize the EXT2_BETA_CONFIG only for the pats that support it
> - update the writeble regmap table to exclude read-only registers
> - Link to v8: https://lore.kernel.org/r/20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com
> 
> Changes in v8:
> - remove "address scan" from emc1812.rst documentation
> - change the second dimension of emc1812_limit_regs_low[][] to 2
> - clamp input value before doing math on it to avoid overflow
> - use rounding instead of truncation for 8 bits limit registers
> - fix misleading comment when HW ID is not recognized
> - Link to v7: https://lore.kernel.org/r/20260223-hw_mon-emc1812-v7-0-51e2676f4e20@microchip.com
> 
> Changes in v7:
> - driver
>    - fix an overflow emc1812_set_hyst
>    - remove unused parameter in emc1812_set_temp
> - devicetree binding:
>    - remove unneeded restrictions not to bloating the binding
> - Link to v6: https://lore.kernel.org/r/20260212-hw_mon-emc1812-v6-0-e37e9b38d898@microchip.com
> 
> Changes in v6:
> - driver
>    - fix an overflow when writing more then 191875 to limits stored on 8
>      bits register
>    - remove "i2c_set_clientdata" from probe
>    - fix discrepancy where writing 16ms and reading it back returns 15ms
>      at update interval
>    - skip setting the ideality factor for channels that are not available
>      on the device
> - devicetree binding:
>    - change the way interrupts are described/used
>    - add "microchip,enable-anti-parallel"
>    - rewrite "allOf" section to be more clear
> - Link to v5: https://lore.kernel.org/r/20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com
> 
> Changes in v5:
> - fix calculation in emc1812_get_limit_temp
> - use i2c_get_match_data cover the case when the driver is instantiated
>    via I2C ID table.
> - replace dev_info with dev_warn
> - remove some unnecessary truncation on 8 bits
> - remove clamping when reading the temerature with hyst
> - not change the conversion rate at probe time
> - use a generic define to remove duplicate channel_info entries
> - Link to v4: https://lore.kernel.org/r/20260127-hw_mon-emc1812-v4-0-6bf636b54847@microchip.com
> 
> Changes in v4:
> - fix file permissions for read only properties
> - fix calculation when the limits are written
> - remove the temp_min_hyst because the part doesn't support it
> - Link to v3: https://lore.kernel.org/r/20251218-hw_mon-emc1812-v3-0-a123ada7b859@microchip.com
> 
> Changes in v3:
> - remove mesages that are not helpfull
> - fix an issue related to NULL labels
> - fix sign/unsign calculation
> - replace E2BIG with EINVAL
> - use BIT() to create mask
> - Link to v2: https://lore.kernel.org/r/20251121-hw_mon-emc1812-v2-0-5b2070f8b778@microchip.com
> 
> Changes in v2:
> - update the interrupt section from yaml file
> - update index.rst
> - remove fault condition from internal sensor
> - remove unused members from structures
> - update the driver to work on systems without device tree or
>    firmware nodes
> - add missing include files
> - make NULL labels to be not visible
> - corect sign/unsign calculations
> - corect possible underflow for limits
> - Link to v1: https://lore.kernel.org/r/20251029-hw_mon-emc1812-v1-0-be4fd8af016a@microchip.com
> 
> ---
> Marius Cristea (2):
>        dt-bindings: hwmon: temperature: add support for EMC1812
>        hwmon: temperature: add support for EMC1812
> 
>   .../bindings/hwmon/microchip,emc1812.yaml          | 184 ++++
>   Documentation/hwmon/emc1812.rst                    |  67 ++
>   Documentation/hwmon/index.rst                      |   1 +
>   MAINTAINERS                                        |   8 +
>   drivers/hwmon/Kconfig                              |  11 +
>   drivers/hwmon/Makefile                             |   1 +
>   drivers/hwmon/emc1812.c                            | 965 +++++++++++++++++++++
>   7 files changed, 1237 insertions(+)
> ---
> base-commit: d2b2fea3503e5e12b2e28784152937e48bcca6ff
> change-id: 20251002-hw_mon-emc1812-f1b806487d10
> 
> Best regards,

