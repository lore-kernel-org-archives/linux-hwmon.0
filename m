Return-Path: <SRS0=B7jK=QB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC18C282C2
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jan 2019 22:04:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE0BE21855
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jan 2019 22:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gltMPQyv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfAYWEH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Jan 2019 17:04:07 -0500
Received: from mail-pl1-f178.google.com ([209.85.214.178]:38364 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfAYWEH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Jan 2019 17:04:07 -0500
Received: by mail-pl1-f178.google.com with SMTP id e5so5156282plb.5
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Jan 2019 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PCZb4cxuCjbf0qm7oe0GNJHjjpy1C8qX3eIL7jLWAug=;
        b=gltMPQyvQBSvvZFgIMbAH3XS4VjzZQ9bDL46A09/+UGbZ2FwSfJhcRP+hbTeXBnRJA
         fLAJBUJ5I4SPnk8U6J+cNn56uniUTccJGhO605oflmndCet12RF8IoTOOw9iOtCgGgBd
         3UhUkLs2FhR0UwByP9nbtMSgqePRypThOEVCl8dfd+Eve/4sDjCVuYfzHCNufbbVdjW8
         xa74GxWfwlpz3/Bsu+B+LJr+ZP8nhmj+O6msl0FBQ0gLrciXrEuaPmUV36JizAFC58jV
         gVK3N4egqrlmgqLWohmXH9xViC5EBhVP/Ruyz5mTBE7G9NrSlM+FOGrBflG4EX2QksGV
         BW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=PCZb4cxuCjbf0qm7oe0GNJHjjpy1C8qX3eIL7jLWAug=;
        b=Zj9OFjDXQRswb0PXsXMzH6FBNLBOZpesw4P+zEBK55Rdipj5vCmKk8pDFrZ0VGeENv
         5gKjYKwo+F5WpdaH1r+iPxPE4MZ0JQi6Xq5ZSsU1VG9eCJ6Gnis2MiYvvVbCTsr3GWGq
         VZZ/dNnWRJbZ9BKKgQr+f1IEwhWhZGVqcD1mTtF/thW6SHUAgOCEXf6WpDNXAIVvyZgN
         xg24kLA673xOjYiLIxZgLvS5kYbByiapd5jZfS+x0kcZZb9SfneMAnyvfbkQlbh7Yjde
         8fhfwis7P0zTr8ThnIrzyIec3armJecNypez9WIk++JLoZaevK0bPvU14hlaV4XhMcSk
         YfsA==
X-Gm-Message-State: AJcUukeyJH6n3LWmkV/Uo7UHDJl2a9qPESnB9PXZl1loaA5SDweKzZ+y
        fFj7GIobtctwS/qhKKX80IU=
X-Google-Smtp-Source: ALg8bN6DYAX75gka7TYWHUcm0QObOn40h/Dmkga5m73BfvjXih8Uws2udGh4sPv2wq+jbNSQAk1CJA==
X-Received: by 2002:a17:902:6bc7:: with SMTP id m7mr12997359plt.106.1548453846327;
        Fri, 25 Jan 2019 14:04:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c23sm30468828pfi.83.2019.01.25.14.04.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Jan 2019 14:04:05 -0800 (PST)
Date:   Fri, 25 Jan 2019 14:04:03 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matt Wilbur <wilburm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: LM5066 low- and high-current limit scaling
Message-ID: <20190125220403.GA23935@roeck-us.net>
References: <CAGQJtpOG7m3J9=nbUFi9xhhOKh2T9spSDW4mYfkPeJrSVANdXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGQJtpOG7m3J9=nbUFi9xhhOKh2T9spSDW4mYfkPeJrSVANdXQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 25, 2019 at 03:13:39PM -0500, Matt Wilbur wrote:
> Hi
> 
> First off, this is the first time I've ever tried something like this,
> so I fully anticipate I will make some etiquette / process mistakes.
> 
> In a project I am working on, we make use of the LM5066 hot-swap
> controller.  I believe the kernel module for this chip
> (drivers/hwmon/pmbus/lm25066.c) has an error where the scaling
> parameters for the low- and high-current limits are swapped.
> 
> What's the best way for me to make my case?  Just create a patch and
> try to submit it?  A free-form discussion on the mailing list?
> 

Normally you would send a patch and make your case in the description.

However, be careful.

PSC_CURRENT_IN_L is used if DEVICE_SETUP[4]=1, which (hopefully) translates
to CL=VDD. Per LM25066 datasheet, table 41:
	CL=GND:		M=13661, B=–5200, R=-2
	CL=VDD:		M=6854, B=-3100, R=-2

Current code:
	DEVICE_SETUP[4]=0: M=13661, B=0, R=-2
	DEVICE_SETUP[4]=1: M=6852, B=0, R=-2

This looks mostly correct to me, except for the offset and the
slight difference if CL=VDD. Looks like that was changed at some
point in later datasheet versions.

Overall, the problem (or confusion) is that the logic for
DEVICE_SETUP[4] in the datasheets for the various chips changes.

5066i:
	0 = high setting (50 mV)
	1 = low setting (26 mV)

25066, 25066i:
	0 = low setting (25 mV)
	1 = high setting (46 mV)

... so of course it may well be that the data for some of the chips
is wrong, since we use PSC_CURRENT_IN_L for DEVICE_SETUP[4]=1
throughout (in other words, it is likely that either the data for
LM5066 is wrong, or that the data for LM25066 is wrong - the only
question is which one). It may also be that the datasheets are wrong
or misleading, and that CL=VDD is not (or not always) equivalent
to DEVICE_SETUP[4]=1.

Guenter
