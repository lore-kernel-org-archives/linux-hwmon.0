Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D959C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Feb 2022 17:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243671AbiBQRXZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Feb 2022 12:23:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236689AbiBQRXW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Feb 2022 12:23:22 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1F716A58A;
        Thu, 17 Feb 2022 09:23:07 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id f19so9599186qvb.6;
        Thu, 17 Feb 2022 09:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0gybyyRu3IGKlZtiD8StGrVP4LxulQSa3HqTVXj/khc=;
        b=H/37aLzYeceJ9Jh531557la8ClaAw63GyAplENYNBYsVU0lJxGS+7u7R2lMTZ22KQx
         MQwNFqsly5gzQU53LpRYuyV8I+qsJ4l+6Zwan/6+5Rp9TAe7bSteno+Smnv8xjRd2+dx
         xcRLgFABBVSOvh+5bBcKMvMt5tn6sqWrCXzSJWHoSN/kKq16Q55eqt7jKKAa9lTb7tIK
         KNl9mLoUKeMHggakgHNkBcOrXvqvndnCnfuMGrOdhN8R3ZfCjXsJ7BbSjHzYeqpG1I0d
         edNMJE6+oYR2MmbD2ohxZgdK/NpOITI7+xnl5wg8aJEjelAwTFhF4x0/HnSLQb/0d1SQ
         xCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0gybyyRu3IGKlZtiD8StGrVP4LxulQSa3HqTVXj/khc=;
        b=chCsWdh+hKP/S5TB4KQBceAgDFMnClmpQ+DmTb5qf7W33HkvGKWEoRY+C7TdrcPG+Z
         It99wxmwOw7pB5VObB+lsy9V24qZn1SSs08eTbQtMTsnNoMxZnk9poY52EBZ/2ZcEry1
         kaDPS7U8U7Mz91Vo/C7aXUOORRmMrTjjEs9QGD5uAkCWpd0hvEwrXxJs5rUH54qVEYsC
         dYUpVX4MbSEik7s3M16C3hjJrYCMiqLfk7bbMFLgxcfOJKxFGjsv8FOf0yHwPYLRFQYX
         1itNZoPCkpsQlPD/YV+QCRYPEqHrfA8/h1zWDoUQ2BWxsl35NJyfukeiwjYX9WY1M5xS
         zebw==
X-Gm-Message-State: AOAM530AxlKBBDDcB+Q5xePcOqSjIo5OwsZHx4TSVQ7/jOoCFiDcrPnF
        g2Ek6H1EoizOHZbUIMnjVq0=
X-Google-Smtp-Source: ABdhPJzLyI555BxrmOhhr/BhwwEMITyHqAkocnzI8ArzNjU8/c7kmGkX630BMPh142wEfGxq3CbqyQ==
X-Received: by 2002:a05:6214:2b06:b0:42d:582:f95f with SMTP id jx6-20020a0562142b0600b0042d0582f95fmr2917457qvb.20.1645118586670;
        Thu, 17 Feb 2022 09:23:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d65sm848121qkg.104.2022.02.17.09.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 09:23:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5c9d8241-1b79-fb02-948c-dbeed5b58642@roeck-us.net>
Date:   Thu, 17 Feb 2022 09:23:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/2] hwmon: (lm70) Add ti,tmp125 support
Content-Language: en-US
To:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>
References: <524e85e640a4fccdf68b0a1c18b516378a581d35.1645116431.git.chunkeey@gmail.com>
 <2cf86380c491fd9972b1931498fcdb9d1a6a1937.1645116431.git.chunkeey@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <2cf86380c491fd9972b1931498fcdb9d1a6a1937.1645116431.git.chunkeey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/17/22 08:47, Christian Lamparter wrote:
