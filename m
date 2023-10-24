Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1BCC07545
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Oct 2023 17:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344101AbjJXRmb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Oct 2023 13:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344012AbjJXRma (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2023 13:42:30 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435D010CC
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1698169332; x=1698774132; i=w_armin@gmx.de;
        bh=ogDfHzAX/yTatTfQPt1Mt7cBjLEhF86SNincpfdE768=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=IchRXDzo/oTFupWOs8mMjgZkrqAgySjHNbd53JiYrDPWZdGy7OApIQi51bwecbI+
         LX2Lr2o61OTQ3UjsyQZoH/OaZTvyCsw2l6DlhKBrWrWn9r9RBpPrCPcdVddv536XB
         AfUUWe40p5Oce8Y67D+8kJz92v558ihj8yD/3+5g4N7SPkI8vppaANaXLv5W3NamD
         8WwBSZAwMU/26yqrQz9r1w5ZS9kwvChBz1DEAZN1udSwBOzwfEDvf9xAa+6AFHRkK
         b07g7l4Pw/WoVkQTpWI7abeN5JLVGfToTpnCf/1ppLKKCksyEmWJIifJLilFRyMB2
         Cj2woSpvU0YStsc3kw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVHe-1rAow81xE0-00JrwW; Tue, 24
 Oct 2023 19:42:12 +0200
Message-ID: <7d9b4557-5e4b-44ea-be6f-2d23632dcf77@gmx.de>
Date:   Tue, 24 Oct 2023 19:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sch5627 on Fujitsu Celsius W280
To:     Guenter Roeck <linux@roeck-us.net>,
        Ian Nartowicz <deadbeef@nartowicz.co.uk>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20231024150438.68dd079b@debian.org>
 <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
Content-Language: en-US
From:   Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U9Cd2+EE3Jcz6RswJwb/C0ZQY6Xg2Zgw9UM4R9x+B2a0+hdoF72
 J0Z935BvD5H0mMCBMY6kc4PAFl2tDWbFCbB9gcT0OM7bpUldbcxLA+dc0CAhp9heJy/oDIO
 +IfupBYSTrIcjw1dMFMa5k3i/kyCBVNUswAk8s6JLgyIfsGK/udlBKsfalz2oHjxLpVbvYc
 0zN6njRx9mB33KXYvxC4g==
UI-OutboundReport: notjunk:1;M01:P0:K8li8i5lyXM=;UTLxe+5gXPL231SQoYHJPuQX3VQ
 QKO8sQFRYjKDoEl2ofPWvgX1oknX3orO17hRstSaG6SQ1i7sQTtNAMzjpueLU2jDXRNP/VnwJ
 mI17/VP015LgVTDFhGNfjsrK0QeDHZsGyuW9ys7eFdnPm9i7/TmcJBw2JyGNwa+cxoYU3FsbA
 h5eOQ3NkJcmW58OeNfqhzQ+CCZvIU1NxMeCGmMwjRNsRwh1K5yvaO4JThdnI5Pcye/vVAAtQ9
 rrW8Zta4AINFnSRb39JELJZNdEraoOdVzeLMw1y2+WEZWcHrXOFLgXZYixXh9yomR3AMo1Y7U
 gU+BdwUla6OSjEzIjjcQWj4+laVNxHnetve3C6h9uk3shZgg34dLHce+/hvM/fAvPqgUsR/OJ
 0u1p89giPCB3VBVtb9pC+yK7NtHFtvR8VzInasKemgwISUJvtpeHtbWB+e9uu1D5+iWAINgS1
 PjYIt5FhrVHwFeS9hnf2hWMPx4nQ0yr8K+l9Q3kXQwWBQ+BZJTAh0fAt1dhOUJeQfXIz+lzQq
 ez6NQbM24eLn5V66eyS9i9SIZ/4E6HYsCQshFRpJiL1hihdPwXerub/HHpSbTpG3zJMBxjMOV
 xxKSRzTlwQWr+kdnAU/bNXua0Suaq7M8DTHn4bUSHkkQkcKwW8x8gEWcjx16IFAjLhg5ccZ6n
 QJ2W4EFx543h7dfODITKnsd5tiUNRn5uTXSZcQp9jZ5YzdnSMmrQg0WJ1wPMpRkhH8lf8HNrG
 counqiPzFLPajHr0oHd2j0FtzSCQDz6O53UK+qbN0ekFA9bgo6kb/tjoVEiaafJHRZ6cER0Pv
 yqRtMzD68Y+N7aWXAc+V3LUXK6MxBLn0aqnF+nNaSCfUmT2ldV/3asucbisyi4t/NVf6tO2qZ
 LA3KjBq2rJDWXy62Bk3ncJDXQRackNoqAb6Q1aIwjK71Y4KjBb3wQseCEv2fHreqCxKva8bGZ
 iDsKJEFw8CvIFkpIP8CT0afQL+w=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 24.10.23 um 16:48 schrieb Guenter Roeck:

> On 10/24/23 07:04, Ian Nartowicz wrote:
>> I just upgraded a Celsius W280 to the 6.1 kernel and noticed that
>> hardware
>> monitoring was gone.=C2=A0 Was working in 5.10.=C2=A0 When I added it t=
o the
>> dmi_override_table, it started working again (with a slightly
>> different device
>> name).=C2=A0 dmidecode shows it as an on board device, type other, stat=
us
>> disabled
>> (just the watchdog?), and description "SMsC SuperI/O".
>>
>
> Weird, this is the second private e-mail I get in a single day.
> Is there some information out there suggesting that kernel maintainers
> should be contacted without copying the mailing list ? If so, tell them
> it is wrong. As warning to everyone, I won't reply any further
> to private e-mails like this.
>
> Looking at the code, try adding ignore_dmi=3D1 as module parameter when
> loading the driver. I think commit 393935baa45e5c messed it up and
> prevents the driver from loading if the parameter is not provided.
> Maybe the conditions in sch56xx_init() are wrong or too generic.
> Armin, any comments ? Do we need to revert your patch ?
>
> Guenter
>
I think so, it seems that the DMI devices are not always present.
We better revert the DMI autodetection patch to prevent anymore
regressions like this.

Armin Wolf

