Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191DBC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 22:01:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E585C60F46
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 22:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244687AbhJPWDJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Oct 2021 18:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244675AbhJPWDH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Oct 2021 18:03:07 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC0CC061765
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Oct 2021 15:00:59 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so721850otr.7
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Oct 2021 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=luFS3aabC+IX3l5slrh73+qpSHy6gLim/4fXNxioOcQ=;
        b=nL8882+hbgJCnRKgg5baZSNHVGn7B9P84BTeI+PgC8bq0CzKm44lL04Y+vhCEtP44r
         rhZtpzO58tAx2QantbbQfmusUIIPxKwPpdZ61zvuSNQHByQHA9LJsFSCcAI+gJwLKm9W
         M4yHVWjl7ISoMMrTmJATxGciWd3iNPpI/2AyPHsBGHJzsvZ0jiuNV/Mqk7Girmw38J44
         8ZpcfKJJ2CLN9vIQ6U6GwbV7lKVjgKUZzB+nOcJtRoGMwUuuYuW+AEDBQ8+d7qJCuY3e
         l5atCp2Y7G4hIDVvjdjqQ9TJFkfX6heEKnoBk2DJhlwbMEAfbgp2GWT224EJie6Qj0uQ
         NIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=luFS3aabC+IX3l5slrh73+qpSHy6gLim/4fXNxioOcQ=;
        b=KSy7Db06fSaysZ92dmQyosBzGRP95vkhIjJiBK8UL2dU+zjtU9lXd870Aw+CJnChbb
         lmlI2KOXhvPrECrG8DSzvLEW/bT75imNh4arkT19LGBXDNDAfB7ezo/VAnwBw3V1SC/9
         lX3umMezH7416H+bCMXfcx9ZoRWLPAzZvSMuLlWYCWXE4rqX8SzbB1sdssGmxjUW8EIG
         1TUUc6UwH2s/eLQ3Mkqz3dSpl9GrEnIHzGgp+vRXsbm+6CQCiafVNTmWR6nN5qZ15t3h
         ZwdkmGmIkrN9WchY94E3RRfg5yGV0iaOMtw8jF2+/g3/gnBpFiSbUXvnIoAdKE+BE30F
         BSBg==
X-Gm-Message-State: AOAM532rdd1XBuJZLbCvr7hDEmWyP/4uEgn1DWPDOzXTeYgPB++cF6s0
        m/oUl4h2BXbxAJlmo6d2OyGzZESchew=
X-Google-Smtp-Source: ABdhPJzYj3r3HIhCiLUMkGGahuSoM8EgE4HcNwrOySMfpOqmZbdzbjlO+MLcgluRQQqTBdbPbridEg==
X-Received: by 2002:a9d:4605:: with SMTP id y5mr15304596ote.359.1634421658514;
        Sat, 16 Oct 2021 15:00:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a15sm2241269oiw.53.2021.10.16.15.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 15:00:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <20211013185113.GA3336263@roeck-us.net>
 <747f759b-22df-3f0f-f2a0-75ff56468853@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5b0f66d5-f8b8-6bd9-ecdf-dfc090ee8f1e@roeck-us.net>
Date:   Sat, 16 Oct 2021 15:00:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <747f759b-22df-3f0f-f2a0-75ff56468853@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/16/21 2:25 PM, Armin Wolf wrote:
> Am 13.10.21 um 20:51 schrieb Guenter Roeck:
>> On Mon, Sep 27, 2021 at 12:10:43AM +0200, W_Armin@gmx.de wrote:
>>> From: Armin Wolf <W_Armin@gmx.de>
>>>
>>> The nominal speed of each fan can be obtained with
>>> i8k_get_fan_nominal_speed(), however the result is not available
>>> from userspace.
>>> Change that by adding fanX_min, fanX_max and fanX_target attributes.
>>> All are RO since fan control happens over pwm.
>>>
>>> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
>>>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> Reviewed-by: Pali Rohár <pali@kernel.org>
>> Applied.
>>

[ ... ]

> After looking at hwmon-next today, i noticed that this patch was
> apparently removed.
> Is there a issue with this patch causing the revert?

Not that I recall. Looks like I messed up. Sorry, and thanks for noticing.
I added it back in.

Guenter
