Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1BC33A00C
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561159; cv=none; b=Kascxjd7v6JGjWxT9lSK8nHsE2cLFQH90OfE/e5A4BJQrEEPCiOE5Jq9ZwiiDDEtw/O6cUkQPBQhR4PznlKfsNYbIaxAgBYtYT7lJyGq2cZ5ZyjYWlpvL60kAxF9ZQNl65YpQqzyV0JNWh/Uu7rFHyGHP+iZ+XqjiAUT+uj8XwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561159; c=relaxed/simple;
	bh=yEnbG3q6AMh3WvDMSAJMZ7igfLMQ++HdgrmLKXO0qeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D25A04yA7HZOjI4C6Sxk4k31CTBR4JNjtaUor4CRNWYbBrtHX2dd92z+7IDe17SksbEtJEgUlELMqrg1JfEPv2yoygm+FAqD5bc+m5I7I/dN7Zy+e9Lz/tZRlCsiBQ3nmr0vcf6RE3b3fUkkZCVLTU+Tm6KrbqsSKzbG+a7qY2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvwK04JO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvwK04JO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1220521a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786561157; x=1787165957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDUmI7JQdaX2Oj0mItGi6PEt+TH4ELXvui3kKxAmk5E=;
        b=dvwK04JOxbKPDFnZLXB4ikHPSUUjC0ceiyrq8KEriAdTWNGULTC9HcpkNYb5Hb56u0
         tGgH1Z5HQFqf/C92aAmGqfODBFQlTJnZDRq8HBMaCDF4KKRiJ6BgnHlDkan247ugQ276
         b57xtXZFa6RdyRRgoJAV06LEAwNaHi3SKXxlR+olEcVo3XZprYRf26iCqeT8ciMmXN+B
         Iriw0wtJ5zvWGmRHsv1NGzcAM7Exms8zCN8QlaWE0x4/PXPPaolB1wVA1ga2+cMXyNgb
         FPVRL2JYcJkIdbRPgparu8qOwaLapJksqJuXd6FzhiOw5ckkxCDxcPKL/sEHVwn8rxb2
         mVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561157; x=1787165957;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xDUmI7JQdaX2Oj0mItGi6PEt+TH4ELXvui3kKxAmk5E=;
        b=oSsZoJFZOO+VrMwkRuGrqCLr8rWC83o5x2q7FooX6Nsa12L6wYNH4+w+EsauKYvE+J
         p70arYFWUuU3xe45gBPHvWNpnyn51Z0Z23jF9DfgysygA6WE/rmTBxEE6E4E9HKhu2+k
         ZycfassAUjkc6EjzlMQEMlqfZw/g5WDqDP5LgTGDPUXQ9UM57DHay7z2zG4Sgn2naG5J
         8gcB4ADCaruH9HUEnQktq8qe7VvI2t/qUtyFgraq722LGJM4NpGlt9hZirptXrrc93nl
         6nolXqQfM+sQr2u11tc2Lh3K5V/PAbQTjU372I4BYVdxUGXJEt8boswq6NRgMCGmiDti
         AR2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrVdBEOJSB3wEXa92EdXRLRGuh/S5Cta+x1oav0hskY2uZqtqK9XOvENusl4aGCuBn7Sy103qioAPgBXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzanG0l1YRJPFcDGOn9UZi56R8dejzvIsm0R/8hsU+6ePjKqsgS
	u1cAahZD/IQljOSvoLzHTEGuU2fbwwwu8U4DRXw76NCrNgaJGkIHtNNm
X-Gm-Gg: AR+sD13PQV49DLXI2i+goEWbUrOPLVX7iNT0l8NJ0v9thaOGpWkWBl/ljpScExXRxqm
	iMLsY/zK1vtcWBVBNNpoPxOodowPxrQC/1BBBgKvnuh8grhLn190WsYqM65TCC2JcUqSFFs/0ur
	rj7rtb9bpxKsNDuEdh/48zzJzi9d0RNB1iFjA9T57n0QMjD7/VGQ+eDd3QZ9CqYUKGqSORfar/R
	0nCaizhTGi6MSiO3WG31vyqBH2owqPKeBKub++VJCIi9vwBkQrzV5evjsUIX7jW7OhnEf5koy0U
	yTl+zMkqgaNuNS4sg6KzZJmQbMtN8OsInitB1hmRRRnOLv6s3IBAVhGsx1GMfxWLSoAdkjrhdlH
	uqX2vL6sBJFRxZDY5mi8617XPia0O9hLzuhvbWh0WPnABSNzM6C7woeBFazqZYLaUfSHdDHFp6p
	VZojar46HQLZITgeJAecoUgBicHGefxogrBqIS+VdZIQl9l8AWJW7MK7U4r6Ru/OCG6vPVRMOMe
	wNBfcaQX/dDuQDmtbBjbSBv7JUWey498qLmsQ==
X-Received: by 2002:a05:6a20:cc97:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cc54f4968dmr839460637.7.1786561156556;
        Wed, 12 Aug 2026 11:59:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31da7bf64b5sm9421251eec.10.2026.08.12.11.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 11:59:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <75c8ae75-2103-436b-8f64-e71d4f284b48@roeck-us.net>
Date: Wed, 12 Aug 2026 11:59:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (k10temp) Add per-CCD temperature monitoring for
 Zen5 Turin
To: Gabriel Ford <gabriel@gford.dev>, Clemens Ladisch <clemens@ladisch.de>,
 "open list:K10TEMP HARDWARE MONITORING DRIVER"
 <linux-hwmon@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260812163812.2760-1-gabriel@gford.dev>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260812163812.2760-1-gabriel@gford.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 09:37, Gabriel Ford wrote:
> Add support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)
> CPUs, as they fall in a different model range with a larger number of
> maximum CCDs compared to their desktop counterparts. Tested and working
> on an EPYC 9555P.
> 

Sashiko has a point, showing that the temperature of the additional four dies
can not be shown due to the code in k10temp_read_temp().

So how does your test result actually look like ?

Guenter

> Signed-off-by: Gabriel Ford <gabriel@gford.dev>
> ---
>   drivers/hwmon/k10temp.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index de0760dc597d..b882fe09ac1b 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -207,6 +207,10 @@ static const char *k10temp_temp_label[] = {
>   	"Tccd10",
>   	"Tccd11",
>   	"Tccd12",
> +	"Tccd13",
> +	"Tccd14",
> +	"Tccd15",
> +	"Tccd16"
>   };
>   
>   static int k10temp_read_labels(struct device *dev,
> @@ -515,6 +519,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		}
>   	} else if (boot_cpu_data.x86 == 0x1a) {
>   		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x2f:	/* Zen5 Turin */
> +			data->ccd_offset = 0x1F0;
> +			k10temp_get_ccd_support(data, 16);
> +			break;
>   		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop */
>   			data->ccd_offset = 0x308;
>   			k10temp_get_ccd_support(data, 8);

