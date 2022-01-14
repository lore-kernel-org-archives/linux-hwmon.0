Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C47BC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 18:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236765AbiANSV7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 13:21:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiANSV6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 13:21:58 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9819CC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 10:21:58 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id i9so13306109oih.4
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H6HF0WjXUpBTQyCOFsbprqidjdxg5LgOmZp2nlbkO4Y=;
        b=GtI/DShsRZYrgENS6/IucJ5qfxM9pdPDGIP9Kv5JaLH4pFDuPyDhUBJxq/wJZoyHlu
         q5PL34VmPFnCnaU0KuEq85KQK2cY/W5tqsg39x+/OJMFw8YRpzDALEiraddHvA/g7VFX
         ZrJm+BYD6Zv3xQNIBDYruFacqog0VWXfyerILvSspyiJu+9KOjfQeceZDkYwymlkDoYH
         ats0UKpV9qE+/t5WDD85oHa5a31lpRZiQ4UZEK4ubqnLrPpPke0uO7DwBgGniZyOp9Kd
         d46h9SeTgEoMKQh0mnpEyR0zP7ZaTSTx07Kl9Bp41S/PXa41qLhdZHpQVpOqllHZH97b
         Fh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=H6HF0WjXUpBTQyCOFsbprqidjdxg5LgOmZp2nlbkO4Y=;
        b=Pk7JBlGeV8OOphtN3+dQ0LRiYhX0ERYQry1h3KyjjEI2/csCl4DJV0mxPfVKeYve9v
         upVgEe8Gyk3CvOzPoA3Qfz2+MjNWxyb3PZ2m3kSqCZI2TxwCGPFiwrX6wGORjs/GzUuY
         2NkQmmEpEqDlg1zeljqnjHXZA0zY243fjCmRpGTZ8Ta0OSl8XaOE8gYV7hCarTnO91Xg
         yTZaxT5ACNvfAwDUxvHi8HAiO1PsyjFp+NvZ57haeO7d7KFbgbTsw4Y/qI63uxY61iCt
         9DJY9t6M3krP8M7F/F4cx3dJOwAyVCPfad0OH43H/i4OWrrk9AyciwtiqvnxPSKO0RyU
         +uAg==
X-Gm-Message-State: AOAM532SB1FWwn9QZGqDsclAJoKj8MnLSXk8BY1cgVAW5AbER69s8MmD
        1oyswLdAncUS5Z9PHWefmmTs2ucUWnI=
X-Google-Smtp-Source: ABdhPJyvVLdhTIUssrsgfjaj9AzqUJRUpniFqdt1o4xSOVlXTiR3sECW5G4fvB89DxttZjSN+0HFzg==
X-Received: by 2002:a05:6808:238d:: with SMTP id bp13mr14314656oib.155.1642184517901;
        Fri, 14 Jan 2022 10:21:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 12sm2054377otu.9.2022.01.14.10.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:21:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 14 Jan 2022 10:21:55 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anthony DeRossi <ajderossi@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        pauk.denis@gmail.com, eugene.shalygin@gmail.com
Subject: Re: [PATCH] hwmon: (asus_wmi_ec_sensors) Support T_Sensor on Prime
 X570-Pro
Message-ID: <20220114182155.GA998098@roeck-us.net>
References: <20220111051842.25634-1-ajderossi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111051842.25634-1-ajderossi@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 10, 2022 at 09:18:42PM -0800, Anthony DeRossi wrote:
> Asus Prime X570-Pro motherboards have a T_Sensor header that can be
> connected to an optional temperature probe.
> 
> Signed-off-by: Anthony DeRossi <ajderossi@gmail.com>

Applied to hwmon-next.

Guenter

> ---
>  drivers/hwmon/asus_wmi_ec_sensors.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/asus_wmi_ec_sensors.c b/drivers/hwmon/asus_wmi_ec_sensors.c
> index 22a1459305a7..a3a2f014dec0 100644
> --- a/drivers/hwmon/asus_wmi_ec_sensors.c
> +++ b/drivers/hwmon/asus_wmi_ec_sensors.c
> @@ -112,7 +112,8 @@ struct asus_wmi_data {
>  /* boards with EC support */
>  static struct asus_wmi_data sensors_board_PW_X570_P = {
>  	.known_board_sensors = {
> -		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB, SENSOR_TEMP_VRM,
> +		SENSOR_TEMP_CHIPSET, SENSOR_TEMP_CPU, SENSOR_TEMP_MB,
> +		SENSOR_TEMP_T_SENSOR, SENSOR_TEMP_VRM,
>  		SENSOR_FAN_CHIPSET,
>  		SENSOR_MAX
>  	},
