Return-Path: <SRS0=nCRF=AQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DF0C433E0
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 13:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF61E2075D
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 13:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWJKQPdw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgGENX3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jul 2020 09:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgGENX3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jul 2020 09:23:29 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6D0C061794
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2020 06:23:29 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x11so14306567plo.7
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Jul 2020 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cMDzgZhB+2WAI/hj7L5hfKUXwssqZOTEM4Ookex7ZHQ=;
        b=XWJKQPdwTyticWt5EfzLayXdnL/4v+dB33r1e1p2afYX3zLNYZ8CjNazX4WVvliCd0
         AagqwlXQMn/KAFLpi7Ce4w9P4Hzf9Mbp5lRkRMZ1kAmfzcovnTcohN49g5MXFOGDs+BX
         18WFBox2hcQnug7cSoR4gWNwdwllVy5gNljad0grqFUx89PlSiaLSa0kDomBhXQRSiPK
         7Yi5aKM5wnu5kyDHqLP8cNgHCGYJNN7Tbsui/9MchEEhm4g+2Sm9B9Fk4V5SfE2fRDzw
         RSxSzWiwuCTzrmIKnJeAuhBJkIgOiVmcDp/20AW3gShBEBRtmfwC/nhhYnhg7quHVKuU
         wcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cMDzgZhB+2WAI/hj7L5hfKUXwssqZOTEM4Ookex7ZHQ=;
        b=OPLBmsw5/pdWX3S9SxdVx/P4a0sMq+0nPWmEP8fvy67B7yV5szMf+XCfVFll/59Qlz
         GOG1gYcPiD6AyD8/mLM2eZQ/wmkbfwrOS+WKJQJIWTwU5d21Tik5eKp2zM0yTM1X28gu
         50I5fLUE1OEdqPVw1TpVD4D8Zn5CAhwftXVjjTRoRb6fkWWCmAWp51Ni6V7YRbpwLvoV
         LbBo8YDKTtptFSNoMaE1OlNZnuzaahS3ty7QcFSRI58ucoFOH5mrRVQYS6SbX2k6eMgV
         ahT96b0OJ1UrqkyIgx+WRZiEcaMLzqMOr/2eVH+ZsBzggTJlaCCkijYfPi6hWeMm9yLk
         VwQg==
X-Gm-Message-State: AOAM530WTab8rtFSHzVlE/2rLx2/bSvE5uXj7J/3iaI7Av524PgaQtBz
        EkJ5lxamavOkeLkROHCeSNSdbR7PtDY=
X-Google-Smtp-Source: ABdhPJy/1+D5UNUq77haNDVDEGq0B6vA1JHoEMk7CxybVDrYiqw6Mb89SMtgiOBZPSVD79G8OyVjeQ==
X-Received: by 2002:a17:902:b687:: with SMTP id c7mr37709876pls.102.1593955408101;
        Sun, 05 Jul 2020 06:23:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j10sm16101566pgh.28.2020.07.05.06.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 06:23:26 -0700 (PDT)
Subject: Re: [QUESTION] fan rpm hwmon driver
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <xU_nzuNaKzomGSEsIdtEGvDVgR0MuUoti45TC5WzkVu0FscRsOEp7dzY4tGOoUkvrG9QPJethyosMSnxcXFuE-xcpqJ6DQwfnPkPlFiEcbY=@protonmail.com>
 <3b92f53f-fd3f-a432-aae1-620582701286@roeck-us.net>
 <vCYQSnYIKROnbBCa77NtCP1VqtQUNl8cItazgNFjTJfmzRogHKpxkUThwzQnv-HXuISOOhhZ_J_gM2Pm-Y8dwfp2c6IxY2LYirIgdbriYwQ=@protonmail.com>
 <3259b471-c3b6-ef22-e5c6-813313395cef@roeck-us.net>
 <gPUUkJgSquQcl0TQu3m4-RdGPCj7xKAyRqgZlbIcu0FoA3egKZHq6VUMpNDMLJSp5Vs9GTRV7QWOfKJR3Mv4zgKof9JtJn_bAjAZu6Rykkk=@protonmail.com>
 <097a08db-2afb-f220-75d3-caa9d37fd1f9@roeck-us.net>
 <OiRhgUQ7biZw0KwFjt27l2MOveHFmJ5I2LevL0Uh84m1lPTioycSKybzJlMzjkGpcQkVnOOI4kiY7vKQ2Yzw7-uHub8OsCUir6RsmFIE9go=@protonmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1507eedb-c78c-7333-84ec-880e1ea1b1c8@roeck-us.net>
Date:   Sun, 5 Jul 2020 06:23:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <OiRhgUQ7biZw0KwFjt27l2MOveHFmJ5I2LevL0Uh84m1lPTioycSKybzJlMzjkGpcQkVnOOI4kiY7vKQ2Yzw7-uHub8OsCUir6RsmFIE9go=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/5/20 4:34 AM, Barnabás Pőcze wrote:
[ ... ]

>>
>>> Furthermore, did it help answer the "who is going to maintain the driver after the initial submission" question of your previous email?
>>
>> A driver is not write-and-forget. It has to be maintained, preferably by someone
>> with access to the hardware. Otherwise it is going to bit-rot. Do you plan to
>> volunteer to do that ?
>>
> 
> I have no clue what that entails, but I am assuming: fixing bugs, accepting, reviewing patches for that driver, then forwarding them upstream, maybe also updating the code base according to the best practices at the moment from time to time, correct?
> 
You would not have to forward patches upstream (I see them anyway), but
correct for the rest.

> I would certainly volunteer if it is needed.
> 
That would be great.

Something else that came to my mind: Did you examine the DSDT ?
If the board vendor did the right thing, it should include an abstract
means to read the fan data through ACPI. That would be much better than
having to read it from the EC directly.

Thanks,
Guenter
