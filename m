Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4E9C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 14:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23DD72084E
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 14:37:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5dTETnR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfDNOhh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 10:37:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33790 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfDNOhh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 10:37:37 -0400
Received: by mail-pl1-f196.google.com with SMTP id t16so7331854plo.0
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Apr 2019 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kojBuHeJ0Y+M+o6kM1kSo5WEL/QK83I/e8wdi5AdBhA=;
        b=f5dTETnRmtgBYlv8Nf/COu1/z4Dy/Fky2YSc8WTFAz0PLvJLAXfvVRSsmh6CVU0PsQ
         ZlywUhKmV/nn/0szDFr0TB2/349OIcR8EtzpeDpLWK3fwcmQu2rtV685zgfgMo7414da
         6TjyNmPmHrwTVBD/6980gMtsos07bu7d3NwdOZFn1GuKS1XXlNnphjAp3Qt47fzdbil3
         /mYvruFhFIq6xNQaFytXUxPTPz2YgSRgAaBs7WGtEAS+nCwJ4cKUaTGShqnlNxrc6ou6
         Z0nLBESfyM8/4uP6/XS8HRnHPfaq/2kgi6AR2s+QozrD37Gqyqa1ouJN1nM7uqoxCE2t
         BjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kojBuHeJ0Y+M+o6kM1kSo5WEL/QK83I/e8wdi5AdBhA=;
        b=L2+iuvvHIGHXh7NyDVET2KPQVTiuSxraBap/t8M8uWJjSn4RVuo8EqMCjHf2MOZvx5
         XeDq9Cz+khn5oOGxs+2YvzPHmecpybs8+uiRNtQwclsVbsWhmAD25I21hAYmgYZHG6Q4
         abVGln4UkHycDmHSs7zNScPGiUezVNNZxvv+Yd6Jp2BGDcc6Hto+oH3aJndkKMLcb8LO
         stEX23FeXW3GNC9wov5hhccbhEEVjkmbZ27KK6AhV8hd91yEePKkYyGRkckAkCWRgJ+A
         FFT81e3jHdKXkWK+KHD9GwutGb1Q1vn2X+I4CaJQAW2wHsrqCiSO+uDwcUZUgl+6ooxz
         dXhw==
X-Gm-Message-State: APjAAAWnyukQLm16QKKGUU+28wtHOmQAfeVaAgwxRKZGoguMj5ly3TTX
        wo2LT1vkQDixFMfqJMS9NTxS9HHz
X-Google-Smtp-Source: APXvYqyIMuIOj8mL+WKwj6a5lZ7/1mnPvG7D1SFJImd5PR8GzvGInFuAa4xM0vi7VLsCCRtrCgz+QQ==
X-Received: by 2002:a17:902:2702:: with SMTP id c2mr50721146plb.37.1555252656783;
        Sun, 14 Apr 2019 07:37:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n1sm52566483pgv.19.2019.04.14.07.37.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 07:37:36 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] lm25066: support SAMPLES_FOR_AVG register
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1555171278.git.krzysztof.adamski@nokia.com>
 <8b52d91c3b182d54d9cc523d2542bbca413927d1.1555171278.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <57f99b8f-f4e8-eda0-432c-21ecb0346a52@roeck-us.net>
Date:   Sun, 14 Apr 2019 07:37:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8b52d91c3b182d54d9cc523d2542bbca413927d1.1555171278.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/13/19 9:03 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> Manufacturer specific SAMPLES_FOR_AVG register allows setting the number
> of samples used in computing the average values (PMBUS_VIRT_READ_*_AVG).
> The number we write is an exponent of base 2 of the number of samples so
> for example writing 3 will result in 8 samples average.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/pmbus/lm25066.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index 53db78753a0d..b560d33db459 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -26,6 +26,7 @@
>   #include <linux/err.h>
>   #include <linux/slab.h>
>   #include <linux/i2c.h>
> +#include <linux/log2.h>
>   #include "pmbus.h"
>   
>   enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
> @@ -39,12 +40,15 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>   #define LM25066_CLEAR_PIN_PEAK		0xd6
>   #define LM25066_DEVICE_SETUP		0xd9
>   #define LM25066_READ_AVG_VIN		0xdc
> +#define LM25066_SAMPLES_FOR_AVG		0xdb
>   #define LM25066_READ_AVG_VOUT		0xdd
>   #define LM25066_READ_AVG_IIN		0xde
>   #define LM25066_READ_AVG_PIN		0xdf
>   
>   #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
>   
> +#define LM25066_SAMPLES_FOR_AVG_MAX	4096
> +
>   /* LM25056 only */
>   
>   #define LM25056_VAUX_OV_WARN_LIMIT	0xe3
> @@ -284,6 +288,10 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
>   	case PMBUS_VIRT_RESET_PIN_HISTORY:
>   		ret = 0;
>   		break;
> +	case PMBUS_VIRT_SAMPLES:
> +		ret = pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);

		if (ret < 0)
			return ret;

> +		ret = 1 << ret;
> +		break;
>   	default:
>   		ret = -ENODATA;
>   		break;
> @@ -398,6 +406,11 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
>   	case PMBUS_VIRT_RESET_PIN_HISTORY:
>   		ret = pmbus_write_byte(client, 0, LM25066_CLEAR_PIN_PEAK);
>   		break;
> +	case PMBUS_VIRT_SAMPLES:
> +		word = clamp_val(word, 0, LM25066_SAMPLES_FOR_AVG_MAX);

0 is not valid, and ilog2(0) returns -1 (or is undefined).

> +		ret = pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
> +					    ilog2(word));
> +		break;
>   	default:
>   		ret = -ENODATA;
>   		break;
> @@ -438,7 +451,7 @@ static int lm25066_probe(struct i2c_client *client,
>   
>   	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
>   	  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
> -	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> +	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
>   
>   	if (data->id == lm25056) {
>   		info->func[0] |= PMBUS_HAVE_STATUS_VMON;
> 

