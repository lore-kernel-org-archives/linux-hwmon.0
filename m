Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F42EC4332F
	for <linux-hwmon@archiver.kernel.org>; Sat, 31 Dec 2022 23:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbiLaXnc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 31 Dec 2022 18:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbiLaXnJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 31 Dec 2022 18:43:09 -0500
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466559FDA
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Dec 2022 15:43:00 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 7FF32240289
        for <linux-hwmon@vger.kernel.org>; Sun,  1 Jan 2023 00:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1672530178; bh=2iFVvjsn4cG6UuOZBrBpAosJeIU0MtRJJO3aRMQV5QE=;
        h=Date:Subject:To:Cc:From:From;
        b=EHAds9/VUf0PpNtyzouBtw3tsdtTwXWCoazOeGN6F9JUL2ghlgvtoQ1bVpvOMBJFo
         i+XdsoCmJJrW/ODy5JajFhCyiGvpo83v7eEa5zOwGKliddevFottUaqHZk1J0ctA3+
         GWYjlBuATO9cLHfxNVt34o1F6CK7fTE/IsxPHJOqcfGPBrIqQ/5fmB352ROYZs978p
         NdnXvg3ZS2749vaUQi0BvEpep1KHXttFhBjLLzp5RVQePTTSaY2o6jeuhwkybo4DID
         bbgeNj5Iv3YiZ/AfY0mzr1/0FEwFGUZ9aGiGyfoxBMNazbItq9ttRnYt0qn+6lz0rA
         vnCPH93UIYuZw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4NkzFs2xSNz6tpn;
        Sun,  1 Jan 2023 00:42:57 +0100 (CET)
Message-ID: <3ba37e2d-413b-4d7d-e99b-8e0a53bd7f4e@posteo.de>
Date:   Sat, 31 Dec 2022 23:42:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
To:     Christian Lamparter <chunkeey@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
 <20221230214855.GA3881237@roeck-us.net>
 <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
 <73d1eb21-6cb9-a60f-218b-af129c2cb7a4@gmail.com>
Content-Language: de-DE
From:   Sebastian Arnhold <sebastian.arnhold@posteo.de>
In-Reply-To: <73d1eb21-6cb9-a60f-218b-af129c2cb7a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I tried to add acpi_enforce_resources=lax, but sadly, it does not solve 
the problem.

Maybe Ahmad can help add support for the board?

Thanks,
Sebastian

Am 30.12.22 um 23:58 schrieb Christian Lamparter:
> Hi Sebastian,
>
> On 12/30/22 23:13, Sebastian Arnhold wrote:
>> Thank you very much for the patch, Guenter Roeck!
>>
>> I just compiled it using the mainline Kernel as a basis, but 
>> "sensors-detect" still claims there are no sensors detected on my 
>> ASUS TUF GAMING X670E-PLUS WIFI.
>
> Unfortunately, this might be because ASUS has some "new" ideas :/.
> See this RFC from Ahmad back from October (Author is in Cc)
> for an in-depth view why this is happening:
>
> https://patchwork.kernel.org/project/linux-hwmon/patch/20221018173428.71080-1-ahmad@khalifa.ws/ 
>
>
> Regards,
> Christian
>
