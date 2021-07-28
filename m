Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6958C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2FC76101B
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhG1VHi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhG1VHh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:07:37 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32B2C061757
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 14:07:35 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id h10so2404686qth.5
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jul 2021 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rSa9/LmcXx63TD/jf3jmKMV0aB/l77DW4pV055DYF9U=;
        b=GFtWi2u7iNlwfrOcold7Uf2/9S0Joj/K6U7DvEbYNo8mXpVamz5QnldGb0c/+ISNQb
         EXxw1w+o8Zfw4P7Rn/iN7pRNVH1MASGs5bpaRWuDWW9snpJRdzYjhtrHs+Z2ly9+xDUn
         BSlVEdQIDYOXG5deHVbLjaeI8/cfy93PywxKWZrUi0j4P8Rhdi7uJyxc9qI3XojzGb5z
         HrA3H/xfODuoRkJYorsdtYYx2NljJ04cMt3weo4yPLGN5GECX5Vx6gGZ2Ekvr5AYO3OH
         jTZZnxy3H28w75WeupZ+0/cBQuNp1eKJylMyIyIapJBPp4o91udPIp73T5mdG4nVZRJ2
         zoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rSa9/LmcXx63TD/jf3jmKMV0aB/l77DW4pV055DYF9U=;
        b=TD81vk4Sz7jdUykriosTbY108DweZbVAgUxFQ3XCZv1Fjyubu/k93wuGM874UqQldi
         Mnw1uHJ4iAdp/mOQYjwTa1LQ5JhXtpgdgWqkYeoSCyKtl7Y3JBCJ2/Z2QTrriRWLx+2o
         3f0XxnCvtUh+2Z1PpYIfz0Ee+/cQeHABQvsjt657WCIjaKh7ywNuzLWmZKorNAQ9x5x3
         dhZnWOb6BgYYX+Ij/nRn3T3bgFzeziiHokyDJKWQAhT5ymfk9e+2NmhD1RT7ak3FfvBE
         izNIUPkHSrxCTEJVy4h8jnyw4ct8Wy3hq2I1H2iR1zEVTemyMZyNzPnXlN3U5I15MedK
         Pyiw==
X-Gm-Message-State: AOAM533n66Jw8gpI3TUZyko1nPDxMZ0JiVTxxAissy/Ws71OWKw/iMmD
        tkSXKrZXfDHCiCFFJiGaSG6ZwoxYSLE=
X-Google-Smtp-Source: ABdhPJzTWM6cDwdw7iYZA6cEGawNo3gz2GGQSjX1WMzAnsBW7AJjZxQD+VuRSi7ZDVOlxO08esXH3A==
X-Received: by 2002:ac8:5fc5:: with SMTP id k5mr1389005qta.327.1627506454492;
        Wed, 28 Jul 2021 14:07:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z23sm426122qts.96.2021.07.28.14.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 14:07:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     W_Armin@gmx.de, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
Date:   Wed, 28 Jul 2021 14:07:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728205142.8959-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> This patch series is converting the dell-smm-hwmon driver
> to the new hwmon registration API. In order to do so,
> it introduces a platform device in the first patch, and
> applies some optimisations in the next three patches.
> The switch to the new hwmon registration API is done in
> the next patch. The last patch is fixing a small bug.
> 
> The caching of the fan/temp values was modified to better fit
> the new hwmon API.
> 
> The patches work fine for my Dell Latitude C600, but i whould
> appreciate someone testing the code on another model too.
> 
> Changes in v6:
> - Make pwm1_enable permissions write-only

Sorry, guess I am missing something. Why ?

Guenter

> - Do not test fan speed in dell_smm_is_visible()
> 
> Changes in v5:
> - Fix checkpatch warning after patch 5/6
> - Hide fanX_label if fan type calls are disallowed
> 
> Changes in v4:
> - Make fan detection behave like before patch 5/6
> - Update coverletter title
> 
> Changes in v3:
> - Update description of patch 1/6 and remove empty change
> - Let pwm1_enable remain write-only
> - Include a small bugfix
> 
> Changes in v2:
> - Fix coverletter title
> - Update docs regarding pwm1_enable
> 
> Armin Wolf (6):
>    hwmon: (dell-smm-hwmon) Use platform device
>    hwmon: (dell-smm-hwmon) Mark functions as __init
>    hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
>    hwmon: (dell-smm-hwmon) Move variables into a driver private data
>      structure
>    hwmon: (dell-smm-hwmon) Convert to
>      devm_hwmon_device_register_with_info()
>    hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
> 
>   drivers/hwmon/dell-smm-hwmon.c | 847 ++++++++++++++++-----------------
>   1 file changed, 419 insertions(+), 428 deletions(-)
> 
> --
> 2.20.1
> 

