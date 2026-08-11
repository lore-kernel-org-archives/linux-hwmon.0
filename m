Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E73A5E87
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463741; cv=none; b=YgLpcvdlP9rbXbVA6DR/6jIgLcEtCNzK6sg30H5PCj08v2ekTQQVBsq3WLPA2jZo4EI3kk2bM0O0OpPI+v7WLeyNaejZVyqgZqrPiT1JMOJ7gFqI3KIL6K+KIXMKGj0wRhTZO6gUIpxR/4OWVSvsnI/DJSdgTdkpte+0OfkQoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463741; c=relaxed/simple;
	bh=nT8cLL/y+y5sK54nxhdUvolR+F3zBZ6Gyj7LYc/L6ZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S+gNxaTChxB6SN6bzuWxt2FPphgqXOVhc78PegVo2fvdkr3L0EqP+fnzUclANXTkCZcV7mZxVWhpOQJDDr3hfacsbSz3kattpyYaiUq6V9G7TpQM4+VVn4TmlvJWYTbu0yplLlDEg+JE7Nlr+Zry0voyrWb8cnrkpCU+d3UuU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4yCTKYd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4yCTKYd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84864086bfeso10697b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463738; x=1787068538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP+tJKH/tyuUNQHRDyf5Si2FoMuT24X9NWHm/gMOJtI=;
        b=m4yCTKYdNGtXAnD0fwjhary0YvCscSgiCFDDES7VwZxJKLCmUwsIeGFHnrDAbV9Y5a
         TijmWC800v4RgsLZ306K19nMTKNkcqeRHtShdvDJXBO+85i0v6h5IkJs9PinXya5azb/
         SXC60PE2ZQ9PrMlykXVHFtL5N3vbWzlvjLi6up1c+pV3Z+9/tUBfY895VxiyO+vTxMkP
         n7hfOGPZZFWCchZzVn++F11O5TLBNdCQfR/QwiaLRw72I39SpHzg0jzPJlMbeuNdOttz
         xLvhbolLXnkh3Ice8xUUWEuC/11LCXOYY0UOck+c0gNbxUEAT4Sk4ucuD7gwcBM6HHlX
         1+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463738; x=1787068538;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZP+tJKH/tyuUNQHRDyf5Si2FoMuT24X9NWHm/gMOJtI=;
        b=gnO/VzAyaRuH9qg1RM9jqnwZFoJYhOyovvjf0y7RdlyOENRbK9CJ5wibkf/GWXFHJ+
         QLyXpHBapQcvoIRjV75Cq5wjhCk7A6hN5QBv5JmYff0IzCZP9HuK2l0tWVHPgbxlOSZN
         sxQ2wvlTtaZhi5cWlbEFuwRPzOGGDqmrs1Eq5SHJMBkH6SBKKJikjNF5zE2DvI1oceB3
         k1chLgQbRyfVNNdjXsDcr1Nt6eAmuHAW+vKGBczPENTpBO8z7aExrbcHwNcjEfovPI0o
         6T2cPBNb203e6G+A9oXqPnNj2PxINwuWS0AjNA2H2tmQplkcCrGkt9qdn8P3JGbYixZn
         nk5A==
X-Forwarded-Encrypted: i=1; AHgh+Rph+PSPkng8M+FDq1u963M8RdR4ES2Lzq6shLvbOi4AGCGR9oK9nnM9tIV1TkVHv6M6oSOwDT3epCKlIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXQIpuaV2nMi+80mOY695OojvAzCPAPLmjQmHLVqEQfmN33MHB
	j27tkHk+WjSYcuZwhIJGZxI2qiMKldKzOqxNnJLj9qxS9ab6db9yWtxZ
