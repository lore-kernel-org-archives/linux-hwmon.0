Return-Path: <SRS0=10GT=AO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6299CC433E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Jul 2020 17:10:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4262720708
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Jul 2020 17:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcJOI0BF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgGCRKa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Jul 2020 13:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgGCRKa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Jul 2020 13:10:30 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0A0C061794
        for <linux-hwmon@vger.kernel.org>; Fri,  3 Jul 2020 10:10:30 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id bj10so7628839plb.11
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Jul 2020 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fv0ZEJzTaExdgIBC+xlYdEPnp7kJYcI4JmwVX8XmzpI=;
        b=NcJOI0BFSUN9iSiRMC9aCjWTY/S68SSCbyTB2gwDLGKttYIqOqO4F2vYQDQTImfkdq
         ZXPUeSVDgVlsj7AQJkV1Tc2GJmpHofJ1VzRR0XCo3pKuhXEUveaIzLIATS5quZdcnA83
         wWnI8GyEC8unuUqK0+o31wfRWzU6p22q+sTB8NzWT3HH25bfjYMxah7gkUtVjlcnZp9V
         VX+hbvQW/MTYKy3KN45CD6vWh6qyc2bleyG3WYDoU+Ypqqtl7SJNsFQtZyrd/sWpNvqX
         01/70iBy9MPBXt+drU2t3cP6I83bx48D4lhbtPQ5Gse2pD7/t6RPtQSjjzvZMwKdxc90
         204g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Fv0ZEJzTaExdgIBC+xlYdEPnp7kJYcI4JmwVX8XmzpI=;
        b=i2BJsTgqwH4y0R3KauX5womjMBYZxaxoMCZfxck9g9sXvy2RqrgIAvETRx22FBwdvl
         eLNeJq42gQKiXEyySLxRd82EnIeofJ8pBqFNjhDMh5gGPHVHuaUax5r2L8B32aoEuJzv
         x75YRcabeSp4xGwLHHIxusxTlCshGiztXVA0UPCfigQGQjw0mRLrFBhtil0JRQUSRR7P
         wH60o8uq0yBrrWL6AmLjoZHt8ZwFPooRNOp3dBAfpFpQfeqNkaGC7J8Cc00ateHB1YCQ
         g9pezCzrFBDxvEjBK9rvqdD1mDpFNVP37bT2wv+gHm3Dg5+QATWnc3q95WRhCcpHFRur
         Zjsg==
X-Gm-Message-State: AOAM533t5zKg18w2+jl9PhodYZ4Zeck3w5SaEXZ7ryOFX8dlDLJSQ8WH
        gl+B4enqbHycpoiDZvBXX8fLk7DuIS4=
X-Google-Smtp-Source: ABdhPJz2Nzg1BUOawoJqeN7F0CT/zyccJoU69oLFg8XpilU9ma3cLNIgjF3ZMs3bnTpqbUt8XvcFZg==
X-Received: by 2002:a17:90b:94f:: with SMTP id dw15mr33504277pjb.199.1593796229607;
        Fri, 03 Jul 2020 10:10:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v11sm1702869pfc.108.2020.07.03.10.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 10:10:27 -0700 (PDT)
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error for
 NCT6798D
To:     Stefan Dietrich <roots@gmx.de>, linux-hwmon@vger.kernel.org
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
Date:   Fri, 3 Jul 2020 10:10:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/3/20 9:03 AM, Stefan Dietrich wrote:
> Hi all,
> 
> with my Asus Formula XII Z490 and 5.7.0-7.1-liquorix-amd64 I'm getting
> the following error messages during boot:
> 
> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> nct6775 nct6775.656: Invalid temperature source 28 at index 0, source
> register 0x100, temp register 0x73
> nct6775 nct6775.656: Invalid temperature source 28 at index 1, source
> register 0x200, temp register 0x75
> nct6775 nct6775.656: Invalid temperature source 28 at index 2, source
> register 0x300, temp register 0x77
> nct6775 nct6775.656: Invalid temperature source 28 at index 3, source
> register 0x800, temp register 0x79
> nct6775 nct6775.656: Invalid temperature source 28 at index 4, source
> register 0x900, temp register 0x7b
> nct6775 nct6775.656: Invalid temperature source 28 at index 5, source
> register 0xa00, temp register 0x7d
> 

There is nothing much if anything we can do about that. The NCT6798D
datasheet reports temperature source 28 as reserved. You could ask
Asus for support, but their usual response is that they don't support
Linux.

> During sensors-detect, most of the standard temperature, voltage and
> rpm sources are recognized, however, some of the values, particularly
> voltages, are off quite a bit. In addition, output of additional

Voltages need to be scaled. Scaling factors are mainboard specific and
would have to be determined by comparing BIOS reported voltages with
raw voltages (board vendors usually don't provide the information).
Scaling factors can then be entered into /etc/sensors3.conf.

> temperature sensors (via headers on the mainboard) which are reported
> fine in BIOS, are missing.
> 

Again, this is mainboard specific. We don't know how the hardware reports
those values. Only ASUS could provide the necessary information.
Unfortunately, as mentioned above, they are not exactly known to be
Linux friendly.

Guenter

> Booting with acpi_enforce_resources=lax doesn't solve this issue.
> 
> I'd be happy if anyone would be able to fix this issue or give any
> pointers on how to do so. Unfortunately I only have very basic coding
> skills, but I'll be happy to assist in debugging.
> 
> 
> Cheers,
> Stefan
> 

