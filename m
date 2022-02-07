Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F3C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 11:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381608AbiBGLqY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 06:46:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359443AbiBGLOx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 06:14:53 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF061C03FEE3
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 03:14:38 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s7so2562601edd.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Feb 2022 03:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VJyVQdTTOuQPU3YB2lNjqUBtKY7gFcwk8PaGpqOOFhY=;
        b=YLTS3NDUZfbhBy/GWHNWXAfVddiTqFFAS1xZnjoqahsvp+19QlM0VXIcpdf20emUz7
         Zllec1PlzHf+NvtkVXB/WnDg2FI3ixD1lBFq3BNiwJbunGNrB5ljO7ysv6nQwgCZoa1v
         KpA8ENtbWDPZMUxw1qS+AkRMQgIwJOWCS5p1gRynPqOmW5xlx6etYJQmcLpWxTUwI9ra
         xb0JhMYlwsdacWYpczn77n/Js16TGqPrxvMHyhefLtkJiJ2S5QjFZdl4m2pe5wSyQbxA
         Ufk7lSxEtHVGfcCcWx/HtzG1+3xiWo64/gT+hEPWOosMik6jHDjryXUwzoSQlnDNEdUS
         EL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VJyVQdTTOuQPU3YB2lNjqUBtKY7gFcwk8PaGpqOOFhY=;
        b=Ne7F14WhtzdE12Au0ZeS5Eu5iBGI4MRmUbPS4RZC2ayEDyL9yCWF/6D5m5yZlNtFi5
         Drmttz7bVc9hb/EawIZpaN80SffuAnh8Xvlx7V7/vZ9Vv5esuJgYMmfOEAaqhCxazaGO
         /rQ7xNnmzwwcEQhmY//vSQ6Se/R/FKpPuuyBBoDyzytoQmPj7JUVN8sXu4Oio7zVOCRz
         YxAyhhC43+87Q5wnzANHEuT8sRnLxUFxAHqVYT10XIuyZ0TbPcP4dr+nWmYGWlzzAjvQ
         XOW8X1snbDvLaG+96Xo+nzxZR25DgDX8Jjuz/4bZ+43rcKb8j07Tr3Pu2Eaf7NT8Rx3V
         PiBw==
X-Gm-Message-State: AOAM531+5MfjO/1WAiSwCIgL6ybli/XH1wkHmNFQ7sskrWwrX0rRkrTV
        +lcCMZ2N6ooiBPOEHkPTMvaBwUH/+o4=
X-Google-Smtp-Source: ABdhPJyNUAWjQGvjb6xtKuoYlMBslsg7q5RtGrBIrqyM5Po3jBcXVUEOO0AZOyWu4iSdJ/ItS/Yhlw==
X-Received: by 2002:a05:6402:4385:: with SMTP id o5mr13738108edc.48.1644232473149;
        Mon, 07 Feb 2022 03:14:33 -0800 (PST)
Received: from [192.168.0.182] ([79.119.107.253])
        by smtp.gmail.com with ESMTPSA id jt17sm3561471ejb.161.2022.02.07.03.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 03:14:32 -0800 (PST)
Message-ID: <39e9c961-11b5-dfc3-d8c9-9c95ef22ccc0@gmail.com>
Date:   Mon, 7 Feb 2022 13:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/6] hwmon: adt7x10: Refactor to use with_info API
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20211223205219.2184104-1-linux@roeck-us.net>
From:   Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20211223205219.2184104-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Everything seems to function fine after the regmap conversion.
Thank you for taking the time to work on this.

Tested-by: Cosmin Tanislav <cosmin.tanislav@analog.com>
Reviewed-by: Cosmin Tanislav <cosmin.tanislav@analog.com>

On 12/23/21 22:52, Guenter Roeck wrote:
> V1 -> V2:
>   * add device managed action for restoring config
>   * merge multiple small related patches into a single patch
>     that converts the driver to use devm_hwmon_device_register_with_info
>   * switch to devm_request_threaded_irq after switching to
>     devm_hwmon_device_register_with_info to make sure that it is impossible
>     for the interrupt handler to access the freed hwmon device
>   * drop core driver remove callback
> 
> V2 -> V3:
>   * merge patch that passes name from i2c driver into the
>     devm_hwmon_device_register_with_info patch
> 
> v3 -> v4:
>   * Use regmap to hide chip specifics and to cache register values
>   * Various minor changes and fixes
>     * With the use of regmap, the bus device (bus_dev) is no longer needed,
>       and the patch introducing it was dropped
>     * Hysteresis value calculations depend on two values: The associated
>       register value and the hysteresis itself. All calculations must be
>       protected to ensure that one value isn't changed during calculations.
>       Add the missing locks to both the hysteresis read and write functions.
>     * Restoring the original configuration is only necessary if it was
>       actually changed. Only call devm_add_action_or_reset() if that is the
>       case. This also lets us drop the associated check in the action
>       function.
>     * Use enum to index ADT7X10_REG_TEMP[]
>     * Check all attributes in is_visible function explicitly.
>       While this is strictly speaking not necessary (the mode for
>       unsupported attributes should not be requested), I find the explicit
>       checks easier to understand and less error prone.
>     * Drop linux/hwmon-sysfs.h include and add missing linux/device.h include
>     * Squash patches 6/7 (pass hwinfo dev to irq handler) and patch 7/7
>       (use hwmon_notify_event) into a single patch; otherwise bus_dev would
>       still be needed temporarily.
> 
>   Note: This version of the series was module tested for ADT7410, but not
>         on real hardware, and not for ADT7310/7320/7420.
