Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A3DC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 18:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbiBUSvb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 13:51:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbiBUSuD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 13:50:03 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A16195
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 10:49:39 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id 1793F1F439B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645469377;
        bh=6ztFYaaL2BBqOqeyy8kujNy6tQkLluxFCGLm26clzmo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=UjBmxC7MSROtj9TE1IQ65ykvKvXwAsGRWOjmz7Essj74w8nmgoZrlZ0K8UxVVDG+O
         xvw6GTxJcgvpKnCcZis0Cz2xVqOPps275bTbIPMzr9K1LyiCctcoU0McnwxddEK84B
         RnC3m9CdhCGZwQKldC0fJMNhOljauG/zpnf0fcU/oKsGxd0IDSQRmvpkWdXVAgZ3ov
         to4Xlm9H4GiG1NPW0eYsSOIiTtKCUGqV9XXtuYYPEdynBHbdUyEAfivmoiXCJM9yun
         OaUF+vXvsqvHm875YXbcI+hEBlkmng/grg589GMta9XfWpg8SG2F06SGAD9QlLxKSg
         Q6v7//K4XoGow==
Message-ID: <b9c9f2e2-508d-e34c-c0a1-ec0b579ad3b6@collabora.com>
Date:   Mon, 21 Feb 2022 21:49:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] hwmon: Handle failure to register sensor with thermal
 zone correctly
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
References: <20220221182209.1795242-1-linux@roeck-us.net>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220221182209.1795242-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 2/21/22 21:22, Guenter Roeck wrote:
> If an attempt is made to a sensor with a thermal zone and it fails,
> the call to devm_thermal_zone_of_sensor_register() may return -ENODEV.
> This may result in crashes similar to the following.
> 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000003cd
> ...
> Internal error: Oops: 96000021 [#1] PREEMPT SMP
> ...
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : mutex_lock+0x18/0x60
> lr : thermal_zone_device_update+0x40/0x2e0
> sp : ffff800014c4fc60
> x29: ffff800014c4fc60 x28: ffff365ee3f6e000 x27: ffffdde218426790
> x26: ffff365ee3f6e000 x25: 0000000000000000 x24: ffff365ee3f6e000
> x23: ffffdde218426870 x22: ffff365ee3f6e000 x21: 00000000000003cd
> x20: ffff365ee8bf3308 x19: ffffffffffffffed x18: 0000000000000000
> x17: ffffdde21842689c x16: ffffdde1cb7a0b7c x15: 0000000000000040
> x14: ffffdde21a4889a0 x13: 0000000000000228 x12: 0000000000000000
> x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> x8 : 0000000001120000 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : 0068000878e20f07 x4 : 0000000000000000 x3 : 00000000000003cd
> x2 : ffff365ee3f6e000 x1 : 0000000000000000 x0 : 00000000000003cd
> Call trace:
>  mutex_lock+0x18/0x60
>  hwmon_notify_event+0xfc/0x110
>  0xffffdde1cb7a0a90
>  0xffffdde1cb7a0b7c
>  irq_thread_fn+0x2c/0xa0
>  irq_thread+0x134/0x240
>  kthread+0x178/0x190
>  ret_from_fork+0x10/0x20
> Code: d503201f d503201f d2800001 aa0103e4 (c8e47c02)
> 
> Jon Hunter reports that the exact call sequence is:
> 
> hwmon_notify_event()
>   --> hwmon_thermal_notify()
>     --> thermal_zone_device_update()
>       --> update_temperature()
>         --> mutex_lock()
> 
> The hwmon core needs to handle all errors returned from calls
> to devm_thermal_zone_of_sensor_register(). If the call fails
> with -ENODEV, report that the sensor was not attached to a
> thermal zone  but continue to register the hwmon device.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Fixes: 1597b374af222 ("hwmon: Add notification support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Use dev_info instead of dev_warn, and change message to be
>     less alarming.
> 
>  drivers/hwmon/hwmon.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 3501a3ead4ba..3ae961986fc3 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
>  
>  	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
>  						   &hwmon_thermal_ops);
> -	/*
> -	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
> -	 * so ignore that error but forward any other error.
> -	 */
> -	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
> -		return PTR_ERR(tzd);
> +	if (IS_ERR(tzd)) {
> +		if (PTR_ERR(tzd) != -ENODEV)
> +			return PTR_ERR(tzd);
> +		dev_info(dev, "temp%d_input not attached to any thermal zone\n",
> +			 index + 1);
> +		devm_kfree(dev, tdata);
> +		return 0;
> +	}
>  
>  	err = devm_add_action(dev, hwmon_thermal_remove_sensor, &tdata->node);
>  	if (err)

LGTM, thank you. But still needs a t-b from Jon.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
