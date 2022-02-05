Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE54FC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 17:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357936AbiBERz7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 12:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiBERz7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 12:55:59 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401F8C061348;
        Sat,  5 Feb 2022 09:55:58 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso8669057oop.0;
        Sat, 05 Feb 2022 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3Gxs8xXpvnxLnMLrJcMW4cpi6sp32phq+ZGNRuTkOVg=;
        b=jnzgezbgaxOl2vqP4641tuJAkbmNKS2X4fjQ7dKPfjhL30+JcwFlhjZcfMKt9gxfSu
         jTxI2Ui8kCvI3lfkujxpdIH4gf2nkKO/0Lf6J4UJrtO8ujN9gV1H9L/iiwO58wtcJYuG
         7q7Nv1HRvA23t3VZFenvn3g3FLxtDRltnjisgcsMY5B1D2zTB1gsppc8qfllnwdfyU/h
         htoPPV6idZGETiJedflTHWBEocOH+OjUtSeH26VvhcuZyCnnZhGoO04+jTjnSpAmv3mC
         Foqqh24gZQyGEK8D6yirfDaL+Fdb6JUfXRNMXozZ+056g0lQycbv2daxFyY9PBnr/0rf
         5xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3Gxs8xXpvnxLnMLrJcMW4cpi6sp32phq+ZGNRuTkOVg=;
        b=ZKws7ahWTgDkOY0qNc9eDvZNtFLhcF4iapaKyDEgrwPsUGh4H2ABNS+iYY2Y5wsEah
         hbAGwnBX2ZuxaM6+C2j6lwghostTznaGL/XgsjP4Jt+dE88ua/cbpn1zn9veAuldvKXU
         hr3WFkhOrxu19hFB0NZPeCqt50thtHotBuPr2OC5gDYvYb6XQLKM3Q3C0xwylXuCt8wz
         nccunRfZOpdtDR2Gc+q6iDnBcppZor9LAZNM2MbHMJUNBn0+0Xap3910GJZ0sTru/cKH
         g+25SAWdK187MflMwtAwNwqQHNCefvjXVn2f/dus5GqS5ScYixyk5/I3Or6+E9sbUzx9
         KaMA==
X-Gm-Message-State: AOAM532hs9r+Juehw1d3mpab0v9K3o5pPT/uEgnfQiIWnfT2Ssht5Cbw
        cPp9i7MEHYb71vsW9xfLYu+nkNQbVpJwPg==
X-Google-Smtp-Source: ABdhPJwn4wiwvH27+Y0xtqktq2n1H1SC31AGA0kxcZM/4TjI8f1FkFFnEww2hCWtqJTMlLtn+j8Aww==
X-Received: by 2002:a05:6870:a556:: with SMTP id p22mr1849633oal.19.1644083757482;
        Sat, 05 Feb 2022 09:55:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y19sm2123217oti.49.2022.02.05.09.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 09:55:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <334d923b-aaea-897f-1b80-d19a06be1383@roeck-us.net>
Date:   Sat, 5 Feb 2022 09:55:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix a typo in asus_ec_probe()
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220205092015.GA612@kili>
 <CAB95QAS8LxMeWGFqZ3MGHBBxxBafz3w9L1GxxdP16XjZKLVAuw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAB95QAS8LxMeWGFqZ3MGHBBxxBafz3w9L1GxxdP16XjZKLVAuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/5/22 01:59, Eugene Shalygin wrote:
> On Sat, 5 Feb 2022 at 10:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> There is no such struct as "asus_ec_sensors", it was supposed to be
>> "ec_sensors_data".  This typo does not affect either build or runtime.
> 
> Thank you for the fix! Perhaps you could also replace the sizeof
> argument below with *state to make the compiler check the declaration
> type?
> 

The weirdness is coming from the fact that the probe function is
really a shim and all work is done in configure_sensor_setup().
A more conventional implementation would not have that separate
function. Changing the above won't change that and on its own adds
little value. I applied the patch as-is.

Guenter
