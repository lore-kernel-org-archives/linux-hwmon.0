Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B4BC433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 18:41:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DDC5613B6
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 18:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbhEMSme (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 14:42:34 -0400
Received: from mout.gmx.net ([212.227.15.18]:42999 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231167AbhEMSme (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 14:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620931267;
        bh=g1tpzKOSZitpyVCdzPHRsvK69HNaAbSvtobtpfSVRos=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=hz2VqEQxus5Xrk5SKIBIcgYgSCH5B3JhWR48f0O8luhoBZLuHXcpwkpELCZCY54Zo
         OGoGTUxgD3GAimHxbWD3Do/xkwlQMtt2HufmYzRuqsMptqywZj+Zxk30qXkGRPdZhl
         pL0uVQrvMUFQrCYVuMyTPcpbWObfJGc5J2HNPr00=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.131] ([84.154.212.154]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6mE-1lDg9n26yS-00lRkL; Thu, 13
 May 2021 20:41:07 +0200
Subject: Re: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <20210513154546.12430-1-W_Armin@gmx.de>
 <20210513164838.eacakojhvtb2se2e@pali>
 <e333b7e2-4bb7-1be2-5d26-4b60e6463d7c@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <60d82aa4-3f44-d10d-8db5-3d6a30f25945@gmx.de>
Date:   Thu, 13 May 2021 20:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e333b7e2-4bb7-1be2-5d26-4b60e6463d7c@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:8RRA6Tu4kGIAmOe3SLjVNG42SiFxNRoqKTf7sjOiTTtmigMr+Bj
 3N+nKZvNIgsF8qze3pED/toxBWpTCkJQ9rxNjcLlEInOyJ/EMwkmdpN4BqQIvax2c3ScZaK
 RtCPsZ7YES04mVZBbB2BTY1hds2WRYAUMg9Hia4/deJHPtjULbt/FtEcKtSWwklCsqF640m
 odVEkRZ/gikAzu3h0Zj2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r7e44Hnf5Xw=:qvnICEvMtTYeDwNssvQZFj
 pCnfivE1yy4ltxq+k0kJDvR/kN8c2xmjyLuGoktE9/HwpKMQsgsuOl24nmJQvFogbEXgxWJ+c
 o/XXdDLPGYdM7lQLxwDCGSkMsY/FXgGmAOIkbh5u+ZZkSDsbUJvgC52RpUVrrIViVxBeL8Lcc
 ApGkXZXVQeBODalkVfRL7HBGfPqc0s2yIppSXQcrzfW/+awirwJn/ZOpIMd+fAL4F2IY3WDEp
 gKUAhkDYSCGbVf9Q8VwyyiXzvQbtQ7da0olr2/ROXZFOgU13EiHHkyPuJJ1YjQiYN+HWCRs06
 E5zA51uW/onBmnui2pxVEXGFqrvXZb9F75jIPPU1hO9CZdnxOYsMwwwS/R2qpExbIk5ebV7pn
 tUMjwvwM4+kLpnYsDx6ohW1vurm76KQPIQLZuAgIkHDEZl6Q67Ruluxa8vJW9ghcMk8IRrwjp
 A9eRQCHfnNqsomPdvDxlJbj0wYsB1Ee3pvAfCTA1JnyPU7cpuUQks5Onws2nXonb2NSFqYmuh
 hpVG3iiVoRnC5BMjRAjgUejKlP3FidUvLIjAn3KBmrZMlyJaNckqTUzUWJITUqL7ogxCG1QjV
 7DZKSBCHdNcYjOc9Q5CMA0Fmw8EMP2ZPf+lWtOYoqRwwabIW4g9eA3Ud9CBIyrxCbmNcI1iNA
 eeWbXsBenKIxz9FKaXGHNRRAyh7khJ/DSRL3GetYKZsn7FIDpOBjDrYJ29W9CwHKKk64uRs+l
 4XrnB6YJyOcbalth+yUa8aaSac+q9KoBNE557gwz8xlT8JVqTJaUgdvoGYpjrgHvAK3awxl+N
 b18oGuBvBIeacv63d8X+iqZzJCpRHKsWJL4WI9loUS5Z9LJVU9aLMyIy3FwGeoHv0Sjv0RPSH
 JBuQtGpRwEYzHUC5apy9Jc8Hlu+DItoc2DGFhVKv+sk8f9g2y+m8ZiYS2kd6cNej2b6rp4WnQ
 xxyC2B0pdYiGDPYom+7shEO10UrP+nAbIHHWuaMATHc5Go4ij3Tw/XGPmKOKUBShl3d+wTHik
 hjgT7ujo01tkH5qrL9b1m5E5JoY9EYBSGapz8RgUk4OysVqx2KCqOUaa/xMkSigaKbshDGfzN
 i91BkT73eYx1yae3qAwmlWU4BxK49c7swTP8tsj2Hy9WnISb14kIvGVRxFAKW3bvIPjacmhGz
 F2t+mf4LLIxnrQUF1+hjbuLAqq8bOUCfimZ4JQ0lo4xiEz1vzPO9zWXEMUbzwGSbUBVuE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 13.05.21 18:53 Guenter Roeck wrote:
> On 5/13/21 9:48 AM, Pali Roh=C3=A1r wrote:
>> On Thursday 13 May 2021 17:45:46 W_Armin@gmx.de wrote:
>>> From: Armin Wolf <W_Armin@gmx.de>
>>>
>>> When support for up to 10 temp sensors and for disabling automatic BIO=
S
>>> fan control was added, noone updated the index values used for
>>> disallowing fan support and fan type calls.
>>> Fix those values.
>>
>> Do you mean this change, right?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D1bb46a20e73b0bb3364cff3839c9f716ed327770
>>
>>
>> Yes, it looks like that it should have been part of that change.
>>
>> Therefore I suggest to add Fixes tag:
>>
>> Fixes: 1bb46a20e73b ("hwmon: (dell-smm) Support up to 10 temp sensors")
>>
>> Otherwise looks good!
>>
>> Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
>>
>> For future development I would suggest to rewrite/drop these magic
>> numbers as same problem can be easily repeated in future.
>>
>
> The best solution would be to rewrite the driver to use
> hwmon_device_register_with_info(), but that should be done
> by someone with access to the hardware.
>
> Guenter
Im currently doing exactly that, since i have an old dell notebook. But
that might take some time.
>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>> Tested on a Dell Latitude C600.
>>> ---
>>> =C2=A0 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>> b/drivers/hwmon/dell-smm-hwmon.c
>>> index 2970892bed82..f2221ca0aa7b 100644
>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>> @@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] =3D {
>>> =C2=A0 static umode_t i8k_is_visible(struct kobject *kobj, struct
>>> attribute *attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int index)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (disallow_fan_support && index >=3D 8)
>>> +=C2=A0=C2=A0=C2=A0 if (disallow_fan_support && index >=3D 20)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (disallow_fan_type_call &&
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (index =3D=3D 9 || index =
=3D=3D 12 || index =3D=3D 15))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (index =3D=3D 21 || index =
=3D=3D 25 || index =3D=3D 28))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (index >=3D 0 && index <=3D 1 &&
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(i8k_hwmon_fla=
gs & I8K_HWMON_HAVE_TEMP1))
>>> --
>>> 2.20.1
>>>
>