X-Gm-Gg: AR+sD13EgG2aHBdGCFFO+ozhIQ3+5IR4A2CN45HfgZtjToQzS6IDms1klHwGG1SgHHt
	+rVQsZ1J+LqSW6AS4uDkc/7/383PbaCHqZ/HgOtbcg0RqDgjC0IAslNU2PL5oZ0iZ/wu1Wp5Pfa
	5ZoBc+gTLBtbl0XltAfG1Nr4GmAEOkRaUQ3Q2uEdPkxAb0seiceaEp5kDQPucjuVfdAPytEq1u2
	rjeCAdeLBJRnVSForlJDO4cJriV+7EC0AbjarD+L17mcEvY+1rL6ScHUdEuTYRWeVThjxkCaqLc
	LtSGpDdKwMz3cN+t5/EdDkXGmNQqTD+j3aZAzRc6e09hpzKL8tq1P26VEcEVge7w81EvnFasaeW
	kKjB8fYCVS+s/8468pssxRLDWlzoGUoM+OB6QmgDGkYY5iL4mASGEdY4XaGPHRPaUhCtDLIZwgj
	PJBpC7V/JtBFWXPWbe+1YRWJt4CJGrXaQTSkI/GESPPZZlaFQgaXj7FqLeiYBuWH2OkkeCkDkxV
	Bdg9QpNzNuLspeaCg14PjdeF4HOqaVUPmS0SQ==
X-Received: by 2002:a05:6a00:1da5:b0:84a:2c46:3fdb with SMTP id d2e1a72fcca58-84fa867cd02mr4878028b3a.5.1786463737798;
        Tue, 11 Aug 2026 08:55:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa954c125sm994954b3a.41.2026.08.11.08.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:55:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <42ac07a2-a812-4dbd-a771-70f5a16129e2@roeck-us.net>
