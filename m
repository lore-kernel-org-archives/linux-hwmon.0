Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EBEC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Feb 2022 18:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244559AbiBTStZ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Feb 2022 13:49:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243159AbiBTStZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Feb 2022 13:49:25 -0500
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4343849FBB
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Feb 2022 10:49:03 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-231-Q5RDfTEoPQK_wlmSaWaQ6g-1; Sun, 20 Feb 2022 18:49:00 +0000
X-MC-Unique: Q5RDfTEoPQK_wlmSaWaQ6g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 20 Feb 2022 18:48:58 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 20 Feb 2022 18:48:58 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Armin Wolf' <W_Armin@gmx.de>, "pali@kernel.org" <pali@kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-assembly@vger.kernel.org" <linux-assembly@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] hwmon: (dell-smm) Improve assembly code
Thread-Topic: [PATCH v2] hwmon: (dell-smm) Improve assembly code
Thread-Index: AQHYJdVCkKl8QQjZ0kWJRwIdNPLg26ycx2mg
Date:   Sun, 20 Feb 2022 18:48:58 +0000
Message-ID: <6f4c21b5e1cb4fa38a5e0c1716658329@AcuMS.aculab.com>
References: <20220219211011.16600-1-W_Armin@gmx.de>
In-Reply-To: <20220219211011.16600-1-W_Armin@gmx.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf
> Sent: 19 February 2022 21:10
> 
> The new assembly code works on both 32 bit and 64 bit
> cpus and allows for more compiler optimisations by not
> requiring smm_regs to be packed

I'm intrigued about the __packed..

Prior to 5.17-rc1 __packed was only applied to the fields after 'eax'.
This actually has no effect (on any architecture) because there is
no padding to remove - so all the later fields are still assumed to
be 32bit aligned.

5.17-rc1 (565210c781201) moved the __packed to the end of the
structure.
AFAICT this structure is only ever used in one file and for on-stack
items. It will always actually be aligned and is only read by the
code in the file - so why was it ever marked __packed at all!
On x86 it would make no difference anyway.

I can only guess it was to ensure that the asm code didn't go
'wrong' because of the compiler adding 'random' padding.
That isn't what __packed is for at all.
The linux kernel requires that the compiler doesn't add 'random'
padding - even if the C standard might allow it.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

