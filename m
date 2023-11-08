Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73631C4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Nov 2023 06:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjKHGDf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Nov 2023 01:03:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjKHGDe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Nov 2023 01:03:34 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95545D41
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Nov 2023 22:03:32 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-da077db5145so6455291276.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Nov 2023 22:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699423412; x=1700028212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EIG5IR4aeSLKZDL/UZXg2XK7G8saSh+KpyA/eSaablg=;
        b=d6WKhfr/AEbCp+6Ee8HIonkEN9sDwSeF8lW8C9qAyPvk7MeqsGj0hbfk7sn8MUS/18
         fSaJW6sXO/aO/oUBCIbKZ1ATi5SlMNpI9tazc7BFkb4TIM6yrfnah3zlXDLqB84IKtwV
         AUj1GGlH+S4lwTszjvAEmwVmiEsYipbXlud97Z9/H+uTKxxTmBRTMf4zKfBcVSPbksIQ
         wu0dTkWR9ztn5263Vsh3ie2nkBQcHd9KAG1i9V4mwpZwrzwlYuWi5AuZzJJiOTuZv5Yq
         7LWU1NUfagsh1xzjeL2vy2DlSvdr+dxkq5xl51f+5GerjiZySLi6xdZ6PqclilL2Q4Sg
         FX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699423412; x=1700028212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIG5IR4aeSLKZDL/UZXg2XK7G8saSh+KpyA/eSaablg=;
        b=QQR0AbY9MsQAK6fX35BxvWy0djbK6GLDGVfhc+EpoFMpe22+0ZIq39FJ+jAG8dtimi
         yeYQ6d0qVDvzQALlJ+FEpdSrdWt/NP5Ee+5v1YDAEw6TCbHp8l1hUYRNxmVvR2x2Vpv/
         t6yiFllKuiRsf0CazS66hmfTfBKF8XXkNGTMkOcSY8NwocCcdQfHDjTOy1Rml+owNgbt
         jQL14tD/JzhV/QBXbXn92M8WWNA+K/26tcE/ZtSYLLRwpQuxPjVIgZmVHzVQTSCktyV/
         8oY3Tdl18G7nDVaxHcflYMFbYqI5WJH+KPkPyuQUvFnG8jxpsbSH/CPxG6WlVWcpA1Yg
         6XUA==
X-Gm-Message-State: AOJu0YxDDN42XN+H5hkvxVjEqYYaB59yOqepVDW7EHBAEUCDakEmME/v
        BgWCGwe+BX4vqCc3oA13VCNQQWOCocI=
X-Google-Smtp-Source: AGHT+IF9ZQ9pLL0zD7oJvlhdVLMQPtYZSchzfaLXz8GGqOFRWKHRyOrDI1RAYwlmLBUehOpna/BvIw==
X-Received: by 2002:a25:d105:0:b0:da0:3bfc:b915 with SMTP id i5-20020a25d105000000b00da03bfcb915mr879997ybg.11.1699423411714;
        Tue, 07 Nov 2023 22:03:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l10-20020a056902000a00b00d9a3fe483cfsm5824912ybh.23.2023.11.07.22.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 22:03:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9259f35c-0d0c-4e02-ad8d-abc856e21ad8@roeck-us.net>
Date:   Tue, 7 Nov 2023 22:03:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v10 0/3] Support pwm/tach driver for aspeed ast26xx
Content-Language: en-US
To:     Billy Tsai <billy_tsai@aspeedtech.com>
References: <20231107105025.1480561-1-billy_tsai@aspeedtech.com>
 <3ea9ef0c-27c0-4304-8bf7-26710224c3b1@roeck-us.net>
 <SG2PR06MB33658A0B3EA8FD0870D8AC388BA8A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
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
In-Reply-To: <SG2PR06MB33658A0B3EA8FD0870D8AC388BA8A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/7/23 18:07, Billy Tsai wrote:
> On 11/7/23 02:50, Billy Tsai wrote:
>>> Unlike the old design that the register setting of the TACH should based
>>> on the configure of the PWM. In ast26xx, the dependency between pwm and
>>> tach controller is eliminated and becomes a separate hardware block. One
>>> is used to provide pwm output and another is used to monitor the frequency
>>> of the input. This driver implements them by exposing two kernel
>>> subsystems: PWM and HWMON. The PWM subsystem can be utilized alongside
>>> existing drivers for controlling elements such as fans (pwm-fan.c),
>>> beepers (pwm-beeper.c) and so on. Through the HWMON subsystem, the driver
>>> provides sysfs interfaces for fan.
>>>
>>> Changes since v9:
>>> Change the type of fan-driving-mode to string
>>> Fix some typos and formatting issues.
>>>
> 
>> What is the resend about ?
> 
> Hi Guenter,
> 
> The reason for the resend is simply to remove the 'Change-Id' in the commit log, which
> will get the error for running scripts/checkpatch.pl.
> 

You should mention that in the change log, and please _never_ drop
the mailing list from your replies.

Thanks,
Guenter

