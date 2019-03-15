Return-Path: <SRS0=+5Hs=RS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8970DC43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Mar 2019 10:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60E3B218A5
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Mar 2019 10:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbfCOKZD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Mar 2019 06:25:03 -0400
Received: from mail.infodas.de ([87.190.49.227]:37586 "EHLO mail.infodas.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727938AbfCOKZC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Mar 2019 06:25:02 -0400
X-Greylist: delayed 320 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Mar 2019 06:25:01 EDT
Received: from veco001.infodas.de ([192.168.119.2]:54072)
        by mail.infodas.de with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <C.Groenke@infodas.de>)
        id 1h4jw6-0002un-1o; Fri, 15 Mar 2019 11:19:34 +0100
Received: from mailsrv.infodas.de (192.168.100.13) by veco001.infodas.de with Infodas vecoMail 3.5.100.00565
        id 52645172024297; Fri, 15 Mar 2019 11:19:32 +0100
Received: from AS001EX.ifd.infodas.de (192.168.100.13) by
 AS001EX.ifd.infodas.de (192.168.100.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1034.26; Fri, 15 Mar 2019 11:19:33 +0100
Received: from AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0]) by
 AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0%12]) with mapi id
 15.01.1034.033; Fri, 15 Mar 2019 11:19:33 +0100
X-CTCH-RefID: str=0001.0A0C0202.5C8B7C36.009A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   =?iso-8859-1?Q?Gr=F6nke=2C_Christian?= <C.Groenke@infodas.de>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: AW: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Topic: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Index: AdTZlFnCHh83NT7jQ5qCS2EYnwBUxQAE3J+AAAMyQPD///ozgP//329wgADVuID//x1OIIABxjYA//7Mh0A=
Date:   Fri, 15 Mar 2019 10:19:33 +0000
Message-ID: <c1b60322acda43caa9e334841a83778a@infodas.de>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
 <25260e7b0f3d43588253791046440a64@infodas.de>
 <20190314165308.GA14159@roeck-us.net>
In-Reply-To: <20190314165308.GA14159@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.242.2.3]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter,

> -----Ursprüngliche Nachricht-----
> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> Gesendet: Donnerstag, 14. März 2019 17:53
> An: Grönke, Christian <C.Groenke@infodas.de>
> Cc: linux-hwmon@vger.kernel.org
> Betreff: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
> values (LINEAR11 vs LINEAR16)
> 
> Hi Christian,
> On Thu, Mar 14, 2019 at 04:08:32PM +0000, Grönke, Christian wrote:
> >
> > The framework code seemed to work fine. I used your code for the
> conversion:
> >     linear11 -> 'scaled integer' -> ieee754 It provided a way to test
> > the code and was easy for me as my tries to do some other bit magic
> > weren't successful. That means I partly tested the code from
> > pmbus_data2reg_ieee754 as my read_word function uses this for the
> > conversion. Of course not the module local function...
> >
> 
> Wondering ... I would have thought that it should be possible to
> implement a simplified linear11 <--> ieee754 conversion, without
> converting to a scaled integer first. Have you tried that ?

There might be a more efficient and elegant way. I toyed around with
the conversion for a moment but didn't figure out a working way 
quickly.
Right now I need to integrate the driver and get it working in the
System so that the depended application could can be worked on.
I might revisit the current conversion code after that and try to
find a "better" way.

Kind regards
Christian
