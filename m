Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE462C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jun 2021 15:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B95661465
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jun 2021 15:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbhF1PoV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jun 2021 11:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236735AbhF1PoC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 11:44:02 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3B4C0527C5
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jun 2021 08:01:10 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g19-20020a9d12930000b0290457fde18ad0so19051945otg.1
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Jun 2021 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O9zV2E/vPYfTy4A5DQ0o17d+Ki5x9zHJ2tH3UrxjnnI=;
        b=lCvYrWK2PtdmmGVlebF58rF4iD49GZmNSs8mIaqvpSC5y3kp4aSspansJKhPiBS+GG
         kxkcoZTja7UiqNtR0TTYr3NKWxN2rkpCth1h2YsHb0H49wmndVqN/dQ+Zf68Lkgkgb+F
         C/cGnLUzqRFNNSzfFUt9lStHUJhu35JZt371vDeZOPlTw+jwtEvEJ+ovIIv+OUS0vh/H
         sGRAfqZSmWL3Xu7sGkyuZDzUSOREDO+LYhacULOJFvRHux9hpShS2j93WDDAuX60iCBt
         UfAF1BNp9pa4GDHtqialPzrmlmGnKQBQJ3fFu4LI+Sj54L06aJieRiwdgXeTrMcbEhc9
         JgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=O9zV2E/vPYfTy4A5DQ0o17d+Ki5x9zHJ2tH3UrxjnnI=;
        b=cSlX88rzu6r0zCT6tAGOAF2ig+NTGiwQ7wwrgx3SlSimTxua+ermSLpmlfZXE8XbXL
         z+SvjLR6E+9f1E+F533cXNkQGlNQkm1NTGcRY4VBBtp7LWRYz0oFWR8MQquk3lRJRfH5
         lxiQBesSt4zgxVVPaEQ4vBX4j+IJT2/F6XwnwFPXBf6IN5kYmQ7nwPHskiW600xMfVYJ
         P0bQCpUDDQcI/iUHOCJC6i1du2A9Xal7cElhQndGDtXgAUQ831uqM6lrgl+9QQVJhbHJ
         emE8EESnpvlFubLRdXdMSCK55RzCJZ9Iw6EXiREkOmluCVKGVCaaBN2Qw44/3qIhGX4Z
         OIMw==
X-Gm-Message-State: AOAM531sNqHuuNUKU6kddV5tH5UOzTM11R0yV2ExSafj9wp47/N8R6jx
        AkP843+UOy6miVd7WaDBPvM=
X-Google-Smtp-Source: ABdhPJw9G0oNrpiioQ/2sM7xzp8zQndFVuoVCV2PFccfftIMy8x+yEpEGOaT9QWI9QsWRrPa5EvEbg==
X-Received: by 2002:a9d:7641:: with SMTP id o1mr20689798otl.119.1624892468308;
        Mon, 28 Jun 2021 08:01:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y9sm1100042oov.4.2021.06.28.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:01:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 28 Jun 2021 08:01:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, Akshay Gupta <Akshay.Gupta@amd.com>
Subject: Re: [PATCH 2/3] hwmon: sbrmi: Add Documentation
Message-ID: <20210628150106.GA440785@roeck-us.net>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210625132544.18094-2-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625132544.18094-2-nchatrad@amd.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 25, 2021 at 06:55:43PM +0530, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
> 
> - Add documentation for sbrmi module
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>  Documentation/hwmon/index.rst |  1 +
>  Documentation/hwmon/sbrmi.rst | 79 +++++++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 Documentation/hwmon/sbrmi.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9ed60fa84cbe..5cd4798fe193 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
>     q54sj108a2
>     raspberrypi-hwmon
>     sbtsi_temp
> +   sbrmi
>     sch5627
>     sch5636
>     scpi-hwmon
> diff --git a/Documentation/hwmon/sbrmi.rst b/Documentation/hwmon/sbrmi.rst
> new file mode 100644
> index 000000000000..db50393167bb
> --- /dev/null
> +++ b/Documentation/hwmon/sbrmi.rst
> @@ -0,0 +1,79 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver sbrmi
> +===================
> +
> +Supported hardware:
> +
> +  * Sideband Remote Management Interface (SB-RMI) compliant AMD SoC
> +    device connected to the BMC via the APML.
> +
> +    Prefix: 'sbrmi'
> +
> +    Addresses scanned: This driver doesn't support address scanning.
> +
> +    To instantiate this driver on an AMD CPU with SB-RMI
> +    support, the i2c bus number would be the bus connected from the board
> +    management controller (BMC) to the CPU.
> +    The SMBus address is really 7 bits. Some vendors and the SMBus
> +    specification show the address as 8 bits, left justified with the R/W
> +    bit as a write (0) making bit 0. Some vendors use only the 7 bits
> +    to describe the address.
> +    As mentioned in AMD's APML specification, The SB-RMI address is
> +    normally 78h(0111 100W) or 3Ch(011 1100) for socket 0 and 70h(0111 000W)
> +    or 38h(011 1000) for socket 1, but it could vary based on hardware
> +    address select pins.
> +
> +    Datasheet: The SB-RMI interface and protocol along with the Advanced
> +               Platform Management Link (APML) Specification is available
> +               as part of the open source SoC register reference at:
> +
> +               https://www.amd.com/en/support/tech-docs?keyword=55898
> +
> +Author: Akshay Gupta <akshay.gupta@amd.com>
> +
> +Description
> +-----------
> +
> +The APML provides a way to communicate with the SB Remote Management interface
> +(SB-RMI) module from the external SMBus master that can be used to report socket
> +power on AMD platforms using mailbox command and resembles a typical 8-pin remote
> +power sensor's I2C interface to BMC.
> +
> +This driver implements current power with power cap and power cap max.
> +
> +sysfs-Interface
> +---------------
> +Power sensors can be queried and set via the standard ``hwmon`` interface
> +on ``sysfs``, under the directory ``/sys/class/hwmon/hwmonX`` for some value
> +of ``X`` (search for the ``X`` such that ``/sys/class/hwmon/hwmonX/name`` has
> +content ``sbrmi``)
> +
> +================ ===== ========================================================
> +Name             Perm   Description
> +================ ===== ========================================================
> +power#_input     RO    Current Power consumed
> +power#_cap       RW    Power limit can be set between 0 and power#_cap_max
> +power#_cap_max   RO    Maximum powerlimit calculated and reported by the SMU FW

'#' is always '1', so just say so.

> +================ ===== ========================================================
> +
> +The following example show how the 'Power' attribute from the i2c-addresses
> +can be monitored using the userspace utilities like ``sensors`` binary::
> +
> +  # sensors
> +  sbrmi-i2c-1-38
> +  Adapter: bcm2835 I2C adapter
> +  power1:       61.00 W (cap = 225.00 W)
> +
> +  sbrmi-i2c-1-3c
> +  Adapter: bcm2835 I2C adapter
> +  power1:       28.39 W (cap = 224.77 W)
> +  #
> +
> +Also, Below shows how get and set the values from sysfs entries individually::
> +  # cat /sys/class/hwmon/hwmon1/power1_cap_max
> +  225000000
> +
> +  # echo 180000000 > /sys/class/hwmon/hwmon1/power1_cap
> +  # cat /sys/class/hwmon/hwmon1/power1_cap
> +  180000000
