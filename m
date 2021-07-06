Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE48EC07E96
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8879261C2F
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhGFNOs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhGFNOs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jul 2021 09:14:48 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02E9C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jul 2021 06:12:09 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so21513809ota.4
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jul 2021 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Aow6ck76kYplLFJO8lYAKWyD1oN7PHbAGmlZEOibdbA=;
        b=B34H7Jns30YDyaTjpEbryfbC+7iBGPjKvBb23ucldYtno6c2qnj/hFRG5F+MmwAYCE
         bOJldpYfF/W2/t8iwQ7rSl/dBq9TyEEwWs7l2VtHf50UrG1ieFbvjXBNUNzJlzm/T7SK
         OTxzKRiWtB/AHm0vLE2KxXtngwgOiS+bvX1X9efyAd7EnEOPs50kE749l7sPmVANv2ww
         A2ExTd7TvroF+ZYZBrMUWMWOJlWF/j9ouIf1gO4Sx9ybiAmhupzuk4dCt9wVXhbrz8we
         JSYruKzCOaKzE08irSUhw5CS6WEroQTeeTgLF+FEqnKW9t5JazvBvXOs22h3E5T3w00S
         ux5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Aow6ck76kYplLFJO8lYAKWyD1oN7PHbAGmlZEOibdbA=;
        b=Qtse4S1BExvrEQ7xOonbBeKL3yeCMX5nfejq6fJ6GY+o0/XZDvCCuSiJuuMSb7auaJ
         S8qQpk4xeLdrXhMTc0OqDwgyYFtFvjjjA/RYpbKGJ3eut/No7iG+oqV4T9Flo3tyNru7
         632Hz9YsxxzR7JNOuWZuWtfUXZBQzVvBMIcAz9i/EnAq5IRY0iS5cWgJkrtMwfkJ22d1
         wSJRp9YNS2VRKLr8/loV1UWioLJ5cYL0Acvn580g6fJHTC1k0e2QjXQ/LOFXHm+ugCVJ
         yqC7j+BWj1n65HOxDdRDhdehDwp7Lt0C5YMzUn/blUKcsbliRM2HIlTdgPOn3Ro0umYS
         5FvQ==
X-Gm-Message-State: AOAM532n84Z1l2dvMjBhBKfrZeNio94dMJL3I7IY96ZaALsDjqlyM4rx
        ztdetOHSgB4bu7fxJ4TuFjprf8E2nQg=
X-Google-Smtp-Source: ABdhPJzateAHHGK5K8yGYTsOBuwdZcIa4HYTV3NAuIDVSMT7nqlZ0J7I/dBWwkXl3Rzmr/HGAV6tRA==
X-Received: by 2002:a05:6830:2316:: with SMTP id u22mr11585234ote.90.1625577128269;
        Tue, 06 Jul 2021 06:12:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b8sm474528ooa.16.2021.07.06.06.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 06:11:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
To:     "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <MW2PR1901MB20287B190088EC2608094AF2A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c058d3c0-2977-00cc-fba8-2eb81b28095a@roeck-us.net>
Date:   Tue, 6 Jul 2021 06:11:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MW2PR1901MB20287B190088EC2608094AF2A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/6/21 6:01 AM, Balac, Arun Saravanan wrote:
> From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> 
> Add driver for MAX6620 Fan controller
> 
> Arun Saravanan Balachandran (2):
>    Add attributes in MAX6620 driver to retrieve fan fault status
>    Update MAX6620 driver as per linux code guidelines
> 
> Cumulus Networks (2):
>    Driver for MAX6620 Fan sensor
>    MAX6620 fix rpm calculation accuracy
>   
> Shuotian Cheng (1):
>    Update MAX6620 driver to support newer kernel version
> 
>   drivers/hwmon/Kconfig   |  10 +
>   drivers/hwmon/Makefile  |   1 +
>   drivers/hwmon/max6620.c | 625 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 636 insertions(+)
>   create mode 100644 drivers/hwmon/max6620.c
> 
> 
> base-commit: 303392fd5c160822bf778270b28ec5ea50cab2b4
> 
Please squash all patches into one, and please use
devm_hwmon_device_register_with_info to register the hardware
monitoring device.

Also please follow the guidelines in
Documentation/hwmon/submitting-patches.rst.

Thanks,
Guenter
