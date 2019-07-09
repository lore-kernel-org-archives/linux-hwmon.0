Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85591C73C46
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:44:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D99C20861
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OboVNFBo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfGINoC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 09:44:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34100 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGINoB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 09:44:01 -0400
Received: by mail-pf1-f194.google.com with SMTP id b13so4723331pfo.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jul 2019 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JDvarV134Af8NIeblTRxR86t8yZ3bs1L703iYsgA6rE=;
        b=OboVNFBoGK8X4dB6FXEP5pbMMqxXZeWkOX+//332Ubdrbdq8XPeWrst5FF5tD/ApPQ
         omduEEPSTdSxPrMkHsmxi5s0L33lmCizhdYW8qoAL2MrNnwXwwUwB+Ba6AtINtJ3O+/Q
         iJ/UcUmkCUDnMkeu6voToboRK+ca506clay6XZ9f0I7sXM30ltBSV2Ly51blLQDY27Z5
         jMAR9zdi3fWTelRs/4PkeVYqZuJiidhib8a3YWN9qfXBrucfPWRvstSOB09rY+vdTyR1
         zgmouncGRlKLoj3yvGVJLS06OoQdFkjNieg/tvm0CVLCM2pISxuvOVxPARJ17+Ytw4rJ
         12Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JDvarV134Af8NIeblTRxR86t8yZ3bs1L703iYsgA6rE=;
        b=eyuQHGwR+CvHH7nDvEWUbn/Z1RD1AdfF6VzJxMAUvhlCqmc+Y8acdsUNDOCE0HWxdp
         GlJ0c9PlaPyb6AMPRA+zNT6Tl4kDclDgJ38pqkes9esfxQjbO3qOGQ7RINmLuy8FY2Ox
         i26D5etKJG8jsjTkYsZJP57mn4J4WDPKhjx/Cxi+UrC3SSlDRRrY2jhJcb2yWWhVKWeM
         kdcpoTrAK7y7IG3TKzA6QtVu1dp2vUAwyPDbS9cxWrh0Eg53aeYXaZL6ntLNNCQeFl6b
         81jhPGp63a9Vxc4hhuBxihJ1EXmJ5vVctuSb81/dCbfPox9E7BKxzjPlVcsILG1RGn77
         QvfA==
X-Gm-Message-State: APjAAAUmpqbhIy5ihmE365oA/PWSpbQtJTz6lyHwxRdIBg1lzIDddNlA
        jV9ldW5ttP0L6uWP3UqhEg6j38NM
X-Google-Smtp-Source: APXvYqxCmmYhAbhYqipo9XQgPdiQFgAopPweBQX38w3SRUBy1NbOCbPyfZbDhtaOBbjSm5VFPasDWQ==
X-Received: by 2002:a17:90a:71ca:: with SMTP id m10mr105426pjs.27.1562679840890;
        Tue, 09 Jul 2019 06:44:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g2sm39762980pfb.95.2019.07.09.06.43.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:44:00 -0700 (PDT)
Subject: Re: [PATCH v1 0/5] Help with lm75.c changes
To:     Iker Perez <iker.perez@codethink.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <48ef8bb0-b420-24a4-16a2-c8d6e5d30eee@roeck-us.net>
Date:   Tue, 9 Jul 2019 06:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709095052.7964-1-iker.perez@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 7/9/19 2:50 AM, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> Hello,
> 
> I have been working in the lm75.c driver, trying to add a variable update_time
> to the tmp75b device.
> 
> I am not very confident about, if what I am doing and how I am doing it is the
> best way it could be done. For that reason, I decided to send my current
> changes, so maybe I could be helped and my code revised.
> 
> I decided to separate my all my changes in probably more than needed commits
> because I thought that it would b easier to understand at first place. After
> the feedback and my changes are ready to submit I will squash the ones that are
> related between them and the patch series will be much shorter.
> 
> Thanks in advance for your help,
> 

Looking through your patch series, I can't help thinking that you don't have
much experience writing kernel drivers. I am open to coaching you through this,
but I have to ask: Do you have an actual use case ? This is not something
we'll want to do as a coding exercise, since it will add a non-trivial
amount of code to the kernel.

Thanks,
Guenter

> Regards,
> 
> Iker
> 
> Iker Perez del Palomar Sustatxa (5):
>    hwmon: (lm75) Add kind field to struct lm75_data
>    hwmon: (lm75) Include hwmon_chip in the permitted types to be writen
>    hwmon: (lm75) Give write permission to hwmon_chip_update_interval
>    hwmon: (lm75) Create function from code to write into registers
>    First approach to sample time writing method
> 
>   drivers/hwmon/lm75.c | 166 +++++++++++++++++++++++++++++++++------------------
>   1 file changed, 108 insertions(+), 58 deletions(-)
> 

