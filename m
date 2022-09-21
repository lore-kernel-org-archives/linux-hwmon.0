Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEEDC32771
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 22:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiIUWsb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 18:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiIUWsa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 18:48:30 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A739A4074
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 15:48:29 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso348275pjk.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=ehUZqqFi7a7grijLCJZ2HlfNebaQ1QTKYkpsx9XMm2s=;
        b=WC3E3UoWW9sHaZ07ppkZP/oCDubdzi2r/U17u8nyJ1Aj12KLNe1wn9pSjGnwG74MWJ
         Kzg32yjLhneEkNC9tw5Fw1MC3E+2R8hPOHYXtgWEVJG05M7oXN3GORfhxe0ixqbFDUz2
         zVu4YWgbv0Y8idgUyqkpy97j3TggkAWalvBnpqgtffmPAL9txyZohBMtEustRIuwd5KQ
         wM0aYHRsobXu5PDuXmdXL4uXvvothLML+dKI1VdOBphfCsGIMAPThhSqUQiUyDWPORr4
         LU1ScsKu5q6x6MLQSsCpdVq4GC5GUWXwluqJMSuH4Q8vTAwtCZJP4ecqso42pTChV40W
         hWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=ehUZqqFi7a7grijLCJZ2HlfNebaQ1QTKYkpsx9XMm2s=;
        b=2ojVL7PLP+9OyUoeyVWzo44hAte5+FmunP5K5YV5ksOFPcblnT7qHhF2tkNXDaQC3Y
         f/IRCkl6NCN8bQX6sex95f/yWv6U/VCSP8Z0IrPGmBKOfLS47NjtdoFsdDywnhcPdRPk
         TDKb5/02tNXr/fS33DaP7NipTQpTWJcLKTFOcpWlX2xFEOhjeK2T1pOrEiP357KCaSIJ
         NOfV1/Zy2PgAPgvFwME1/5jfIJijqxmJ4iQ9D1NB8G8Kya7LW+CvgN7RkZb1RE7A+ldT
         jJ7cwXUl0SsVM3QxojyI1DHn/xUqRaroo4dZyyP56eL80C8r2qCXVh3QBRBwaVqb9kBm
         56og==
X-Gm-Message-State: ACrzQf2mWfacx//E5w9XoOUI78bAJBjBYHggedSn/0B/8OqdKFkopURX
        FTVea7k35sy1Vl811On4NTI=
X-Google-Smtp-Source: AMsMyM4Y8MoQT7BJ9wAp3YGTHnaqJGcumfqtfGkFgDlCPYHIHuzGTY6WJUdFEjs2f1fNej2yYoypkA==
X-Received: by 2002:a17:90a:67c1:b0:202:e10a:4f14 with SMTP id g1-20020a17090a67c100b00202e10a4f14mr438821pjm.238.1663800508864;
        Wed, 21 Sep 2022 15:48:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jb6-20020a170903258600b0017541ecdcfesm2504960plb.229.2022.09.21.15.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 15:48:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1dc868db-e756-230a-3515-1e025e1f3409@roeck-us.net>
Date:   Wed, 21 Sep 2022 15:48:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drivers: adt7470: check the return value of
 adt7470_read_temperatures
Content-Language: en-US
To:     Li Zhong <floridsleeves@gmail.com>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com
References: <20220921222748.1667190-1-floridsleeves@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220921222748.1667190-1-floridsleeves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/21/22 15:27, Li Zhong wrote:
> adt7470_read_temperatures() fails and returns error when operations on
> regmap fail. adt7470_update_thread() currently does not check for it and
> propagate the error.
> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>   drivers/hwmon/adt7470.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index c67cd037a93f..0aadb2dc067f 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -289,12 +289,16 @@ static int adt7470_update_thread(void *p)
>   {
>   	struct i2c_client *client = p;
>   	struct adt7470_data *data = i2c_get_clientdata(client);
> +	int err;
>   
>   	while (!kthread_should_stop()) {
>   		mutex_lock(&data->lock);
> -		adt7470_read_temperatures(data);
> +		err = adt7470_read_temperatures(data);
>   		mutex_unlock(&data->lock);
>   
> +		if (err)
> +			return err;
> +
>   		if (kthread_should_stop())
>   			break;
>   
NACK.

That is a kernel thread which should keep going even after an error.
Aborting the thread after an error would be the absolute wrong thing
to do.

Guenter
