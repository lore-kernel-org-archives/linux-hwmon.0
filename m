Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BF6C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 14:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242230AbiA0OKP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 09:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbiA0OKO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 09:10:14 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39336C061714
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 06:10:14 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id bb37so6104093oib.1
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jan 2022 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rHBh+jrKC3N5gj+IuXj4wEHqScRqMoYF5ynDOAe7WS0=;
        b=ArIgKKYYqfxn6kKTWVn8yEhMG11MbUvRuu5T+FkMG13L3+PAwswpjGAWsRlOznPW2u
         ZrUelgPyBEhsA6ZPGOHYx9FjF2HLj0vt15Axttr0NZbphSDNbRClYvsS61rTTBK83WP7
         Wk8JrWa8Uz2tW9+9rZSGyBNlG8xTcoodeRi5zWvlb+wwfvCYTBDm1lmQnNAlU7JsOF4S
         Fsq09RVvD+KT6S4w1EgGHiiNpLEaJCWsp5RqZ1Odx7cRvfhdkplFYSYsEnkIqDLmbgKk
         cv8G8d6mixFsBZort3nry5vDiVMO5sF6prN6SS5yDMiTs2EW+4eASRIa0BzKq9zeWRFR
         lalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rHBh+jrKC3N5gj+IuXj4wEHqScRqMoYF5ynDOAe7WS0=;
        b=RZa4lOVjYHsIP9pMfwXrmKErAm6qzuYW+pVnafO4Qno9+/zacKCG78d5uKkTHrOPQx
         2xEviwANzrqL7ClKXgxHnsVXj/7E+/+lmf16HpHFNw15gtqXekA7FdKsbd5QNdSaKd+Q
         tqPxc/yuMxCTdtiOAgYM94KEzIphL7RPyhKtW3JW1igH6Yj90e9zUbBUBCifZlqy2kZh
         US+iP85S9ygSnltVQOiqUc6btP4nIlqK7uHCjs+0fgEzQ3REVSc3hvHOLWMO3acYiOko
         V+8jGwxo6GkRzhs35rnYvcPH8NvWJVnjkRAGjVaGCQcqGRiWyqJSGys3U4iLfbGqrcRR
         b+gA==
X-Gm-Message-State: AOAM532YhjAoQ8nIBGTtwqkD/LIqC2F/9gHmn5lsQjyTV6NEOGP9CP8S
        MD8undVVBDOBxYLcPDF4rutNZUwFbxGeiw==
X-Google-Smtp-Source: ABdhPJyBbwNLTS+f5gnem1HYBl036H9cHtnYdNIrX01otxqTA9gQ1v7S6PpVOfGf8N2JB+XJ/0IuSw==
X-Received: by 2002:a05:6808:1921:: with SMTP id bf33mr2312044oib.327.1643292613580;
        Thu, 27 Jan 2022 06:10:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b20sm6926317otq.20.2022.01.27.06.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 06:10:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <142a21c6-26c5-5b84-aaa6-1d324da77804@roeck-us.net>
Date:   Thu, 27 Jan 2022 06:10:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [bug report] hwmon: (lm83) Convert to use with_info API
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20220127085218.GE25644@kili>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220127085218.GE25644@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/27/22 00:52, Dan Carpenter wrote:
> Hello Guenter Roeck,
> 
> The patch 1c8467e8e8b2: "hwmon: (lm83) Convert to use with_info API"
> from Dec 22, 2021, leads to the following Smatch static checker
> warning:
> 
> 	drivers/hwmon/lm83.c:337 lm83_is_visible()
> 	warn: signedness bug returning '(-19)'
> 
> drivers/hwmon/lm83.c
>      300 static umode_t lm83_is_visible(const void *_data, enum hwmon_sensor_types type,
>      301                                u32 attr, int channel)
>      302 {
>      303         const struct lm83_data *data = _data;
>      304
>      305         /*
>      306          * LM82 only supports a single external channel, modeled as channel 2.
>      307          */
>      308         if (data->type == lm82 && (channel == 1 || channel == 3))
>      309                 return 0;
>      310
>      311         switch (type) {
>      312         case hwmon_chip:
>      313                 if (attr == hwmon_chip_alarms)
>      314                         return 0444;
>      315                 break;
>      316         case hwmon_temp:
>      317                 switch (attr) {
>      318                 case hwmon_temp_input:
>      319                 case hwmon_temp_max_alarm:
>      320                 case hwmon_temp_crit_alarm:
>      321                         return 0444;
>      322                 case hwmon_temp_fault:
>      323                         if (channel)
>      324                                 return 0444;
>      325                         break;
>      326                 case hwmon_temp_max:
>      327                         return 0644;
>      328                 case hwmon_temp_crit:
>      329                         if (channel == 2)
>      330                                 return 0644;
>      331                         return 0444;
>      332                 default:
>      333                         break;
>      334                 }
>      335                 break;
>      336         default:
> --> 337                 return -ENODEV;
> 
> return 0;?
> 

Oops, yes. Thanks for the note.

Guenter

>      338         }
>      339         return 0;
>      340 }
> 
> regards,
> dan carpenter

