Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E0C00140
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jul 2022 14:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiGZOdU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 10:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbiGZOdT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 10:33:19 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939A62B180
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 07:33:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id li4so2280686pjb.3
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=Bnr7Bs9kyqCkps5L/sHHfZRfBzf0FtYUa9QnCLqa0A0=;
        b=Lgwr+2iNWViUKl1IfNG99KeaclPsnPMKbLR+3Qf/j3RgtlEyk3DBQ/TtQDnq3nVY1Q
         a0tiFoJAakx4js1Ec/CV9qLqtY/bt3L74V8cep9mUGbpwB+Fo0mXOSOkw0VGqs3J2twE
         ReXAj/DKE8EGt57wGEJQbDScXrK8N/wsRgCUnu+9Yk2kQwdhHalXYLci4V94VnFDY3HK
         7DyCUVlIRMKp1VAaXLHpzlWtTRG6ensqEBU6inep9zplcyBtjXoMblCCtg0+30oRYqKZ
         QKTcgUfU16+FKAK96zTE9aMIatNPOPffz0qcb+yxdtSMGvx8mDecgGpQRMelf+VqgCXn
         C22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=Bnr7Bs9kyqCkps5L/sHHfZRfBzf0FtYUa9QnCLqa0A0=;
        b=NY37UAhWdrmzjMYci6HJihBPoM3jv5XV4Pj3m+kzb63SrBGIo+Wl8GXBw8XfP9A4m7
         0qAV8KQ+5JWS6KdrEllPlMlxYGapINoOywpJy5x9ayzRT6NYojmBHHs4Q9f6CTEOpdfI
         xCuWq755pCnrjLEYvN6TPwAZ0FOvtT9iNjgsQL3TM6umOKSS0LK/JjNQ7zT5302eE9Mm
         6CuZpp2UzcmBmZr9NUUK1gmQhvskrEES8kKK79Dch5T9z2SY+/gGlUa0NBQroHUTfv++
         6Q9bc7swNDjHFp8eMP7s73E71vr5sQlXXLaylRgVA6MvRhdQ3W/Is8Zp+zDvMzZECZp8
         fnYw==
X-Gm-Message-State: AJIora/WUMIsZNH9OIKQsMljnYSWf0PVPltuOObV5tqG1HSDl6+XiEtp
        ziijwJNapbX3y+47ROIZPdY=
X-Google-Smtp-Source: AGRyM1tEsa7i6Z2keEExYXlWX13sIjmvCi8Eh0Ng7meywBWCzXEMa1vCof7rSa1UjzuDanF5A5O/CA==
X-Received: by 2002:a17:90b:35d1:b0:1f2:50ae:4249 with SMTP id nb17-20020a17090b35d100b001f250ae4249mr19855656pjb.228.1658845998094;
        Tue, 26 Jul 2022 07:33:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n124-20020a622782000000b0052896ea8a28sm11838773pfn.151.2022.07.26.07.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 07:33:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <981f21b4-dde7-f7b3-1ac7-d4d528de1661@roeck-us.net>
Date:   Tue, 26 Jul 2022 07:33:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org
References: <20220726122857.116-1-Ibrahim.Tilki@analog.com>
 <20220726122857.116-3-Ibrahim.Tilki@analog.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] docs: hwmon: add max31760 documentation
In-Reply-To: <20220726122857.116-3-Ibrahim.Tilki@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/26/22 05:28, Ibrahim Tilki wrote:
> Adding documentation for max31760 fan speed controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---
>   Documentation/hwmon/max31760.rst | 53 ++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/hwmon/max31760.rst
> 
> diff --git a/Documentation/hwmon/max31760.rst b/Documentation/hwmon/max31760.rst
> new file mode 100644
> index 000000000..11055722b
> --- /dev/null
> +++ b/Documentation/hwmon/max31760.rst
> @@ -0,0 +1,53 @@
> +Kernel driver max31760
> +======================
> +
> +Supported chips:
> +  * Analog Devices MAX31760
> +
> +    Prefix: 'max31760'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31760.pdf
> +
> +
> +Author: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> +
> +Description
> +-----------
> +
> +MAX31760 is a presicion fan speed controller with nonvolatile lookup table.

precision

> +Device has one internal and one external temperature sensor support.
> +Controls two fans and measures their speeds.
> +Generates hardware alerts when programmable max and critical temperatures are exceeded.
> +Supports direct and temperature based automatic fan control.
> +
> +Temperature measurement range: from -55°C to 125°C
> +
> +Temperature Resolution: 11 Bits, ±0.125°C
> +
> +Please refer how to instantiate this driver: Documentation/i2c/instantiating-devices.rst
> +
> +
> +Sysfs entries
> +-------------
> +
> +=============================== ============================================================
> +fan[1-2]_input                  Fan speed (in RPM)
> +fan[1-2]_enable                 Enable fan readings and fan fault alarms
> +fan[1-2]_fault                  Fan fault status
> +temp[1-2]_label                 "Remote" and "Local" temperature channel labels
> +temp[1-2]_input                 Temperature sensor readings (in millidegrees Celsius)
> +temp1_fault                     Remote temperature sensor fault status
> +temp[1-2]_max                   Temperature max value. Asserts "ALERT" pin when exceeded
> +temp[1-2]_max_alarm             Temperature max alarm status
> +temp[1-2]_crit                  Temperature critical value. Asserts "SHDN" pin when exceeded
> +temp[1-2]_crit_alarm            Temperature critical alarm status
> +pwm1                            PWM value for direct fan control
> +pwm1_enable                     1: direct fan control, 2: temperature based auto fan control
> +pwm1_freq                       PWM frequency in hertz
> +pwm1_auto_channels_temp         Temperature source for auto fan control

This needs to be explained further. No one will know that "3" reflects max(temp1, temp2).

> +pwm1_auto_point[1-48]_pwm       RW PWM value for LUT point
> +pwm1_auto_point[1-48]_temp      RO Temperature value for LUT point
> +pwm1_auto_point[1-48]_temp_hyst RW Temperature hysteresis value for LUT point

Temperatures are fixed, and there is only one hysteresis value. That means there
will be 96 sysfs attributes with effectively just a single controllable value, and
otherwise constants. This is just confusing and has no value. Drop all those,
document the relationship between temperatures and pwm1_auto_point[1-48]_pwm,
and provide just a single attribute for the hysteresis.

Guenter

> +=============================== ============================================================

