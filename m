Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB18C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8A4F6103B
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245240AbhIXMGj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244854AbhIXMGi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:06:38 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE91EC061574;
        Fri, 24 Sep 2021 05:05:05 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so12863673otx.3;
        Fri, 24 Sep 2021 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KTNvo2NdVXJ8RYqiPChVUPh+6+QMgCZl/OPc8G3+r+M=;
        b=pOuzplGH1UebXGKaqbRVizrKfvvsH2H3DtpqVqXN7GY6fI0O/qfByuCl5TegnqOvEY
         gTDUbDwFxttybN7Ley4oBCLW/TCxqlovl8MbOK+oQM9MB987yq3SfOQM7w5FmsPwJ+2Z
         hwAtcKzDKruldZjRz2RrlSTAXaVPStvEW2YColwrzaYFSHy/JMnxUeyRAT8G3W1xr8U/
         TevSGPW8BDAN8YqBfnO3I9L5ALSpM0zptNI3pF12CvzI5eOlCOpznXbJV/YI6tKZZ/xV
         hT9eugmi6xgduiuKIXO2nBpVnoFKmUZWAk5HnYuW2dITdYPECdy3MrlsNyHjSMbUGfBL
         ah4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KTNvo2NdVXJ8RYqiPChVUPh+6+QMgCZl/OPc8G3+r+M=;
        b=B29eZx7UJHgzzkqUjz8S/Wud331wZCkB7GRR4ccuq9Sr+AWlC8rRyyrEkePymq5rvw
         W+ahaSaMArKZ58QYC11o17OOco9muMokxHlH5b2VQh79VnQpmpwAHWQPUrakTyZDsgQc
         blRAdR8KiKzDE5pqxv9KyaswRmsWifiGve6EROiFZsKHTVe3eXfaxWlDx19SBz6jk25C
         2xufGxAFTpiwOJuj125BZHYKEjlDD38n7cjMfD+Sdtrp1QDJe3dBGYQB/ETiqQzTl50S
         C3E5KROoZDCc6rPTqdulWWpOv/Wui5fCLPL7bwcm/BYEyh1VoSYxy/y8h9rpag/gCUPE
         YBMg==
X-Gm-Message-State: AOAM531GugAFtkzgnglTyJqQtjCWfdHE8bCwFsdwEXsvQpBAWSUjzKpp
        9pybX9YWPRM+rg9NG/iIvT8=
X-Google-Smtp-Source: ABdhPJzwmE2sy8QgRbLaC3bmRdP5T7F787v0KP2GlgouUSUscZWsFkad64d9yUqbzRKL6kDVlO5utA==
X-Received: by 2002:a9d:6143:: with SMTP id c3mr3598235otk.124.1632485105326;
        Fri, 24 Sep 2021 05:05:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f17sm2171229ook.9.2021.09.24.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:05:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 24 Sep 2021 05:05:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: Re: [PATCH v2 02/10] hwmon: (tmp421) introduce MAX_CHANNELS define
Message-ID: <20210924120503.GA2696341@roeck-us.net>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
 <abc1a213a25b890b799b35ad94bb543a2ade7fc8.1632473318.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abc1a213a25b890b799b35ad94bb543a2ade7fc8.1632473318.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 24, 2021 at 11:39:06AM +0200, Krzysztof Adamski wrote:
> There are few places where the maximal number of channels is used define
> the size of arrays but when raw number is used it is not clear that they
> really related to this quantity.
> This commit introduces MAX_CHANNELS define and uses it those places to
> give some context to the number.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to hwmon-next, no need to resend.

Thanks,
Guenter

> ---
>  drivers/hwmon/tmp421.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index ede66ea6a730..2c9ba5fe5f2a 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -29,6 +29,7 @@ static const unsigned short normal_i2c[] = { 0x2a, 0x4c, 0x4d, 0x4e, 0x4f,
>  
>  enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>  
> +#define MAX_CHANNELS				4
>  /* The TMP421 registers */
>  #define TMP421_STATUS_REG			0x08
>  #define TMP421_CONFIG_REG_1			0x09
> @@ -36,8 +37,8 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>  #define TMP421_MANUFACTURER_ID_REG		0xFE
>  #define TMP421_DEVICE_ID_REG			0xFF
>  
> -static const u8 TMP421_TEMP_MSB[4]		= { 0x00, 0x01, 0x02, 0x03 };
> -static const u8 TMP421_TEMP_LSB[4]		= { 0x10, 0x11, 0x12, 0x13 };
> +static const u8 TMP421_TEMP_MSB[MAX_CHANNELS]	= { 0x00, 0x01, 0x02, 0x03 };
> +static const u8 TMP421_TEMP_LSB[MAX_CHANNELS]	= { 0x10, 0x11, 0x12, 0x13 };
>  
>  /* Flags */
>  #define TMP421_CONFIG_SHUTDOWN			0x40
> @@ -89,7 +90,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
>  struct tmp421_data {
>  	struct i2c_client *client;
>  	struct mutex update_lock;
> -	u32 temp_config[5];
> +	u32 temp_config[MAX_CHANNELS + 1];
>  	struct hwmon_channel_info temp_info;
>  	const struct hwmon_channel_info *info[2];
>  	struct hwmon_chip_info chip;
> @@ -97,7 +98,7 @@ struct tmp421_data {
>  	unsigned long last_updated;
>  	unsigned long channels;
>  	u8 config;
> -	s16 temp[4];
> +	s16 temp[MAX_CHANNELS];
>  };
>  
>  static int temp_from_s16(s16 reg)
