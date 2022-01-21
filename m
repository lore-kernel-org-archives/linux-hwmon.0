Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962E7C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 06:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343643AbiAUGKw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 01:10:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiAUGKv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 01:10:51 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E7DC061574;
        Thu, 20 Jan 2022 22:10:50 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id bb37so12299326oib.1;
        Thu, 20 Jan 2022 22:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bmUE+UAQIq+lnb6V2xHfUxeS+ieLP/9MF+Hgg+E9Fyc=;
        b=Xj5wzCwmwUATpzv3n6ufzmVBKZza6qceqGmOAHU+Bf2s1zmgM3cnbnGy66OrsaFk9b
         tJYH91S0evYHSwdIuP0+Rwrde8V7LYUYGOpP7BvuYg9HPT1g2ZC6ec7RhVisqjB0YoSD
         YUVSf+sf5QqfbbOIOmbLwc9kKsdyMrRMKbekWfrEIGGKOqnII1JdkfFKYKTM7zYYThWt
         OMr8UoDeeRFnbEoloCLsL1NZSpHQfKP1genC084Pg2znId59DMKtPKZ0qK0LLJvychx8
         hUf0cfxjN68Iew9Wf6kNWfQSDd9QsBu2ECNcaYiguLc9q8tEtc4+P4pqzvSMlOPDy+/P
         3ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bmUE+UAQIq+lnb6V2xHfUxeS+ieLP/9MF+Hgg+E9Fyc=;
        b=2NrbNis0NSd7D/2UnCNBX9FrgfwRphY3rw/lXALKp2Wu9CMkEnIUi6eVXn6O18CRfM
         nkcgps2y9sg8O1/Gtl/V6zTT7hdfYIkFftvkvTdpLi/SclTmWnulO/iObJDS87DRLL2h
         WTtjauBkpEnJXlQBayG6tIW/YtXz12wxAqRGCE7crV1nmEQaDeG9cU/a9b+3pQUr+ils
         K4cQ0MTlsr49s+PZJIw9uDAFlDSpelzeFq0A1uXgpuVtBEFCRCYIRu5kR16DaJ/FFdr5
         Gg74CKWDoj8Hji7OugqA4aYW7p1Hz9gpS4V5o7y9g3Y/wHQr8KtPPn+okSy1Fh71/xaQ
         aatw==
X-Gm-Message-State: AOAM531YmS9EZf9yW1rDZjo5TUFNYh8tJ1CcZw3dYxUxQOfVAI8QwGVm
        UJNLMvVxKDhJ2ZBvfAMWLKNPWRpzxXY=
X-Google-Smtp-Source: ABdhPJzjiYgdgGlYyUo+gfDNJI/1obruFIxvXLHdfMKoU1t2Q4HZy5NZIm2ZJEVgdikllJMUY0lXhQ==
X-Received: by 2002:a05:6808:1405:: with SMTP id w5mr2012092oiv.50.1642745448555;
        Thu, 20 Jan 2022 22:10:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l14sm607305otr.17.2022.01.20.22.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 22:10:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20220121053917.GB27293@kili>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (adt7470) Prevent divide by zero in
 adt7470_fan_write()
Message-ID: <4ef54638-1b51-2507-1e45-ff9050c3711e@roeck-us.net>
Date:   Thu, 20 Jan 2022 22:10:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220121053917.GB27293@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/20/22 9:39 PM, Dan Carpenter wrote:
> The "val" variable is controlled by the user and comes from
> hwmon_attr_store().  The FAN_RPM_TO_PERIOD() macro divides by "val"
> so a zero will crash the system.  Check for that and return -EINVAL.
> 
> Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/hwmon/adt7470.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index d519aca4a9d6..cd474584dc0b 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -662,6 +662,9 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
>   	struct adt7470_data *data = dev_get_drvdata(dev);
>   	int err;
>   
> +	if (!val)
> +		return -EINVAL;
> +

Technically that restores old (pre-fc958a61ff6d) behavior, but it is still bad:
Userspace can provide a value of -1 (or any other negative number), and it will
translate to 5400000 RPM. So it should either be

	if (val <= 0)
		return -EINVAL;

or
	if (val <= 0)
		val = 1;

Thanks,
Guenter
