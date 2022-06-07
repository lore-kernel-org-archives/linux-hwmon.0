Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77B5C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 12:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243027AbiFGMtn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236004AbiFGMtm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 08:49:42 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF3813EA2
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 05:49:41 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-f33f0f5b1dso22987567fac.8
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jun 2022 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IAPw0jlen8u5gj81utv+x23nQSoRGRydKWLbXCTnak8=;
        b=MA+v502kxckBZr1/r+1WZ8MvjADK5ASpqjffwvmsKoOOqsfT8sAc3/PXqVboVVcBdY
         rHDWdKGpr4/rzxLl/v/7UeeyPBO1p9fhFpAvjQ0Dg3IBzUZDNUI/brwnv3wPsWvsGAEd
         gGbURxEklBiDZupxtRxjX0YDN8RCIkvPDQlkaRH0QbAEESx5iuBzR7oXP9+21PJmcjLA
         ihM8L5HDsbup8veDW6e33O97LjIku9576rHeLV9apVlwYXaB4p65kTQz9cHLOnSAawmC
         mgnU7hRByEHd9Fbn/yQCRL3WOS6f++m0JuCHj3p1R4YrFpToueGsmB6m3Nse+Qfyebum
         bALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=IAPw0jlen8u5gj81utv+x23nQSoRGRydKWLbXCTnak8=;
        b=3l+420/Vcv+5JEjLGoT80duQ+aBRZdr6K/GgZedKkv506N+sjhYxXyMwcgcj3vUnk4
         JZ2+zvzM7JXL3kgPR4oFDlB8OVxm226r/W0V9GsMbkJ7eoRGFE1PSx3rHgY+4Jg9Al79
         NnnzO0aJqE9wVgy9uD3Zh6wsDv86r8tqqrN35mF4zXPZpaJD3ek7YhqgJFbkeMYSn9ID
         YZVAG86j6rnEG5SU7tCcGie+HzFT1cyXc7mXpNAWIl6zMWxnKCJRp2aC42NW24Jp0bwS
         z2zMXFD/gmsyuTO6lu/G98XpSbINWOcpZWqorC7YXzZsvGeBCrpoaG17EHqDhn7mgVbR
         hS5w==
X-Gm-Message-State: AOAM532OFmVgxoff5OLc7O3cFMES2RtE9QQ14uPQQCIW7pA/4VlTfRPH
        zTVbihl9Dnpx8+bNbLPKwyk=
X-Google-Smtp-Source: ABdhPJzRlsLKVjUq/MuuNjbQkkspMesxe4nrtL3mWSkpavXZmpXqdNIRLoQ6Kj/YcyzgJhubO2fhaw==
X-Received: by 2002:a05:6870:538a:b0:e2:602f:f6 with SMTP id h10-20020a056870538a00b000e2602f00f6mr16602882oan.214.1654606181211;
        Tue, 07 Jun 2022 05:49:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id lv21-20020a056871439500b000f28a948dd2sm7908778oab.21.2022.06.07.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:49:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Jun 2022 05:49:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        przemyslaw.cencner@nokia.com, krzysztof.adamski@nokia.com,
        alexander.sverdlin@nokia.com, slawomir.stepien@nokia.com
Subject: Re: [PATCH 2/2] hwmon: (lm90) Read the channel's temperature offset
 from device-tree
Message-ID: <20220607124939.GA1786850@roeck-us.net>
References: <20220607063504.1287855-1-sst@poczta.fm>
 <20220607063504.1287855-3-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607063504.1287855-3-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 07, 2022 at 08:35:04AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Try to read the channel's temperature offset from device-tree. Having
> offset in device-tree node is not mandatory. The offset can only be set
> for remote channels.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> Changes since v1:
> * Use the new function lm90_set_temp_offset.
> * Update the messages in dev_err() calls.
> 
>  drivers/hwmon/lm90.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index ec885cb3ab92..9d878163a1f2 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -2666,6 +2666,7 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
>  				      struct lm90_data *data)
>  {
>  	u32 id;
> +	s32 val;
>  	int err;
>  	struct device *dev = &client->dev;
>  
> @@ -2689,6 +2690,21 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
>  	if (data->channel_label[id])
>  		data->channel_config[id] |= HWMON_T_LABEL;
>  
> +	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
> +	if (!err) {
> +		if (id == 0) {
> +			dev_err(dev, "temperature-offset-millicelsius can't be set for internal channel\n");
> +			return -EINVAL;
> +		}
> +
> +		err = lm90_set_temp_offset(data, lm90_temp_offset_index[id], id, val);
> +		if (err) {
> +			dev_err(dev, "can't set temperature offset %d for channel %d (%d)\n",
> +				val, id, err);
> +			return err;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
