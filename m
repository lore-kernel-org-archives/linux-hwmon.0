Return-Path: <SRS0=yUAk=RQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F10C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 16:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 573042075C
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 16:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWlzeFcD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfCMQVR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:21:17 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:35329 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfCMQVQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 12:21:16 -0400
Received: by mail-pf1-f179.google.com with SMTP id j5so1742076pfa.2
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Mar 2019 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=d0pLk5UOTb5FRYg7kBQoZMcpe8le+VUKJFjyvNARKHc=;
        b=aWlzeFcDiKhzqwRxQUQ5gzCppZURcLSH1hQu39Wjv904SD10gIytCkGTz69Xn9WR4n
         320mcqonOxvUhNC7BFpHmM7A4VxS83h6vNZqK0bh/gdxXVkz727nP1MNporHNG0lo4MM
         ivIAvDxsrBJWwabscbiHiHERnM2LWbYrcR3QWfmnijjofntrfnn10xd9+LwmRZ4mrvaF
         SJx55RRmwbWele/+wkPV/yLXCBI5Gtyd0ezFtbrLpdprA6ANWrSX62jQHoWH5qUDvFFW
         be0bQUs59Va0n1MemqYSR02aNENnHyXEDIDP1W7SWAHkmXu1zf/iOj6gN8/2M3MpAj1T
         QM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=d0pLk5UOTb5FRYg7kBQoZMcpe8le+VUKJFjyvNARKHc=;
        b=IU2S6wT86jzH0Q8KTVuFouOmhVMVGZ1XlxYn+6leVNAUeKK851LCFov5jjTm6Wcbxz
         eEmzKBIsPHYgvMgb/JQ1xsVHgzGOr4xSaZBf+LIBFBwaiKjlPnivRvZGykonZOXoVeNp
         w3j5r6odn5+2zrlHUngnv6oqie82y2/g2j9FBzB/3zDy+yeFUH6cEJNcYOw4snh7axwW
         MkLCKMAtZAJvrCFQwnShxsmDerO27xOxooP0C5Riy2kVRXceK8ydmH95dL27d6OWRmSo
         WtRsXeRnJW5P0KvHaWZGovI+IDoPI9eIhDN8fpYXUmUzJMK5lIlj+9V24DiolpucqAlP
         teig==
X-Gm-Message-State: APjAAAWGBL5un+mBKZUp0dQjYlY76pVTEBX4XyPH9UUyRT/oXvBKLymd
        pO0S2DSItuQ1oMYAzQLUmXU=
X-Google-Smtp-Source: APXvYqxi2A4d+uvDK0wYOZHbFBR5QMbTitfkPlj3i7PlmwO32PRYyqX0j0tIg1bFbgJIdSSzJMWrJQ==
X-Received: by 2002:a63:4343:: with SMTP id q64mr1339753pga.105.1552494075474;
        Wed, 13 Mar 2019 09:21:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i79sm21864063pfj.28.2019.03.13.09.21.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Mar 2019 09:21:14 -0700 (PDT)
Date:   Wed, 13 Mar 2019 09:21:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190313162113.GA15451@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190313151941.GA7122@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 13, 2019 at 08:19:41AM -0700, Guenter Roeck wrote:
> On Wed, Mar 13, 2019 at 12:31:53PM +0000, Grönke, Christian wrote:
> > Hello all,
> > 
> > I am currently working on a hwmon/pmbus driver for a PMBus capable 3Y Power/FSP power supply (YH5301-1EAR).
> > 
> > The datasheet has limited information. But with the help of some online sources, other datasheets from the vendor and the pmbus sub-system I could figure out most of it.
> > 
> > However, I did run in some troubles with the VOUT values. To my understanding (and from what I could validate) the device does encode _all_ values as "LINEAR11". Meaning all values have a mantissa of 11 bit and the exponent in the other 5 bits of the register word. This causes some troubles with the read out of the VOUT registers (e.g. READ_VOUT). The pmbus subsystem expects these values to be in "LINEAR16" encoding. Hence the full word register is the mantissa and the exponent is supposed to be in VOUT_MODE.
> > Sadly, the VOUT_MODE register isn't supported. It reads 0xFF.
> > 
> ... violating its own specification...
> 
> > In my first attempt to work around this, I provided a custom read_word_data function that would fixup the value. However, that did lead to problems with negative values and also had a precision loss (12,09V -> 12V). I tried to compensate by faking the values as 'direct' and adjusting the m/b/R values to match. This is also not perfect, as it is messy and also seems to report the wrong values in some cases.
> 
> Messy is relative. Polluting generic code is just as messy.
> What are those cases where a wrong value is reported ?
> 
> > 
> > I think the best solution would be to prevent pmbus (more specifically 'pmbus_reg2data_linear') to treat the obtained value as LINEAR16. A quick hack shows me that this would work with all the reported values of the device. However, this means proving da vendor/device specific workaround by changing a generic component.
> > 
> > I am not sure how you feel about this. Ultimately, I'd like to upstream the driver (and potential fix), so I would like to find a solution that is fine with you all.
> > 
> > My current proposal would be to introduce a flag in pmbus_platform_data.flags that allows to disable the LINEAR16 switch in case the sensor has the class PSC_VOLTAGE_OUT. At least this seems the change with the smallest impact. I am not sure how to name the flag but to propose something I'd say 'PMBUS_VOUT_IS_LINEAR11'
> > 
> > What do you think?
> 
> Not sure if that is less messy.
> 
> Have you tried to fake the VOUT_MODE command and to provide an exponent
> that makes sense ? While LINEAR16 does not support negative values,
> I don't immediately see that as a practical problem, unless the power
> supply indeed reports negative output voltages.
> 
As a follow-up: If the above is not feasible (eg the exponent changes
all the time, or the reported voltages can indeed be negative), an
alternative would be to implement support for IEEE half precision
floating point format, as specified in PMBus 1.3.1.

Downside is that a device using IEEE half precision floating point
values must not use LINEAR{11,16} at all. But that would still be
better than hacking the PMBus core code.

Guenter

> Thanks,
> Guenter
> 
> P.s.: I asked for more information from the vendor, but I don't really expect to
> get anything. Worth trying, though.
