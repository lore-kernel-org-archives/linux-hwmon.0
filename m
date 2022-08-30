Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3813EECAAD1
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 13:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbiH3Ncv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Aug 2022 09:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiH3Ncf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2022 09:32:35 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02366E39B6
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 06:32:32 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id q63so10681681pga.9
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Aug 2022 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=PTamupsjWIh61YygPWuVu2xHPu036cMf3Hvx4IGuuvs=;
        b=Ds2C4FNdNbiLAOoGmDeZt2gZETIPmYnl8dqDhc/8ahSK0V0fh9bEMKDXjxY2fKBi3r
         GHjJ5YzN0kllIquW39+QIVj1SpeGSSgZPNzQkKMsc/gvbPp1TZ31MGUwbbvRbKM+aib7
         GwSZq3cJ4N1pSux3e5my57MnZ2gXjcqX7nkX8pXMsSt3Uky52pqD612JFCmijKKeGG2l
         mbQ6ZPGZ/SurXHDFk9pJWJI9DJaENQzSZ/T/IydQG+I1zhTLSZ7UM6cf617dkw1CWdvQ
         7rkn3ieynPTxu68pfb57riZsVyEv0KZM7s8yZOndxRjLEzcagO5pWRrIPo915rs1lq9n
         F7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=PTamupsjWIh61YygPWuVu2xHPu036cMf3Hvx4IGuuvs=;
        b=599Gd6Tot8HCaR+GYYXJC2vmoG66r3CnBJI2sEuQcq2sUgo/hTstWuMJG40yjvG3+V
         hmJ7tGgiGqTuP4ssm7oMVuLN909P7FHjmxQOeX3yqIAehsemPkxcjpeedKLIEZ8KRn2A
         7KYm+vB2UH7weRgBXdH/0CXWMw6J95rkroGcATNqQMKeEiL5WTJYaBeDUSQ7gRNqdTAL
         BAZRrtja3kynNeRxXTTdo49vKJoDHejW7bVTd4Sw5pIldla2enerK9rIGEU/9txBlIr1
         bFbzfH9nKPiisUzkPIrF043Vzx77ZxPuAaCIlen58GkBtDq7Nr5lOvQ2t330CvPvGmPD
         BlbQ==
X-Gm-Message-State: ACgBeo1obu47tnMiRE7nGam5XBMYyPgY9jLmPQzogNlUHS+SAQXGmeQy
        MrYld975AzlqBR0DdaspVX1+IxU106f6oQ==
X-Google-Smtp-Source: AA6agR752TePj5YuzYcnlJb/gAzyqd6Lj6t1Q2wjliDHjh0vaHEqc4ZaBmK9RMMEE7rt9kPIz/Il7w==
X-Received: by 2002:a62:e217:0:b0:538:604:2dd0 with SMTP id a23-20020a62e217000000b0053806042dd0mr14408623pfi.70.1661866351832;
        Tue, 30 Aug 2022 06:32:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78f25000000b0052e82c7d91bsm9345503pfr.135.2022.08.30.06.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 06:32:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 30 Aug 2022 06:32:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH hwmon-next v5 3/3] docs: hwmon: add emc2305.rst to docs
Message-ID: <20220830133230.GA229238@roeck-us.net>
References: <20220810171552.56417-1-michaelsh@nvidia.com>
 <20220810171552.56417-4-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810171552.56417-4-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 10, 2022 at 08:15:52PM +0300, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Add description of emc2305 driver.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> v1->v2
> - Add document to index.rst
> ---
>  Documentation/hwmon/emc2305.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>  Documentation/hwmon/index.rst   |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 Documentation/hwmon/emc2305.rst
> 
> diff --git a/Documentation/hwmon/emc2305.rst b/Documentation/hwmon/emc2305.rst
> new file mode 100644
> index 000000000000..258da49d18f9
> --- /dev/null
> +++ b/Documentation/hwmon/emc2305.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver emc2305
> +=====================
> +
> +Supported chips:
> +   Microchip EMC2305, EMC2303, EMC2302, EMC2301
> +
> +   Addresses scanned: I2C 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d
> +   Prefixes: 'emc2305'
> +
> +   Datasheet: Publicly available at the Microchip website :
> +      https://www.microchip.com/en-us/product/EMC2305
> +
> +Description:
> +-----------
> +This driver implements support for Microchip EMC2301/2/3/5 RPM-based PWM Fan Controller.
> +The EMC2305 Fan Controller supports up to 5 independently controlled PWM fan drives.
> +Fan rotation speeds are reported in RPM.
> +The driver supports the RPM-based PWM control to keep a fan at the desired speed.
> +The driver provides the possibility to have one common PWM interface for all FANs
> +or up to the maximum available or configured independent PWMs.
> +
> +The driver provides the following sysfs interfaces in hwmon subsystem:
> +
> +================= == ===================================================
> +fan[1-5]_fault    RO files for tachometers TACH1-TACH5 fault indication
> +fan[1-5]_input    RO files for tachometers TACH1-TACH5 input (in RPM)
> +pwm[1-5]          RW file for fan[1-5] target duty cycle (0..255)
> +================= == ===================================================
> +
> +sysfs interfaces in thermal subsystem:
> +
> +================= == ========================================================================
> +cur_state         RW file for the current cooling state of the cooling device (0..max_state)
> +max_state         RO file for the maximum cooling state of the cooling device
> +================= == ========================================================================
> +
> +Configuration is possible via device tree:
> +Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f7113b0f8b2a..83b082d222af 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -63,6 +63,7 @@ Hardware Monitoring Kernel Drivers
>     ds620
>     emc1403
>     emc2103
> +   emc2305
>     emc6w201
>     f71805f
>     f71882fg
