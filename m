Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901BCC7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:04:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6862F21903
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nsc5T1nT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfGVSEN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 14:04:13 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32875 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731022AbfGVSEN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 14:04:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id x3so27405917lfc.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cGcKb175DABWBbXDXWY+bq3SXb5xng57gmYV3oHgv3I=;
        b=Nsc5T1nT+lafCwzi1nZ+ZpjiM58LbwlBxsamPBL+RkUD+plkvoqRSJ+3aBNMDt7umk
         zjjXpRog4Meux5d4DhvKKayoNFAa6tZ0kL5S6NlA5322FsoN6suvOXlNtAZyz5+jLA9a
         C4RTqqrKpyG/WiR7JkZd+o3DYSC1s8OeSU6huo2DlfaEhldJJp0wA7wkI4IML6aAX7wj
         pchNdUxytdjYXdIOoJGTfP3QZRS7jbx8kHlIv55m2SE/20sA2PYEIMRL11h26PF80V3W
         rNVtedQYxL9wAmiRk/zGJ8gF4L/b0uVJqPZYuBOXbA8sCEG07110nRT/IujA9oJkJLvD
         utag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cGcKb175DABWBbXDXWY+bq3SXb5xng57gmYV3oHgv3I=;
        b=ni0demZhUwaWAVdOocxPjfwhfFo3nqrlEIVO7DDFJ6IwHWPNOMar+V/YhuIot9gC/B
         jLMVtZqe51uj82lkwgrZ/KU+VA8sDNeEpABH+pKpedOb6HjR9CdO+HEhcJUvMNUUtJSS
         wYU/vdyCV74gw5kB9seo0DuJxDyb6SpP9ybcfXs9S6BNCPnBPvfwj8mjYicDuliXe5Ph
         rlPsbT/78D7yq0trsZXrfb6nblI/hQIFOK6g5sCm07X/G6bTq4aLrxMeAp9eSAWhSJ0y
         WUGzCIaDWbIMyEDH4MZ+o1mKa8xY3usuMmBeo4qyL1Oqg9hR1j4Qn6wzrSKUsY1hfiie
         hbyQ==
X-Gm-Message-State: APjAAAWLusX5/38kORXUedr0I0IV5OQ+e9n0bSmpgoGbHNNtdHaTFrk8
        CXSYG4EgG5VfF8sPLPfhNLU=
X-Google-Smtp-Source: APXvYqzSqVovBUBLwIsVnpccYDO1pcKb2B+9sc1PK4QSGhSXU0pnjm9UltWw/LlH6aqnLXyNv92nZA==
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr29870583lfg.152.1563818650904;
        Mon, 22 Jul 2019 11:04:10 -0700 (PDT)
Received: from [192.168.0.100] (62-78-152-105.bb.dnainternet.fi. [62.78.152.105])
        by smtp.gmail.com with ESMTPSA id f30sm6070906lfa.48.2019.07.22.11.04.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:04:10 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
To:     "Woods, Brian" <Brian.Woods@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Vicki Pfau <vi@endrift.com>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
 <20190722091245.GA23240@nazgul.tnic> <20190722160420.GA16162@amd.com>
 <20190722165105.GA9336@roeck-us.net> <20190722173928.GA16597@amd.com>
From:   Marcel Bocu <marcel.p.bocu@gmail.com>
Message-ID: <5be62ebf-0930-3ea5-6e0c-936e21450725@gmail.com>
Date:   Mon, 22 Jul 2019 21:04:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722173928.GA16597@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 22/07/2019 20:39, Woods, Brian wrote:
> On Mon, Jul 22, 2019 at 09:51:05AM -0700, Guenter Roeck wrote:
>>
>> With 3900X, and the series applied, I get:
>>
>> k10temp-pci-00c3
>> Adapter: PCI adapter
>> Tdie:         +45.1°C  (high = +70.0°C)
>> Tctl:         +45.1°C  
>>
>> which looks about right.
>>
>> Interesting, though. I thought there are two CPU dies on this chip.
>> I guess the temperature sensor is on the IO block ? If so, are there
>> additional sensors on the CPU dies ?
>>
>> Guenter
>>
> 
> That's good to know.  Thanks for testing it.
> 
> What happens is the IOD takes the max temperature of the chiplets in the
> package and presents that as the temperature of the package.  It works
> the same way as it does in Rome (server parts).  For better or worse,
> you just get the max temperature of the chiplets rather than the
> temperatures of the individual chiplets.
> 

Out of curiosity, is it the maximum temperature of all chiplets, or just
the non-powergated ones? Because this might explain why I get so much
variance in the idle temperature (40 <-> 50°C in a matter of a second
with a mostly-idle processor). This variance is visible on linux, but
not at all on the firmware's configuration interface.

One other option would be the stock fan not being tight-enough... but
apparently quite a few people have the issue. I'll try tightening it!

Marcel
