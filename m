Return-Path: <SRS0=yUAk=RQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61112C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 12:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 383C2214AE
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Mar 2019 12:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfCMMiD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Mar 2019 08:38:03 -0400
Received: from mail.infodas.de ([87.190.49.227]:30197 "EHLO mail.infodas.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfCMMiC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Mar 2019 08:38:02 -0400
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Mar 2019 08:38:01 EDT
Received: from veco001.infodas.de ([192.168.119.2]:50568)
        by mail.infodas.de with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <C.Groenke@infodas.de>)
        id 1h4334-0005xp-1H; Wed, 13 Mar 2019 13:31:54 +0100
Received: from mailsrv.infodas.de (192.168.100.13) by veco001.infodas.de with Infodas vecoMail 3.5.100.00565
        id 52480313022545; Wed, 13 Mar 2019 13:31:53 +0100
Received: from AS001EX.ifd.infodas.de (192.168.100.13) by
 AS001EX.ifd.infodas.de (192.168.100.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1034.26; Wed, 13 Mar 2019 13:31:53 +0100
Received: from AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0]) by
 AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0%12]) with mapi id
 15.01.1034.033; Wed, 13 Mar 2019 13:31:53 +0100
X-CTCH-RefID: str=0001.0A0C0209.5C88F83A.008C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   =?iso-8859-1?Q?Gr=F6nke=2C_Christian?= <C.Groenke@infodas.de>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>
Subject: PMBus driver for FSP/3Y Power device with non-standard VOUT values
 (LINEAR11 vs LINEAR16)
Thread-Topic: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Index: AdTZlFnCHh83NT7jQ5qCS2EYnwBUxQ==
Date:   Wed, 13 Mar 2019 12:31:53 +0000
Message-ID: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
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

Hello all,

I am currently working on a hwmon/pmbus driver for a PMBus capable 3Y Power/FSP power supply (YH5301-1EAR).

The datasheet has limited information. But with the help of some online sources, other datasheets from the vendor and the pmbus sub-system I could figure out most of it.

However, I did run in some troubles with the VOUT values. To my understanding (and from what I could validate) the device does encode _all_ values as "LINEAR11". Meaning all values have a mantissa of 11 bit and the exponent in the other 5 bits of the register word. This causes some troubles with the read out of the VOUT registers (e.g. READ_VOUT). The pmbus subsystem expects these values to be in "LINEAR16" encoding. Hence the full word register is the mantissa and the exponent is supposed to be in VOUT_MODE.
Sadly, the VOUT_MODE register isn't supported. It reads 0xFF.

In my first attempt to work around this, I provided a custom read_word_data function that would fixup the value. However, that did lead to problems with negative values and also had a precision loss (12,09V -> 12V). I tried to compensate by faking the values as 'direct' and adjusting the m/b/R values to match. This is also not perfect, as it is messy and also seems to report the wrong values in some cases.

I think the best solution would be to prevent pmbus (more specifically 'pmbus_reg2data_linear') to treat the obtained value as LINEAR16. A quick hack shows me that this would work with all the reported values of the device. However, this means proving da vendor/device specific workaround by changing a generic component.

I am not sure how you feel about this. Ultimately, I'd like to upstream the driver (and potential fix), so I would like to find a solution that is fine with you all.

My current proposal would be to introduce a flag in pmbus_platform_data.flags that allows to disable the LINEAR16 switch in case the sensor has the class PSC_VOLTAGE_OUT. At least this seems the change with the smallest impact. I am not sure how to name the flag but to propose something I'd say 'PMBUS_VOUT_IS_LINEAR11'

What do you think?

Kind regards
Christian

-- 

Christian GRÖNKE

INFODAS GmbH ~ Rhonestraße 2 ~ 50765 Köln ~ Germany
Phone: +49 221 70912 187 ~ Mail: c.groenke@infodas.de
