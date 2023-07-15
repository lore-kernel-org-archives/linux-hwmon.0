Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8037AC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 14:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjGOOqq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 10:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjGOOqp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 10:46:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686A2E4A
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 07:46:44 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6689430d803so2105741b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689432404; x=1692024404;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXoT91T1J3dDoNx06U1caLQMoQD5udqdjB5ka8GKxVc=;
        b=geImWxncquE2mLZOXj3JkyqjY23l7SZoyvQpCWpPhkqZ2xnN5mstNwwNzDfItNx8vN
         jAd8vrj0mpRmpSJdAOnedSJKWwx9xac4PSLIbAlDYMrx+YijKeOQFW0GgWDkD5sjY0VS
         W5aKPNcriGWG47MuJ32IshSKfCSnUCiPlYijj3NS67+Bl+f85eUFhzo8B+WDypy6NuHI
         1OMkn4UnM0ot4N7gNXzYL7tmsn6g0YYHP59tqw8JKNM7wMdEyL8hbpWUfY2tQp/ZrByq
         GZv+TFynjmvgtMkr2UCBGeIyHEObx/CKdsb/KSDv7cDfmmMEBjdfDgtIiOqge3BvX27L
         6vJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689432404; x=1692024404;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXoT91T1J3dDoNx06U1caLQMoQD5udqdjB5ka8GKxVc=;
        b=bXfQTiGPKnP8sw4o8owGz3YfhMAivujrQRggcBrFgZlVHAbVMObM30QVB3xXNQRza7
         F0P5B9bS3OHCfr8kdv98uyGSkta8DJotiGutTxjZDNXAxsScyFh5t8dQGm2AedBS7LdU
         xmGa6zwKRwOoGLb88YQ5vN60UnLcNCNA6/j3VlbV2XIPPPY+tvAIlYZzFFZ2nRsuo6gO
         Uhl39Q/R5+xUM59IOpNoA1clDKty8DABmekMd0Wba8sr63Vae8Quz7+xMXcV111m43Dl
         G8pW2X+GD0/4sUp4ONmS3/d5kUfyZbEcoKKcj1grewZMlNk+i6mNOm9jCMayoWknVPHG
         lrZA==
X-Gm-Message-State: ABy/qLa0WZk+zNTdDQSzD2toxw1PiccRP/YaGeVytBqsr5gacUnxt/iA
        GE4YMQi7r7k4JKEpsBW0F6A=
X-Google-Smtp-Source: APBJJlGcGn8JaUH/h2u56UxDlioxT8DE5iLk+k13shokf1P/H27Ax7RLX7RZoQ9cLXYVMqk70OqPVA==
X-Received: by 2002:a05:6a00:3a2a:b0:668:74e9:8efb with SMTP id fj42-20020a056a003a2a00b0066874e98efbmr8119056pfb.8.1689432403686;
        Sat, 15 Jul 2023 07:46:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x7-20020a62fb07000000b0067ab572c72fsm8887386pfm.84.2023.07.15.07.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 07:46:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <15a2c16b-f1d4-6912-02ff-99ff8584c431@roeck-us.net>
Date:   Sat, 15 Jul 2023 07:46:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230715094452.36119-1-ruc_gongyuanjun@163.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/1] hwmon: check the return value of
 platform_get_resource()
In-Reply-To: <20230715094452.36119-1-ruc_gongyuanjun@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 02:44, Yuanjun Gong wrote:
> platform_get_resource() may fail, therefore, the return value
> of platform_get_resource should be checked to avoid null pointer
> dereference in devm_request_region().
> 

No, it can not, because the device was instantiated from
platform_create_bundle() which always creates the resource.

Guenter

> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>   drivers/hwmon/w83627ehf.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index fe960c0a624f..7793a4273e00 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -1703,6 +1703,8 @@ static int __init w83627ehf_probe(struct platform_device *pdev)
>   	struct device *hwmon_dev;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!res)
> +		return -EINVAL;
>   	if (!devm_request_region(dev, res->start, IOREGION_LENGTH, DRVNAME))
>   		return -EBUSY;
>   