> The TMP125 is a 2 degree Celsius accurate Digital
> Temperature Sensor with a SPI interface.
> 
> The temperature register is a 16-bit, read-only register.
> The MSB (Bit 15) is a leading zero and never set. Bits 14
> to 5 are the 1+9 temperature data bits in a signed two's
> complement format. Bits 4 to 0 are mirrors of Bit 5 and
> therefore ignored.
> 
> This was tested on a Aerohive HiveAP-350.
> 
> Bonus: lm70 supports TMP122/TMP124 as well. So, I
> added them to the Kconfig module description as well.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> Datasheet: (Link)
> <https://www.ti.com/lit/ds/symlink/tmp125.pdf>
> 
> I'm not sure if it's "Ok" to add the TMP125 to this lm70.
> It seems like it, especially since the TMP124 and friends
> are supported by this driver.

Better than a separate driver just for a few lines of code.

> ---
>   drivers/hwmon/Kconfig |  4 ++--
>   drivers/hwmon/lm70.c  | 15 +++++++++++++++

Please also add the chip to Documentation/hwmon/lm70.rst.

>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8df25f1079ba..5cdf38004fae 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1208,8 +1208,8 @@ config SENSORS_LM70
>   	depends on SPI_MASTER
>   	help
>   	  If you say yes here you get support for the National Semiconductor
> -	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123 digital tempera-
> -	  ture sensor chips.
> +	  LM70, LM71, LM74 and Texas Instruments TMP121/TMP123, TMP122/TMP124
> +	  and TMP125 digital temperature sensor chips.
>   
>   	  This driver can also be built as a module. If so, the module
>   	  will be called lm70.
> diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
> index d2a60de5b8de..4202e4e03584 100644
> --- a/drivers/hwmon/lm70.c
> +++ b/drivers/hwmon/lm70.c
> @@ -34,6 +34,7 @@
>   #define LM70_CHIP_LM71		2	/* NS LM71 */
>   #define LM70_CHIP_LM74		3	/* NS LM74 */
>   #define LM70_CHIP_TMP122	4	/* TI TMP122/TMP124 */
> +#define LM70_CHIP_TMP125	5	/* TI TMP125 */
>   
>   struct lm70 {
>   	struct spi_device *spi;
> @@ -87,6 +88,11 @@ static ssize_t temp1_input_show(struct device *dev,
>   	 * LM71:
>   	 * 14 bits of 2's complement data, discard LSB 2 bits,
>   	 * resolution 0.0312 degrees celsius.
> +	 *
> +	 * TMP125:
> +	 * MSB/D15 is a leading zero. D14 is the sign-bit followed by
> +	 * 9 temperature bits (D13..D5) of 2's complement data,
> +	 * discard LSB 5 bits (same as D5), resolution 0.25 degress celsius.

degrees

>   	 */
>   	switch (p_lm70->chip) {
>   	case LM70_CHIP_LM70:
> @@ -102,6 +108,10 @@ static ssize_t temp1_input_show(struct device *dev,
>   	case LM70_CHIP_LM71:
>   		val = ((int)raw / 4) * 3125 / 100;
>   		break;
> +
> +	case LM70_CHIP_TMP125:
> +		val = sign_extend32(raw, 14) / 32 * 250;
> +		break;
>   	}
>   
>   	status = sprintf(buf, "%d\n", val); /* millidegrees Celsius */
> @@ -135,6 +145,10 @@ static const struct of_device_id lm70_of_ids[] = {
>   		.compatible = "ti,tmp122",
>   		.data = (void *) LM70_CHIP_TMP122,
>   	},
> +	{
> +		.compatible = "ti,tmp125",
> +		.data = (void *) LM70_CHIP_TMP125,
> +	},
>   	{
>   		.compatible = "ti,lm71",
>   		.data = (void *) LM70_CHIP_LM71,
> @@ -184,6 +198,7 @@ static const struct spi_device_id lm70_ids[] = {
>   	{ "lm70",   LM70_CHIP_LM70 },
>   	{ "tmp121", LM70_CHIP_TMP121 },
>   	{ "tmp122", LM70_CHIP_TMP122 },
> +	{ "tmp125", LM70_CHIP_TMP125 },
>   	{ "lm71",   LM70_CHIP_LM71 },
>   	{ "lm74",   LM70_CHIP_LM74 },
>   	{ },