Date: Tue, 11 Aug 2026 08:55:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (socfpga) add Agilex 5 channel mapping
To: tze.yee.ng@altera.com,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <0701aacab270fb8ca7bb35e8e72b7dd629e2cdcb.1786428156.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0701aacab270fb8ca7bb35e8e72b7dd629e2cdcb.1786428156.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/26 23:11, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add temperature channel mapping for Agilex 5 and bind it to the
> "intel,agilex5-svc" compatible string. Reuse the Agilex voltage channels.
> Agilex 5 omits temperature channel 2 (top-left corner) because that
> sensor is not present; remaining sensors keep Agilex channel numbers.
> 
> Match intel,agilex5-svc before intel,agilex-svc so dual-compatible DT
> nodes select the Agilex 5 board data.
> 
> Update the socfpga-hwmon documentation to list Agilex 5, the matching
> compatible string, and the SDM temperature/voltage channel tables.
> 
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
>   Documentation/hwmon/socfpga-hwmon.rst | 52 +++++++++++++++++++++++++++
>   drivers/hwmon/socfpga-hwmon.c         | 27 ++++++++++++++
>   2 files changed, 79 insertions(+)
> 
> diff --git a/Documentation/hwmon/socfpga-hwmon.rst b/Documentation/hwmon/socfpga-hwmon.rst
> index e5da42556a62..664103a38195 100644
> --- a/Documentation/hwmon/socfpga-hwmon.rst
> +++ b/Documentation/hwmon/socfpga-hwmon.rst
> @@ -7,6 +7,7 @@ Supported chips:
>   
>    * Altera Stratix 10 SoC FPGA
>    * Altera Agilex SoC FPGA
> + * Altera Agilex 5 SoC FPGA
>   
>   Authors:
>         - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> @@ -32,3 +33,54 @@ driver based on the service layer compatible string:
>   
>     * intel,stratix10-svc
>     * intel,agilex-svc
> +  * intel,agilex5-svc
> +
> +Channel mappings are fixed in the driver (not described in DT). The tables
> +below list the SDM page/channel encodings used for each family.
> +
> +Temperature channels
> +~~~~~~~~~~~~~~~~~~~~
> +
> +==========  ====  =======  =================================
> +Family      Page  Channel  Label
> +==========  ====  =======  =================================
> +Stratix 10  0     0        Main Die SDM
> +Agilex      0     0        Main Die SDM
> +Agilex      1     0        Main Die corner bottom left max
> +Agilex      2     0        Main Die corner top left max
> +Agilex      3     0        Main Die corner bottom right max
> +Agilex      4     0        Main Die corner top right max
> +Agilex 5    0     0        Main Die SDM
> +Agilex 5    1     0        Main Die corner bottom left max
> +Agilex 5    3     0        Main Die corner bottom right max
> +Agilex 5    4     0        Main Die corner top right max
> +==========  ====  =======  =================================
> +
> +Agilex 5 omits SDM temperature channel 2 (top-left corner on Agilex)
> +because that sensor is not present in hardware. The remaining sensors keep
> +the same channel numbers as Agilex.
> +
> +Voltage channels
> +~~~~~~~~~~~~~~~~
> +
> +==========  ====  =======  =================
> +Family      Page  Channel  Label
> +==========  ====  =======  =================
> +Stratix 10  0     2        0.8V VCC
> +Stratix 10  0     3        1.8V VCCIO_SDM
> +Stratix 10  0     6        0.9V VCCERAM
> +Agilex      0     2        0.8V VCC
> +Agilex      0     3        1.8V VCCIO_SDM
> +Agilex      0     4        1.8V VCCPT
> +Agilex      0     5        1.2V VCCCRCORE
> +Agilex      0     6        0.9V VCCH
> +Agilex      0     7        0.8V VCCL
> +Agilex 5    0     2        0.8V VCC
> +Agilex 5    0     3        1.8V VCCIO_SDM
> +Agilex 5    0     4        1.8V VCCPT
> +Agilex 5    0     5        1.2V VCCCRCORE
> +Agilex 5    0     6        0.9V VCCH
> +Agilex 5    0     7        0.8V VCCL
> +==========  ====  =======  =================
> +
> +Agilex 5 reuses the Agilex voltage SDM page/channel layout and labels.
> diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
> index 5b43274d0aa2..92bffc02e309 100644
> --- a/drivers/hwmon/socfpga-hwmon.c
> +++ b/drivers/hwmon/socfpga-hwmon.c
> @@ -433,6 +433,30 @@ static const struct socfpga_hwmon_board_data agilex_hwmon_board = {
>   	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
>   };
>   
> +/*
> + * Agilex 5 exposes the SDM and three corner temperature sensors. Channel 2
> + * (top-left corner on Agilex) is not present in hardware, so the SDM channel
> + * numbering keeps the gap (0, 1, 3, 4) rather than renumbering.
> + */
> +static const struct socfpga_hwmon_channel agilex5_hwmon_temp_channels[] = {
> +	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
> +	{ SOCFPGA_HWMON_CHAN(1, 0), "Main Die corner bottom left max" },
> +	{ SOCFPGA_HWMON_CHAN(3, 0), "Main Die corner bottom right max" },
> +	{ SOCFPGA_HWMON_CHAN(4, 0), "Main Die corner top right max" },
> +};
> +
> +/*
> + * Agilex 5 reuses the Agilex voltage SDM page/channel encoding and labels.
> + * Check more specific "intel,agilex5-svc" before "intel,agilex-svc" below so a
> + * node that lists both compatibles selects this board data.
> + */
> +static const struct socfpga_hwmon_board_data agilex5_hwmon_board = {
> +	.temp = agilex5_hwmon_temp_channels,
> +	.num_temp = ARRAY_SIZE(agilex5_hwmon_temp_channels),
> +	.volt = agilex_hwmon_volt_channels,
> +	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
> +};
> +
>   static const struct socfpga_hwmon_board_data *
>   socfpga_hwmon_get_board(struct device *dev)
>   {
> @@ -443,6 +467,9 @@ socfpga_hwmon_get_board(struct device *dev)
>   
>   	if (of_device_is_compatible(np, "intel,stratix10-svc"))
>   		return &s10_hwmon_board;
> +	/* Prefer the more specific Agilex 5 compatible over generic Agilex. */

I don't think that is going to work (see Sashiko feedback). On top of that, it is
conceptually wrong.

Guenter

> +	if (of_device_is_compatible(np, "intel,agilex5-svc"))
> +		return &agilex5_hwmon_board;
>   	if (of_device_is_compatible(np, "intel,agilex-svc"))
>   		return &agilex_hwmon_board;
>   

