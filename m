Return-Path: <SRS0=3EK7=6C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2FCC2BB1D
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Apr 2020 03:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C9122201
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Apr 2020 03:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ5SWHL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgDRDTG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 17 Apr 2020 23:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726164AbgDRDTF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 23:19:05 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25675C061A0C
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2020 20:19:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 2so2047567pgp.11
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2020 20:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=48satfkhKE7PS5N7uTwkrx0HdlssIYrnkbdyBp70N58=;
        b=KJ5SWHL7m2+UW6TmljmMtmw1R8ic5zA5HH5s4GkpDtWEgFoeYSbzwcLa2spZWK8j0G
         NHSn6rndL7fwXHJFEvR+owb41k9lQG3Ekf+ggc33yykOmDG6lymokSvetpUNDXhPAz/S
         dY9sU6Y+j2yd4qIsrWHknjwP5wCMFu/hQX4Is1ijdHnGrHtFda9iqj2zEzMFNaRIDEqs
         bPf710IyNEnsN2ECO7GKOfpDv+LPn8HrejlV/t0xwfcBspVIWGJFuv6QG7sZYqvSQgX6
         +WsuKHrf3XfbUNXe8ftObu9T7nbGnvsMi/KySifCWClV/jsAQ0bAFmVSm+bTAc1XCgr/
         L1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=48satfkhKE7PS5N7uTwkrx0HdlssIYrnkbdyBp70N58=;
        b=O4+mOcfjx2Y6Zg5Ab/mbsUf56WZOSWIJbIiMt6sQJchJbAj6OZx3xW0SfiTsCHaz6M
         7LLnuhdCTmy7micocnUg4hNTDbOsWGyfUSOSOBNbyY4auobSs3lpHcNH/If19xidfn7x
         l1+vVkDPnCW8TyqsHcDYaAa6htp/q+oy6oNwuWxc98FboOLH8R17WCrv47jYQLT3mxro
         VlumyxGOYmF9q6LAsOCgjciOHCpW6SwFxNl4cX5YPJf2z/Y3JX/IpOWen/eYulf6w72R
         p7LXM3rmn/koNQ6koL/YV7RBo7HdtGw7l/yjiOVfzWThLFNO/jTkrRNlcAnf9MXRlIqP
         VcXw==
X-Gm-Message-State: AGi0PuZkliiqEY1RA5q3MmA7XAaczOGMbwgtUKjM3ogXDp3HqXEHvrsV
        s5RqSBRQgibj39JTlrXO5htW9zgF
X-Google-Smtp-Source: APiQypLGy0wiG+DGoSOTkgwgulI1bR+FrIGsRMjFg3VtfX0u3gneW/u/1TvO39I77jAw1aXnj9CRYg==
X-Received: by 2002:a62:cdcc:: with SMTP id o195mr6476497pfg.323.1587179944441;
        Fri, 17 Apr 2020 20:19:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id na18sm7100744pjb.31.2020.04.17.20.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 20:19:03 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (jc42) Fix name to have no illegal characters
To:     Jean Delvare <jdelvare@suse.de>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org
References: <20200417092853.31206-1-s.hauer@pengutronix.de>
 <20200417115503.249d4d48@endymion> <20200417103255.GZ1694@pengutronix.de>
 <20200417154723.09bad8d9@endymion>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1d53da6e-13c9-63c3-0950-89f2a82ffc79@roeck-us.net>
Date:   Fri, 17 Apr 2020 20:19:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200417154723.09bad8d9@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/17/20 6:47 AM, Jean Delvare wrote:
> On Fri, 17 Apr 2020 12:32:55 +0200, Sascha Hauer wrote:
>> On Fri, Apr 17, 2020 at 11:55:03AM +0200, Jean Delvare wrote:
>>> On Fri, 17 Apr 2020 11:28:53 +0200, Sascha Hauer wrote:  
>>>> The jc42 driver passes I2C client's name as hwmon device name. In case
>>>> of device tree probed devices this ends up being part of the compatible
>>>> string, "jc-42.4-temp". This name contains hyphens and the hwmon core
>>>> doesn't like this:
>>>>
>>>> jc42 2-0018: hwmon: 'jc-42.4-temp' is not a valid name attribute, please fix
>>>>
>>>> This changes the name to "jc42" which doesn't have any illegal
>>>> characters.  
>>>
>>> I don't think "jc-42.4-temp" is a valid i2c client name either.  
>>
>> What makes the name invalid then? I am not aware of any constraints of
>> i2c client names.
> 
> Historically hwmon devices were i2c devices so libsensors would use
> the i2c client name as the device name, and still does as a fallback if
> memory serves. Therefore whatever rule applies to hwmon names would
> also apply to i2c names (in the context of hwmon devices) even though
> this is not enforced.
> 
>>> I believe this should be fixed at the of->i2c level, rather than the
>>> i2c->hwmon level.  
>>
>> Are you suggesting a character conversion from hyphens to underscores or
>> similar in the i2c core?
> 
> No, my point is that from a userspace perspective it shouldn't matter
> if the device comes from the OF tree or not. So the device name should
> be the same, i.e. the i2c client should be named "jc42" always. That's
> what happens for all other devices I checked, simply because it turns
> out that their OF compatible string is in the form
> <vendor_name>,<linux_i2c_client_name>, so when you strip the vendor
> name you get the right name directly.
> 
> My knowledge of the OF subsystem is fairly limited though, so I have no
> idea if it is possible to enforce a specific name like that at an early
> stage. The proper name can't be guessed by i2c-core, so ideally the
> conversion should be provided by the driver itself. I see that struct
> of_device_id has a "name" field, can it be used for that purpose? If
> not, I suppose the "data" field could be used for that.
> 
>>> Not sure how other drivers are dealing with that, it
>>> seems that in most cases the name part of the compatible string matches
>>> exactly the expected client name so no conversion is needed.  
>>
>> Other i2c hwmon drivers I found do not have any hyphens in their
>> compatible string, so they are at least not hit by this message.
> 
> I drew the same conclusion here, and your patch is definitely better
> than nothing as it fixes a real problem, however it is not prefect due
> to the reason explained above, plus the fact that it would break if the
> driver ever supports more than one device type (say JEDEC releases JC43
> tomorrow and we add support... you code forces the name to "jc42" even
> if the OF name was something other than "jc-42.4-temp").
> 

The driver should really list all supported devices (not the standard).
It could/should have a generic property name to match, but I have no idea
what that should be. There are existing compatible properties named
"jedec,ufs-1.1" and similar, so maybe the current compatible string
isn't as bad as I thought.

Still, we need to do something. I am open to suggestions.

Guenter
