Return-Path: <SRS0=Sbn2=UU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8166C48BE3
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jun 2019 14:05:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E9322166E
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jun 2019 14:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ufcGyQ8L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfFUOFM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jun 2019 10:05:12 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40014 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFUOFL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jun 2019 10:05:11 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so3426164pgj.7
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jun 2019 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WT+vQeHQE4yW/jUkm8vPerLm68RVDFB0MWsQRtmPLeU=;
        b=ufcGyQ8LyndWi+RGn8xTeOFkagm1JwlS57FT2kU+fwDvnxnxLjEtZiKisTUQO/Uq7/
         NGjQ4N9dtXmhiqttesy88kFXgGfgkrvWbNbIeZ/Qkl0pxiYJAPOFsXDKOaZVH4yPU2Dz
         d4lsO0IMnksdgXMwTI+/UH023MEw+R5ScWfWSWEQwnm2bFzJet9D/4pbYFZ42FwCwG3/
         JRAO4cAt5r5Q61MYDnhL3gZiCR324uR5+KEI+1GaOpCjSepwErUym6mUhXVFTnn8L2yw
         NqUi8nIQKVhi9WpKLGtzs8kHA2V2GFENwli6rSllGAb9hl4X9GgV2b+NOl2XR3Ek8Sxc
         s1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WT+vQeHQE4yW/jUkm8vPerLm68RVDFB0MWsQRtmPLeU=;
        b=ZcwXJIiwsBcx4UrlBFtyuatu2Lw8GmkKzbxlH6+7Sg3s9Y+ROQZmhfRKHXGYInrm1Q
         LBdcuckuzFlj8KYm6skRyplX/K399PvPuR3OrjLN/lwRgOjcruTb044ADAeF/mkbPOJq
         fj6HurujBjxICi4sxCzv6OuHhT88knVC5Sv3yEI2svJIsyqZV+I+rIp1gNSQIUfPgv4+
         CitVhv0o1BlZqPn3l1hBlCiGFX1g15Ie4d7IxMNSzvDXhXCO4w/wHH1XFal9+QdOIJig
         twaITzXRYj8r0Rpo13BIa/tsIyonjQGGu0bsFHXPkExBnWD2IOg209untJZW/Lfeq9K4
         dOjw==
X-Gm-Message-State: APjAAAV0RJVZTvlbVY9UdVIm/PdCxYUpKXBmgLshR1bolIWpVHRFJLhx
        mPRpxNc8u5mDw3D/GTi3rNKOjZlN
X-Google-Smtp-Source: APXvYqyfHmLVPvtUZTMmtT7CDISG/SNIre1frirMdKAKzf5vzYEHYATnvChRjsf8XJy2dSDL5fmbrA==
X-Received: by 2002:a17:90a:f498:: with SMTP id bx24mr6979963pjb.91.1561125910665;
        Fri, 21 Jun 2019 07:05:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d19sm2490694pjs.22.2019.06.21.07.05.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:05:09 -0700 (PDT)
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
To:     Christian Schneider <cschneider@radiodata.biz>
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
 <20190617170422.GA13276@roeck-us.net>
 <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
 <dfa89854-8784-6d7a-9abe-06914791de32@radiodata.biz>
 <20190619195354.GA29429@roeck-us.net>
 <c97f4c9c-a374-8a25-27ee-698689f525ce@radiodata.biz>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1e7fafcf-3619-04ca-41f2-962c06636471@roeck-us.net>
Date:   Fri, 21 Jun 2019 07:05:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c97f4c9c-a374-8a25-27ee-698689f525ce@radiodata.biz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/21/19 1:30 AM, Christian Schneider wrote:
> Am 19.06.2019 um 20:53 schrieb Guenter Roeck:
>> On Wed, Jun 19, 2019 at 12:00:37PM +0200, Christian Schneider wrote:
>>> Ok, seems that moving that block, where fan_alarm_init is called down, isn't
>>> a problem on master.
>>> I need to use 4.9, cause we have an embedded device that needs patches, and
>>> they are only available for older kernels.
>>>
>>> In 4.9, fan_alarm_init() does fan_data->alarm = alarm;
>>> When fan_alarm_init() is called after
>>> devm_hwmon_device_register_with_groups(), then fan_data->alarm is not yet
>>> set, so the sysfs attribute is not created.
>>>
>>> when I move the fan_data->alarm = alarm; out of fan_alarm_init() before
>>> devm_hwmon_device_register_with_groups() and the fan_alarm_init() after,
>>> then it works, and doesn't have a race condition.
>>>
>>> On master, populating fan_data->alarm_gpio is done in
>>> gpio_fan_get_of_data(fan_data); as far as I understand, so moving the
>>> fan_alarm_init() block further down shouldn't be a problem.
>>>
>>> I don't know, how I can test this with master kernel. Unfortunately, the
>>> device, I'm using doesn't have a recent kernel. And on my normal (desktop)
>>> pc, I don't have a gpio fan.
>>> How should I proceed now?
>>>
>>
>> Essentially, we'll need two patches: One to move fan_alarm_init() after
>> devm_hwmon_device_register_with_groups(), and then the notification patch.
>> For the backport to v4.9, the first patch will have to be slightly modified:
>> The first part will a simple
>>     fan_data->alarm = pdata->alarm;
>> at the location where fan_alarm_init() is called now, the second part is to move
>> the call to fan_alarm_init() after devm_hwmon_device_register_with_groups().
>>
>> It is ok to test the result with your 4.9 based kernel; we'll just have to be
>> careful when reviewing the mainline patch.
>>
>> Thanks,
>> Guenter
> 
> Ok,
> it seems like it is working as expected now on my 4.9 kernel. No race-condition and notification is received.
> I will adopt the changes to mainline kernel, but not sure if I can make it today. Might be Monday, till I have the patch.
> 
No hurry.

Thanks,
Guenter
