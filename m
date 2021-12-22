Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA16FC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 02:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbhLVC6k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhLVC6j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 21:58:39 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D99C061574
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Dec 2021 18:58:39 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id m6so1822581oim.2
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Dec 2021 18:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xKFBAGxLqF76kmIHgio3sY/aEZ/QWeiB0GsjDy6I9ZA=;
        b=NzKo4FDxCL/ijKUJ9hmZsm4TYQP+OYoaySHMTXn9xWMCU9ncCjmg4YeiI2fLP6djmM
         JiXeptaXghWhww5u+5t0CrNczaZ1FAuhE6B1rcB36Mo+9QczDo574uvVzEPSgBj9S9J+
         wMyLtiVAWdRyQ4JVmKHlJaxyrXytQ2JQQ58zu8eZAYs7r/nneY7Becb5+RFMxQ9KMqTl
         xwxcxdpgYf0yW1XfxvvfMiMWUOFWA1GiSRiGHjz+cwJFdiqu22K5TzFk0xnCDeXfYeIY
         3d2eWb32Ly99OsUzNtFS6zTxI8knNhb9llBvE8ke+HU70WhddonSNZnEdJpmbRi8t7Tj
         W8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xKFBAGxLqF76kmIHgio3sY/aEZ/QWeiB0GsjDy6I9ZA=;
        b=hJFmdn4RQHM/9DD/yAKPe6mS7oK50xPstum1+FtQVHOXemBoV8Eb0fUSJyqteYzrVh
         4tZ8/XPL+JC8LnfLUESmP4YLerTyB7hBIoRyk0+29akgUnjHI/3Qs92sXsrIohnKilCK
         sztry+xUYu2eMxEoj+AuUQkImBdCM2E+qJJGz+H4P559PZDpR5dwjwH+6SHPQCQrHbxq
         6b/2Kr4Q0gjci0g/Rzf0HKBG8aPZ/f1IGuY17qOWnUfCYrHJuB7JaN6sDQ8Of8ghDqMa
         OMTiIcnBX1e6Nl38s99j7ueOOup9oJ1aGBmyARw+irt8sWZVqE4jPeHPZKXWYZ7uB9ve
         UDSg==
X-Gm-Message-State: AOAM5312l5+VwiAOShaVckW3iWpOtN/+QeS/JVuyh6W1oC6tRc6o+qH1
        4tjjunBe37CpdUVDYWAo5+NwYXpRC0Q=
X-Google-Smtp-Source: ABdhPJycOzHw79AXysX1EWSoBQVBCMqwH+ekY7Q2uzqWE/QTZnO+hs7yfz8aeji3zJFt8A4dTsc01g==
X-Received: by 2002:a05:6808:699:: with SMTP id k25mr751740oig.135.1640141918074;
        Tue, 21 Dec 2021 18:58:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r3sm143902oti.51.2021.12.21.18.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 18:58:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/5] hwmon: (corsair-cpro) Use devres function
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20211222020114.3524736-1-liu.yun@linux.dev>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b2797eb5-e87a-918a-2232-8be943bcac69@roeck-us.net>
Date:   Tue, 21 Dec 2021 18:58:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222020114.3524736-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/21/21 6:01 PM, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> Use devm_hwmon_device_register_with_info() and remove hwmon_dev
> from ccp_device struct as it is not needed anymore.
> 
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>   drivers/hwmon/corsair-cpro.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index fa6aa4fc8b52..f476367ba6cf 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -76,7 +76,6 @@
>   
>   struct ccp_device {
>   	struct hid_device *hdev;
> -	struct device *hwmon_dev;
>   	struct completion wait_input_report;
>   	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
>   	u8 *buffer;
> @@ -486,6 +485,7 @@ static int get_temp_cnct(struct ccp_device *ccp)
>   static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
>   	struct ccp_device *ccp;
> +	struct device *hwmon_dev;
>   	int ret;
>   
>   	ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
> @@ -523,12 +523,12 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	ret = get_fan_cnct(ccp);
>   	if (ret)
>   		goto out_hw_close;
> -	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
> -							 ccp, &ccp_chip_info, 0);
> -	if (IS_ERR(ccp->hwmon_dev)) {
> -		ret = PTR_ERR(ccp->hwmon_dev);
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
> +						     ccp, &ccp_chip_info, 0);
> +	ret = PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (ret)
>   		goto out_hw_close;
> -	}
>   
>   	return 0;
>   
> @@ -541,9 +541,6 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   
>   static void ccp_remove(struct hid_device *hdev)
>   {
> -	struct ccp_device *ccp = hid_get_drvdata(hdev);
> -
> -	hwmon_device_unregister(ccp->hwmon_dev);
>   	hid_hw_close(hdev);
>   	hid_hw_stop(hdev);

The point is that the above two functions need to be called _after_ the hwmon device
was removed. This patch changes the order and removes the hwmon device after the hid
functions have been removed.

If you think this is valid you'll need to explain in detail why removal order
does not matter. Otherwise this patch deserves a NACK.

Guenter


