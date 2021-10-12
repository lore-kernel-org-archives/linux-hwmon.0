Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7018FC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57171604DA
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237101AbhJLOeO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235294AbhJLOeN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:34:13 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B29C061745;
        Tue, 12 Oct 2021 07:32:12 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id k2-20020a056830168200b0054e523d242aso16583369otr.6;
        Tue, 12 Oct 2021 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u8APRU0KxIoZbnE8x6adVv19WHZIMrX+SjVjQeNzfHI=;
        b=Mnb4sedEwGYENrLQHmDezYBerdrIEpQdX976p9952Iv09TeIglrvIT1ZdSxT0UpILj
         tzTVjxzCKbeT3pbOqAjG8toJKryzuBeL6Meu1OTjo6fs2SXFQdNVwlWzpjKzJgUPXRbe
         DsunKd/WieDoefBJs2hAibTcSRl6nzcwBBogA9Fje6RRia24NZoRp7DbQ/Sbfxj4/fQQ
         YYsj+V/4wPfthhRkZTe9WebnlhEKkz7m+eSAPEUuix6m0/IBftu0VdRQyhgRiLZSz+UQ
         QbWbowUbTyjMy5H+P96YT4qoSaD9sFZ8ozXrgnqqfHLLMt6WRL3HMDKbrSNTvLYZbLsf
         8O+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u8APRU0KxIoZbnE8x6adVv19WHZIMrX+SjVjQeNzfHI=;
        b=hxqsZ161gcpAiHdlaitQjegM114/t0cu4yq4p8793cklsx2w5zOc5gYDU/UsRfpCqV
         Xj4WnypgOVCc5nxowg6adi6q4hbMeoccF63lZQ/j0vuMXcATBTydtRxIfE36UhufRQ70
         hvrmHtDd9Ysj+SIjeDFkAKzmueJOiqZaODBWM+p6mmPu/3JMgH6ekoG4Rqu2XJwqPjbe
         xVQWIMqpEuqbcBJnEqOL66ALj9d4Y6f6MgCc4Ys0UUVU/dqevplSdFKytkCEO1wtzJ2P
         wN0KbgWIom6/IxitOBYht86e/zGsBYPw6+a+L0vDp26/62LJoUvu1dbvSgSUrDzR3rFQ
         ZwCQ==
X-Gm-Message-State: AOAM531sg8qx+AGSrS1oWFukicqorsgqKURe2Z6C8S+8m+gk/aXYpZpE
        N2L0O6rhwoG1pDiPYflUgNrSrQJ1DF0=
X-Google-Smtp-Source: ABdhPJxkp2G0leKuJkb0Qym8YQIAgkGJQyeVLIT/JcXcU+tzXdehYwUX0XxadJRMazLQdZ3/IKdCNw==
X-Received: by 2002:a05:6830:2685:: with SMTP id l5mr26826689otu.9.1634049131313;
        Tue, 12 Oct 2021 07:32:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w141sm2367409oif.20.2021.10.12.07.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 07:32:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 04/10] hwmon: (tmp421) support disabling channels from
 DT
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <8a9571a79408d46de8a0276703a3de28deb0c061.1634029538.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e43ac3f8-b183-6fc7-8c05-a6e2f3aa151b@roeck-us.net>
Date:   Tue, 12 Oct 2021 07:32:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8a9571a79408d46de8a0276703a3de28deb0c061.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/12/21 2:27 AM, Krzysztof Adamski wrote:
> The previous patch introduced per channel subnodes in DT that let us
> specify some channel specific properties. This built a ground for easily
> disabling individual channels of the sensor that may not be connected to
> any external diode and thus are not returning any meaningful data.
> 
> This patch adds support for parsing the "status" property of channels DT
> subnodes and makes sure the -ENODATA is returned when disabled channels
> value is read.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/tmp421.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index ab64d9825ca4..fffffd671e34 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -89,6 +89,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
>   
>   struct tmp421_channel {
>   	const char *label;
> +	bool enabled;
>   	s16 temp;
>   };
>   
> @@ -170,6 +171,9 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>   	if (ret)
>   		return ret;
>   
> +	if (!tmp421->channel[channel].enabled)
> +		return -ENODATA;
> +
>   	switch (attr) {
>   	case hwmon_temp_input:
>   		*val = temp_from_raw(tmp421->channel[channel].temp,
> @@ -323,6 +327,8 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
>   	if (data->channel[i].label)
>   		data->temp_config[i] |= HWMON_T_LABEL;
>   
> +	data->channel[i].enabled = of_device_is_available(child);
> +
>   	return 0;
>   }
>   
> @@ -371,8 +377,10 @@ static int tmp421_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> -	for (i = 0; i < data->channels; i++)
> +	for (i = 0; i < data->channels; i++) {
>   		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
> +		data->channel[i].enabled = true;
> +	}
>   
>   	err = tmp421_probe_from_dt(client, data);
>   	if (err)
> 

