Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D274C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Feb 2022 02:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236665AbiBYCHw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Feb 2022 21:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236585AbiBYCHv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Feb 2022 21:07:51 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1954AC935;
        Thu, 24 Feb 2022 18:07:19 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id l25so5850539oic.13;
        Thu, 24 Feb 2022 18:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZkxPoQG2p6gIQGus1/F5qc+ezeB5slwiUAnLZL3G+Ug=;
        b=eCp7FJtI/dGf0hkSGZmnzsap3rhJZVFY7wNp5N8m6VLiVuGPmLsdo+QU7D+nBAre7a
         1rNOtDkUAt8lkXgzp3dJfJCWiNJs9+UPxpr67YLvYwZhAoQTfr9O/VGs9/OsJ45bCYKF
         Q2F++4a5c5GuQTnHIOrCdvNsB79Db1KeQVsDI1YTI68EYlVsiyqm8mfFLKJyvnNci/v/
         Bp8R8uy4QkgnycAMHU8t7yhzP2AS8gGHcLIVhu9FDeJECEqMJzqDc5503I9AvTZAqj/h
         d8XBsfB2G7b7JkZYoj01JnyE9CiT+26JYYAiPVFpWK6JgJEq+QXHyPu5dQaAJ5wwrQBS
         JnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZkxPoQG2p6gIQGus1/F5qc+ezeB5slwiUAnLZL3G+Ug=;
        b=2PCt6BuSLzRa0+nBYj45J+lEQ/n844p7XmQ/F9cnRLfIV0LkwPPF3XifOkhRf14tte
         UHiLHQYCLqiZaKJ8+p3VbcfjVG4AOG1jP7QHgVNrVu6BtpPDcBsBxU7Gxv+rqqbLMPAC
         2dQKiMaNuKfHlgFfFx6a92vZHdakY9J7rbSX3x/JdJSDP1ciTHy3TmtntFV5dIhldDLb
         DYAWnC+ZakIM/mlPEh+bvUcOvS+VocimOkrX45VWI1wNsj0ESeD3OnCQGs7mUdnU+YGN
         RUN5WbU02Wx7SMPB35ZwwQ9iB93Fb3MtRrwkKgRPqDWso1DlS9Bk78q5M6cSIQyG5Br4
         1uWg==
X-Gm-Message-State: AOAM5311BUzrjHAhf+yQtcBVLT040TP5SuVa0Rc3SY3D+pQdMicpSOIp
        MzDaWCg85Z6vLWVJ8dfkFR8=
X-Google-Smtp-Source: ABdhPJyO4mn5uPj5gsPfmwJKT/m5KAupLmYp29S338IS7trEGRAo80D+hAEYtOwomfYP1iCUqGZbyg==
X-Received: by 2002:a05:6808:300b:b0:2d4:6574:2d19 with SMTP id ay11-20020a056808300b00b002d465742d19mr521893oib.92.1645754839124;
        Thu, 24 Feb 2022 18:07:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r41-20020a056870582900b000d6cbaf589esm735803oap.40.2022.02.24.18.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 18:07:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Feb 2022 18:07:17 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: (lm70) Add ti,tmp125 support
Message-ID: <20220225020717.GA1975769@roeck-us.net>
References: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
 <43b19cbd4e7f51e9509e561b02b5d8d0e7079fac.1645175187.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43b19cbd4e7f51e9509e561b02b5d8d0e7079fac.1645175187.git.chunkeey@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Feb 18, 2022 at 10:06:43AM +0100, Christian Lamparter wrote:
