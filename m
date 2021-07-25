Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290AFC4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 21:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A22960F35
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 21:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhGYU7h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhGYU7g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Jul 2021 16:59:36 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90C9C061757
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jul 2021 14:40:05 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id k13so5709902qth.10
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jul 2021 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y2lrfSPSwO4q9iMAjqA+f1RL/gUDtGGb2OQ+GiYqCbU=;
        b=dvx+FBpTYtwbQ2yz+0sx9bJV5BEqC3uj7Hc1bf8U3o2goO/lGJTX9KvYGACVtY/Ilv
         RnY/M8nZWQNZWogQuGE2e3oFkT1FuIIxb/F+pzyvebkRfvtXT7rFwrRO0gn4dfCDXfxc
         CMiTq1rH5bU5L6ui2aOtg40egUHKrvwQGiI8GLs3GkZegeac4oAK3mR/DEtrc2auzEc/
         qNTqf03jJswAX341yeTjnxSONKNNTQqdvNgTys/BTvfOIcH+5VnP3IdD7O7uvxPsJPHO
         yS1K4P4TGBxU8eG7tYvljjF0KQnYNZ0yLNandx41LZ0H83EBvxktzVZ0UkACEeMujzoJ
         Jqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y2lrfSPSwO4q9iMAjqA+f1RL/gUDtGGb2OQ+GiYqCbU=;
        b=uCSUXRNnVCidcRREMgoFN+cA3/VrDYS+X0Q/fO2d/bqjdIUbA2Ze9EyLhV5gA30TpF
         61S5G19uokRyc/bkWd6ALLxAmfvGadTKbKk3aPU5y8IQsvWWm/nbouObFw9UXS2+H8KB
         Fou5ZKhUBd7gPmzLknxJZMJB6mgtvLPTtQqw6cg10DJ7elxZLuOZYB87T//BktAibEsS
         B1aDRYjKWyf1HvuAgjigBXZyhOjLhpgC+oDka3GvLett08GRvdX6Xh+IbKHjXitMywGM
         AzioIuQBlDYWWGM19x17CkMsEnrfeTm573w4EjT5ANHZPW0DejUzMpXVbzZ84LsOYPqd
         QrqQ==
X-Gm-Message-State: AOAM533SWjZG7WnrwlnDGyje/Mr9HTt+Dj36FvuFvjAWBA0vne0vaBvo
        3U/HGIeeIYg6YDmOCbnBEDY=
X-Google-Smtp-Source: ABdhPJxm9I0p1uGuChLEWgi2thhU7GUE8ynUs3AtPzvpOyaESXHpeRekrZzx0TWA4j50f2HrwQPyuA==
X-Received: by 2002:ac8:588f:: with SMTP id t15mr12857436qta.367.1627249205023;
        Sun, 25 Jul 2021 14:40:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h10sm17604760qka.83.2021.07.25.14.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 14:40:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon: sbrmi: Add Documentation
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Cc:     Akshay Gupta <Akshay.Gupta@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210720055737.8666-1-nchatrad@amd.com>
 <20210720055737.8666-2-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8dab172a-465f-baef-b480-9615ddde0ef5@roeck-us.net>
Date:   Sun, 25 Jul 2021 14:40:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720055737.8666-2-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/19/21 10:57 PM, Naveen Krishna Chatradhi wrote:
> From: Akshay Gupta <Akshay.Gupta@amd.com>
> 
> - Add documentation for sbrmi module
> 
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v2:
> None
> 
>   Documentation/hwmon/index.rst |  1 +
>   Documentation/hwmon/sbrmi.rst | 79 +++++++++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
>   create mode 100644 Documentation/hwmon/sbrmi.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9ed60fa84cbe..5cd4798fe193 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
>      q54sj108a2
>      raspberrypi-hwmon
>      sbtsi_temp
> +   sbrmi

alphabetic order, please.

Other than that, for my reference,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

>      sch5627
>      sch5636
>      scpi-hwmon
> diff --git a/Documentation/hwmon/sbrmi.rst b/Documentation/hwmon/sbrmi.rst
> new file mode 100644
> index 000000000000..296049e13ac9
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
> +power1_input     RO    Current Power consumed
> +power1_cap       RW    Power limit can be set between 0 and power1_cap_max
> +power1_cap_max   RO    Maximum powerlimit calculated and reported by the SMU FW
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
> 

