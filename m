Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D6DC6FA82
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Sep 2022 16:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiIDQGj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Sep 2022 12:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiIDQGi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Sep 2022 12:06:38 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F352137FA7
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Sep 2022 09:06:36 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id l3so6340651plb.10
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Sep 2022 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=+tZ5kj1bT378GrX4zmhE+OHgIyEk7W8qH7M5x7H+9Ls=;
        b=g6FnLR5fXHqURx//PyQ3AAlwZMfybbE06hVlTXj6Bwhp1Z6/tJbNNRyAQO3yN+e/0i
         m4GZCHnRe4qUdHPVMc/NQWFStoRmWNVvkSluB+tCp3dhIVLBXfX1VZ+NUuwCljGz7A5O
         QXae1Y/IzHA2F6LVWmFoUIsW8EKRTo9Q9tz28slu7WUMtp/qC6WnyudEuy1EQ//MwnvT
         fisAdBhxKtM7I8JwmHptAJatlzaLIoKGahxxPt75F0hMwZaRQPhDnvr02E2HfX3q//Cs
         5YNpDBgfB1iAaXjT+Wess0a4MThc/BB12rHAjHqoLEy+sgZrmQJTFVZjFrvTkqDe8qdp
         V6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+tZ5kj1bT378GrX4zmhE+OHgIyEk7W8qH7M5x7H+9Ls=;
        b=EKRZyRjgg0sdbTr+mtUSq3i/YoStJhLTKSirZSJO4gT5Rton6jZF0dOQohakGyCgrm
         3IVOVaIurSA1ay4B9TlnebxOlrI7cfYJtbBG8pAxyHjQJ7eSLOms4LTQweQKAvMnVSCn
         wJRQDTOi2iu5yocr58nEG2M+mIqLe4sVnEcqdg1Xv3crlp7S8UFb9GrvT/0ZjPCZr+ye
         wg7z/AvzQh62Mz4lStHh7O3miVCNW/14GAkJ797lbqM2sOB8tt1r4XkmPa+VEZzk/qHE
         rPWuj5OuEc8EtYGSzQeQ7WBmb223a9BYtiEm7NmGkd/acQ7Ad1s/LPO/MLuYKuXXIupl
         r8KA==
X-Gm-Message-State: ACgBeo2r/0gLYxInM1pqtu/qg6g6Kyzx4gj4nKPkCBSFyGxqSkicfRy9
        ChugPMGI1a7GGan5H6IGX3I=
X-Google-Smtp-Source: AA6agR69hiNbuUfdcuTbe3vPubgQaRvPcMSN9QZD8c1uWsp/aigrWYWWEuxTnSnUJ4n28uZGhakOTg==
X-Received: by 2002:a17:902:c209:b0:175:1a78:a170 with SMTP id 9-20020a170902c20900b001751a78a170mr27567191pll.45.1662307596237;
        Sun, 04 Sep 2022 09:06:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b4-20020a170903228400b00175168a79d6sm5555440plh.286.2022.09.04.09.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 09:06:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 4 Sep 2022 09:06:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/4] docs: hwmon: add max31760 documentation
Message-ID: <20220904160632.GA3007049@roeck-us.net>
References: <20220901125906.929-1-Ibrahim.Tilki@analog.com>
 <20220901125906.929-3-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901125906.929-3-Ibrahim.Tilki@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 01, 2022 at 03:59:04PM +0300, Ibrahim Tilki wrote:
> Adding documentation for max31760 fan speed controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---
>  Documentation/hwmon/max31760.rst | 67 ++++++++++++++++++++++++++++++++

The file also needs to be added to index.rst.

>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/hwmon/max31760.rst
> 
> diff --git a/Documentation/hwmon/max31760.rst b/Documentation/hwmon/max31760.rst
> new file mode 100644
> index 000000000..fd67c1318
> --- /dev/null
> +++ b/Documentation/hwmon/max31760.rst
> @@ -0,0 +1,67 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
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
> +MAX31760 is a precision fan speed controller with nonvolatile lookup table.
> +Device has one internal and one external temperature sensor support.
> +Controls two fans and measures their speeds.
> +Generates hardware alerts when programmable max and critical temperatures are exceeded.
> +Supports direct and temperature based automatic fan control.
> +

Please use full sentences.

Thanks,
Guenter

> +Temperature measurement range: from -55°C to 125°C
> +
> +Temperature Resolution: 11 Bits, ±0.125°C
> +
> +Please refer how to instantiate this driver: Documentation/i2c/instantiating-devices.rst
> +
> +Lookup table for auto fan control
> +---------------------------------
> +
> +========= =================================
> +LUT Index Name
> +========= =================================
> +1         PWM value for T < +18°C
> +2         PWM value for +18°C ≤ T < +20°C
> +3         PWM value for +20°C ≤ T < +22°C
> +...       ...
> +47        PWM value for +108°C ≤ T < +110°C
> +48        PWM value for T ≥ +110°C
> +========= =================================
> +
> +Sysfs entries
> +-------------
> +
> +=============================== =================================================================================
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
> +pwm1_auto_channels_temp         Temperature source for auto fan control. 1: temp1, 2: temp2, 3: max(temp1, temp2)
> +pwm1_auto_point[1-48]_pwm       PWM value for LUT point
> +pwm1_auto_point_temp_hyst       Temperature hysteresis for auto fan control. Can be either 2000mC or 4000mC
> +=============================== =================================================================================
