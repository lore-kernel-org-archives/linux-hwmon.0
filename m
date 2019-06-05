Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4945C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 20:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ADD782067C
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 20:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIH8mt7V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfFEUkq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 16:40:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35147 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEUkq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 16:40:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id d126so38205pfd.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VupF8qNdv2E0LdjsFi1xe4USPVN+XvDlVzWekaW38eM=;
        b=nIH8mt7VBXD/rLUGYFL/XnjZwDKA1eC0njBv8DtjlaGY47MliAaC/a2wGBMSJCLy40
         lW97IQMC4leOzN1kOpw6QP8BIvyt1nAZ57GSipyKjVn+XspG6r494ShG9L7LGOzsLgsP
         YUyr1df1HJuPpNoaweNa1CmldXx5PE2y2vJC7dMmJY2l7GkJHdNgDGshHrClDLI1/pFq
         hYifXzAXzBTsXqP8hRLIwHwYWuFrLfM7k20EunA+hgdCFGSiY7bNqgqVd0UpIOKp4dNo
         K+7hQGBgAsPIWDhjBMyy7iAQ2RimIieYIXwC4LdPlakVxSqmcnfR/3scCGf1ppsuF4yV
         B/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VupF8qNdv2E0LdjsFi1xe4USPVN+XvDlVzWekaW38eM=;
        b=UiQ1dMnmWT/Hkn4yzvKIXySFV3uVWjOStjEYysxBJp7pHOPiWi/io9hQTnWZjsc3PN
         aqiWkabbyoPOrilhPSivv21DavbtORcbROuqmNP+hl1IDuFrRfOCmcZdrq557S31f4No
         LxVSzfy73vFAYFG9mixIHc8cHrDfgWdHN8Svq7oFi25bPdN1jDKFEUMLEZMjnsaXi9sX
         Vmu41Z/U4RAsApe3zm8N+d5hIeMOysOU7bOFPnJiS4a4ZH7PH9ufgq05CUb+PlCp8bfT
         KulTuGjY6Is50a45hL5OGUqTlWyrpWKaDQlRKtN/CLmH/p5S7Tc8nyw82vrM7/ThX6FK
         PklA==
X-Gm-Message-State: APjAAAWK0CTu1sLRgh19mKxHY9NSICMCK99Qthp6cYJr3I2DuTUYlYVH
        7IXB62mcRyciOU9pfgjOeno=
X-Google-Smtp-Source: APXvYqyZfA14NrAxP84OoD2iWsFtsp6K6qvJmK90MQWOL4U0ddUH0wkGml+tpyPv4C7IDbZ6uyvmUA==
X-Received: by 2002:a62:a508:: with SMTP id v8mr47913320pfm.87.1559767245380;
        Wed, 05 Jun 2019 13:40:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k6sm23107827pfi.86.2019.06.05.13.40.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 13:40:44 -0700 (PDT)
Date:   Wed, 5 Jun 2019 13:40:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2 2/2] adm1275: support PMBUS_VIRT_*_SAMPLES
Message-ID: <20190605204043.GA30893@roeck-us.net>
References: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
 <7524aaac106af01da2b52662b160535a211ebcd0.1559140351.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7524aaac106af01da2b52662b160535a211ebcd0.1559140351.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 29, 2019 at 02:36:21PM +0000, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> The device supports setting the number of samples for averaging the
> measurements. There are two separate settings - PWR_AVG for averaging
> PIN and VI_AVG for averaging VIN/VAUX/IOUT, both being part of
> PMON_CONFIG register. The values are stored as exponent of base 2 of the
> actual number of samples that will be taken.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Applied.

Thanks,
Guenter

