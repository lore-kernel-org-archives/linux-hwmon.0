Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D1EC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jan 2022 20:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiAOUdf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jan 2022 15:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbiAOUde (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jan 2022 15:33:34 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBBEC061574
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 12:33:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id br17so42256810lfb.6
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 12:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=af++m2llNqGdodZlQN0sYaRMAfK82rp/R4Aq1q9QuCA=;
        b=KRfNbsSTHd5OfARx7JsztPS+fu/XZnUeOCHXW4MMZtHLvijXCD4I5XTER7ilpFwmgF
         fuKlP6Ux+a4UwUGSKn9mgzor6yWbnEFc/pg4PIG4Zo75aVZVFpItvbrx/jl0bisd/e+C
         24akXMx6T7d1Imi6MCP/XV99sVNXywaEssEnpEy82Jim1hzmRaKwmMWo3XCYu9hWMLet
         VJl5/vC81V/BoJPiXdsC6lC7ttFd/+XkNX4tAN4jL9QjFHZAfG5uo0J4EHxAUE/L3xMC
         KBPIeufgSragp2KKiQAztbcADFjsB3IUxA8PeDwquMwtiq0pQ9mi/orTRew03z9w/pV5
         nSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=af++m2llNqGdodZlQN0sYaRMAfK82rp/R4Aq1q9QuCA=;
        b=FYCD2wJD4GYl80jE0gkW7DY6vdyRk4GiEqmSHNHUZXcDOxO84uM6VDGo/TKTstkHQG
         N+dX4LELk/QJoYgEbYcF2k+Mm8QD+OWBbYR9whKvkysz/PbEdg9vA0meExWwxE2/ceGo
         ZnOPzPO2fBem+7boLhU/smrFK8AT8siw5q6w6eNves5uBc2v9vnpRl6Dc+BNng9zO97I
         RtYFvbxwHycFMfOLtq8mN+L5IOumvfPuPNTHXADDgpAUBRe0vNDJQHW0CUc5KtUs71zW
         A1aF7jWotXj2vm8EHBry6t07oNJAoNk9zVl+zH90c5CdE9uG7ignfWZ/vZXQzwWQkwyl
         ifqw==
X-Gm-Message-State: AOAM5337GxhyfIdjkByHZaRroR4dyzhUENmBtpRaohkHC2Lw9Q+1do5Z
        XFQ7C1HyPVXGyLyesLNTwLIodvNwkBo=
X-Google-Smtp-Source: ABdhPJzhsxY5r5BX1nZBHbiMbXxodca8FDf0d6sE16DWyjxcO+tC598Ow/a9quskTClNz3JWZCFIAA==
X-Received: by 2002:a19:760d:: with SMTP id c13mr11076140lff.289.1642278812336;
        Sat, 15 Jan 2022 12:33:32 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id p6sm947384lfg.307.2022.01.15.12.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 12:33:31 -0800 (PST)
Subject: Re: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-7-linux@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e67010f7-6934-8d89-d8de-7d06793ddff3@gmail.com>
Date:   Sat, 15 Jan 2022 23:33:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111165116.1298459-7-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

11.01.2022 19:51, Guenter Roeck пишет:
> sysfs and udev notifications need to be sent to the _alarm
> attributes, not to the value attributes.
> 
> Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm90.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index ba01127c1deb..1c9493c70813 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
>  
>  	if (st & LM90_STATUS_LLOW)
>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> -				   hwmon_temp_min, 0);
> +				   hwmon_temp_min_alarm, 0);
>  	if (st & LM90_STATUS_RLOW)
>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> -				   hwmon_temp_min, 1);
> +				   hwmon_temp_min_alarm, 1);
>  	if (st2 & MAX6696_STATUS2_R2LOW)
>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> -				   hwmon_temp_min, 2);
> +				   hwmon_temp_min_alarm, 2);
>  	if (st & LM90_STATUS_LHIGH)
>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> -				   hwmon_temp_max, 0);
> +				   hwmon_temp_max_alarm, 0);
>  	if (st & LM90_STATUS_RHIGH)
>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> -				   hwmon_temp_max, 1);
> +				   hwmon_temp_max_alarm, 1);
>  	if (st2 & MAX6696_STATUS2_R2HIGH)
>  		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> -				   hwmon_temp_max, 2);
> +				   hwmon_temp_max_alarm, 2);


IIUC, "alarm" is about the T_CRIT output line. While these attributes
are about the ALERT line. Hence why "alert" notifications need to be
sent to the unrelated "alarm" attributes? This change doesn't look right.