> The TMP125 is a 2 degree Celsius accurate Digital
> Temperature Sensor with a SPI interface.
> 
> The temperature register is a 16-bit, read-only register.
> The MSB (Bit 15) is a leading zero and never set. Bits 14
> to 5 are the 1+9 temperature data bits in a two's
> complement format. Bits 4 to 0 are useless copies of
> Bit 5 value and therefore ignored.
> 
> This was tested on a Aerohive HiveAP-350.
> 
> Bonus: lm70 supports TMP122/TMP124 as well.
> I added them to the Kconfig module description.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v1 -> v2: - spelling fixes + nicer (IMHO) texts (Roeck)
> 	  - added entry to Documentation/hwmon/lm70.rst (Roeck)
> ---
>  Documentation/hwmon/lm70.rst |  7 +++++++
>  drivers/hwmon/Kconfig        |  4 ++--
>  drivers/hwmon/lm70.c         | 16 ++++++++++++++++
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm70.rst b/Documentation/hwmon/lm70.rst
> index 6ddc5b67ccb5..11303a7e16a8 100644
> --- a/Documentation/hwmon/lm70.rst
> +++ b/Documentation/hwmon/lm70.rst
> @@ -15,6 +15,10 @@ Supported chips:
>  
>      Information: https://www.ti.com/product/tmp122
>  
> +  * Texas Instruments TMP125
> +
> +    Information: https://www.ti.com/product/tmp125
> +
>    * National Semiconductor LM71
>  
>      Datasheet: https://www.ti.com/product/LM71
> @@ -53,6 +57,9 @@ The LM74 and TMP121/TMP122/TMP123/TMP124 are very similar; main difference is
>  
>  The TMP122/TMP124 also feature configurable temperature thresholds.
>  
> +The TMP125 is less accurate and provides 10-bit temperature data
> +with 0.25 degrees Celsius resolution.
> +
>  The LM71 is also very similar; main difference is 14-bit temperature
>  data (0.03125 degrees celsius resolution).
>  
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8df25f1079ba..94a47e70533f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1208,8 +1208,8 @@ config SENSORS_LM70
>  	depends on SPI_MASTER
>  	help
>  	  If you say yes here you get support for the National Semiconductor
> -	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123 digital tempera-
> -	  ture sensor chips.
> +	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123, TMP122/TMP124,
> +	  TMP125 digital temperature sensor chips.
>  
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lm70.
> diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
> index d2a60de5b8de..c20a749fc7f2 100644
> --- a/drivers/hwmon/lm70.c
> +++ b/drivers/hwmon/lm70.c
> @@ -34,6 +34,7 @@
>  #define LM70_CHIP_LM71		2	/* NS LM71 */
>  #define LM70_CHIP_LM74		3	/* NS LM74 */
>  #define LM70_CHIP_TMP122	4	/* TI TMP122/TMP124 */
> +#define LM70_CHIP_TMP125	5	/* TI TMP125 */
>  
>  struct lm70 {
>  	struct spi_device *spi;
> @@ -87,6 +88,12 @@ static ssize_t temp1_input_show(struct device *dev,
>  	 * LM71:
>  	 * 14 bits of 2's complement data, discard LSB 2 bits,
>  	 * resolution 0.0312 degrees celsius.
> +	 *
> +	 * TMP125:
> +	 * MSB/D15 is a leading zero. D14 is the sign-bit. This is
> +	 * followed by 9 temperature bits (D13..D5) in 2's complement
> +	 * data format with a resolution of 0.25 degrees celsius per unit.
> +	 * LSB 5 bits (D4..D0) share the same value as D5 and get discarded.
>  	 */
>  	switch (p_lm70->chip) {
>  	case LM70_CHIP_LM70:
> @@ -102,6 +109,10 @@ static ssize_t temp1_input_show(struct device *dev,
>  	case LM70_CHIP_LM71:
>  		val = ((int)raw / 4) * 3125 / 100;
>  		break;
> +
> +	case LM70_CHIP_TMP125:
> +		val = (sign_extend32(raw, 14) / 32) * 250;
> +		break;
>  	}
>  
>  	status = sprintf(buf, "%d\n", val); /* millidegrees Celsius */
> @@ -135,6 +146,10 @@ static const struct of_device_id lm70_of_ids[] = {
>  		.compatible = "ti,tmp122",
>  		.data = (void *) LM70_CHIP_TMP122,
>  	},
> +	{
> +		.compatible = "ti,tmp125",
> +		.data = (void *) LM70_CHIP_TMP125,
> +	},
>  	{
>  		.compatible = "ti,lm71",
>  		.data = (void *) LM70_CHIP_LM71,
> @@ -184,6 +199,7 @@ static const struct spi_device_id lm70_ids[] = {
>  	{ "lm70",   LM70_CHIP_LM70 },
>  	{ "tmp121", LM70_CHIP_TMP121 },
>  	{ "tmp122", LM70_CHIP_TMP122 },
> +	{ "tmp125", LM70_CHIP_TMP125 },
>  	{ "lm71",   LM70_CHIP_LM71 },
>  	{ "lm74",   LM70_CHIP_LM74 },
>  	{ },
