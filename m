Return-Path: <SRS0=1lQR=PW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90950C43387
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Jan 2019 02:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63D0120657
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Jan 2019 02:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfANClX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Jan 2019 21:41:23 -0500
Received: from [223.203.96.18] ([223.203.96.18]:47270 "EHLO
        barracuda02.hxt-semitech.com" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726631AbfANClW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Jan 2019 21:41:22 -0500
X-ASG-Debug-ID: 1547433674-107606139f18abc0001-LXWHwZ
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by barracuda02.hxt-semitech.com with ESMTP id tp8x8fpV40bBIN5A (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO); Mon, 14 Jan 2019 10:41:15 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 14 Jan 2019 10:41:04 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Mon, 14 Jan 2019 10:41:04 +0800
From:   "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To:     Rob Herring <robh@kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>,
        "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Thread-Topic: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
X-ASG-Orig-Subj: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Thread-Index: AQHUpAvy8GAMUOOpLkCuSbjbkhrxsA==
Date:   Mon, 14 Jan 2019 02:41:04 +0000
Message-ID: <d51a1a5fe99b4227a596ff66c05ad67c@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190111193612.GA23166@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.98]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1547433675
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 1899
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5000 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65646
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob Herring,

Thanks for your reply.

On 2019/1/12 3:42, Rob Herring wrote:
> On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
>> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> s/monitering/monitoring/

I delivered the latest v3 patch and updated the subject. you can refer
to the following link:

https://patchwork.ozlabs.org/patch/1022664/

>
>> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
>> ---
>>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> new file mode 100644
>> index 000000000000..bbd601100e66
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
>> @@ -0,0 +1,11 @@
>> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
>> +
>> +Required properties:
>> +- compatible : "dps650ab"
> Needs a vendor prefix.g
Add vendor delta on v3 patch.
>
>> +- reg        : I2C address, one of 0x58, 0x59.
>> +
>> +Example:
>> +       dps650ab@58 {
>> +                   compatible = "dps650ab";
>> +                   reg = <0x58>;
>> +       };
>> --
>> 1.8.3.1
>>
>>
>>
>>
>> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> We can't accept emails with these clauses.
>
> Rob

Delete the message on v3 patch.

Thanks,

Xiaoting


