Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17208C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 16:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjGOQdq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGOQdp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 12:33:45 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA92103
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:33:45 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b9e9765f2cso17880135ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689438824; x=1692030824;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q0irYUzED7hPysi2TG95rjhp/kqpynQd4LY8EmKEe0=;
        b=Z1te0PD7u3Ix5HsLLZoDdCt67Migm8li7N9dweI1F+EPkaw/pft4i0ad2BEGaKDixA
         trBiAw+aZiyXbZBg1vB34zhGqCtQjwzNgONi6hxu0sthLcAQFxMd8o/g/bFQHZcuhNp4
         XoWrzRF/lB7LvpkecCwXkKzlqh82o+XupQXRUkz2gj12SQNmRyVxZbLi0f5K7ihbeuF5
         pjDnEgjiXE4h/xqimqdU5hqZboactYjOMa6Zgvhj9xKJY49oPCUMJ1Y1Gj9iFER4bckq
         BO4zkRdVli7aQBpHzIKPTkCL6aCa+gM6DQPdV28g8DZJwsP/fzEOO/z5LgnqN8vePNlT
         8TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689438824; x=1692030824;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Q0irYUzED7hPysi2TG95rjhp/kqpynQd4LY8EmKEe0=;
        b=NpJh3h2UN5jYiv8wmfPP4hLdNSvbNtuSgICgWZ2QrtDabW0R80n31Opg9OXdOMSxzb
         XFtwqIjqm9DpifRlxeSQZsJ6Dc/pupdnWH56Ce/8SwOIw91WIA0XPUu+yt2OSGGKuIak
         1BH509p4XJSzhGnmRJJG6PaB9m7Ew22dkz7t5ue/A8cafIDrmGt74W7f4iDVkO0J8i5W
         zHsNbJPcSRpvYT1eR9BYHGggEPCIAml6KNiiBNXL7Qh0lM6jGW4WtHWBSx9V4ZbhU2Xl
         pX3b3krMXHr83p0uq7qNkL51SfDDS1SVW6D8q/LKgDHzzLidV5HcsrifzaD4ulIPAu2Y
         AaAg==
X-Gm-Message-State: ABy/qLYCgfnM/1rqZukLOvKO9+aZDFCb9o+FMjYeaVdkT0D7vZm0t4A/
        Ebf3afk0zgUsd/SnwDcFR61ny78+/Ts=
X-Google-Smtp-Source: APBJJlH0fZnPC45SLIiyCP65qhIJqKBPcs2xMFk0vFu1JMqY62TJrdimvKwfxqB4KzmUpruFpNpehQ==
X-Received: by 2002:a17:903:32ca:b0:1b8:94e9:e7d2 with SMTP id i10-20020a17090332ca00b001b894e9e7d2mr6933062plr.0.1689438824350;
        Sat, 15 Jul 2023 09:33:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jh6-20020a170903328600b001b8b26fa6a9sm9749711plb.19.2023.07.15.09.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 09:33:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d1307352-7b13-6064-25e2-b7504f55569e@roeck-us.net>
Date:   Sat, 15 Jul 2023 09:33:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (nct6775) Flip Caseopen alarm as 1 is OK
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20230715153234.1307325-1-ahmad@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230715153234.1307325-1-ahmad@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 08:32, Ahmad Khalifa wrote:
> we flip intrusion alarms as nc6796d-s datasheet states:
> - CASEOPEN0_STS. CaseOpen Status.
>    * 1: Caseopen0 is detected and latched.
>    * 0: Caseopen0 is not latched.
> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
>   drivers/hwmon/nct6775-core.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 1006765d8483..b0435b0bb1ba 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1734,6 +1734,16 @@ nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>   		return PTR_ERR(data);
>   
>   	nr = data->ALARM_BITS[sattr->index];
> +
> +	/* nc6796d-s datasheet states: CASEOPEN0_STS. CaseOpen Status.
> +	 * 1: Caseopen0 is detected and latched.
> +	 * 0: Caseopen0 is not latched.
> +	 * so we flip intrusion alarms, 1 is OK
> +	 */
> +	if (data->kind == nct6799 && sattr->index >= INTRUSION_ALARM_BASE)
> +		return sprintf(buf, "%u\n",
> +		       (unsigned int)!((data->alarms >> nr) & 0x01));
> +

Ok, I am lost here. 1 means that case open is detected and latched. That
is no different to all other chips of the series. Why would you want
to return 0 (no alarm) in this case for nc6796d-s ?

Guenter

>   	return sprintf(buf, "%u\n",
>   		       (unsigned int)((data->alarms >> nr) & 0x01));
>   }
> 
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> prerequisite-patch-id: 36e3467bd9ea72cb3ad2bef638a8389a9537d111
> prerequisite-patch-id: 85db508f68cabb50472c0cc5ef3953fc46bee3b1
> prerequisite-patch-id: 1504eb67a66d80604d73cda09059629f102fc961

