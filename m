Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A5BC433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Mar 2021 18:05:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8A7D64DE8
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Mar 2021 18:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCNSEs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Mar 2021 14:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhCNSEY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Mar 2021 14:04:24 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F12C061574
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Mar 2021 11:04:24 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id o19-20020a9d22130000b02901bfa5b79e18so4032697ota.0
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Mar 2021 11:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QyqujYJM71oFkDh/2aS/JeZUGhgVchrMoEAkoVa2mwU=;
        b=joal3F2w5zFczRlhxyKoegVUwBS0LlHaRuOq1a2GIxnHLd94Q8r0qljC3r0hyXEbnn
         ARgAHz/Pxs3k3xIvDdSUymDKsilXYEqd7E7CUi/ag/FS+DHpeVUSy3zuO3Lzch4gLkfP
         CvQ3748aZrzlaTxuO3U/1Sk8lRZfIoj7iyPjh+APtuLpR4lxnmekCUANH2CnqKsTYvZ7
         H9zBImNMFiXUU5w74/musXvbDOhI0ecvWCy9AnFatX6PvzUxup5c2FYl32HQkK2KvhV7
         QJuDXFPx527AMWcoSGpL7K17/Im4F678NMAzF4v0O6/UmmpnqSrBpejR35edDGF0YG/N
         dB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QyqujYJM71oFkDh/2aS/JeZUGhgVchrMoEAkoVa2mwU=;
        b=Thq7wMhsLSkUndNrqFPhkri/yc67CoZjwqvNqbLazjafnxDf/mgRbLd20OCYA1Cq8g
         MfQSfLintHePdnPAv3LlvQBgb0aooDICvrFMMIAq8IhKSMPp8GC15Gg7JAkhMvuht1rH
         qbZt4/m+xWWBJu4/jub2FAVeXsf/BUlP7yERo0Z65fUWb5h9vSMRwbKo2aqqP7UsVBH5
         pxt7mNHGJGKBt9JlEuIoSIglImUdD2/xKEYc+E1ePtcNK/b6LynhwZHQX3xWE2kYUCD9
         Ryq8iQP3yDX/w0fs2eRszSO8MYMhnb6rQ3YPqKw/yDEBCB1bgsQIRH788UaLnJ7JCqIV
         BTbg==
X-Gm-Message-State: AOAM533tyBNSGn1mXTTxeNbiU2gx6A0m5ooWf9usCG1GfxEiOw8gmvSJ
        DxJwQh3LeayiDqII3ScNT+4=
X-Google-Smtp-Source: ABdhPJy0mo4cOZrNHFZ9ipXb21iSl/Dy5/y5S61Dtq07HEH88NY9nPknoiyc9zuhrsl/kSZ4BYpdNg==
X-Received: by 2002:a05:6830:18c6:: with SMTP id v6mr11300548ote.120.1615745063480;
        Sun, 14 Mar 2021 11:04:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s3sm4099796ool.36.2021.03.14.11.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 11:04:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] nvme-hwmon: drop not common HWMON_T_MIN and HWMON_T_MAX
To:     Wang Yugui <wangyugui@e16-tech.com>
Cc:     linux-hwmon@vger.kernel.org, dwagner@suse.de, hare@suse.de
References: <20210314064445.785F.409509F4@e16-tech.com>
 <86ec9dc2-5c4b-1a03-8f58-ea132bd0aef1@roeck-us.net>
 <20210314235117.8386.409509F4@e16-tech.com>
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
Message-ID: <3581ef28-80ed-1afa-87a5-ddc413947df5@roeck-us.net>
Date:   Sun, 14 Mar 2021 11:04:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210314235117.8386.409509F4@e16-tech.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/14/21 8:51 AM, Wang Yugui wrote:
[ ...]
> 
> Most of the users do not like something like 'low  = -273.1¡ãC' or 
> 'high = +65261.8¡ãC' that just seem noise, or software bug, or hardware
> error, and that will cause unnecessary worry.
> 
> We can support more HWMON_T_MIN and HWMON_T_MAX for advanced 
> user iff a valid configure value in the futher, and without any noise.
> 

This is not a valid argument. This is similar for almost all
sensors. You are effectively arguing that all limits for all sensors
should be disabled unless a default is configured by the hardware.
For example, looking at the Super-IO chip output in one of my systems,
I see:

nct6797-isa-0a20
Adapter: ISA adapter
in0:                    +1.42 V  (min =  +0.00 V, max =  +1.74 V)
in1:                    +1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in2:                    +3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in3:                    +3.31 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in4:                    +0.99 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in5:                    +0.15 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in6:                    +0.55 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in7:                    +3.39 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in8:                    +3.28 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in9:                    +1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in10:                   +0.00 V  (min =  +0.00 V, max =  +0.00 V)
in11:                   +0.66 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in12:                   +1.21 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in13:                   +0.68 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in14:                   +1.50 V  (min =  +0.00 V, max =  +0.00 V)  ALARM

Following your line of argument, we should disable reporting (and setting)
minimum and maximum values for pretty much all hardware monitoring drivers
because the hardware (or the BIOS) doesn't set default values. This simply
does not make any sense at all.

If you don't like the default limit output, I would suggest to either
configure limits or to disable the driver in your system. Depriving
all other users from setting limits (and getting alarms if they are
exceeded) just because you don't like that the hardware does not
initialize those limits is an exceedingly bad idea.

Thanks,
Guenter
