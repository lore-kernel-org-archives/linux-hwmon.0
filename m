Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31AAC25B0C
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Aug 2022 20:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiHFUTy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 Aug 2022 16:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiHFUTx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Aug 2022 16:19:53 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73BEBCA
        for <linux-hwmon@vger.kernel.org>; Sat,  6 Aug 2022 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1659817161;
        bh=q7/GJkxfv6cDhPuqaWYg8wKBz+teFH4F+ySMjpq/q5w=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ZYsTa2gGLSKyJXplGZd+oF7IjE0y7D6ubg4KuvJY8xBdcY8UuwLlM1f+LbG3NDWCr
         fVqwAvn1g9clFWpsL0huO3ZP6u74N6LdMKGlfz5wjIe6WzVvbEXe03kKufhLnlXEFa
         Ziq9+AodN4hgXKYIK8l6uUbreX6er9f1roY7voI8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9uK-1o2CtP0wUM-00ICvE; Sat, 06
 Aug 2022 22:19:21 +0200
Subject: Re: [PATCH] nvme: hwmon: Add support for throttling temperature
 feature
To:     Tokunori Ikegami <ikegami.t@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <20220806054606.7280-1-ikegami.t@gmail.com>
 <20220806083113.GA3986075@roeck-us.net>
 <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <354484dd-bf1f-8339-c68a-f950fb72d3f7@gmx.de>
Date:   Sat, 6 Aug 2022 22:19:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ae3a4377-440b-af9d-8033-cbfe2d76d135@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:FAS5zy60L5aqQ7wkkjhsFoarPZmt+6g/eg5jKN3MpF/KDVqyv+U
 4W/RBfEhFL6JmtM+4ImKJyBCErQoOtHZfW7/+NpCmaCKSdGw1EpsgARN3UJIsbN1TkZc4BY
 Htasj3XeIqlnRMAW7fk5+lmbJYhIk2AaSOPOPIvxyS2417l7IkbFiXAZ612n/jzMmAX05Ls
 nIXI/1fAorvTSA4mwhu9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w6ZLTVgixO8=:mtOBysN4gIOfwin9fdjDGB
 Y+ofyBwzw99uyEi3GAhJvhBKwX5Tp6CKkdtxKvOiB3uOWKAJRPvfKANtOeSkBadRFAAtj5Skt
 PckXOoKBR21HUD4P/Z8y6Qm6BzWtpHyl1rxuDTz17Da/oYUcMGocAepERymWhXB8a0tz0qDAL
 QbwVXZeSQuh2GRKkRpAGLoWV/N6KAVuAelwYcQErZeIIjeL1C6+aaz9yccoOzZhhrYe5arYAm
 dD7Q0f64eL+NC3HG/OExOXIFOhjE2ms8jqWGBCWgkFesYdzqSkdMXEtl1aJJabzbeq0EvAkIA
 uKDhuU4HW5anCTQhCYKfanWjaL4mQzwmoDXUdhL576SDcQq4YsIja5zgVyHCRD1LWJwS51RgK
 uu/n9NASu2aP/6t8Q6OCPTIWdw1/PacUH+KlyFtvzHTTrQ4ldPCxjcFb/hWbiJ1l2g9JFGiW5
 kYKMaQ73G8VFpaNsc5P02vj5cCHPOOZmumeUpwn/jp9AHKwKT/xKN/a+K7zrixtYAO1cOpFj7
 d4+8s+vo/tfseS4NYWm/mIMeSzO3XvoblxfnXH9rg9olD4a0ENSwdbtPZi3BsRcoZOLqvHmhm
 6p0OA7UJlYfk6V/2yeCFNUyXRvvZcaR77+dPtk8GlxcIuxmgVoo99iFHDCHpRHtPXUQbeQ7KI
 1AH7Jg2zJYMgzZhvQ9KfUZq/mUUSB2gyKwCXHl3xLG3Rgwp/5NL/xypaurcQnoC+BZaCzNZYj
 TaQBAa7WlGzCXHLPdffK7kU/CD4/XxkX7vNXBwxzjmS4ggHgSherKbSsZIppQq998EStQ9Qu5
 swvChf1H5L8m65ZffcI+MiR7vu9yJ014bv2SUUZ1rz4uM9gjEXHQOGRt3MRH3uR9FXMlIkzeB
 FvCif0krnSB8cjAbHhU9LQMUh3OV+uswoYXowbUQOgTjUefPoM7S9jA45MhykqexmRffAjMNf
 7XBiW3Z1HRJKuliUs/e8kEc0mA6eEjXOGk4W1qbrJFPdh/t5UU0zQqg6ByHcOVvUBsiuh4Urp
 V36IYLFJxgce66plkOukBkM3jUu3JpwWbZNigbf87NYRYGUkYMdczvlowcCL79HqDAgyphuwm
 VYuyUrG5jsqx6hFHN9lPQccbtQLgeb/xR85tbEUfLBDw7RROcdMvVakcg==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 06.08.22 um 13:58 schrieb Tokunori Ikegami:

