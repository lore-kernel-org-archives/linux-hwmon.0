Return-Path: <SRS0=yUAk=RQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92C1C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 16:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB07420854
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 16:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAwaQ7b4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfCMQaa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:30:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33879 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfCMQaa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 12:30:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id v12so1912825pgq.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Mar 2019 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cePWX+U8syxkuQfad+sESnTklGJsJ5qSrDaz7BVx1tE=;
        b=oAwaQ7b4n5yxRQhE5fzdx8QNw/AcEb0QEhrdn6idM5HZ8gKzbeOk6PVX3S+1nL5PHh
         OSOToGEocZH5nC/E671wogwSewxy75Yv8vnmGq6RrPJFNpSShCSWpXRK3sx9Qg8PV/Q4
         v9tGZmX3ERxXh7HAjj6VhEzw8IxTQLoitZqo0hRtiTDtwq9rI2wWTMXjoKfxKZh7nj4u
         PhU2VvnqbvIPUk3AbykNNQ524BbWqMruVmqD+qDc61aHpwxx0jSmOlTxnXENqSDUxuj8
         eu8MDJH2xiY9ELx8sAogGOH2XJGXIa1ndFNXJWY2KCfXuqc+epAsva3/fQS9rntYZaTe
         51LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=cePWX+U8syxkuQfad+sESnTklGJsJ5qSrDaz7BVx1tE=;
        b=GSk4TDve0fUMreKniU8DTNnYnTBFch0fjtDOoI1b66ORWJf6DIEFCO/gDvphVB7Ntu
         TVM5mX2d+INnFEQLUf+ipxegn6zezVYbhO7Tkxb05SKdE4x7zD++hTgRY1S3yZZzEZVT
         26wNlI5j3kILOuqOpVgoQv2TcP9X6W1s9jLe7H/Myq2YqFWh1+sIOkxzy/tY2JedKOdE
         og0vR8QcfdIVKHVeJWZ7Hob4Mc9O0bcU4wCicNvaDngROR4KmITZSe/E4n2GkC025dDJ
         ZdfsxiCrNWS7BAPQToWVcBVXBqYfzHaI2fYJFohk6eRs79Wuvc/C+upN0js9uMDzoB4U
         NcOQ==
X-Gm-Message-State: APjAAAUPYoATE5iRqKNJzvS8EJhH++N42IsSiiM2xPZABkZbuqGILGZZ
        Z22nEnG+ERuP3huA8aF+OZTdCG3o
X-Google-Smtp-Source: APXvYqz3I+WN1X4P6RulGDVYZv/SZ49ZNDmZsIkD+OfPuzM8CF8fW31qw/YFH8fJJYeNl+tketUE6g==
X-Received: by 2002:a17:902:a612:: with SMTP id u18mr45923648plq.145.1552494629079;
        Wed, 13 Mar 2019 09:30:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g15sm5270677pfg.157.2019.03.13.09.30.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Mar 2019 09:30:28 -0700 (PDT)
Date:   Wed, 13 Mar 2019 09:30:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190313163027.GB15451@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Mar 13, 2019 at 04:20:28PM +0000, Grönke, Christian wrote:
> Hi,
> 
> Thanks for the fast answer.
> 
> > -----Ursprüngliche Nachricht-----
> > Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> > Gesendet: Mittwoch, 13. März 2019 16:20
> > An: Grönke, Christian <C.Groenke@infodas.de>
> > Cc: linux-hwmon@vger.kernel.org
> > Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> > values (LINEAR11 vs LINEAR16)
> > 
> > On Wed, Mar 13, 2019 at 12:31:53PM +0000, Grönke, Christian wrote:
> > > Hello all,
> > >
> > > I am currently working on a hwmon/pmbus driver for a PMBus capable 3Y
> > Power/FSP power supply (YH5301-1EAR).
> > >
> > > The datasheet has limited information. But with the help of some
> > online sources, other datasheets from the vendor and the pmbus sub-
> > system I could figure out most of it.
> > >
> > > However, I did run in some troubles with the VOUT values. To my
> > understanding (and from what I could validate) the device does encode
> > _all_ values as "LINEAR11". Meaning all values have a mantissa of 11 bit
> > and the exponent in the other 5 bits of the register word. This causes
> > some troubles with the read out of the VOUT registers (e.g. READ_VOUT).
> > The pmbus subsystem expects these values to be in "LINEAR16" encoding.
> > Hence the full word register is the mantissa and the exponent is
> > supposed to be in VOUT_MODE.
> > > Sadly, the VOUT_MODE register isn't supported. It reads 0xFF.
> > >
> > ... violating its own specification...
> 
> Well, yes. Judging by the spec of the FSP550-50ERS it also exceeds the assumption that there are only 32 pages. The spec. of my current device does not say anything with regards to the pages, but they seem to align with the spec. of the FSP550-50ERS. Eg. page 0x22 shows the data for -12V.

