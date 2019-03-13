Return-Path: <SRS0=yUAk=RQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E127C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 15:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7946213A2
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 15:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8zrzBxk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfCMPTo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 11:19:44 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:39540 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfCMPTo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 11:19:44 -0400
Received: by mail-pf1-f171.google.com with SMTP id i20so1607738pfo.6
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Mar 2019 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Mc4MBaeTWC3NMshRajiaJIWM9pM1bdf3gCJ3U1CZIFw=;
        b=R8zrzBxkrhajHHpH1XjFM0i75HPMAD6uPyrCotGeMBW9PGkg0bUesSN2TIr6jptAaM
         jCcApoMVv4Y/NTXUY6HiMspurBJ8LstPKXGjkLETZePAfCBAUteZKMA2BurXo7aZ5rA4
         6Icjw1R43Y62LsvTEp/lKURwgWfycUdp3RJ09e2h3Hwvif3G4ZdvcBYTi4fc8nJxSb4m
         +49/qS9ewPr2GRy9rV8eH8YFq9DsdVbkfZY7FYXZPp4eB0HHNRCBZBxKPpcR+bmZCV5J
         ffttC+7raS5gDq1NGF1f3edjvvTpTdbkEdSu9Li+HLHTKrdQGocbVXzsIkUik/cBgFyG
         7SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=Mc4MBaeTWC3NMshRajiaJIWM9pM1bdf3gCJ3U1CZIFw=;
        b=fH1ZO5KX5zLcGwfZ48HedPSAoDcundpytDLs/ZuM9OHLqfX03cfLAxAydbgmR61+tC
         u/uMuR10/ofo1ZjYVe8em/5X+F6WcQyLRiPpzpggNgK12/p+mThowMmSoxomgmcSGU5l
         kOdvPH4M6hZlPW95Fa4GYmUieeBN9jegiaJ9tuvQTbq08r9doqWl8IeK4BD9eAzhknb6
         sbX7ZRuZQtH9cBQZcYhSkozm7/fCHpgT+W3HEjsyxNjKgyIRTY+2PAqkJ0a9jiVGGpOm
         1feYBJsKqp6XsDVrShlV02ivF0uOLJf/PwcPcV6DsqMJ5Or0ITJUZRHQ04HZI3cjAXXU
         bUlg==
X-Gm-Message-State: APjAAAV0kTDx/PBaX/2IGieAGW4zcpwPWC4FqCEbJBovyKmORawSJgGF
        +fk5uBezVkchaO20cbbFAy3Kuwwj
X-Google-Smtp-Source: APXvYqwNUu/JEDUn3Vre1JkLKQoBItNgEisQaQq3n68DhYmmKOJQGjU5NLXQesKhTbqheC2vc4ZbKA==
X-Received: by 2002:a63:4b64:: with SMTP id k36mr14477028pgl.234.1552490383075;
        Wed, 13 Mar 2019 08:19:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v8sm16289057pfm.174.2019.03.13.08.19.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Mar 2019 08:19:42 -0700 (PDT)
Date:   Wed, 13 Mar 2019 08:19:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190313151941.GA7122@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 13, 2019 at 12:31:53PM +0000, Grönke, Christian wrote:
> Hello all,
> 
> I am currently working on a hwmon/pmbus driver for a PMBus capable 3Y Power/FSP power supply (YH5301-1EAR).
> 
> The datasheet has limited information. But with the help of some online sources, other datasheets from the vendor and the pmbus sub-system I could figure out most of it.
> 
> However, I did run in some troubles with the VOUT values. To my understanding (and from what I could validate) the device does encode _all_ values as "LINEAR11". Meaning all values have a mantissa of 11 bit and the exponent in the other 5 bits of the register word. This causes some troubles with the read out of the VOUT registers (e.g. READ_VOUT). The pmbus subsystem expects these values to be in "LINEAR16" encoding. Hence the full word register is the mantissa and the exponent is supposed to be in VOUT_MODE.
> Sadly, the VOUT_MODE register isn't supported. It reads 0xFF.
> 
... violating its own specification...

> In my first attempt to work around this, I provided a custom read_word_data function that would fixup the value. However, that did lead to problems with negative values and also had a precision loss (12,09V -> 12V). I tried to compensate by faking the values as 'direct' and adjusting the m/b/R values to match. This is also not perfect, as it is messy and also seems to report the wrong values in some cases.

Messy is relative. Polluting generic code is just as messy.
What are those cases where a wrong value is reported ?

> 
> I think the best solution would be to prevent pmbus (more specifically 'pmbus_reg2data_linear') to treat the obtained value as LINEAR16. A quick hack shows me that this would work with all the reported values of the device. However, this means proving da vendor/device specific workaround by changing a generic component.
> 
> I am not sure how you feel about this. Ultimately, I'd like to upstream the driver (and potential fix), so I would like to find a solution that is fine with you all.
> 
> My current proposal would be to introduce a flag in pmbus_platform_data.flags that allows to disable the LINEAR16 switch in case the sensor has the class PSC_VOLTAGE_OUT. At least this seems the change with the smallest impact. I am not sure how to name the flag but to propose something I'd say 'PMBUS_VOUT_IS_LINEAR11'
> 
> What do you think?

Not sure if that is less messy.

Have you tried to fake the VOUT_MODE command and to provide an exponent
that makes sense ? While LINEAR16 does not support negative values,
I don't immediately see that as a practical problem, unless the power
supply indeed reports negative output voltages.

Thanks,
Guenter

P.s.: I asked for more information from the vendor, but I don't really expect to
get anything. Worth trying, though.
