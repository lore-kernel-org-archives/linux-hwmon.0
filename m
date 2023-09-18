Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE657C46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjIRJsB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240944AbjIRJr4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F311512D
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695030418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6PdvI81FM7rnedloFyyd8Gs6jQOT70iIoyfg1ht/iLs=;
        b=buG4EtROSikw5lOWoDwBM7pOGCAfgWpdR3WDFJxetnvkeyrRwpc/3idMMy9WkXDWr+TXGc
        iU/WfAC2J2C06Hq8BTKmNG6e3IYMBehzGhra0gS8D2WUQ7b3XfVP/rNqzCwu5DKcScbLmi
        Fe+zQX3ZUCgIDlYOfMKhxHOgLECbQj8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-nL0LBEl0NoW6Fghup5BZEQ-1; Mon, 18 Sep 2023 05:46:55 -0400
X-MC-Unique: nL0LBEl0NoW6Fghup5BZEQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c00cfa81b0so7622251fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695030414; x=1695635214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6PdvI81FM7rnedloFyyd8Gs6jQOT70iIoyfg1ht/iLs=;
        b=afBmrKNCcoaIGHW+NDEBckKv6ckUGG4NBhznWxSnVcpiq1WPS2R9jfJCwhuGBBxNlT
         JbH3syhKzz6qq3qpfUDtvG7Fi8YSvX84cSAGd3cDQdpWfMwIVSw3hE7OezzL560RTw/7
         1dSb03Jzdnktatn9CVSENsq9fc2zJ4xBphpuTUZ70wv8dMMOGGXMFS4kpMICCaVzU1Lo
         qkBskFl+2+6defEqOpa1wazTq9Z7uPhEFkik9TiEipYobTLps+piWWv41qxj5mJA3Bwg
         K3KcGJtcvWW0/I6lyj8L/3OaUfUgNKZkoxZm5Ay8xJvFW8tgH2leqB24ClAxOPCveFfa
         Spxw==
X-Gm-Message-State: AOJu0Yy0JV0ahOv40tWsQ3Pv355yCE7K9PmBU0vuzTwLpoJX1Px+oKXU
        di3RZ1WCDvgXECoHL//OjPQzjzlf3u/8opf2yfrLkiyaZHYsNh2VUBspOmfKDsHwHpDSSBp+cU/
        sll3vovi8ahlbBio43IeNirA=
X-Received: by 2002:a05:6512:3f08:b0:500:771f:4887 with SMTP id y8-20020a0565123f0800b00500771f4887mr7692484lfa.55.1695030414454;
        Mon, 18 Sep 2023 02:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6pvthVDZSgmvVW7Jd1Z4SEL0u1YD0P1ADXOSss7VpPVXNYOHFZ0dLup8IU+69yrPDxu/CTg==
X-Received: by 2002:a05:6512:3f08:b0:500:771f:4887 with SMTP id y8-20020a0565123f0800b00500771f4887mr7692472lfa.55.1695030414155;
        Mon, 18 Sep 2023 02:46:54 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lj23-20020a170906f9d700b009930c80b87csm6289687ejb.142.2023.09.18.02.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 02:46:53 -0700 (PDT)
Message-ID: <e151e739-7e09-5fee-fd25-2d686ddf6cfa@redhat.com>
Date:   Mon, 18 Sep 2023 11:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/24] hwmon: (abituguru) Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
 <20230918085951.1234172-3-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230918085951.1234172-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 9/18/23 10:59, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/hwmon/abituguru.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
> index a7cae6568155..93653ea05430 100644
> --- a/drivers/hwmon/abituguru.c
> +++ b/drivers/hwmon/abituguru.c
> @@ -1428,7 +1428,7 @@ static int abituguru_probe(struct platform_device *pdev)
>  	return res;
>  }
>  
> -static int abituguru_remove(struct platform_device *pdev)
> +static void abituguru_remove(struct platform_device *pdev)
>  {
>  	int i;
>  	struct abituguru_data *data = platform_get_drvdata(pdev);
> @@ -1439,8 +1439,6 @@ static int abituguru_remove(struct platform_device *pdev)
>  	for (i = 0; i < ARRAY_SIZE(abituguru_sysfs_attr); i++)
>  		device_remove_file(&pdev->dev,
>  			&abituguru_sysfs_attr[i].dev_attr);
> -
> -	return 0;
>  }
>  
>  static struct abituguru_data *abituguru_update_device(struct device *dev)
> @@ -1533,7 +1531,7 @@ static struct platform_driver abituguru_driver = {
>  		.pm	= pm_sleep_ptr(&abituguru_pm),
>  	},
>  	.probe		= abituguru_probe,
> -	.remove		= abituguru_remove,
> +	.remove_new	= abituguru_remove,
>  };
>  
>  static int __init abituguru_detect(void)

