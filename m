Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E29C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1780C60F02
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhG1Vkk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:40:40 -0400
Received: from mout.gmx.net ([212.227.15.15]:55917 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhG1Vkk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627508421;
        bh=3iaeTNg4o/fk1JxUm6WSLhuUrxcXvpn4GfbyvMHnhts=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ObjkpZKC+70kUNI3s9yERhxS5fzYMGFQosMO+sGBUPiikDfbp4gvcrBpt5+ykiSbW
         4Zj0cFi5P4cQb1hB3abc4/wKAYea9C3aJDAiO6b/c5xOkAJCJnq10Dxjx5S4px21uv
         XQbp64JrXO87q2SIUZAgR9fjonPJOe5g6fyHRDRU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.138] ([79.242.190.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJZE-1mnyjb2oac-00fRiu; Wed, 28
 Jul 2021 23:40:21 +0200
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Guenter Roeck <linux@roeck-us.net>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
 <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
 <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
 <cac1b3ef-b51c-4514-cc7b-000b0d48ac8e@gmx.de>
 <938db8a5-3199-d468-5979-9978171bb138@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <db21294b-48cf-65ad-77dd-494a779650dc@gmx.de>
Date:   Wed, 28 Jul 2021 23:40:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <938db8a5-3199-d468-5979-9978171bb138@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:pvg8VYM8wKJBvj8NJ2nI3r2/94UHQ5hjfwKJQB9sLI1e+Qz5C5C
 IuwrDoqruQ4QmfatGAukFeF4tf0vUnvPnIPow3XTHao4u/gYBJr6aCQpMwTFOaznqihzZoL
 FqOe+h2I4f11ytc7/TIosjNs7HWRCgoh7ubfYy+B0Je8eb6IE0ZLauj+4sRJNwlBWR5MZA9
 KAT1yllGUUjtzb2cTPBQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4xMTK33SU9I=:Qru/VAE2ySAgW4gr3z/TeC
 +e1FzJ/6r2De+n+d/N641S7FGGngwMu68KSiLKxGrjYU1vjNjFCup8hL/jFIZGm/HPkE+pNdc
 JKmc5LSzgAT0ArncMIB+xcm3sDJ3QccN/CrJb7MTX9/I38HWBTBekdgYeN+Pfo+l69tVDzhV3
 ostVAwqgetsZUF8BGq9rA8AwhyYyr/S9x/bOlfMlDwoW41JaANoVcXOJ3PEyVdILsMlChjWuX
 HrmlAZKyd54BhheKAyrKTo2B1EqeC2fSso9BZ8ces07a993ABSBSOcYaDhaXMygq+Ci1NO/eV
 01hAr8kTKxoz398Jgwtx885VGhKzwM0bP6fT8VQpbA7f88updgdmOt/XAefXK0tQMcL3pex6z
 QhQTDfKDdS7QhdHl0rQVkLv+FOR/NSD6aHSFCvPrFHfRrXEDkBbF/dAHvpqc+RdsXCtfo+mqz
 ooFSqgXDfZADk31ZGTTTJr1SVOstOgmGKwgHkIcuxX1aNkCk4KqSQMWvd5f5fwHldapyMUnTq
 qiXTSlTJ/OVsU74X1UMYQhDu1aqOQq+oVGEGeAjAxOww7dHaIaxevTrEBPAMBg3amZ1ELDuQD
 imQlECZr5CEkXwn4o9dUu5T3pUMbdxFy6F5WUF9Ke5hCdDMLgfZ1EmYqYpczfLMlqOKoGP8ze
 2OxEjpnog3/B/xbbXsDT9ZMtcBl5TO+1fJqrtN1bO4XkOVRiuGTD23xYmBvxJXd2sqSoQ6HLK
 rZPuHthOUnl1PlJvLowAKj3Y3j+1v5EHUvMGX3MJoTdc9q9gSb2sDvtCnIY7+w135c9/y4D+J
 2r2YEmWhtRWtgOccCM7Cj65Dl2sWrXbKXx2Rvle9xRJ48oTV+egd6eTZK2FsaehYwA8xxii/h
 fOLdv/6iQaDkh5zBVzgvM4yb082xDNwqabdxCR+zZdX5rX6WXJzeEfBT0IUCNlbYTiJe0oPMK
 faZghqASD7Rn6EZGEevGKaamH/0tYFj0fRTnY+wxBVyR/8gap59KuP+yHPO+wEL3HmlwfPQ1x
 6ua5w9IgN3Sv4zQjnVez0TJgHU91cETGH2ohOmSHHhNs2AzonnrtyST3zdNL9OpN4Kx7jH1Ae
 r1iu+E+ss0/BSmQl8XdLEoxQmMx+n8vPIwD
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 28.07.21 um 23:37 schrieb Guenter Roeck:
> On 7/28/21 2:34 PM, Armin Wolf wrote:
>> Am 28.07.21 um 23:28 schrieb Guenter Roeck:
>>> On 7/28/21 2:19 PM, Armin Wolf wrote:
>>>> On 28.07.21 23:07 Guenter Roeck wrote:
>>>>> On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
>>>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>>>
>>>>>> This patch series is converting the dell-smm-hwmon driver
>>>>>> to the new hwmon registration API. In order to do so,
>>>>>> it introduces a platform device in the first patch, and
>>>>>> applies some optimisations in the next three patches.
>>>>>> The switch to the new hwmon registration API is done in
>>>>>> the next patch. The last patch is fixing a small bug.
>>>>>>
>>>>>> The caching of the fan/temp values was modified to better fit
>>>>>> the new hwmon API.
>>>>>>
>>>>>> The patches work fine for my Dell Latitude C600, but i whould
>>>>>> appreciate someone testing the code on another model too.
>>>>>>
>>>>>> Changes in v6:
>>>>>> - Make pwm1_enable permissions write-only
>>>>>
>>>>> Sorry, guess I am missing something. Why ?
>>>>>
>>>>> Guenter
>>>>>
>>>> pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
>>>> permissions where 0200.
>>>> In the v5 patch series however, the file permission where not 0200,
>>>> so i
>>>> changed that.
>>>>
>>>
>>> Is there a _reason_ for declaring this attribute write only, other tha=
n
>>> "it used to be that way" ?
>>>
>>> Guenter
>>
>> I dont think so, dell_smm_read will just return -EOPNOTSUPP if
>> someone tries to read pwm1_enable.
>>
>> Armin
>>
> That is not what I meant. Is there a reason to not report
> the current status of pwm1_enable to the user ? In other
> words, does the firmware not report its current status ?
>
> Guenter

Pali said the driver cannot query the state of pwm1_enable from the BIOS, =
and with userspace tools being able to change
the state of BIOS fan control behind our back, we cannot simply return the=
 last set value.

