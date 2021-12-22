Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97839C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 03:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242021AbhLVDDf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 22:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235520AbhLVDDe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 22:03:34 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D40C061574
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Dec 2021 19:03:34 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so1003970otl.8
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Dec 2021 19:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iT05ESXCh+8qT8cKQL6Th9Dk2HtIAzCEJDojo/AoqHc=;
        b=Yl/dudDTT2LDoBEXN5Ytm/ymZA0zIwLwytjNgKOvGr3ctVTqIwt2csQ0FdxOnfjxUy
         W/eWMN87+gR3irizi9/LuG2RQGm+r+iZrttcGSHbg5eczQrBnUTxWGMTW12wS29Y/AVt
         XQiB3I4c5aUHB0wupJl8BRELk543Y96f9+Q89NJ7gaFeSBFGyRC5B4kgylr/789ifNog
         rFzpH0CM3wzT4VcN4uKly8MO/finP4SUundMd4ErnHWwKK8KpBSr9g/CNY3gZHL50j7G
         8u1jFNvnCe0xeYgeaQAHowLrgCySConl34EnVp2nDv1P1CcbTg1Oaha+u9FK+poZRqXk
         Icuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iT05ESXCh+8qT8cKQL6Th9Dk2HtIAzCEJDojo/AoqHc=;
        b=ZGbl73h1WDBiHSkEYwsWXF/znBizlbbjwjVSGi9SDMedZpOkgqeFC/l/WP01zPRiLM
         FJ5Y8GMoQ0NGUEFn482nzCSf0vTbSuXtOqXX+aRQ1HM0IgQ1OJlB7iXpd9Xg7wLyBzIj
         uAhzNBDAym/Nt344lINCbI/8uAERpDJCnh2FkdTWjkWvod9ijixZUwJf5wAOk38vHTKf
         WjviJ9oA4C37EN3/J77x4a2iIruA2rZVtfRZXwOb+HndI/czdvDjpy/jDmO6pYWCbD72
         57CIt3ONrD+22yncm8p8Hd5aU1Ug7INYqUkwdvFYawkwv+6vzwukP5KnIRkazaKgUnCK
         01Rw==
X-Gm-Message-State: AOAM531qwhG+84CCxtvZRslNKZKXHCz8hyom4QICTnSMEl3u1PoZhuKz
        ES8buexkGeNyjRycEo9ElwobIl66owg=
X-Google-Smtp-Source: ABdhPJyibOXLJoCaffiquJbN8vOZMYPrplrChwa6smOob9fD5l6PN28KOq7sCW6vP5zjKFokUfHVOg==
X-Received: by 2002:a05:6830:2:: with SMTP id c2mr815457otp.341.1640142213564;
        Tue, 21 Dec 2021 19:03:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 184sm166268oih.58.2021.12.21.19.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 19:03:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 5/5] hwmon: (drivetemp) Use devres function
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20211222020114.3524736-1-liu.yun@linux.dev>
 <20211222020114.3524736-5-liu.yun@linux.dev>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2b3dc236-ef80-6e89-11e0-e70141d6ff24@roeck-us.net>
Date:   Tue, 21 Dec 2021 19:03:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222020114.3524736-5-liu.yun@linux.dev>
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
> from drivetemp_data struct as it is not needed anymore.
> 
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>   drivers/hwmon/drivetemp.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
> index 1eb37106a220..1a5a62288c0a 100644
> --- a/drivers/hwmon/drivetemp.c
> +++ b/drivers/hwmon/drivetemp.c
> @@ -113,7 +113,6 @@ struct drivetemp_data {
>   	struct mutex lock;		/* protect data buffer accesses */
>   	struct scsi_device *sdev;	/* SCSI device */
>   	struct device *dev;		/* instantiating device */
> -	struct device *hwdev;		/* hardware monitoring device */
>   	u8 smartdata[ATA_SECT_SIZE];	/* local buffer */
>   	int (*get_temp)(struct drivetemp_data *st, u32 attr, long *val);
>   	bool have_temp_lowest;		/* lowest temp in SCT status */
> @@ -555,6 +554,7 @@ static int drivetemp_add(struct device *dev, struct class_interface *intf)
>   {
>   	struct scsi_device *sdev = to_scsi_device(dev->parent);
>   	struct drivetemp_data *st;
> +	struct device *hwmon_dev;
>   	int err;
>   
>   	st = kzalloc(sizeof(*st), GFP_KERNEL);
> @@ -570,13 +570,13 @@ static int drivetemp_add(struct device *dev, struct class_interface *intf)
>   		goto abort;
>   	}
>   
> -	st->hwdev = hwmon_device_register_with_info(dev->parent, "drivetemp",
> -						    st, &drivetemp_chip_info,
> -						    NULL);
> -	if (IS_ERR(st->hwdev)) {
> -		err = PTR_ERR(st->hwdev);
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_info(dev->parent, "drivetemp",
> +						     st, &drivetemp_chip_info,
> +						     NULL);
> +	err = PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (err)
>   		goto abort;
> -	}
>   
>   	list_add(&st->list, &drivetemp_devlist);
>   	return 0;
> @@ -593,7 +593,6 @@ static void drivetemp_remove(struct device *dev, struct class_interface *intf)
>   	list_for_each_entry_safe(st, tmp, &drivetemp_devlist, list) {
>   		if (st->dev == dev) {
>   			list_del(&st->list);
> -			hwmon_device_unregister(st->hwdev);
>   			kfree(st);
>   			break;
>   		}
> 

With this change in place, hwmon devices are removed _after_ struct drivetemp_data
is released, which means that there is a race condition where hwmon access is still
possible and uses a released data structure. Besides, it is not well defined if
the lifetime of the hwmon device matches the lifetime of the parent device. I don't
think you know what you are doing, sorry, and I am not even going to look into the
other patches of this series.

Guenter
