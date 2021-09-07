Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E0C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9987161051
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345323AbhIGPeu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 11:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345299AbhIGPer (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Sep 2021 11:34:47 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6106BC061757;
        Tue,  7 Sep 2021 08:33:40 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id bi4so13231419oib.9;
        Tue, 07 Sep 2021 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/IeDn/kM3dgUlXSBv238eSNQpcLMZSPxIbeVZGVUOQU=;
        b=Kv2lMLmaj7oTybmLpkB16tQxDRhc81VfBEREvb9KPu8iPdYr6JA4Fadb8u1Gcin/r8
         yqnX+gmZ5+Rx36PXRXRM2qQqQIaOFIf/D6ZG+tDR6MV08cjGhQ+eUQGMbb6yFXslYyQs
         1zpSM7R5p6L/jqrK6K+C5Zi7E3uCpyWgz5i2DY9Pvau2H0goziXO5pxaSJGrYcmxlz+W
         NHm1/7VRYlF8QRlkZmGcMNjIa9bPpPf2IhaG56A4qxfeDkzcPISh6rYBdLzB4qYnARo/
         l/RQoHDNojRE+HRGnulrruNBZIacp4nYPPVLyQeYJGsIX0E6TpYev6vUk4paZRHeOWc1
         BJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/IeDn/kM3dgUlXSBv238eSNQpcLMZSPxIbeVZGVUOQU=;
        b=tNn0okTjh/V+dI5RR678LifE1y6rb2NVpIhOBDAfzcH5bmGWQgNLtS2UvD9bwV8Z8o
         N7cSKLtBNh7djQziDuJt064FqWTF2xnqSoPcM7Qm2stVQRNT5rPQItYWu04gzmZjYZIA
         Rg8H5Oj/a4NjUS+t8JO9kgol6ihCctUbaCzJF4n9rxN228W84l1L4yIEXuINjWF1a+Gk
         ZaWv+d2ZerP2mESmWJeni/n7tW+sDNyGcwwJMUGIAlFGKFh7d6AdGnlyao2Wltglupaq
         p0p2JXvm3Gca5HNaR8g8JuxUnnW2LfiH548/GmhTVbOMya2GGZ66BP3KrmOnc3zA8Ir8
         na9A==
X-Gm-Message-State: AOAM53036RJk6wt9P2DCahRaXfnKYU0cliWn7X7mRf6Amu6z0j2WgGNa
        RYFW9i2Qw8WaNto/hzK4itUUOJAgYFs=
X-Google-Smtp-Source: ABdhPJwU25PJPl7qfK6A3xd0sP1Pe2MBOiDghElTJSqB5Dtbf/K+km8rcxIyAwYCQ0aWZEZlaERISQ==
X-Received: by 2002:aca:5c07:: with SMTP id q7mr3264634oib.68.1631028819525;
        Tue, 07 Sep 2021 08:33:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k8sm2286636oom.20.2021.09.07.08.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 08:33:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <1a2aa678c5a6261a1c096702f2e314e701533660.1631021349.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 5/8] hwmon: (tmp421) support disabling channels from DT
Message-ID: <68308226-0b64-e246-41b7-0a9583072d77@roeck-us.net>
Date:   Tue, 7 Sep 2021 08:33:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1a2aa678c5a6261a1c096702f2e314e701533660.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/7/21 6:43 AM, Krzysztof Adamski wrote:
> The previous patch introduced per channel subnodes in DT that let us
> specify some channel specific properties. This built a ground for easily
> disabling individual channels of the sensor that may not be connected to
> any external diode and thus are not returning any meaningful data.
> 
> This patch adds support for parsing the "status" property of channels DT
> subnodes and makes sure the -ENODATA is returned when disabled channels
> value is read.
> 

If channels can be disabled via DT, the respective sysfs attribute (tempX_enable)
should also be supported.

> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index a1dba1d405ee..a41d7935acb9 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -89,6 +89,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
>   
>   struct tmp421_channel {
>   	const char *label;
> +	bool disabled;
>   	s16 temp;
>   };
>   
> @@ -125,9 +126,8 @@ static int temp_from_u16(u16 reg)
>   	return (temp * 1000 + 128) / 256;
>   }
>   
> -static struct tmp421_data *tmp421_update_device(struct device *dev)
> +static void tmp421_update_device(struct tmp421_data *data)
>   {
> -	struct tmp421_data *data = dev_get_drvdata(dev);
>   	struct i2c_client *client = data->client;
>   	int i;
>   
> @@ -149,14 +149,17 @@ static struct tmp421_data *tmp421_update_device(struct device *dev)
>   	}
>   
>   	mutex_unlock(&data->update_lock);
> -
> -	return data;
>   }
>   
>   static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>   		       u32 attr, int channel, long *val)
>   {
> -	struct tmp421_data *tmp421 = tmp421_update_device(dev);
> +	struct tmp421_data *tmp421 = dev_get_drvdata(dev);
> +
> +	if (tmp421->channel[channel].disabled)
> +		return -ENODATA;
> +
> +	tmp421_update_device(tmp421);
>   
>   	switch (attr) {
>   	case hwmon_temp_input:
> @@ -314,6 +317,10 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
>   	if (data->channel[i].label)
>   		data->temp_config[i] |= HWMON_T_LABEL;
>   
> +	if (!of_device_is_available(child)) {
> +		data->channel[i].disabled = true;
> +		return;
> +	}
>   }
>   
>   void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
> 

