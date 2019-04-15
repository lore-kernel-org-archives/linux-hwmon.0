Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F75EC10F12
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:16:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29AC22070D
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLi99SnM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbfDOUQ1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:16:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38186 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbfDOUQ1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 16:16:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id f36so9122074plb.5
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0zg7iGo8A9Y0NOviiorOl0735LTDfVinLnakb9hXMt8=;
        b=BLi99SnMPxPcdwQnIM4xKfynQJegNq9uWNltI1+C79wlSOjMFQMQuq7DK9FnyUi9Ck
         f/FWBgpyaqi+xfuzCrefFS5Ta4QTj6nEPJYEZsixrqfArQdnoNL+0xfb+3uh4MMKDOqz
         TYp9A8dYQ8wvBY41jKt1kM++YdaXv4FkY4qK7I3iLI8Eg8tBlmLIyKNhTy+PedkeUy72
         fPwNcR3IRS8tQL7UCbp6CiHlzYw2g01rkpRUvgYTN6XgkOnmojCLx+4ZFXN03mtCjb/z
         +G2H/j7PgZ5vobmVxnR8D/3/EjbFRihvVUNRW/tc4kAMLclqfxUggdSxsCeaSWwK++vg
         UJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0zg7iGo8A9Y0NOviiorOl0735LTDfVinLnakb9hXMt8=;
        b=nW8VeDlW1cnhlJrGWhOs/zFwhLSiESvoGxLguR/6ZBTotfdjElgHuYDYvVBnMOLpie
         FDFpG3kyUceI5pJ3/6CEWgUl5GU3d0EJJ47tCNNZUsWLC4FSviFehLhrkrI3jEf0bJ+Q
         nlLkSuPfkAGb7+sePrGs13Xbd5FUP7zGL1acrU40er265eacMYbHIrK4Y0lAwNL1xjMT
         xaPEndrt4J3y2L+4kLLUu9MB4AMBxO1/j3LgbNIOWyRShXDkIk3dxtJtU5Ce+qsOmxsL
         OIl6ACW8pglHunc77g79IM6mHAJUwgnoEpxgd+vBQ2/okrW1gGoI0hRQcmZVGkTWy5ZM
         l7+g==
X-Gm-Message-State: APjAAAU1iYndJnXnDjla7kfbEQJApmO2GdynZx25oG9Z94hFuJGuvRc9
        pGpQFLAesgXBajr3MhB3eAg=
X-Google-Smtp-Source: APXvYqz/3ruJfg3/Kj4G1tkelJJhhZ31+2w7K+HitE6KQNPDosguYb9Zpi1mNznRlyjRC1BlfUGpAA==
X-Received: by 2002:a17:902:59c5:: with SMTP id d5mr77532814plj.104.1555359386870;
        Mon, 15 Apr 2019 13:16:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e7sm48746397pfc.132.2019.04.15.13.16.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 13:16:26 -0700 (PDT)
Date:   Mon, 15 Apr 2019 13:16:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 3/4] lm25066: support SAMPLES_FOR_AVG register
Message-ID: <20190415201625.GA25805@roeck-us.net>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <81104f51d2c10aff1932de23a24d5bc133b52ab7.1555273192.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81104f51d2c10aff1932de23a24d5bc133b52ab7.1555273192.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 09:59:19PM +0000, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> Manufacturer specific SAMPLES_FOR_AVG register allows setting the number
> of samples used in computing the average values (PMBUS_VIRT_READ_*_AVG).
> The number we write is an exponent of base 2 of the number of samples so
> for example writing 3 will result in 8 samples average.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/lm25066.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index 53db78753a0d..715d4ab57516 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -26,6 +26,7 @@
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
> +#include <linux/log2.h>
>  #include "pmbus.h"
>  
>  enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
> @@ -39,12 +40,15 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>  #define LM25066_CLEAR_PIN_PEAK		0xd6
>  #define LM25066_DEVICE_SETUP		0xd9
>  #define LM25066_READ_AVG_VIN		0xdc
> +#define LM25066_SAMPLES_FOR_AVG		0xdb
>  #define LM25066_READ_AVG_VOUT		0xdd
>  #define LM25066_READ_AVG_IIN		0xde
>  #define LM25066_READ_AVG_PIN		0xdf
>  
>  #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
>  
> +#define LM25066_SAMPLES_FOR_AVG_MAX	4096
> +
>  /* LM25056 only */
>  
>  #define LM25056_VAUX_OV_WARN_LIMIT	0xe3
> @@ -284,6 +288,12 @@ static int lm25066_read_word_data(struct i2c_client *client, int page, int reg)
>  	case PMBUS_VIRT_RESET_PIN_HISTORY:
>  		ret = 0;
>  		break;
> +	case PMBUS_VIRT_SAMPLES:
> +		ret = pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
> +		if (ret < 0)
> +			break;
> +		ret = 1 << ret;
> +		break;
>  	default:
>  		ret = -ENODATA;
>  		break;
> @@ -398,6 +408,11 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
>  	case PMBUS_VIRT_RESET_PIN_HISTORY:
>  		ret = pmbus_write_byte(client, 0, LM25066_CLEAR_PIN_PEAK);
>  		break;
> +	case PMBUS_VIRT_SAMPLES:
> +		word = clamp_val(word, 1, LM25066_SAMPLES_FOR_AVG_MAX);
> +		ret = pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
> +					    ilog2(word));
> +		break;
>  	default:
>  		ret = -ENODATA;
>  		break;
> @@ -438,7 +453,7 @@ static int lm25066_probe(struct i2c_client *client,
>  
>  	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
>  	  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
> -	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> +	  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
>  
>  	if (data->id == lm25056) {
>  		info->func[0] |= PMBUS_HAVE_STATUS_VMON;
