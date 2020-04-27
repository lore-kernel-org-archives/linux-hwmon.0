Return-Path: <SRS0=1vPy=6L=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DCEC54FD0
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Apr 2020 13:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D0020663
	for <linux-hwmon@archiver.kernel.org>; Mon, 27 Apr 2020 13:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi/XmspG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgD0NeU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Apr 2020 09:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgD0NeU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Apr 2020 09:34:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01816C0610D5
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2020 06:34:20 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t11so8703577pgg.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2020 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jpyqeoUYiJHMwlhQOh1Jzu/4bIAdQJb6XGtHqWlyLms=;
        b=Gi/XmspGrfW5gszB7YEkToK5qoQGOl1z9S/oVNLABFqj7YmKHs1FxUAup0OhB9OMnv
         yluK873NpuRQ24CqrYN54SfFD8JIJ1nxUYlx12Pindl9KxXyBr70crmWElD7eYXpASu7
         WfpBIdIizLuPfA2YZvqcwWQGSipbbmlXnBow6rXfGXyqmfZ3HW39LTzH2uPtz2ei0J4Z
         NGXlYbET43WXQrYOotaEh0o6fsbFm0J3XKintO6i1mKRDLwxKSz0MYquqMwphJCp+c+C
         ROzUaMZZZmDCJuS7JvNHev8d7EQHJDmlqbo88E9qrNjpPsUra0wJpLnU6VGHiq7H//uf
         G9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jpyqeoUYiJHMwlhQOh1Jzu/4bIAdQJb6XGtHqWlyLms=;
        b=Nv1H5noI0/Bw5fRJnH8AhwQyPhqU/s5Akq2dovQdNTxB4QStvSvZj2YuUb9vyW607D
         mX9/t378iGiQc06PqhRPM61sxkkchaxvr3gRum7jGgJa1jqDVfQY0zkcgIjmY9MTvvsJ
         ky8NSifdqnWcznGSEnymi8hFSyP6lTRIlAL8hgtjKsJj5vi/X+fL5vjaWGv9BNtJ8718
         CSzEbk02Dmlkbhdnpd6lLGMDBvlgp7quF1MKs4trJw/qs9EGUZ8JpXpXjF0KgS0q6jx/
         3wwLIYHcR/e7YYxMPGKyZ3HXQaUhCYHmGBypYI45BJnKqJ7odu545Woo/I7om245sHCs
         P8bg==
X-Gm-Message-State: AGi0PubGQSSm2VxzL+K/O/sjyS0Rgt+qZ33XN0Ja53ggGHQf+JR6SY80
        LNRyqI20mpwOyF7zoJR9Dn0uT53U
X-Google-Smtp-Source: APiQypKajlUoJdx57FWNtIVKk72cbbkU5fp3keH33Ns8TSvL44qx1AEAQy0N713oWS3Bx0vtUYgEBg==
X-Received: by 2002:a62:864c:: with SMTP id x73mr23865018pfd.235.1587994459269;
        Mon, 27 Apr 2020 06:34:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t7sm12543977pfh.143.2020.04.27.06.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 06:34:18 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] hwmon: Add amd_energy driver to report energy
 counters
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
References: <20200425161750.GA67085@roeck-us.net>
 <CAHfPSqAj+Ga8u-bL3TrhWJAmMpJ4y4C9t627j3er=UoV9LfGHQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <23f57a70-9c1e-2b1d-eaa4-80b093db8146@roeck-us.net>
Date:   Mon, 27 Apr 2020 06:34:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHfPSqAj+Ga8u-bL3TrhWJAmMpJ4y4C9t627j3er=UoV9LfGHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/27/20 5:39 AM, Naveen Krishna Ch wrote:
> Hi Guenter,
> 
> On Sat, 25 Apr 2020 at 21:47, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Apr 24, 2020 at 08:50:54AM +0530, Naveen Krishna Chatradhi wrote:
>>> This patch adds hwmon based amd_energy driver support for
>>> family 17h processors from AMD.
>>>
>>> The driver provides following interface to the userspace
>>> 1. Reports the per core consumption
>>>       * file: "energy%d_input", label: "Ecore%03d"
>>> 2. Reports per socket energy consumption
>>>       * file: "energy%d_input", label: "Esocket%d"
>>> 2. Reports scaled energy value in Joules.
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>
>> Couple of additional comments below.
>>
>> On a higher level, I noticed that the data overflows quickly
>> (ie within a day or so), which is the reason why the matching
>> code for Intel CPUs never made it into the kernel. With that
>> in mind, I do wonder if this is really valuable. I am quite
>> concerned about people complaining that the data is useless,
>> and I have to say that I find it quite useless myself. Any
>> system running for more than a few hours will report more or
>> less random data. Any thoughts on that ?
> This driver will also address the future platforms with
> support for 64-bit counters.
> 
> We do have platforms that will come out very shortly, which will
> support a different energy resolution to increase the wraparound
> time with 32bit counters,
> 
> On a platform with 2 sockets each with 64 cores,
> Assuming 240W, new resolution of 15.6 milli Joules
> 
> -  Wrap around time for socket energy counter will be
> (up to ~3 to 4 days with maximum load).
> 
> 2^32*15.625e-3/240 = 279620.2667 secs to wrap (i.e 3.2 days)
> 
> - Wrap around time for the per-core energy counters with the
> new resolution will be
> 
> 2^32*15.6e-3/ (240 * 128) = 2184533.33 secs to wrap (i.e 25 days)
> 
> When a work load is to be run on certain predefined cores.
> The Work load managers can gather the energy status before starting
> and after completion of the job and measure power consumed by the
> work load.
> 
All that doesn't help much for existing platforms, nor for users who
expect that counters don't wrap around at all (at least not until they
reach the 64-bit limit).

I see two options. Either provide power reporting instead (which should
be done in the k10temp driver), or implement a kernel thread which runs
often enough to catch wraparounds. While not perfect (it will only report
the energy since the driver was loaded), it will at least avoid the
frequent wraparounds seen today, and that caveat can be documented.

>>
>> How about making the power reporting registers available and
>> reporting per-CPU power consumption instead ? I think that would
>> add much more value.
> We will expose power reporting when platform exposes that information.
> Until then, energy reporting becomes further critical.
> 

Some Windows tools such as HwInfo report power readings today,
on existing CPUs, so I don't really buy the claim that existing
chips don't report it.

Thanks,
Guenter
