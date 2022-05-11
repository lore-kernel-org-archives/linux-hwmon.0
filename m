Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81018C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 01:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiEKBhj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 21:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbiEKBhh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 21:37:37 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CEC56F83
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 18:37:36 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id q8so1012358oif.13
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 18:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=TagVN3PQe7GEKWsS80IsSXJr3bH8NP92efZPFMc4XHE=;
        b=cL75SeSl8qY5P0fW313CJdJvxqKYjlqvlMx6kNFNlW6wKN1NvIk4zN8pK1fXdnMioK
         XsxZHCjPfFAD6hoWS1ZdKweOLG4vNGBGe6atY/EjQA3Lcp2pIcmr7vDArPmsMvIHDrgQ
         Bq0LFXmwv6GQaozOBQbQq2GNNJ34nB7kETwBvzcgGxVB3x5QCAlSAIZHKobY2s+H1YyM
         b9Sj/qvaoNAFH19IkquFYI1YeCPnPNjVSSwt07/2VhPiSvpH98R5/lDDFkuh0nkopXhK
         jyHYGtO9a9a04OlbWOtfyogKJxHphlK1b8eWgBNMsoO68plpBPUt3x+Jhn5vy3qdTOlI
         EhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=TagVN3PQe7GEKWsS80IsSXJr3bH8NP92efZPFMc4XHE=;
        b=gUAnnePgYRUVhlgVHmU3qt6KX8Ks/gLO7XiltlpqsFhqLJfezYoxyR+h4jIko9w6XV
         1tvdiXTKx3UK8F3mohPWa5BdJXtqTMeJqTR3KZlseUtR1iGcO+g25lox+znoYFNRHhzP
         kyNDoRzLF2ISXn1WR9czSGHh/moqgKJav20vWL1mPdkL0WaWlMHTVrVSIOuIQViii4s/
         5mk/2aHmTeSI3mBD8mwPXq+iK+LQhLQRfjCUlmQh7tAwL0HhO5oFMWbBKzV1dW4J2amn
         vTktc8I3SVn1Mi9g6fkVzEr+soG5253JcrhpRujoe+Cxor+X+qWu+9S4+OGSCO2YLcvl
         iRDA==
X-Gm-Message-State: AOAM530BC4s0dBptINkiNjtjOYXHibxT+8wswkRcH4Fo/LIezQJFytI3
        wHFYw/a6Ug7rCR0Grwbhh6E=
X-Google-Smtp-Source: ABdhPJz/rFP9kgCvRWe5uvQzEmV8WKPwfSC5IoqFcswhX/d2uo/hp3NBAy08PxzbJ60N8om6a7jQGA==
X-Received: by 2002:aca:a98e:0:b0:326:b029:33ef with SMTP id s136-20020acaa98e000000b00326b02933efmr1370378oie.123.1652233055490;
        Tue, 10 May 2022 18:37:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e18-20020a056870d11200b000e92295f8acsm234868oac.2.2022.05.10.18.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 18:37:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
Date:   Tue, 10 May 2022 18:37:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <20220510080900.22758-2-holger.brunck@hitachienergy.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
In-Reply-To: <20220510080900.22758-2-holger.brunck@hitachienergy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 5/10/22 01:09, Holger Brunck wrote:
> Some lm90 devices can operate in a extended temperature mode, this feature

lm90 compatible ... mode. This ...

> is now eanbled if the property is set in the corresponding device tree

enabled

> node.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> cc: Jean Delvare <jdelvare@suse.com>
> cc: Guenter Roeck <linux@roeck-us.net>

Cc: isn't really necessary or useful to list maintainers; You might want to
use the --cc option of git send-email instead. Also, if used, it should
be "Cc:".

For the subject, please use "hwmon: (lm90) ...".

> ---
>   drivers/hwmon/lm90.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 1c9493c70813..6cdbcfab9f20 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1707,6 +1707,7 @@ static void lm90_restore_conf(void *_data)
>   
>   static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>   {
> +	struct device_node *np = client->dev.of_node;
>   	int config, convrate;
>   
>   	convrate = lm90_read_reg(client, LM90_REG_R_CONVRATE);
> @@ -1727,7 +1728,8 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>   
>   	/* Check Temperature Range Select */
>   	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
> -		if (config & 0x04)
> +		if (config & 0x04 ||
> +		    of_property_read_bool(np, "onsemi,extended-range-enable"))
>   			data->flags |= LM90_FLAG_ADT7461_EXT;

Maybe I am missing something, but I don't see the matching configuration
change. Specifying the flag in devicetree only really makes sense if the
chip configuration is changed accordingly.

Guenter
