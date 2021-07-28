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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90626C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E2EF6069E
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 21:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhG1Vey (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 17:34:54 -0400
Received: from mout.gmx.net ([212.227.15.15]:60619 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231665AbhG1Vex (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 17:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627508075;
        bh=AxBG+FkRHYPpRJnWzwt7ampHyEzvaiAfxnefeS9a0vc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=FzjVwkzaJsXUOOPTLV0SzUsClq13x5UP1NUL0/SPyJUaazNAiI1AqmTv/fMl5jseI
         ABg1sS7RJmM9WhXuUjT65IShs8syoZsmDUMddUDcXYWLFtzN/gPcfrsjP4peEDRZTI
         CMJP1Gm9bCroGWx1498mOaVtRj+KL4aqaXVFFRGk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.138] ([79.242.190.212]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1mhuxv0GgK-00ZNU5; Wed, 28
 Jul 2021 23:34:35 +0200
Subject: Re: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon
 registration api
To:     Guenter Roeck <linux@roeck-us.net>, pali@kernel.org
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20210728205142.8959-1-W_Armin@gmx.de>
 <cb393f4a-44c6-4f67-6c1e-ba04c48a59e5@roeck-us.net>
 <340a960b-3031-77de-8e62-5fd933ec9a62@gmx.de>
 <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <cac1b3ef-b51c-4514-cc7b-000b0d48ac8e@gmx.de>
Date:   Wed, 28 Jul 2021 23:34:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0500dd39-c82c-8268-91a3-0a97103ab3d0@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:uoH3jZgmovkbzGIHFcZjnrypXR4JKbDNjg1Ply2tecsuOku8bXQ
 M9f+5go8CGtnPaMbIZmAxmhMH4X6/6eabKCeLW5pQh3tb8yh+sWR16a5tanHp+0hywf1us2
 YAQ8ifFMX+luY6Kt+Fni2nDMtwKjlGkaDpd6C6J/ew9XRpx1gvExq6xqaso8ZKX3waNH+T9
 IFeOWMLUwrCjPiJMSTmRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p5kFCa7oBQQ=:Lo99wOnTWZhhYLGo8lai2E
 VRtScJ7YFI712YgAGVsaTJ7OIdWC4qujFsJo0qwST2cvk2AAfAGEwaMu6ppj9RAQN7HT0jCZc
 Cppv/f3HBouFoD5jAvrOA4v6aILIC3SP7xtf/701LNSPpY7ijNrY/lhwcEz9x7DjOZpi0Cixa
 yxmm6YLPS4QnKIlK4iUxWrjShSxCElGHJpahSjMnNIaENjXxYWPhgU5t4jMCyudwByp4Kpbn2
 1Fs88x1oC54kPkRMuej0X0Sp2JqSXe1cJA7B3r2rP3eSz+SgZkCb62d8ZKNyd4annJAn8H9zN
 i5YSfEOAY+yh5zxN6wsg+o7kdnB7huqegbdbEKz0w8lEao9XdA73mGREWWfyCJp/qVaHO9G40
 NhQ/bn2bzYcte1f3TPWq+se2LQd8QhEjOgBMCXZPGrhsqwoInWbqTWew46lbDD3Nuh6W7pSRX
 UIqTrSCtJ2vUgtuvkImNh514cj52DG677NaD3NkESUIby//rU77PHqkOeKAbTgcOrib5zNYEv
 JJdAPJJCHOhp33SlOKLSPUEaix+lgdjSmtY25w1ZG260WQ5kCG3CVao4rx8yod9w194EeeOOn
 8kMu5nbEm4t2t5m5vf1IB+cAA4gZ6KhH4iwQcCCOV22Norrqa1va8HXSlBY0Ud22Q2sm0JIVI
 Sl3gIMdThFuegk02ZTGVDKQP86YfIwHHZmMFhk7aJd7dV0OenVhydYkzBCrOrajMNY5emqVDP
 Q2vXcpHFIuRMSELL/vuW/nX5dIM30vvFRUk/lyXUrK9L/KbIh8d6Sk9H1ip8mscM18+YyApPw
 TxCKxH+h+AQBe3zSZoDjhTW3l/IJPtQDsp4A/HNwb0pvjMqj+hVVShbUh0mQ4oT3rK4yERT6Z
 b0NnPNxnpfrkXwR22dXhmTQ7nH6G7wR31DwxYPHPIUwirlYzsHAgXq24TKIH2PVJ1HS3E3r7y
 nx1dWtN3w5rpelbQXVijK/vTfuEmhm4QYM8TiH3fjKlXRQ+PwpzKVYRGaIo1BHC67WD1QHRQi
 E6hqk51CohOHMAT31ATo6mKsVK1S+WpCUE0VTSTNrTmFBk8F21RsYAYpSYFal4V/ejjJDlb+A
 8C0QZ/CxpKfvpsk0yWHdbqBKxaPP6agM+8c
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Am 28.07.21 um 23:28 schrieb Guenter Roeck:
> On 7/28/21 2:19 PM, Armin Wolf wrote:
>> On 28.07.21 23:07 Guenter Roeck wrote:
>>> On 7/28/21 1:51 PM, W_Armin@gmx.de wrote:
>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>
>>>> This patch series is converting the dell-smm-hwmon driver
>>>> to the new hwmon registration API. In order to do so,
>>>> it introduces a platform device in the first patch, and
>>>> applies some optimisations in the next three patches.
>>>> The switch to the new hwmon registration API is done in
>>>> the next patch. The last patch is fixing a small bug.
>>>>
>>>> The caching of the fan/temp values was modified to better fit
>>>> the new hwmon API.
>>>>
>>>> The patches work fine for my Dell Latitude C600, but i whould
>>>> appreciate someone testing the code on another model too.
>>>>
>>>> Changes in v6:
>>>> - Make pwm1_enable permissions write-only
>>>
>>> Sorry, guess I am missing something. Why ?
>>>
>>> Guenter
>>>
>> pwm1_enable used SENSOR_DEVICE_ATTR_WO before the patch, so the file
>> permissions where 0200.
>> In the v5 patch series however, the file permission where not 0200, so i
>> changed that.
>>
>
> Is there a _reason_ for declaring this attribute write only, other than
> "it used to be that way" ?
>
> Guenter

I dont think so, dell_smm_read will just return -EOPNOTSUPP if someone tries to read pwm1_enable.

Armin

