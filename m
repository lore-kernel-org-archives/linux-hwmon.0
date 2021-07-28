Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEE2C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:20:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C52360462
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhG1VUF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:20:05 -0400
Received: from mout.gmx.net ([212.227.15.15]:44869 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231475AbhG1VUE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627507181;
        bh=aQvojKoyWn4SdU4JJB58zII3g9XDAqDNhUc1BvnPsVo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=haCCFRvB0Bllq/jowtPl9bcDIp3HaHevCzSAmnAh5yaPrpn39H61934JJFzP0FbER
         ccaMDOBBX1zc0C1GVeb0nSD6qAE0iSvsIs8VOXAqnsHt4DMTdJ5BRDl4eY7FKYi31i
         KxgDHjg0v0SGqFIUrBuCbXrE1/2IDvENdz9jeq0M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.138] ([79.242.190.212]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My36T-1n7Qnq1dgV-00zZKa; Wed, 28
 Jul 2021 23:19:41 +0200
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Guenter Roeck <linux@roeck-us.net>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
Date:   Wed, 28 Jul 2021 23:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:yaJsNOQEogpfzt8RmH4/7pWg0APk7oyvuFRRs5q3BwB+4p32AZ+
 RUxgrHm/V+jams87F27VXk1B9d8aB5zHHKirExEuQ3AkiuU/nwzNvIKu8wK8OClREZw5KMB
 yJcI1Zr+XvNNluOvkfpXmM/+wU3Y09D4Za62+VdfMEM/b1uuUmztQVoxetwStQwiNZIMm2J
 Echc1A91MDmWT7iiRhneA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tAEDHKNmyGQ=:D5koJkGo8SHwbzggEP42ED
 EJwtOYGlhWetjfZ8qFNKygOoMb3Czp2USbcdmbIGbBrrYxme9+tQWKuP4mwbgTpRDCylmRN/D
 Yd+KaIH2AwlGCpbebNxBjrPRmbJoCqQ3/wGqJwPwI4TdSMmCDsXObw7YE3DX9kKgX6+Feo464
 0AgvAlm/d/QZJHNPxwbaSFfa//H6ePa9CyRDLFkiQETqjebSIsnwDVAZemTUoNYM1LJ2EuZz0
 CN13t8ENPNsNdgpPEjO7bZVMifeoKDCW2YnIzNFEpvAiMtrZUbK9HLCfQ1vz6iUEOLmmFfWJB
 pJrwLZ7ddgpFvmn16XHq12WgaX18z4yLrVNcLyIq3Q48wlhzMngW6Q6V/IW9OBrcEaC2oCLp3
 WWruP8FCgRo0foQ7n1ScL/U/qLCzhI3tUbItSkCk5rNsZPPBgkvUHcH/Q02m0GAMr9/OQf4dL
 sPiINNG1UAZw7T+IRgKXIW/uSaHJFO3F3OjeOyWA8Hc2P/vxy21TLAxX9eBvqA/uLhUQTIHcp
 6AgDGStGKt6c/wA6O88PzLA/EPuyoKKMVbV/lhpinLjoWPdkggUzW8JMO7tAbSkMDWUgJU4sY
 +WBl6b9q91gVUMNVnROgjPYMZLrwRfCaILULIdEC/cy/UicMqjb63eL8iddaGFH9fXcKubMiR
 lPD+sUjD2wDo9M86SOsFpatVp8BxI0Zvkl64bGdWHb794gSa3DKJL1H0R+Fjqbl9L7U2r5QOZ
 9jlnO7lO8b2SpviDvZdF+1QWuK+v8C5//XRqRG2hUFL+diIB5mhNRPsl1jnuobFthmlYw7H2P
 isk2sg5B14DZX9/Hq/E3EVF1/70HPfNOk4R9IwHyWZbxwwBR7JY9K4DCu5gjfalj9+1NM4Quf
 ArMXCFUj4WobZq3BbV1zBEIH5bOz0lA2xoicOW9w69sg5y53edIdloA4oO+rTcXdtxeeIPN5i
 PUNUdJm9llWt+ZXuYkQ7FvpNQAyPijtkSYBTOwW/7kwGz0hUzXAc9pAfJHp8CXfxBUy8tdVwX
 0xmSc45tJmXvPRK4DNPBxX27ndEj3X1mnJ1OSnLC+JaNVCX32X3c4KRVC6XpMfY1QsK1yzW3W
 IGLbFrs0l7/QOjyTQq4gU669LmiMjVqh8Vc
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 28.07.21 23:07 Guenter Roeck wrote:
> On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> This patch series is converting the dell-smm-hwmon driver
>> to the new hwmon registration API. In order to do so,
>> it introduces a platform device in the first patch, and
>> applies some optimisations in the next three patches.
>> The switch to the new hwmon registration API is done in
>> the next patch. The last patch is fixing a small bug.
>>
>> The caching of the fan/temp values was modified to better fit
>> the new hwmon API.
>>
>> The patches work fine for my Dell Latitude C600, but i whould
>> appreciate someone testing the code on another model too.
>>
>> Changes in v6:
>> - Make pwm1_enable permissions write-only
>
> Sorry, guess I am missing something. Why ?
>
> Guenter
>
pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
permissions where 0200.
In the v5 patch series however, the file permission where not 0200, so i
changed that.

Armin
>> - Do not test fan speed in dell_smm_is_visible()
>>
>> Changes in v5:
>> - Fix checkpatch warning after patch 5/6
>> - Hide fanX_label if fan type calls are disallowed
>>
>> Changes in v4:
>> - Make fan detection behave like before patch 5/6
>> - Update coverletter title
>>
>> Changes in v3:
>> - Update description of patch 1/6 and remove empty change
>> - Let pwm1_enable remain write-only
>> - Include a small bugfix
>>
>> Changes in v2:
>> - Fix coverletter title
>> - Update docs regarding pwm1_enable
>>
>> Armin Wolf (6):
>> =C2=A0=C2=A0 hwmon: (dell-smm-hwmon) Use platform device
>> =C2=A0=C2=A0 hwmon: (dell-smm-hwmon) Mark functions as __init
>> =C2=A0=C2=A0 hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
>> =C2=A0=C2=A0 hwmon: (dell-smm-hwmon) Move variables into a driver priva=
te data
>> =C2=A0=C2=A0=C2=A0=C2=A0 structure
>> =C2=A0=C2=A0 hwmon: (dell-smm-hwmon) Convert to
>> =C2=A0=C2=A0=C2=A0=C2=A0 devm_hwmon_device_register_with_info()
>> =C2=A0=C2=A0 hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3=
rd fan
>>
>> =C2=A0 drivers/hwmon/dell-smm-hwmon.c | 847 ++++++++++++++++-----------=
------
>> =C2=A0 1 file changed, 419 insertions(+), 428 deletions(-)
>>
>> --
>> 2.20.1
>>
>
