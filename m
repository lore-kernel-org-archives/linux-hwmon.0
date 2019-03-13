Return-Path: <SRS0=yUAk=RQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE375C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 16:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1D9F2075C
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 16:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfCMQUn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 12:20:43 -0400
Received: from mail.infodas.de ([87.190.49.227]:28244 "EHLO mail.infodas.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfCMQUn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 12:20:43 -0400
Received: from veco001.infodas.de ([192.168.119.2]:51120)
        by mail.infodas.de with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <C.Groenke@infodas.de>)
        id 1h46cH-0002Iz-0k; Wed, 13 Mar 2019 17:20:29 +0100
Received: from mailsrv.infodas.de (192.168.100.13) by veco001.infodas.de with Infodas vecoMail 3.5.100.00565
        id 52494028022821; Wed, 13 Mar 2019 17:20:28 +0100
Received: from AS001EX.ifd.infodas.de (192.168.100.13) by
 AS001EX.ifd.infodas.de (192.168.100.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1034.26; Wed, 13 Mar 2019 17:20:28 +0100
Received: from AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0]) by
 AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0%12]) with mapi id
 15.01.1034.033; Wed, 13 Mar 2019 17:20:28 +0100
X-CTCH-RefID: str=0001.0A0C020C.5C892DCD.003E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   =?iso-8859-1?Q?Gr=F6nke=2C_Christian?= <C.Groenke@infodas.de>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: AW: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Topic: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Index: AdTZlFnCHh83NT7jQ5qCS2EYnwBUxQAE3J+AAAMyQPA=
Date:   Wed, 13 Mar 2019 16:20:28 +0000
Message-ID: <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
In-Reply-To: <20190313151941.GA7122@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.76]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Thanks for the fast answer.

> -----Ursprüngliche Nachricht-----
> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> Gesendet: Mittwoch, 13. März 2019 16:20
> An: Grönke, Christian <C.Groenke@infodas.de>
> Cc: linux-hwmon@vger.kernel.org
> Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> values (LINEAR11 vs LINEAR16)
> 
> On Wed, Mar 13, 2019 at 12:31:53PM +0000, Grönke, Christian wrote:
> > Hello all,
> >
> > I am currently working on a hwmon/pmbus driver for a PMBus capable 3Y
> Power/FSP power supply (YH5301-1EAR).
> >
> > The datasheet has limited information. But with the help of some
> online sources, other datasheets from the vendor and the pmbus sub-
> system I could figure out most of it.
> >
> > However, I did run in some troubles with the VOUT values. To my
> understanding (and from what I could validate) the device does encode
> _all_ values as "LINEAR11". Meaning all values have a mantissa of 11 bit
> and the exponent in the other 5 bits of the register word. This causes
> some troubles with the read out of the VOUT registers (e.g. READ_VOUT).
> The pmbus subsystem expects these values to be in "LINEAR16" encoding.
> Hence the full word register is the mantissa and the exponent is
> supposed to be in VOUT_MODE.
> > Sadly, the VOUT_MODE register isn't supported. It reads 0xFF.
> >
> ... violating its own specification...

Well, yes. Judging by the spec of the FSP550-50ERS it also exceeds the assumption that there are only 32 pages. The spec. of my current device does not say anything with regards to the pages, but they seem to align with the spec. of the FSP550-50ERS. Eg. page 0x22 shows the data for -12V.
But this is a different issue that I can come around with the hook in read_word_data and a array that maps the page numbers.

> 
> > In my first attempt to work around this, I provided a custom
> read_word_data function that would fixup the value. However, that did
> lead to problems with negative values and also had a precision loss
> (12,09V -> 12V). I tried to compensate by faking the values as 'direct'
> and adjusting the m/b/R values to match. This is also not perfect, as it
> is messy and also seems to report the wrong values in some cases.
> 
> Messy is relative. Polluting generic code is just as messy.

Indeed.

> What are those cases where a wrong value is reported ?

The values for lowest/highest seemed of. I don't have a specific example at hand. I didn't save the read-outs during the testing. I could reproduce them. However, they may also be wrong due to me doing the wrong conversion.

> 
> >
> > I think the best solution would be to prevent pmbus (more specifically
> 'pmbus_reg2data_linear') to treat the obtained value as LINEAR16. A
> quick hack shows me that this would work with all the reported values of
> the device. However, this means proving da vendor/device specific
> workaround by changing a generic component.
> >
> > I am not sure how you feel about this. Ultimately, I'd like to
> upstream the driver (and potential fix), so I would like to find a
> solution that is fine with you all.
> >
> > My current proposal would be to introduce a flag in
> pmbus_platform_data.flags that allows to disable the LINEAR16 switch in
> case the sensor has the class PSC_VOLTAGE_OUT. At least this seems the
> change with the smallest impact. I am not sure how to name the flag but
> to propose something I'd say 'PMBUS_VOUT_IS_LINEAR11'
> >
> > What do you think?
> 
> Not sure if that is less messy.
> 
> Have you tried to fake the VOUT_MODE command and to provide an exponent
> that makes sense ? While LINEAR16 does not support negative values, I
> don't immediately see that as a practical problem, unless the power
> supply indeed reports negative output voltages.

Yes, I tried this at least partly. I remember that not all values looked 'good'. Can't recall right now. The negative value of the -12V was definitely a problem.

However, writing this mail now casts a lot of doubt. I will revisit the code and try the VOUT_MODE hack again. I know understand this stuff a bit better than some days ago when I started. I will play around a bit more.

That said, I still like the read outs I currently have with the hack in place. They are a lot closer to what the other sensors on the board say.

> 
> Thanks,
> Guenter
> 
> P.s.: I asked for more information from the vendor, but I don't really
> expect to get anything. Worth trying, though.

I will do that. This was now the first round of poking around. I will have to go through our hardware supplier, so this might take some time.

Kind regards
Christian
