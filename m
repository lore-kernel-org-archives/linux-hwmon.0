Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E594BECAAD4
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 13:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiH3NTG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Aug 2022 09:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiH3NTF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2022 09:19:05 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C29FD83DC
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 06:19:04 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id fa2so3423829pjb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc;
        bh=wajTOJhEqLs0+53dAYOWnrTovs8VU2U9ebup19wX6TY=;
        b=RxbNFgXxwA1kTIZQVoVfDj6hFardTC1oSWaiKEd/8mLNCPnkYZu1ugMMRglQRVA/W9
         diHyj+FbfL88L3H2ClNGjP2AxLbvcTL/VEwO/P/XUDh0vIDM6Tn3fjl9rZ9fSJ/0wUL2
         yywvrKMz0b1+w7cqz4kdpeQxW/aDLyu2JYhTaN4gdo3a29zrHdUxt44HCiWVIPPhynKM
         vqJfB15qX4K5t+asvk5T9X8ptYQ4ogxhS1IBNJddK8cgb7V6Xs/6ZhQ9pc+Sx7Sh/nU3
         u5ptVKEdWDeCHn3lKFuaslMXGYFyH5xbcWepewT9QSxsg4nfQ7Py6XTBD8UmJZR4yGjD
         pLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc;
        bh=wajTOJhEqLs0+53dAYOWnrTovs8VU2U9ebup19wX6TY=;
        b=uiu0tfqhqiSEgG7q0oSON5ZzgtI65Yn5Ba39iszioHdZbrlRDKhL3OmNXon47VoGGM
         6MttwN+yDz/9aQ8Kp7NM2qjHuppy+fipn7TY2bT/qXciBup9o5Cu+qHT79fp6bRlRI0V
         ixGIYlfoOS0LqMwoPPmiNNINRy/8jxYVE+DREykzHz0MMnXWTYkKPSYsqhBx4M07oF/+
         MmpO1Gnh76Ck3/ya77CwhnuhKXQooaYfl/7jLyo2BAnNHCyvCKAKaAnXZ2D/zyBDHMMD
         TTtgOLtQoFaBavJvCft3mRoh8v7qfW1VYoCKkcnE3SILAPQHaIFSczP0tbH2MYJySdf7
         0+9g==
X-Gm-Message-State: ACgBeo1L/zIWzTPbk2CGZqP8xSkqVL8OUM2vw6WxaKFHYoLVWicIHmuT
        TJMfO0fGLIVCoP35pTT/IXHW2t9lc38RKQ==
X-Google-Smtp-Source: AA6agR55JYxPdOi5ikqJIvH5kwsyv2l18mckmu/H7FXWYhey27fMGogKVh3xaAAit0kWYGoR95BYWg==
X-Received: by 2002:a17:90b:35c3:b0:1fe:10c4:cfb7 with SMTP id nb3-20020a17090b35c300b001fe10c4cfb7mr2426709pjb.60.1661865543843;
        Tue, 30 Aug 2022 06:19:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090302cc00b00172ea8ff334sm9666384plk.7.2022.08.30.06.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 06:19:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 30 Aug 2022 06:19:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 2/2] docs: hwmon: add max31760 documentation
Message-ID: <20220830131902.GA227799@roeck-us.net>
References: <20220823093417.348-1-Ibrahim.Tilki@analog.com>
 <20220823093417.348-3-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220823093417.348-3-Ibrahim.Tilki@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 23, 2022 at 12:34:17PM +0300, Ibrahim Tilki wrote:
> Adding documentation for max31760 fan speed controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>

Checkpatch reports:

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

From Documentation/hwmon/submitting-patches.rst:

* Please run your patch through 'checkpatch --strict'. There should be no
  errors, no warnings, and few if any check messages. If there are any
  messages, please be prepared to explain.

Guenter

> ---
>  Documentation/hwmon/max31760.rst | 65 ++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/hwmon/max31760.rst
> 
> diff --git a/Documentation/hwmon/max31760.rst b/Documentation/hwmon/max31760.rst
> new file mode 100644
> index 000000000..067b3a5ce
> --- /dev/null
> +++ b/Documentation/hwmon/max31760.rst
> @@ -0,0 +1,65 @@
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
