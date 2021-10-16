Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7893C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 22:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7936560F93
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Oct 2021 22:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235483AbhJPWLl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Oct 2021 18:11:41 -0400
Received: from mout.gmx.net ([212.227.17.22]:57811 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235468AbhJPWLk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Oct 2021 18:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634422154;
        bh=pAX3bR86ZJ2KaIGOenPDPKErWONRwt5xYyjQL0GBVc0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=VHIYWwitZp9E30/sMIg+bYPqP+E71pbMULKAFXRQ5o0oxxAA/DjzSKYTqatTQ0jjp
         q5NvebtFZgUtAi5GC2Xi5BSCohH8I2pvyA6SiKkvhQT6msYkfK5Dcbp4mGkEaItYNS
         gzw5T59X/qJq7Ae5fGa+gtKRRK4pZy0VmG/qOzf4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.42] ([91.137.126.34]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1mkUhP0d9N-0107jP; Sun, 17
 Oct 2021 00:09:14 +0200
Subject: Re: [PATCH v3 1/2] hwmon: (dell-smm) Add support for fanX_min,
 fanX_max and fanX_target
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-2-W_Armin@gmx.de>
 <20211013185113.GA3336263@roeck-us.net>
 <747f759b-22df-3f0f-f2a0-75ff56468853@gmx.de>
 <5b0f66d5-f8b8-6bd9-ecdf-dfc090ee8f1e@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <2d6c8fd3-2ad6-5fc7-5856-14852e817fab@gmx.de>
Date:   Sun, 17 Oct 2021 00:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5b0f66d5-f8b8-6bd9-ecdf-dfc090ee8f1e@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:a+nmGMwMHBWdKSSDCcKE1dvNYaYtmJMZ58DGNLAQA1nkVyhyyyD
 Fqw6usWC1qalNS7vRTr+T7CCAHBOUG9bezoOsozdBy6tn6oSK8oB7gTb6pgb/D+aVeqiXuJ
 tC5EN9f4wRyQ4UNP1fl+xeQrunJDjevVX1pwmwQUIkL45Imsd77kKFjInY2w1+I8qXRdJFj
 x1HwETWLpJXwsMsf4HTtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aUGbW011Qr4=:0bnBgeG4XXvuUl8IyYBMBI
 iM269Hh75JM1B3dhg8FFEqkSleKhqzcemoi0gje1N2NZFZpKofLh8YBxiZEOpVBeACaYcggJn
 vXaIBetAMbKGZBtLFVeOZou1e9A9LcR4s4TVP2qTcixphaSz89siv4fEtNN2sa3sWO30jRU0V
 hh0hc+JKCbDdyrr0EZoBHNiZhWCtwrcpWHXLT8WnMb8oUsZCjnBLOHCn7ktB0HV9XOWNDcqaI
 FKaHIiKXyjvhtp7x+eck+8vFW/vXnYfqLvxwslC3rxceY+MHXMp7ljtKPB8v+UD4RxMD7TgOG
 WnqzDnxOSNfkMEnn2ugDidqejiBTwTOngtFcVOANBChxdkKm/kAEjWs417g7VUYQONflP08s2
 FDx7RHC4NG7n6uVkPRPT0oi+MEyMUANjEoTHXtIpsMSaAgBaIKBxvOSHdV/PuF1oXQGVQq37P
 0z1Wpjg3jt99Yxl85lpzc/4awswFvjq0XyD+9nXMgCk0QY4zS07xcFzT8S/tlUsS9TxXJhQJo
 lamJzEy7tlnTH/rbkqbxPig6D0BwCpcVkzbArJA+pb+7H/nwRhyaCks88HAngC24YsGcVnAQT
 SR8pj/qJXmYXHk+eNwoDcOh16QWWs5FwspnmHbyB4wLhr47Z6QJpkIysqWOpdp6IlEAtNWYWk
 8yVP1aO5XDnZk0Swh2TuqD+6tRTYSwEc97Z7973o794hqTtamnmgqsOZox3FC7SUGIs3Jd9wv
 muVNTGF4VrMzPkGyP5k/TnV+KOHEhjfcKCkcAoCH7/efbKcOOEy5rG1D4NX6lpWG5GGDDFZrL
 4njyhiiW2Bm2b5H/mBdoMYjUmfoOJQzC0TXhBiLNdSInBlph4H164tK78r0724lav0NlaBgH5
 9Q52mx7EXX9cDFJAUS8bBEemKrz4YoaYiklJErIZJPzklMwmqEEioPlElFmQJtxG4ZhsaNXBW
 KFTEw2lUPmPB01zdFDdEEJzctXGW4X4/alEMoUs+GhIbKekrn5roXuXjYEFbmDy+r6Y8v0Zcy
 zgZ6T5VdeHS/UnkBQiz0jk/647yBura+bI4jLhX+XsPNOK6n69Fu5YCFY8aGUn1g26vZAcMFL
 fmUHtMN2xUyiU0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 17.10.21 um 00:00 schrieb Guenter Roeck:
> On 10/16/21 2:25 PM, Armin Wolf wrote:
>> Am 13.10.21 um 20:51 schrieb Guenter Roeck:
>>> On Mon, Sep 27, 2021 at 12:10:43AM +0200, W_Armin@gmx.de wrote:
>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>
>>>> The nominal speed of each fan can be obtained with
>>>> i8k_get_fan_nominal_speed(), however the result is not available
>>>> from userspace.
>>>> Change that by adding fanX_min, fanX_max and fanX_target attributes.
>>>> All are RO since fan control happens over pwm.
>>>>
>>>> Tested on a Dell Inspiron 3505 and a Dell Latitude C600.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
>>> Applied.
>>>
>
> [ ... ]
>
>> After looking at hwmon-next today, i noticed that this patch was
>> apparently removed.
>> Is there a issue with this patch causing the revert?
>
> Not that I recall. Looks like I messed up. Sorry, and thanks for
> noticing.
> I added it back in.
>
> Guenter
It seems its not the only patch missing, i cant find the following
patches anymore:

[PATCH v2] hwmon: acpi_power_meter: Use acpi_bus_get_acpi_device()
[PATCH v2 04/20 hwmon: max31722: Warn about failure to put device in
stand-by in .remove()