> ---
> 
> Changes in v2:
> - Moved mutex lock to pmbus_set_samples (see patch 1/2)
> - Changed mask type passed as argument to adm1275_read_pmon_config and
>   adm1275_write_pmon_config to u16
> - Changed 1 << ret to BIT(ret)
> 
>  drivers/hwmon/pmbus/adm1275.c | 61 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index f569372c9204..0c3493fa53ea 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -23,6 +23,8 @@
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
>  #include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/log2.h>
>  #include "pmbus.h"
>  
>  enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
> @@ -78,6 +80,10 @@ enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
>  #define ADM1075_VAUX_OV_WARN		BIT(7)
>  #define ADM1075_VAUX_UV_WARN		BIT(6)
>  
> +#define ADM1275_PWR_AVG_MASK		GENMASK(13, 11)
> +#define ADM1275_VI_AVG_MASK		GENMASK(10, 8)
> +#define ADM1275_SAMPLES_AVG_MAX	128
> +
>  struct adm1275_data {
>  	int id;
>  	bool have_oc_fault;
> @@ -164,6 +170,34 @@ static const struct coefficients adm1293_coefficients[] = {
>  	[18] = { 7658, 0, -3 },		/* power, 21V, irange200 */
>  };
>  
> +static inline int adm1275_read_pmon_config(struct i2c_client *client, u16 mask)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
> +	if (ret < 0)
> +		return ret;
> +
> +	return FIELD_GET(mask, (u16)ret);
> +}
> +
> +static inline int adm1275_write_pmon_config(struct i2c_client *client, u16 mask,
> +					    u16 word)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct adm1275_data *data = to_adm1275_data(info);
> +	int ret;
> +
> +	ret = i2c_smbus_read_word_data(client, ADM1275_PMON_CONFIG);
> +	if (ret < 0)
> +		return ret;
> +
> +	word = FIELD_PREP(mask, word) | (ret & ~mask);
> +	ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, word);
> +
> +	return ret;
> +}
> +
>  static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
>  {
>  	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> @@ -242,6 +276,19 @@ static int adm1275_read_word_data(struct i2c_client *client, int page, int reg)
>  		if (!data->have_temp_max)
>  			return -ENXIO;
>  		break;
> +	case PMBUS_VIRT_POWER_SAMPLES:
> +		ret = adm1275_read_pmon_config(client, ADM1275_PWR_AVG_MASK);
> +		if (ret < 0)
> +			break;
> +		ret = BIT(ret);
> +		break;
> +	case PMBUS_VIRT_IN_SAMPLES:
> +	case PMBUS_VIRT_CURR_SAMPLES:
> +		ret = adm1275_read_pmon_config(client, ADM1275_VI_AVG_MASK);
> +		if (ret < 0)
> +			break;
> +		ret = BIT(ret);
> +		break;
>  	default:
>  		ret = -ENODATA;
>  		break;
> @@ -286,6 +333,17 @@ static int adm1275_write_word_data(struct i2c_client *client, int page, int reg,
>  	case PMBUS_VIRT_RESET_TEMP_HISTORY:
>  		ret = pmbus_write_word_data(client, 0, ADM1278_PEAK_TEMP, 0);
>  		break;
> +	case PMBUS_VIRT_POWER_SAMPLES:
> +		word = clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
> +		ret = adm1275_write_pmon_config(client, ADM1275_PWR_AVG_MASK,
> +						ilog2(word));
> +		break;
> +	case PMBUS_VIRT_IN_SAMPLES:
> +	case PMBUS_VIRT_CURR_SAMPLES:
> +		word = clamp_val(word, 1, ADM1275_SAMPLES_AVG_MAX);
> +		ret = adm1275_write_pmon_config(client, ADM1275_VI_AVG_MASK,
> +						ilog2(word));
> +		break;
>  	default:
>  		ret = -ENODATA;
>  		break;
> @@ -439,7 +497,8 @@ static int adm1275_probe(struct i2c_client *client,
>  	info->format[PSC_CURRENT_OUT] = direct;
>  	info->format[PSC_POWER] = direct;
>  	info->format[PSC_TEMPERATURE] = direct;
> -	info->func[0] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT;
> +	info->func[0] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +			PMBUS_HAVE_SAMPLES;
>  
>  	info->read_word_data = adm1275_read_word_data;
>  	info->read_byte_data = adm1275_read_byte_data;
