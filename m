Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78EEC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC4F96058D
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbhJLOg4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbhJLOg4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:36:56 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950F4C061749;
        Tue, 12 Oct 2021 07:34:54 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so26114164otv.4;
        Tue, 12 Oct 2021 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5DAQzaj5k0zpbcvSPbXt1dTefhUnkwFiFL/ydiICl/I=;
        b=kLe1NU9W9q8ejXGQsIgxuEhtBoSn9HiIvO18MZl78PRTFVkpitj/W0pOgr3KcPUXXX
         VkMsWOzxmXjCkxHUcXLda5qt3yQRSN5/6f13oIk/Ft8cf451O8ben+MTLxI0ymiUCtlo
         fmp5xq7aK+77PW1caO/Q+es0+ymn8Xi3IJGZQTTLs5e0RZmwhSOtDEFAdpgius9kbs/2
         zl8WM8bBAuGhtfdDkSfYf0+Hzs0BozE5O8z4rpYZ7yQURRKMVdS++gaymVWrvXFsl7xI
         Rg7lSyzMKzApEctHa+FkKD2iPjG15D7L4aRfTHInutp/RiVzmZPqI0MtZ/VNdPisYlq5
         XvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5DAQzaj5k0zpbcvSPbXt1dTefhUnkwFiFL/ydiICl/I=;
        b=s6sgXMxlT2i5US1yYUiZVJ++1NxPoSWvNRTOSS/Oa1tT3mjuslgvZ0UzvCagCQMDrK
         ZvDxm/h7/eVMUA2hWODNzBDQLwX92GQZJD001ACfwe0k2T08T8ldzqPeiauJJLqzDHcm
         dP/zviwKtfwl1ghJayQzcgOge6aZHf32TOqqwMNM2Om4zazaFZjsfvm27FVJS5WsjWll
         DsOohi7i3L+EQn4TNzsEG5SVujAyt48b76UJfO61BSNV4I4turUMUrS+b+cPBrQCEBw+
         JxLXjnYUUZbG7s5mSgn/mEtX4VJtQxKftnb7T3Gl68Dc7qJh00q7AqcA8XPmcbd1UQO7
         C2Hw==
X-Gm-Message-State: AOAM530PeHtHr8AkSSl/thPR8Tu71zLHWCA4AT1t2/zkWkhOYQ/cqo7B
        gxVyl+BsFuTDa48/KFRl6cZH9bBk9Yo=
X-Google-Smtp-Source: ABdhPJz4DQmooMCNaSSdy35cPWLGu/rOkdBLJVR8d93lHhAUX3WbRwRRDBwVPTP1S9f50DVQxHv1tA==
X-Received: by 2002:a9d:116:: with SMTP id 22mr14341669otu.40.1634049293742;
        Tue, 12 Oct 2021 07:34:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n12sm2139267otq.32.2021.10.12.07.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 07:34:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 05/10] hwmon: (tmp421) support specifying n-factor via
 DT
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <97068b3f1703db5da8fe9bec0729c6b3a79672df.1634029538.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9458b788-2d60-a0be-f59e-46da5531ea92@roeck-us.net>
Date:   Tue, 12 Oct 2021 07:34:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <97068b3f1703db5da8fe9bec0729c6b3a79672df.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/12/21 2:28 AM, Krzysztof Adamski wrote:
> Previous patches added a way to specify some channel specific parameters
> in DT and n-factor is definitely one of them. This calibration mechanism
> is board specific as its value depends on the diodes/transistors being
> connected to the sensor and thus the DT seems like a right fit for that
> information. It is very similar to the value of shunt resistor that some
> drivers allows specifying in DT.
> 
> This patch adds a possibility to set n-factor for each channel via
> "n-factor" DT property in each channel subnode.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index fffffd671e34..fcd2932a6ddb 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>   #define TMP421_STATUS_REG			0x08
>   #define TMP421_CONFIG_REG_1			0x09
>   #define TMP421_CONVERSION_RATE_REG		0x0B
> +#define TMP421_N_FACTOR_REG_1			0x21
>   #define TMP421_MANUFACTURER_ID_REG		0xFE
>   #define TMP421_DEVICE_ID_REG			0xFF
>   
> @@ -310,6 +311,7 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
>   {
>   	struct device *dev = &client->dev;
>   	u32 i;
> +	s32 val;
>   	int err;
>   
>   	err = of_property_read_u32(child, "reg", &i);
> @@ -329,6 +331,20 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
>   
>   	data->channel[i].enabled = of_device_is_available(child);
>   
> +	if (i == 0)
> +		return 0; /* input 0 is internal channel */
> +

I think that should generate an error, ie

> +	err = of_property_read_s32(child, "ti,n-factor", &val);
> +	if (!err) {

		if (!i)
			return -EINVAL;

> +		if (val > 127 || val < -128) {
> +			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
> +				i, val);
> +			return -EINVAL;
> +		}
> +		i2c_smbus_write_byte_data(client, TMP421_N_FACTOR_REG_1 + i - 1,
> +						  val);
> +	}
> +
>   	return 0;
>   }
>   
> 

