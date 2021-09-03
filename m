Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1F8C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 15:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5774F60462
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 15:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbhICPli (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 11:41:38 -0400
Received: from mout.gmx.net ([212.227.15.18]:36325 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349574AbhICPli (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 3 Sep 2021 11:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630683621;
        bh=oZUyUVp46ODHXU+R2n/8rGaTEmcMa7ICQSmT3U4JQ/s=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Sf/TQF0UhU3zhUYxsWcfHN4k6LMpXXu17b9zICFh9UCuTfWtxyYt2cqAH5qVhVQkt
         F9zCiBj65P2gOg0rlFVaLAAHE7PaQKvOVIdYugFFl3jR5o9DACHwjpfLVGoVrv6RCH
         U8p+bebywUY2IxO6zTsPBvmHLjEtSEsRf7zjkP0E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.29] ([91.137.126.34]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwZ4-1nGMI51xj2-00uFzZ; Fri, 03
 Sep 2021 17:40:21 +0200
Subject: Re: [PATCH] hwmon: (dell-smm) Show fan_max param in sysfs
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210903142456.9926-1-W_Armin@gmx.de>
 <20210903144908.vrrae6oeivjxqpkj@pali>
 <cbca6113-9a47-4a69-26bc-92a1fcf9679a@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <4bddae04-808a-b536-7c91-5b634116cb15@gmx.de>
Date:   Fri, 3 Sep 2021 17:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cbca6113-9a47-4a69-26bc-92a1fcf9679a@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:afLbr/ESxaFUHqG+P9qQD407Aw7HN8D8Q+0LaNp17ZF7PZRuP8n
 mviE7FfYZOkXZIYpfRbyuoVtoqUVo2YrXM67C8jNQzKDx/mtHTJVC5F1O55Dl+sn4zppDec
 TCqtyi/Y8Fk62YsM/AZpWgG2EmIWG3vzj34MSvZQ0HkLi2pgfziT9uBjtahrWHi3UdpuB7b
 /VjievacPF2goqZ3aV8Qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ksznk0146g=:unngYIBiepdUrmgM0MFvRv
 Q4+G1BgU5cBoDLmcZQt7l99r+ljO7qdwMshTM7M9ctzBmbCyUFteDF3V/8av1tPnEg8XgQlOs
 yJbIVPAcz3kC6xQnh18GVlsEjnLadiMGxElWXV1ZLpo4E70ge1uw3MrccLa3CYDb0ZzqasPvU
 fZJPbrGOdUbZZTZ6ZPY1e6LEj/Av38Wj8KtlBGHmzby/cfhmfEv6I1oD2QG3azp4BsLhLJjwR
 Jt8HMz6TV6gtBaG1Z5nrDm7SifFhpIDHviukhHOLG3AgZrKAQF4TC+tZNyMzij2ACig0gXXfX
 haetmi/XcZ+cqlSMMyvsA2qNnYh6DP9ef0Hb/hwP87azoTEVK8Ay7HkKsIUEiOY7VgJgmOAld
 0UvOZ9EN+flmfOPgMQkQm/p6nDiKp/Sr/TeaYMVnYo+UxwB3KdtUbzE31XPsHokVPKguymiiY
 GZsCGIPYJ/Rc7sVAc+z0vb5PeCoGntQXAehEE+NxlrvvazEu3Fwm9pm/6UKOO5PuNVKPwMPBj
 bxW0cgQuUt4jUUegcZG5jin33DQXG2ngSQOQkQeDE7cndXNAPAXz8d9gRsalo8v3wpeXs9Nhm
 1FreL6MBqu1QcbZMBikItsg6vND/m+wQ/ojMY4iU/80ZGUqpANbj7aKnUaQq3mmvPm3jcDsEg
 eysGyZ84IToVeFjYuVcmTvtLhB7efslpyDngm9uBE5rQdOXJQm4H55l6MuC/IeYbeOR/+gtZZ
 qYDVNXluUYIy0BHggzI9QMfwitHgw+eDEYWeaPTezWOCOUlS+2ACZGaLZ2paMncIJMZIY93a2
 XF5X52FM4jTnHKlR7YdWjMQBzLdm8y3wt64PpyOwUU0xxp0CQXgQ3Z+ZYD99Wz3g/MpvOoKn+
 p+H+5kXW/d2PHQT//ZQDn6jb90ppFs5JDnjjnxFCKnuT7xaKu8NHdqOhy4Qf2nLhklDgwmrt5
 hfnkS/bybYhufg1d+WdmvBSx4rG3c1f8Lawmf16HWMeGhS3maejbRL+5YSiaVYG2yINdvhdOS
 c3dqO1CT/KJUGOhoODFewHM112EyHwJ67g/FCs959CMsvHh21hZnds9qwtSi1eqgp5wsktFLs
 F2WJTd0rj87MgbMEkMXfS5KetMoKm4kk+LsH6tpaQxw+jLuKHXNGIFcRQ==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 03.09.21 um 16:59 schrieb Guenter Roeck:
> On 9/3/21 7:49 AM, Pali Roh=C3=A1r wrote:
>> On Friday 03 September 2021 16:24:56 W_Armin@gmx.de wrote:
>>> From: Armin Wolf <W_Armin@gmx.de>
>>>
>>> For allowing tools like i8kutils to query the fan state
>>> without having to rely on the deprecated /proc/i8k interface,
>>> they need to scale the pwm values (0 - 255) back to the
>>> real hardware values (0 - 2/3).
>>> Show fan_max in sysfs to allow for such a scenario.
>>
>> Guenter, I think that this is general problem and not specific to
>> dell-smm-hwmon.c driver and i8kutils.
>>
>> All other hwmon tools should have similar problem. If e.g. GUI tool has
>> slider for controlling pwm then such tool needs to know number of steps=
.
>> Otherwise usage of such slider would be not very user friendly...
>>
>> Currently in hwmon sysfs API there is not attribute which could export
>> this kind of information.
>>
>> What about e.g. introducing 'pwm_steps' attribute which would provide
>> this information?
>>
>
> It isn't really a problem. The problem is that the tool writers insist
> not following the ABI. All they would have to do is to use a scale of
> 0..255,
> read back any written pwm value, and adjust the displayed value based
> on the returned value. I do not see why this would be "not user
> friendly".
>
> An attribute such as pwm_steps would not work because the step size
> can be
> non-linear.
>
> Guenter
>
i8kutils uses values from 0 to 2/3 for historic reasons, as the
deprecated /proc/i8k interface
provided such values. In order to not break backwards compatibility,
they cannot simply
switch to standard pwm values (ithink).
I believe that showing fan_max via sysfs would allow i8kutils to finally
use the standard interface,
since when this happens, we maybe can remove the /proc/i8k interface.
>>> Tested on a Dell Latitude C600.
>>>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>> =C2=A0 drivers/hwmon/dell-smm-hwmon.c | 7 +++++--
>>> =C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/dell-smm-hwmon.c
>>> b/drivers/hwmon/dell-smm-hwmon.c
>>> index 774c1b0715d9..6d3fd4f0f99d 100644
>>> --- a/drivers/hwmon/dell-smm-hwmon.c
>>> +++ b/drivers/hwmon/dell-smm-hwmon.c
>>> @@ -107,7 +107,7 @@ module_param(fan_mult, uint, 0);
>>> =C2=A0 MODULE_PARM_DESC(fan_mult, "Factor to multiply fan speed with
>>> (default: autodetect)");
>>>
>>> =C2=A0 static uint fan_max;
>>> -module_param(fan_max, uint, 0);
>>> +module_param(fan_max, uint, 0444);
>>> =C2=A0 MODULE_PARM_DESC(fan_max, "Maximum configurable fan speed
>>> (default: autodetect)");
>>>
>>> =C2=A0 struct smm_regs {
>>> @@ -1245,7 +1245,10 @@ static int __init dell_smm_probe(struct
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fan_max =3D conf->fan_max;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> -=C2=A0=C2=A0=C2=A0 data->i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;=C2=
=A0=C2=A0=C2=A0 /* Must not be
>>> 0 */
>>> +=C2=A0=C2=A0=C2=A0 if (!fan_max)=C2=A0=C2=A0=C2=A0 /* Must not be 0*/
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fan_max =3D I8K_FAN_HIGH;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->i8k_fan_max =3D fan_max;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->i8k_pwm_mult =3D DIV_ROUND_UP(255=
, data->i8k_fan_max);
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fan_control =3D dmi_first_match(i8k_whi=
telist_fan_control);
>>> --
>>> 2.20.1
>>>
>
