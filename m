Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16CDC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 17 Oct 2021 05:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DA8461050
	for <linux-hwmon@archiver.kernel.org>; Sun, 17 Oct 2021 05:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244925AbhJQFun (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 17 Oct 2021 01:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbhJQFun (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 17 Oct 2021 01:50:43 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E4CC061765
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Oct 2021 22:48:33 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n64so19678158oih.2
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Oct 2021 22:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IYNJwKo+ldXH/7Ct+zbhGFKxQ+idkmkqDQ6nfYj6o8M=;
        b=BtC7hmhcrXV5XiVQgGeG/CpDi/izRj26lmIT25qw1pqwB2HR6Aaiamr2MEJRMgWSfz
         rB5aUMGEUmqvxR37k2nPKbnFlArw5qHEwVlx30BQIue76pnlmU+wIvh/4C48j+4y1EKQ
         6/XAenpsosbn7knxoUUdqfKsmsojRO/aVXew5hLpFnDYoAqwqi1LGcPONYjKzaR5J79S
         nCWe1MXdNxGr3v04IF0jd0H9vZdy8d9g9DjC+AQXlI7SUcx59v/slWAfSbgYXzmrDPpo
         RPp9IEVvLuBLcbv26INqr/KoT1OSBhf1BW2TBG8E93Ft02ZODC9RuSs5uXfFRMJUjBNJ
         3wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IYNJwKo+ldXH/7Ct+zbhGFKxQ+idkmkqDQ6nfYj6o8M=;
        b=0bVPlBiXLMeIrd68dBzm7IaSgpl2mIp6oUN7jz7ohYIpFIMQV08603Sa8rmYNrPZsy
         0nZUlRutoV+TBWQfDAPbKZ54K20SS0Zhw6zyZHfdF0EjN6ZB7b48nbcXoAL/T9FPPCAY
         OTUnJq8UW/dvraaVpAv5fFaiuMuM3da1Xc1toY1TQOxqO8FNfnf7m1tGHQiMVps3RfJC
         obYf2Xu0y6L58gOuu0EGaPEssfbFS4Nottg6SCU9VUbO7mcjLFn+bN/J06+PBlcW1X4v
         naRnrweKpvmSxTuGNq4JfkMGXGNSEPyr1Whaa2u3sLZyFxcqOY3QxsYhS1YAtOepKp11
         EMIA==
X-Gm-Message-State: AOAM530tncx4JrkTvvWhpDz6/8JF3uPf4BUYqmhX3+YbtdFgD69VeP/6
        dhjvk+YR9R57yK5vpDaLK24aFI9XmTs=
X-Google-Smtp-Source: ABdhPJx8HLy/x+qn1OBkN6WB0XLQaIbX4hqtyZzJDe+uzRb7E+CNmB8UDILUb1vE/VgrbI1mHaJyVA==
X-Received: by 2002:a54:488c:: with SMTP id r12mr15331628oic.88.1634449712963;
        Sat, 16 Oct 2021 22:48:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14sm1904405oop.8.2021.10.16.22.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 22:48:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <20211013185113.GA3336263@roeck-us.net>
 <747f759b-22df-3f0f-f2a0-75ff56468853@gmx.de>
 <5b0f66d5-f8b8-6bd9-ecdf-dfc090ee8f1e@roeck-us.net>
 <2d6c8fd3-2ad6-5fc7-5856-14852e817fab@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <22cd1936-7380-2c05-4b04-8a49008e0c78@roeck-us.net>
Date:   Sat, 16 Oct 2021 22:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2d6c8fd3-2ad6-5fc7-5856-14852e817fab@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/16/21 3:09 PM, Armin Wolf wrote:
> Am 17.10.21 um 00:00 schrieb Guenter Roeck:
>> On 10/16/21 2:25 PM, Armin Wolf wrote:
>>> Am 13.10.21 um 20:51 schrieb Guenter Roeck:
>>>> On Mon, Sep 27, 2021 at 12:10:43AM +0200, W_Armin@gmx.de wrote:
>>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>>
>>>>> The nominal speed of each fan can be obtained with
>>>>> i8k_get_fan_nominal_speed(), however the result is not available
>>>>> from userspace.
>>>>> Change that by adding fanX_min, fanX_max and fanX_target attributes.
>>>>> All are RO since fan control happens over pwm.
>>>>>
>>>>> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
>>>>>
>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>>> Reviewed-by: Pali Rohár <pali@kernel.org>
>>>> Applied.
>>>>
>>
>> [ ... ]
>>
>>> After looking at hwmon-next today, i noticed that this patch was
>>> apparently removed.
>>> Is there a issue with this patch causing the revert?
>>
>> Not that I recall. Looks like I messed up. Sorry, and thanks for
>> noticing.
>> I added it back in.
>>
>> Guenter
> It seems its not the only patch missing, i cant find the following
> patches anymore:
> 
> [PATCH v2] hwmon: acpi_power_meter: Use acpi_bus_get_acpi_device()
> [PATCH v2 04/20 hwmon: max31722: Warn about failure to put device in
> stand-by in .remove()
> 
You are right. I added them back in. Must have had a blackout or something :-(.

Thanks a lot for checking!

Guenter
