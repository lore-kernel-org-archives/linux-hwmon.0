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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE639C432BE
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA5376101B
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhG1Wtj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:49:39 -0400
Received: from mout.gmx.net ([212.227.15.18]:47197 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232073AbhG1Wtj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627512560;
        bh=5UgCI5WtbLLfkAEM25n+h8Apwffi6w1irg/0ggVKQiQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=O00YJ7GRegSSXhLmTaVwKuQYxpu7pQfmJPF3eqjrC3l4dMXOCVsHBRLL9UTe5fhH+
         up2s9/50BB4QDmDaTXhTnMIvQi8J1U7wFylI9KAKRhnrV3ntnXcRg4mqvE/z0eJETi
         mLdRxjzIA/h4Ny0skKcWV8JX899+7A6Z+rBbXTEI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.138] ([79.242.190.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5Q5-1mNSgK398x-00F9VM; Thu, 29
 Jul 2021 00:49:19 +0200
Subject: Re: [PATCH v7 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Guenter Roeck <linux@roeck-us.net>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728221557.8891-1-W_Armin@gmx.de>
 <fb82b50e-fa7d-c735-262b-0ac930c4d8ee@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <95502d8b-8a18-c600-4a42-9479a0f5c681@gmx.de>
Date:   Thu, 29 Jul 2021 00:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fb82b50e-fa7d-c735-262b-0ac930c4d8ee@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:CAHbO22rEHgCvpq8qtWjfltsF87lxjhuty9uFTC4spEXn53giHc
 SN5K6qfcIfrkczQMaX1ydXews/+RgcGwmoSrff7SOr+lPswadKeuAnPuHvSbHX0vPl7kWQ4
 YrsqiYUUtJ5dwnoSn9nHzVqw2qwK2549dW+DUXEsCXfm7IiOVReZJehEdN+oMON+flHq4pT
 IQfbIHQXtXEvgzEysAiRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5BqHpB+XK2g=:MPR2VbKiDYEEXkelQD01hr
 SVd7bJDLFwMGOKpg1SoIyG/wG2fiSb2BNSumXKbH2yYID+FTGk/r7lK66sa8gwVIYpLSAWMCL
 Z17mmIIYrdytqkIVkwxsZWkDsQzm+irlupBeLpP3OG6jU57H7ND2CErOovM+Ij25soBPanQbT
 StJKWRQXe60X3q3tImMEkR1d8ors/0x1ZK/FhkEQXOC6PtgEqMFJ8/+yzppbjLR2mQ6tgYHkU
 OiHw1Gbq9jD8CwoFIqz3i1f2Q4Em/A1AHEVkeQKg+T0ZDzfnrjOi1n4/aDLDNLmtZeIWSSAwd
 MQqFM9uareqZD4jfpZ5yGnPIu3g7Sr9m2sK3Tw9fXnNfAZoPd1yTODAGXyolawu2A/ZsWq5sl
 38m7raD9Jw6TOHV0qNICcjtYGiZvf7rQhMvSr9W3jDJDRIbcb50oDib8iqhJB7MYHWA/z4ZaG
 2GBQhukkRklKCjG/fv845EVbLboZWUTZLzA7p6vhNUvCAch42uggeA3D+toRrHLZ1gQZDfyi7
 fpU1bVjJCWu1G9bw5YnCPcBnzOQudwX4zfA3jnzyleNsd/GuzsPqEnR8HtreqZOO1/MogjmgS
 +L0l3nS8gQJuxfjh+vC3iqN8fz+L2PxbyyScvv5WyHroHkjXoj/m3vkfJRZ+lyaTlPr5hgi0G
 4eLTWv0bZOxWDESvLUQs2Wu13Blys6fsa3q70mSmIS1iVW26uPBF49fPLou5wFQrk/HnAZhOj
 PVA3mmy5g6MD+RQDRS+dmsb9nfq1aeGeQEfHT04h8PWGk+W38EvLi0zZAuGrHniPxJmuoMhgW
 d0/0jpw6ES4uSOW9E+V2jEuHktF4R+Q0JI1OoyUJtI6sWd2FNrf1svsSKxBmTZ6MeUh6D6nt9
 QX4UwKMl+SzlMFTqXN0QWox6UYLWO+wIJXwKor2xpVZf2BwnGTfjioO6RyLTt+bLfwcbIka/G
 0YOo1CIgYQgZ7oMJAGBAeHk/CZutwcF9esjlobQmv78ktfkS0ZfcpB+AIDi5ahgltRYNV9d2n
 6W81e1Z7XbrEl2k5qYgp4Z4TuslORHxw55VFrjyHmr2xBo7WGo+N+uhljgslwfLttonEhg8gM
 ktzs0CTwvF3zBVae+PnNmHASpUnJJx2NjL0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 29.07.21 um 00:43 schrieb Guenter Roeck:
> On 7/28/21 3:15 PM, W_Armin@gmx.de wrote:
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
>
> At this point I'd suggest to queue the series up in -next and see
> what happens. I don't think we'll get additional feedback.
>
> Thought ? Objections ?
>
> Guenter
>
I agree, its unlikely that the code still has big issues, it works on
the C600.
The only thing still untested is reading fan rpm/changing fan control, but
i expect them to work.
>> Changes in v7:
>> - Add commit explaining why pwm1_enable has to be write-only
>>
>> Changes in v6:
>> - Make pwm1_enable permissions write-only
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
>> =C2=A0 drivers/hwmon/dell-smm-hwmon.c | 853 ++++++++++++++++-----------=
------
>> =C2=A0 1 file changed, 425 insertions(+), 428 deletions(-)
>>
>> --
>> 2.20.1
>>
>
