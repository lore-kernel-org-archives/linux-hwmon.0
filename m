Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FCDC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 13:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237838AbiEXNcq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 09:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbiEXNcp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 09:32:45 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4165FF1F;
        Tue, 24 May 2022 06:32:44 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s188so17594770oie.4;
        Tue, 24 May 2022 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GTnKb2+ZD2ChDR2YG5isQyAauBYvu/oXheaPJ28a9h8=;
        b=TNK4kBtKuXmCRMQECV9Ef4mxMsXd35fZuuKC2vs4qLc13I3OYO9Z9vXhz/iOjCWnfe
         qBPJbsh91jdjh7S0a0bqHbjkyWETkiTI5TvL5u/u94GXARphMAUGtuubHEF2pcTxJZcL
         3oeKgxVq+WJVZ0NBMWEhJPVhTVzqO3w5xWrGFGiklK7KfJG3khZyvZneMunxdGXjBftx
         WpNzXrtaApyvMnxnY8wdT+lodWyOPLt5QZ53F3yf7IcBCubHc0A4g4uYt6WMBNNRnTZT
         +lzmrKqhsSnJnPMJMioFd3QD/jxonLLIJa166KfUC2T9NFEH74pTFZ0qS+vHQlHw9OZc
         hM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GTnKb2+ZD2ChDR2YG5isQyAauBYvu/oXheaPJ28a9h8=;
        b=xXXIOmBJ+6JWT8vVqGVd4xjkg5dDUTRPtXD6Y4B87oaP4IVLir/cr0ISJ1i3H0NEnT
         0Y7DVGSOi+zLIeAA56NxTFSbmE3tiOfo11eaWACRO9MC3yLQcD658u3B7jrITnB8peF+
         XvkPfBJV7XmYiglYf1zvxavDLYl6Lj34RRydr1C8VqtqQhpg4s5K7WJvT8HDJcuaohAw
         hBhteTO6M6fxyiCG6dg//jVgCnCv2bMLF8aOXcyZbj/J/TXHbS8a10nr7HjiQLaK4Qqy
         0QwzkO3byqSbUyo1Se8tLrlcIs2n7kmjHx88g/l9u+GU457BXfFoW1h29NRY6UqVf+XB
         h2jA==
X-Gm-Message-State: AOAM533a2aQvwfWryBFOBDy6CrKRUB+rc8rpBYDtIE4OP+RHFKGXS/2J
        j2ZSMkiCAipq9A314F9b3Krmopf72Gg7uA==
X-Google-Smtp-Source: ABdhPJztrllB+V6b+7i/zHIftY2Qw8Mgp64uuwv3QeyJetpKBtVE18WR4XTkot104hgagIHXpZruQg==
X-Received: by 2002:a05:6808:16a1:b0:2f9:bfea:e5f3 with SMTP id bb33-20020a05680816a100b002f9bfeae5f3mr2345019oib.28.1653399164186;
        Tue, 24 May 2022 06:32:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r84-20020aca4457000000b0032b7a0c5da1sm1015462oia.27.2022.05.24.06.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 06:32:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0bfc3c0-d15f-f19e-5355-03a76ffa71ee@roeck-us.net>
Date:   Tue, 24 May 2022 06:32:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus) add a function to check the
 presence of a block register
Content-Language: en-US
To:     Adam Wujek <dev_public@wujek.eu>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220524104307.272806-1-dev_public@wujek.eu>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220524104307.272806-1-dev_public@wujek.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/24/22 03:43, Adam Wujek wrote:
> Other functions (like pmbus_check_byte_register) cannot be used to check
> the presence of a block register, because it will generate error when PEC
> is used.
> 
> Signed-off-by: Adam Wujek <dev_public@wujek.eu>
> ---
> Notes:
>    Changes in v2:
>      - Use Phase 0xff when setting the page
> 
>   drivers/hwmon/pmbus/pmbus_core.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index acf78d0829d9..2ff66f133d95 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -421,6 +421,18 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
>   	return pmbus_read_byte_data(client, page, reg);
>   }
> 
> +static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
> +				 char *data_buf)
> +{
> +	int rv;
> +
> +	rv = pmbus_set_page(client, page, 0xff);
> +	if (rv < 0)
> +		return rv;
> +
> +	return i2c_smbus_read_block_data(client, reg, data_buf);
> +}
> +
>   static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
>   					      int reg)
>   {
> @@ -558,6 +570,20 @@ bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
>   }
>   EXPORT_SYMBOL_NS_GPL(pmbus_check_word_register, PMBUS);
> 
> +static bool pmbus_check_block_register(struct i2c_client *client, int page,
> +				       int reg)
> +{
> +	int rv;
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	char data_buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };

Unnecessary initialization.

> +
> +	rv = pmbus_read_block_data(client, page, reg, data_buf);
> +	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> +		rv = pmbus_check_status_cml(client);

How about PMBUS_READ_STATUS_AFTER_FAILED_CHECK ?

Thanks,
Guenter

> +	pmbus_clear_fault_page(client, -1);
> +	return rv >= 0;
> +}
> +
>   const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
>   {
>   	struct pmbus_data *data = i2c_get_clientdata(client);
> --
> 2.17.1
> 
> 