Can you try to convince your e-mail system to split lines ?

> But this is a different issue that I can come around with the hook in read_word_data and a array that maps the page numbers.

We could also increase the number of pages supported if it helps.

> 
> > 
> > > In my first attempt to work around this, I provided a custom
> > read_word_data function that would fixup the value. However, that did
> > lead to problems with negative values and also had a precision loss
> > (12,09V -> 12V). I tried to compensate by faking the values as 'direct'
> > and adjusting the m/b/R values to match. This is also not perfect, as it
> > is messy and also seems to report the wrong values in some cases.
> > 
> > Messy is relative. Polluting generic code is just as messy.
> 
> Indeed.
> 
> > What are those cases where a wrong value is reported ?
> 
> The values for lowest/highest seemed of. I don't have a specific example at hand. I didn't save the read-outs during the testing. I could reproduce them. However, they may also be wrong due to me doing the wrong conversion.
> 
That is what I suspected.

> > 
> > >
> > > I think the best solution would be to prevent pmbus (more specifically
> > 'pmbus_reg2data_linear') to treat the obtained value as LINEAR16. A
> > quick hack shows me that this would work with all the reported values of
> > the device. However, this means proving da vendor/device specific
> > workaround by changing a generic component.
> > >
> > > I am not sure how you feel about this. Ultimately, I'd like to
> > upstream the driver (and potential fix), so I would like to find a
> > solution that is fine with you all.
> > >
> > > My current proposal would be to introduce a flag in
> > pmbus_platform_data.flags that allows to disable the LINEAR16 switch in
> > case the sensor has the class PSC_VOLTAGE_OUT. At least this seems the
> > change with the smallest impact. I am not sure how to name the flag but
> > to propose something I'd say 'PMBUS_VOUT_IS_LINEAR11'
> > >
> > > What do you think?
> > 
> > Not sure if that is less messy.
> > 
> > Have you tried to fake the VOUT_MODE command and to provide an exponent
> > that makes sense ? While LINEAR16 does not support negative values, I
> > don't immediately see that as a practical problem, unless the power
> > supply indeed reports negative output voltages.
> 
> Yes, I tried this at least partly. I remember that not all values looked 'good'. Can't recall right now. The negative value of the -12V was definitely a problem.
> 
> However, writing this mail now casts a lot of doubt. I will revisit the code and try the VOUT_MODE hack again. I know understand this stuff a bit better than some days ago when I started. I will play around a bit more.
> 
> That said, I still like the read outs I currently have with the hack in place. They are a lot closer to what the other sensors on the board say.

Makes sense, and in general I agree.

Our last e-mails overlapped; can you explore what it would take to add
support for ieee754 half precision floating point ?  We would need a new
set of conversion functions in the core (ie pmbus_reg2data_ieee754 and
pmbus_data2reg_ieee754), and your driver would have to implement the
linear11 <-> ieee754 conversion. That may be a bit more work, but it
would also be cleaner, and it should not affect precision.

Thanks,
Guenter
