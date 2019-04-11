Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB7AC10F11
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 00:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 202D72133D
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 00:55:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vP9E44F5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfDKAzW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 20:55:22 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40988 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfDKAzW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 20:55:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id d1so2441882plj.8
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 17:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S3HRE/gTio22p4coBZKzzGZwCTyd5A+ghx8z2HFA4B8=;
        b=vP9E44F5QdzR9bjXTfvPcGZxhVDXrbYRbc+pZjP21/wp86lzECfY2Mqsp5N6js3yGD
         R2i3opbXi7HkAO72QHW2RkuekZJGG5VuvwCXLkLDA6coiKkCnWZM+bcJKkT79nECP1jF
         hAMQiqRvSH7pF6HfKAN1QiiOKirpxCsEuvIvDvpRjYW6wO7t6jXibj7Xlw1cAlutqQhS
         ERIP+Ig14nhG/DZJHiIFTXw1yHhE2ChLtpNqtkZYppCcbewg1Z/T9gp6wyCdwf98jRwx
         ErTwVYL3TFex9AEnymmAL6ayiWBRTDbGNsUQeLUi4eiog6WVx04lzD2JVAkGTbSHsec6
         AG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S3HRE/gTio22p4coBZKzzGZwCTyd5A+ghx8z2HFA4B8=;
        b=GhQIQvBVqfEDrwOmWDDnJ6aULQMB/0sJvYh9o/xdbOiEPjlSPqdTc28CpdP/mIMm/3
         bsYtrnWuzI7EaHUTG6wo8pViAAPuiHPehJXUAod485APfV1SuP/wp1Ddc9AMULBGefYo
         zDZmwyUD0U+5gBNf42LPMFe2ZnJ68ymToJ0d6F3HeOcq4ZkYbMZsPXX3/mmypRJG0XFC
         RfXyJ32W81telQOwPNHFz8A5Qf9eyDvHX1DL1YgQRcRX8FH4V6aR3rXvlqmp3q3MuiwF
         dWYzh7nTaAX/NM7HXGjK+ZaoBI9+HahIJeYqvdeLK1xzDwgzFk/Kq4nWCR1Et4iCxygh
         D/jg==
X-Gm-Message-State: APjAAAVdbHs0bzddcREdjIAWDv3CiBLNc6s5Cf4tX/KVm1X7a4UYOjJv
        lh4cZ2E3jN1W97s2C77q0z4=
X-Google-Smtp-Source: APXvYqxS4q5x/3BbCkefwEiB7IRMjNuJDiWi20LjmikL5fEEIsuymV5Ci2T0j4eDQsqr0eUgcodbNA==
X-Received: by 2002:a17:902:7043:: with SMTP id h3mr47947151plt.228.1554944121265;
        Wed, 10 Apr 2019 17:55:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p2sm45898549pfb.80.2019.04.10.17.55.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Apr 2019 17:55:20 -0700 (PDT)
Subject: Re: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <13669c15-3373-da20-6d68-50842d91be18@roeck-us.net>
Date:   Wed, 10 Apr 2019 17:55:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/10/19 3:39 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> Register custom sysfs attribute to be registered by pmbus allowing
> read/write access to the manufacturer specific SAMPLES_FOR_AVG register.
> This register allows setting the number of samples used in computing the
> average values (PMBUS_VIRT_READ_*_AVG). The number we write is an
> exponent of base 2 of the number of samples so for example writing 3
> will result in 8 samples average.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/pmbus/lm25066.c | 45 +++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index 53db78753a0d..c78af0a7e5ff 100644
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
> @@ -38,6 +39,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>   #define LM25066_READ_PIN_PEAK		0xd5
>   #define LM25066_CLEAR_PIN_PEAK		0xd6
>   #define LM25066_DEVICE_SETUP		0xd9
> +#define LM25066_SAMPLES_FOR_AVG		0xdb
>   #define LM25066_READ_AVG_VIN		0xdc
>   #define LM25066_READ_AVG_VOUT		0xdd
>   #define LM25066_READ_AVG_IIN		0xde
> @@ -405,6 +407,47 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
>   	return ret;
>   }
>   
> +static ssize_t samples_for_avg_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	int ret;
> +
> +	ret = pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", 1 << ret);
> +}
> +
> +static ssize_t samples_for_avg_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	int ret, val;
> +
> +	ret = kstrtoint(buf, 0, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
> +				    ilog2(val));
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(samples_for_avg);
> +
> +static struct attribute *lm25056_attrs[] = {
> +	&dev_attr_samples_for_avg.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(lm25056); // should we set a name of this group to put all
> +			   // those attributes in subdirectory? Like "custom" ?
> +
We don't add subdirectories for other chips, and we won't start it here.

I don't mind the attribute itself, but I do mind its name. We'll have
to find something more generic, such as 'num_samples' or just 'samples'.
I am open to suggestions. We'll also have to decide if the attribute(s)
should be limited to one per chip, or if there can be multiple attributes.
For example, MAX34462 has separate values for iout_samples and adc_average.
Do we want samples, {curr,in,power,...}_samples, or both ? Or even
currX_samples ?

Either case, this is needed for more than one pmbus chip (and I know
it is needed for some non-PMBus chips). I am inclined to add it as generic
attribute into the pmbus core instead (and possibly add it to the ABI).

Thanks,
Guenter

>   static int lm25066_probe(struct i2c_client *client,
>   			  const struct i2c_device_id *id)
>   {
> @@ -476,6 +519,8 @@ static int lm25066_probe(struct i2c_client *client,
>   		info->b[PSC_POWER] = coeff[PSC_POWER].b;
>   	}
>   
> +	info->groups = lm25056_groups;
> +
>   	return pmbus_do_probe(client, id, info);
>   }
>   
> 

