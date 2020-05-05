Return-Path: <SRS0=lHFq=6T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55109C3A5A9
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 01:54:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A656206C0
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 01:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9AfOVdY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgEEBym (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 21:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgEEBym (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 4 May 2020 21:54:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438B3C061A0F
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 18:54:41 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so136862plq.12
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=REBtKZB73ACwxwnFbFWxluN0Nf6GgxbYE78s/jtTHoQ=;
        b=O9AfOVdYQBIqnnqOPW66gsuwFrCrMMH6xsvKLDDMVQMGIKmYA1vYFrWq7iQW7Lc5JM
         VIY4WODk6MzOOzob95Gnio1oIbgizfFmAMlUPtTecsUQN0Au0HeLMm3uaBrjlnuQiwoH
         3rT3OrfY2cLuXgqdwbEJSHqanWsO9RPaXpsZLG+cDIbH4WGtnFKCpN+e0UBNG44bXsep
         OG+EhNR0qA1xBBFdrxxpiTSG1YRJssLWF7ZmFmXJoH9PQk/Bz9mPhJA0KDhS7zwnfGQ2
         RyWfmDrkuBuhN4e/C7tWJzq/xJbc8lu+vdvOBCYNxrXRkrQm4Hs8c0NjIiDd/qqMlne7
         eH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=REBtKZB73ACwxwnFbFWxluN0Nf6GgxbYE78s/jtTHoQ=;
        b=T+iBXB69o8zC5Mm/brCP4n+mvTdA6de+Zi1yM/kFrUCxmEAmHmNajvdkIScsEm7Z03
         3FQq9erz3bCVsnyBYlayTBz5+bUL3TZ6SNQy7pKJW3nOG/Nn5MuKHwri1LW4fIvLRwnb
         t8YpmyieRm7mGOFzwLBKBjH3Dq4ak68vnHWIDRpeKcJXEDPhLc1M6lEt5IU0rFbDBW5w
         2E6hTSlgI5cVwCqwy7IGHatxl10W8nVBAuCZeGD5khqhll5MupUN1bVMXLy4/XMGlo26
         pxts+Zl5ZRXenShUkrHutxNBFCFvRJGL/Nzsi1Ro3qkKFhGX5U5bWNFAWlfObhXaLzBn
         VB2A==
X-Gm-Message-State: AGi0Pua4LysWWzVTyMQewc9oYasPCRPvFCiEKSUjzoClVhNltiss42Xb
        +5lNnHDlKCzQZ7zpaiNT8B4=
X-Google-Smtp-Source: APiQypL4lSjaUzQKDw87F0oN13HjXzYTGdvbqhDgKAq8Ln96lhnqW3igps/hNV5qmyDwk03b4AngmQ==
X-Received: by 2002:a17:90a:3287:: with SMTP id l7mr27923pjb.126.1588643680618;
        Mon, 04 May 2020 18:54:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r12sm284384pgv.59.2020.05.04.18.54.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 18:54:40 -0700 (PDT)
Date:   Mon, 4 May 2020 18:54:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: Reduce indentation level in
 __hwmon_device_register()
Message-ID: <20200505015439.GA139472@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 04, 2020 at 11:57:44PM +0900, Akinobu Mita wrote:
> Reduce indentation level in __hwmon_device_register() by preparing a
> helper function.
> 
> This just improves code readability.  No functional change.
> 

Applied.

Guenter

> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  drivers/hwmon/hwmon.c | 68 ++++++++++++++++++++++++++-----------------
>  1 file changed, 42 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 6a30fb453f7a..dcd4445d4570 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -179,8 +179,40 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
>  
>  	return 0;
>  }
> +
> +static int hwmon_thermal_register_sensors(struct device *dev)
> +{
> +	struct hwmon_device *hwdev = to_hwmon_device(dev);
> +	const struct hwmon_chip_info *chip = hwdev->chip;
> +	const struct hwmon_channel_info **info = chip->info;
> +	void *drvdata = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 1; info[i]; i++) {
> +		int j;
> +
> +		if (info[i]->type != hwmon_temp)
> +			continue;
> +
> +		for (j = 0; info[i]->config[j]; j++) {
> +			int err;
> +
> +			if (!(info[i]->config[j] & HWMON_T_INPUT) ||
> +			    !chip->ops->is_visible(drvdata, hwmon_temp,
> +						   hwmon_temp_input, j))
> +				continue;
> +
> +			err = hwmon_thermal_add_sensor(dev, j);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  #else
> -static int hwmon_thermal_add_sensor(struct device *dev, int index)
> +static int hwmon_thermal_register_sensors(struct device *dev)
>  {
>  	return 0;
>  }
> @@ -596,7 +628,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>  {
>  	struct hwmon_device *hwdev;
>  	struct device *hdev;
> -	int i, j, err, id;
> +	int i, err, id;
>  
>  	/* Complain about invalid characters in hwmon name attribute */
>  	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
> @@ -664,30 +696,14 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>  	if (dev && dev->of_node && chip && chip->ops->read &&
>  	    chip->info[0]->type == hwmon_chip &&
>  	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
> -		const struct hwmon_channel_info **info = chip->info;
> -
> -		for (i = 1; info[i]; i++) {
> -			if (info[i]->type != hwmon_temp)
> -				continue;
> -
> -			for (j = 0; info[i]->config[j]; j++) {
> -				if (!chip->ops->is_visible(drvdata, hwmon_temp,
> -							   hwmon_temp_input, j))
> -					continue;
> -				if (info[i]->config[j] & HWMON_T_INPUT) {
> -					err = hwmon_thermal_add_sensor(hdev, j);
> -					if (err) {
> -						device_unregister(hdev);
> -						/*
> -						 * Don't worry about hwdev;
> -						 * hwmon_dev_release(), called
> -						 * from device_unregister(),
> -						 * will free it.
> -						 */
> -						goto ida_remove;
> -					}
> -				}
> -			}
> +		err = hwmon_thermal_register_sensors(hdev);
> +		if (err) {
> +			device_unregister(hdev);
> +			/*
> +			 * Don't worry about hwdev; hwmon_dev_release(), called
> +			 * from device_unregister(), will free it.
> +			 */
> +			goto ida_remove;
>  		}
>  	}
>  
> -- 
> 2.20.1
> 
