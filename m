Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE5DC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 May 2022 02:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbiEUCgr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 22:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiEUCgq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 22:36:46 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9E318DAF2;
        Fri, 20 May 2022 19:36:45 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id h9-20020a056830400900b0060b03bfe792so138003ots.12;
        Fri, 20 May 2022 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=reZZ0bb4f0fiEQRudS7EGi/9c/yjc/nquLrq76GTTdE=;
        b=O5e8ihHeTS7QbJmHv/oE5oy27NuYXM8S2KXQhBLLPhqIx+gbP3S0V4m57/UyOXpqQI
         NHBPIZw5xAtWyimM+eThfUekKwKzZXVwD9V2DuST24KL42YUBv9LPQOrxW08Bzoxn3qH
         6w3Rez6mMDwZw92vqqOnR4jkXGZPQXr/4+2K0e9p0fedpUDI0OgHW9wUDsO2GdIl7xVu
         SLebsTmcfgEDc0NQ0UUJzDrwh3hAaZrAKyx5zOnwi+o5OhCNQxGin98+lpzjWu2qni6I
         7Cy+5AAtdKXdXNq7hMVu4ctEGB2TgWhAqLBT+7HGI2OOt0N1x2H7jmsCmlUukC+x0Mae
         JOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=reZZ0bb4f0fiEQRudS7EGi/9c/yjc/nquLrq76GTTdE=;
        b=vtQN6vte36Xo0wFJHnPFaDP/7F2RA/3uMdh6XLaSgKrcJ7CSGP5XgH/bxHtjQgUkOw
         0ehXBZbOm8eXMEcONt6VdLc34Ch91wBMuUt+WwxN3SMWR9b3Zhfnv7LAnGrTO3UtDps4
         6Y/Kj29UTARmNlkOvm1NPPJcBG+TRpBc/2OrOFHprX8OT4VsYlbVh4GHwReLWYe6G9R9
         k046TFmY8fdimzg2kTAeYh09RcEU0ZVdo/ew4Qp7tkA2shTZsGjnJUKLIqHC5oGEmeQY
         f34hvQ/calyNInioER4n5gg55k5cLilU9URXk8P4O88BbDMcHf3sidF6XUDnpEbjvFCT
         bW1A==
X-Gm-Message-State: AOAM533ey+l7KLwYVqj3XbzygMTuXEtviv8TN0WQ4dchu4AvhTST8MIm
        CJVA2pQ+HsIVJaDt2Dk+MdnsaUVcu3VLXA==
X-Google-Smtp-Source: ABdhPJwxFoawzOr/Mt4hI+cAJ7P4j/WtFSW9/+b2Runj1e72YvsOJt6acvBZkspb0KN8P1iSGUG3aQ==
X-Received: by 2002:a05:6830:1cc2:b0:606:e1ae:150c with SMTP id p2-20020a0568301cc200b00606e1ae150cmr5050087otg.222.1653100604450;
        Fri, 20 May 2022 19:36:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020aca4307000000b00325cda1ffa2sm1836418oia.33.2022.05.20.19.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 19:36:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 20 May 2022 19:36:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 5/8] hwmon: (lm90) define maximum number of channels that
 are supported
Message-ID: <20220521023642.GA2890194@roeck-us.net>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-6-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520093243.2523749-6-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 20, 2022 at 11:32:41AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> Use this define in all the places where literal '3' was used in this
> context.

The literal '3' does not always reflect the number of channels.

> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> ---
>  drivers/hwmon/lm90.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 00fd5734f217..f642c6fd1641 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -93,6 +93,9 @@
>  #include <linux/interrupt.h>
>  #include <linux/regulator/consumer.h>
>  
> +/* The maximum number of channels currently supported */
> +#define MAX_CHANNELS 3

#define<space>NAME<tab>value

> +
>  /*
>   * Addresses to scan
>   * Address is fully defined internally and cannot be changed except for
> @@ -521,9 +524,9 @@ enum lm90_temp11_reg_index {
>  struct lm90_data {
>  	struct i2c_client *client;
>  	struct device *hwmon_dev;
> -	u32 channel_config[4];
> +	u32 channel_config[MAX_CHANNELS + 1];
>  	struct hwmon_channel_info temp_info;
> -	const struct hwmon_channel_info *info[3];
> +	const struct hwmon_channel_info *info[MAX_CHANNELS];

This is wrong.

Guenter
