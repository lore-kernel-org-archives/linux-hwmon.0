Return-Path: <SRS0=qJgv=7K=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1C1C433E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 May 2020 13:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84F9220814
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 May 2020 13:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSWEGxPp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390759AbgE1Nwm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 May 2020 09:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390607AbgE1Nwk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 May 2020 09:52:40 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5D7C05BD1E
        for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2020 06:52:40 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id i17so3080575pli.13
        for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2020 06:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pp9kPkqJMMlBsBgIGzU3Lpst7wk+DHGOf1ntcJqLZEw=;
        b=CSWEGxPpnp12Ls4VH0at1FIvJLCz91+OEm+ciKWynjZZ1abl0pDKCxfEA1x/JPs+Vo
         EHJYUceE2ahXRJN1THu8Vsn0B0YUpDHvztEoUGOpjYnPD4HdjV4N2WLecNun8CSypb4W
         TBJHtaz6fZWKzDCS62WWvvZxj+YpwfCOty10q7jI5yv7B/NFRs7n8ay0ojk1g3hcURIS
         z4plfL4VgfcQcgEj4B/cuSvor9BsGO9mDn44M16SEa6QXiudvYEGC6oYS2cg/gA9zhQY
         RZOYBGPeSQ4/QMondAApShGywxDke9LWb0mifbfSzukojVQevYilOTTZNKffmOUMnPxZ
         iL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Pp9kPkqJMMlBsBgIGzU3Lpst7wk+DHGOf1ntcJqLZEw=;
        b=lMv/1Zgj2650b3ZPbm8l4gTp7Hzu0GHGbJHGoCutMnx/dt3KlktR8Js/fMp9ksf27E
         vpGnZSMsppHGCiwoPN34Jv2tVr6J2nskaFeGAE06bgoZKQ5tsHtUcy0ojbWYo6Jk3QAk
         nlalDQC2RQNU1sob6of5VbzIyv79nBGvLcfjTTe+gsl2BX8bgAXskDjXc3eCyaoLUKl+
         lHS7Wlh4G84Y+NK4Mc31bk0dIbuih9bp0iNHEGmueEmeaBy+ePaWs0NNbqL5Q6CQkNkp
         l7PPKn4C3UnZOO0df/OSI296cuc8cnEZmw4ANh+HgUUgJ4eqOT1MNFPq94afJ04Ez/fT
         hlzA==
X-Gm-Message-State: AOAM531LdNpaNDvIdNqLOSh3MpzYB6QMySSvUfLnX/pbpG5m7IzDkc3I
        Ti5trh7U5XanDTJaliUzV2w=
X-Google-Smtp-Source: ABdhPJwBpzqojltUNA5bMGSYTIBAVdxtKOzhOYTMlEIJrqicjV3o0hcNW5aMT6ER1oVlmQOrbe9Xkg==
X-Received: by 2002:a17:90a:e984:: with SMTP id v4mr3786337pjy.221.1590673959741;
        Thu, 28 May 2020 06:52:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10sm4884615pfa.166.2020.05.28.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 06:52:39 -0700 (PDT)
Subject: Re: Questions about adt7470 driver
To:     Jean Delvare <jdelvare@suse.de>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     linux-hwmon@vger.kernel.org,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Axel Lin <axel.lin@ingics.com>
References: <20200526112259.4356fb2f@endymion>
 <20200527224252.GB89212@roeck-us.net> <20200527233334.GL252930@magnolia>
 <20200528120256.63023d63@endymion>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4ddb3fb5-8461-8269-5fa1-ca8421342903@roeck-us.net>
Date:   Thu, 28 May 2020 06:52:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528120256.63023d63@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/28/20 3:02 AM, Jean Delvare wrote:
> On Wed, 27 May 2020 16:33:34 -0700, Darrick J. Wong wrote:
>> On Wed, May 27, 2020 at 03:42:52PM -0700, Guenter Roeck wrote:
>>> On Tue, May 26, 2020 at 11:22:59AM +0200, Jean Delvare wrote:  
>>>> Hi all,
>>>>
>>>> In the context of bug #207771, I got to look into the adt7470 driver.
>>>> I'm slowing understanding the logic of the background temperature
>>>> registers update thread, still there are 2 things I do not understand:
>>>>
>>>> 1* Function adt7470_read_temperatures() sets data->num_temp_sensors,
>>>> however this value seems to be only used to limit the wait time of
>>>> future calls to the same function. In the general update function we
>>>> still read ALL temperature sensors regardless of its value:
>>>>
>>>> 		for (i = 0; i < ADT7470_TEMP_COUNT; i++)
>>>> 			data->temp[i] = i2c_smbus_read_byte_data(client,
>>>> 						ADT7470_TEMP_REG(i));
>>>>
>>>> Shouldn't this loop be bounded with data->num_temp_sensors instead of
>>>> ADT7470_TEMP_COUNT?
>>>>   
>>> Guess so.
>>>   
>>>> 2* Function adt7470_read_temperatures() also sets
>>>> data->temperatures_probed to 1, and this boolean is then used to skip
>>>> further calls to that function. But do we really need a separate
>>>> variable for this, given that num_temp_sensors >= 0 matches the same
>>>> condition as far as I can see?
>>>
>>> Agreed. On the other side, those are optimizations. I am not really sure
>>> if that driver is worth spending time on, given the age of the chip.
> 
> Well it's still in use and apparently at least one user cares enough to
> report a bug and propose a candidate fix.
> 
... but at the same time that user doesn't have any temperature sensors
installed and won't be able to test any changes.

>> I /think/ the answer to both questions is yes, but I don't have the
>> hardware anymore so I have no way to QA that... :/
> 
> Thanks for both of you for your answers.
> 
> Darrick, I have 3 more questions for you if you remember...
> 
> 3* I understand that the temperatures need to be read periodically in
> order for automatic fan speed control to work. What I do not understand
> is why you bother switching PWM outputs to manual mode each time? What
> bad would happen if we did not do that? I see nothing in the datasheet
> justifying it.
> 
> 4* Why are you calling msleep_interruptible() in
> adt7470_read_temperatures() to wait for the temperature conversions? We
> return -EAGAIN if that happens, but then ignore that error code, and we
> log a cryptic error message. Do I understand correctly that the only
> case where this should happen is when the user unloads the kernel
> driver, in which case we do not care about having been interrupted? I
> can't actually get the error message to be logged when rmmod'ing the
> module so I don't know what it would take to trigger it.
> 

Not sure if rmmod generates a signal. In theory you could possibly
keep writing -1 into the num_temp_sensors attribute, execute the
sensors command (or just read a temperature), and interrupt the
sequence.

> 5* Is there any reason why the update thread is being started
> unconditionally? As I understand it, it is only needed if at least one
> PWM output is configured in automatic mode, which (I think) is not the
> default. It is odd that the bug reporter hits a problem with the
> polling thread when they are not using automatic fan speed control in
> the first place so they do not need the polling thread to run. I was
> wondering if it would be possible to start and stop the polling thread
> depending on whether automatic PWM is enabled or not.
>


The datasheet says nothing about the need to run such a thread for
automatic mode either. As I understand it, the chip is supposed to
repeat temperature measurements automatically once configuration
register 1 bit 7 is set. Of course that is difficult if not
impossible to confirm without access to the chip.

Guenter
