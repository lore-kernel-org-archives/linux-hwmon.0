Return-Path: <SRS0=QRh7=ZW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74F5C432C3
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Nov 2019 04:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 646ED206E4
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Nov 2019 04:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBNVIqPl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfK3ERr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Nov 2019 23:17:47 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45988 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfK3ERr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Nov 2019 23:17:47 -0500
Received: by mail-oi1-f196.google.com with SMTP id 14so27671095oir.12
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2019 20:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qSPROOOkXV8G0XV8bBMe1frAosIhKTUv/51D1UXa52s=;
        b=BBNVIqPlTSPOMf7dXeBzVhs+rsl+98K1KY3+rtjUbcdrHYPtvkVzQSWNWb1Fgb9Jcn
         huEHqYjNX5/wSL2Cf8XbUrgKDUkQvmtu9vtzc8nNZBL8OEp9A0pLarIhYFPFPCijS+8y
         Lo8/VfRaUZX5HjdxZ+EWl5DD7wMs4J0xvJE2swqX97CNYoEwRiVj4LCFZczkzxl+b+hz
         d9/F9Syr5NYd7fWq+OzpPjKL9ZL6ckXMjdgxRKJkpl7ftC6AotYQ9VZWbXGK5DcUjq9s
         5dKlT2AtbwZ4DM0QX/fGkFlZwikd2Y+Bq0xwFPFxWzRicuJhyR2MNVywvRMbnjNpp4cp
         ntOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qSPROOOkXV8G0XV8bBMe1frAosIhKTUv/51D1UXa52s=;
        b=YusU0QxHYWfdzVz6dNsXu7rWTKlNzpG+8FB/FyMPc4jjs6UVybIRbP6nxrpLWeBdRb
         o1gRufWzaARmiVblGa0Go3XCk10gzst6z8CjFNwih7malaam8gtZJhEHutguhFggq/7g
         62gJfwCC82TKX8WU3+m1Q1TQg3BD/wN1L2wzq+7XAmb2NmgLuIfX/p/Wj+tju1867yK4
         XJoQVQLvRO/nNa3vr6KZpkUKwEawGRf8W/25hkfPc6WJmgEkav0mYa201rdic/dV3G11
         qwe5MoDaBJ2f6fdaIaZCE3t/wtWo0lYrU2/cwqv0urXzR+W/dgzlHbiqY0p+hMvr0i8k
         fFpg==
X-Gm-Message-State: APjAAAWSSlGdfipKmlyT61aToFCFP8FvyVUmBRQzs3+b+U5FLRv9Nt5+
        g90y4ibKiOUzmpOVEWEDSms=
X-Google-Smtp-Source: APXvYqzjVzUkRU1p8m5ijNc/uQVDgU/ueRRmlfMt3tsLTrkmdccaB3KrBIeNaNOHZ+0wqinJMk+ADw==
X-Received: by 2002:aca:1e11:: with SMTP id m17mr3132825oic.100.1575087466506;
        Fri, 29 Nov 2019 20:17:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9sm8086854oik.18.2019.11.29.20.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2019 20:17:45 -0800 (PST)
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
To:     Corey Ashford <yeroca@gmail.com>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
Date:   Fri, 29 Nov 2019 20:17:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/29/19 6:11 PM, Corey Ashford wrote:
> Hello folks.  I am running a newly-built system that uses an IT8686E
> chip.  Currently, the latest kernel from kernel.org doesn't have code
> in drivers/hwmon/it87.c to support it, however, I found some source on
> the net which has added support for quite a few more variants of that
> brand of Super I/O chip:
> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
> I tried it out by building the module and "insmod"ing it into my
> running system, and it appears to work fine.
> 
> It seems the original developer had a difficult time pushing the
> changes upstream, so he abandoned the project.
> 

I abandoned the project (and dropped the driver from my github page)
because people started _demanding_ that I push the driver from github
upstream, without offering any assistance whatsoever.

> My thought was that I could add support for just the IT8686E chip as a
> single patch, and since I can test it locally I would have a better
> chance of getting the patch accepted.  The changes to the source at
> the above git tree have quite a number of changes that aren't really
> necessary for supporting the IT8686E chip, so I think the patch could
> be pretty small, but will still credit the original author.
> 

IT8686 is a multi-page chip, meaning you'll need the entire protection
against multi-page accesses by the EC in the system. It also supports
the new temperature map. I don't think it is that simple.

Guenter
