Return-Path: <SRS0=H3vz=7J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5A9C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 16:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 512F720C09
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 May 2020 16:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C90QO6MF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgE0Q5H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 May 2020 12:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgE0Q5G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 May 2020 12:57:06 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E30C03E97D
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 09:57:06 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s69so1758656pjb.4
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2020 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2cQVGK+kPlVDffEvba8/Rb2vd4yxf2UZbozyAJ+Ezq4=;
        b=C90QO6MF4h/a3kYMy+i7NiZYc8XWxZc+ccNbDklE9tJOmX8wD8beljZbqSjdv7Snyl
         K7zSMmVC+5msaIoV5ZoQyC6xuNUbsoD+heQt1QjgYdRG9bYKP0db4Phqs5SvTymYX7xd
         bb6urUXp/28jeNwe/unST14TDBpbb2LWO2cH1p1F8tVSztuIg9PwERXJoSdbHWPQDRlO
         yXJpXtGMzOGTzofGDTCN1Wv3YunIjgTbyxO46rM49B+/K6peGqvZMooaE7caJNgceo3g
         FKkgD3SiY2gZGApE71qfFOMkd5tBVpvRBSswnWjSnw8/Lkhb4Q3O3wiWxpRJiHANJqxz
         gILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2cQVGK+kPlVDffEvba8/Rb2vd4yxf2UZbozyAJ+Ezq4=;
        b=BK4zCUJegOjAKfOH8IvGkdyCuWBDHPx2ZLq26i23/yR1jJUJHVMv30cVhW4miXqlWL
         QXkgTVjc5ijtMD3jEo6aN/Gy7u0v8jfMQHfIDDEBB9DX5B1SoIbUQZdtDXpfHk111TvU
         kE63mwsl4YHXCfPumR452hAMfpejlH+oU46LNWFABRErpmvSShiviJUrx6w/I900QA0b
         Pvw2nCFLopu+Fr4R+M3hcFcOAsG/4OnBP9FpGhzr0+qjhOGfIpEGp2/jj9Ik5GLtLa/L
         yo6y3+Ej7E6ybgi8HCZ37lG+EPyc6V+nSi5xqcY3+drjH+YY1TSZj2p27xBuzq0MDlVn
         gl2g==
X-Gm-Message-State: AOAM530Bx0G1go6xtvJLusxH6Uv3eSNFVFlTN4Bu4nvSQA+/dPaEKBW0
        Pwo4BZnPpK/geFukF6QAn/TDKsYD
X-Google-Smtp-Source: ABdhPJwA4yre/yCACU6+aL3MAYN0xQyNinDkeagsWtBDnoNhN75ykhq1bY7TB+AgIh2kD/tmygfKyg==
X-Received: by 2002:a17:90a:2242:: with SMTP id c60mr6251449pje.224.1590598625584;
        Wed, 27 May 2020 09:57:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z13sm2555089pfq.16.2020.05.27.09.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 09:57:04 -0700 (PDT)
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
To:     Alexander Monakov <amonakov@ispras.ru>
Cc:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200519155011.56184-1-nchatrad@amd.com>
 <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <9a4bbf2f-114a-4c69-b03e-0d9326816d44@roeck-us.net>
 <alpine.LNX.2.20.13.2005271703220.18802@monopod.intra.ispras.ru>
 <20200527144838.GA209591@roeck-us.net>
 <alpine.LNX.2.20.13.2005271755070.18802@monopod.intra.ispras.ru>
 <01990ace-a66a-2ada-5c97-a47a57bc90de@roeck-us.net>
 <alpine.LNX.2.20.13.2005271905490.18802@monopod.intra.ispras.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d7c06251-05ff-9355-23f3-99adc4e85e85@roeck-us.net>
Date:   Wed, 27 May 2020 09:57:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.20.13.2005271905490.18802@monopod.intra.ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/27/20 9:41 AM, Alexander Monakov wrote:
> On Wed, 27 May 2020, Guenter Roeck wrote:
> 
>> This exchange is exactly what I was concerned about when this driver
>> was first submitted. I should have known better, and I should not
>> have accepted it. Right now I seriously wonder if I should revert/drop
>> it. Any arguments/thoughts why I _shouldn't_ do that ?
> 
> Let me apologize and explain my perspective.
> 
> These AMD MSRs have been previously wired up in the turbostat tool, and
> very recently another developer submitted a patch to wire up the package
> energy counter MSR for use with perf.
> 
> Unlike the above, this driver is submitted by AMD. As I have noticed a
> substantial issue (sum of core counters contradicting the package counter),
> I have attempted to report it in this thread. Since AMD is submitting the
> code, I was hoping to get their attention to the issue, and ideally get
> some explanations about how the counters work and to what extent we can
> expect them to be accurate.
> 
> I think most of the discussion about (not) ignoring initial counter
> values was in part caused by misunderstanding exactly what issue I was
> reporting. After all, it's not so important if the driver accurately
> captures boot-time energy use, if the counters are not trustworthy.
> 
> I don't have an answer to your question (whether you should keep the
> driver). I hope you see where I'm coming from. I'm not quite aware of
> the history with coretemp driver, so if all this caused you extra
> headaches, I apologize for my part in the mess.
> 

There are two opposing arguments:

- The driver can not guarantee that there are no previous overflows,
  thus it should always start counting from 0.
- The driver is in all typical and most common situations loaded
  when the system boots, when there have been no overflows. Therefore,
  it should include startup counter values to provide accurate
  information for those most common use cases.

My prediction was that we would see endless arguments about this,
with one set of people arguing one way, another set of people
arguing the other way, and both being extremely passionate
about it. You have already proven my point.

This is a perfect lose-lose situation, with me sitting in the
middle. In such situations my reaction tends to be to pull
the plug.

Guenter