> Note: Sorry let me resend the mail below as text format since it was
> not delivered to the mailing lists as contained HTML subpart.
>
> Hi,
>
> Thanks for your comments.
>
> On 2022/08/06 17:31, Guenter Roeck wrote:
>> On Sat, Aug 06, 2022 at 02:46:06PM +0900, Tokunori Ikegami wrote:
>>> NVMe drives support host controlled thermal management feature as
>>> optional.
>>> The thermal management temperature are different from the
>>> temperature threshold.
>>> So add functionality to set the throttling temperature values.
>>>
>>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>
> I think actually the suggested attributes are not met with the
> throttling temperatures as below.
>
> =C2=A0 temp[1-*]_emergency: Temperature emergency max value, for chips
> supporting more than two upper temperature limits.
> =C2=A0 temp[1-*]_lcrit: Temperature critical min value, typically lower
> than corresponding temp_min values.
>
> =C2=A0 Thermal Management Temperature 1 (TMT1): This field specifies the
> temperature, in Kelvins, when the controller begins to transition to
> lower power active power states or performs vendor specific thermal
> management actions while minimizing the impact on performance (e.g.,
> light throttling) in order to attempt to reduce the Composite
> Temperature.
> =C2=A0 Thermal Management Temperature 2 (TMT2): This field specifies the
> temperature, in Kelvins, when the controller begins to transition to
> lower power active power states or perform vendor specific thermal
> management actions regardless of the impact on performance (e.g.,
> heavy throttling) in order to attempt to reduce the Composite
> Temperature.
>
Maybe those two throttle thresholds could be represented by tempX_crit and=
 tempX_emergency,
the special throttle effect could be documented in the drivers documentati=
on.

Since tempX_crit is already used to report CCTEMP, maybe this value could =
be reported with tempX_rated_max instead?
As far as i know, CCTEMP is the maximum composite temperature rating of th=
e NVME device, so reporting is as tempX_rated_max would make sense.

Armin Wolf

>> NACK. There are several existing limit attributes which can be used
>> for this purpose. I would suggest to use EMERGENCY and LCRIT attributes=
.
>>
>> Furthermore, one can not just extend the hwmon ABI without discussion,
>> much less as part of a patch introducing its use. Any attribute
>> introduced
>> into the ABI must benefit more than one device, and a matching
>> implementation in the sensors command and the lm-sensors library is
>> expected.
>
> Sorry I am not sure about the hwmon ABI situation but if possible
> could you please consider or discuss to extend the attributes from
> this patch review since the suggested attributes seem difficult to use
> instead? (Is it difficult?)
> By the way I have already created the lm-sensors pull request below.
> =C2=A0 <https://github.com/lm-sensors/lm-sensors/pull/406>
>
> Regards,
> Ikegami
>
>>
>> Guenter
