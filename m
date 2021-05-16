Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614CCC433ED
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 May 2021 14:08:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35CD3610A1
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 May 2021 14:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhEPOKG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 May 2021 10:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhEPOKF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 May 2021 10:10:05 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE586C061573
        for <linux-hwmon@vger.kernel.org>; Sun, 16 May 2021 07:08:49 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id 76so3393354qkn.13
        for <linux-hwmon@vger.kernel.org>; Sun, 16 May 2021 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ipdadgSoSoRaDKjyvzvTBn2P8P8C8BXyHr7fU/FxeFI=;
        b=iUA8xO/FoamjhQ7veW50osgUKceHM6K/vnVUGG7UshQiC5RyBfRJGYMhiba806TFJ/
         QtxR79fdHkQva+vcPHbz4PbTUdJV4sFy95YJUgtCxZ08ZU8bP56Cl4dZTXXbjfxOpYJF
         Cyvjz5hpCdayU4Rnfs1X3vhm0NRd6FpOwiKw890gW2G+zk8ASbQFo7NrxyfORACiBgLA
         v+wYlHMKuAM6iWx96TuSbToUd+cL3H7jSzYZcTnjLorvfShqqa6pe+SEAXpf2epU6CJM
         IJWxNXNcKsIPFDMGG5ZQzqgWroKc0w5XaekkTRQZO2jgI5LpJf6TKcO4GydifBkz784r
         cDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ipdadgSoSoRaDKjyvzvTBn2P8P8C8BXyHr7fU/FxeFI=;
        b=ZB2thodbDUtt324D6miD6x4JFZy135wjzYMtZGxIc3Etw6p7AzL8SaGG3gHcU/0bzh
         T5PuYlBcwRalwEn7CDFj5rf6n2LOcNI25aEEOlCCl43OxCXQy6lLadQGXdoDWQm4pUOs
         2OTm2rz7srXiut31aBudgWBGOE8vP5E5mFSqaV9bV6OXBAlV7ZIM2ZxpirA4G1mvNgFB
         DvspT+hi6afSQdL7DTVEurdtFPX1mNNMJ0ft3sysQu8b0QomKwz4V6GlRsWeITJCvlm3
         M+6y6i9uyIInJLXA1vaLQSwSaXSyX7QF2urNJtq8q09wlyQlcACQTnJRjiOkX2t3rvaG
         A3iw==
X-Gm-Message-State: AOAM5309Plaay2+EGJ7HbKe6+7MU/xe1OcRnqK+imiiADLJcnTljJ0l4
        zuL7BBWl+QSBf0Wg69V5OAgCm3XkzCk=
X-Google-Smtp-Source: ABdhPJxouRZiWYPErDev4IRdDqahGz+G+CymKh2b4MWdJEQxzAtuop1WFL3+MS6yIpk8fY4wsvEakQ==
X-Received: by 2002:a37:684d:: with SMTP id d74mr24605997qkc.151.1621174128977;
        Sun, 16 May 2021 07:08:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t128sm8321101qkh.50.2021.05.16.07.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 07:08:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC 0/3] hwmon: (dell-smm-hwmon) Use platform device
To:     W_Armin@gmx.de, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210515183409.682-1-W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ef812119-130f-1ecf-5b42-951dd7a2ac65@roeck-us.net>
Date:   Sun, 16 May 2021 07:08:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515183409.682-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/15/21 11:34 AM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use a platform device in order to use devres functions.
> Also a future rewrite of the driver requieres a device.
> 
> Are the patches for introducing the platform driver/device
> ok for serving as the basis for the conversion to
> hwmon_device_register_with_info()?
> 

The final result looks good. I would suggest though to move
everything except the DMI information check and the SMM Dell
signature from the init function to the probe function in
patch 1/3, not in patch 3/3.

> They work on my Dell Latitude C600 just fine, but i whould
> appreciate someone testing the code on another model too.
> 

Yes, it would be great to get some additional testing.

Thanks,
Guenter

> Armin Wolf (3):
>    hwmon: (dell-smm-hwmon) Use platform device
>    hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
>    hwmon: (dell-smm-hwmon) Move variables into a driver private data
>      structure
> 
>   drivers/hwmon/dell-smm-hwmon.c | 392 ++++++++++++++++++---------------
>   1 file changed, 210 insertions(+), 182 deletions(-)
> 
> --
> 2.20.1
> 

