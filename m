Return-Path: <SRS0=YpYn=ZR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD543C432C0
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 17:35:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B526020748
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 17:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRHyjdkd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKYRfm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Nov 2019 12:35:42 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:43467 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfKYRfm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Nov 2019 12:35:42 -0500
Received: by mail-oi1-f180.google.com with SMTP id l20so13843841oie.10
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Nov 2019 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vy1MaS5vQ4KIZ9Yd27+AZpCt2fRYzc7XNnrRwMIeOh4=;
        b=oRHyjdkd2JXtjRLVz89fPISS+wvjWa26T3ywQrZUBuuusIwSQwpTKDYJntBj1AE/Y1
         7hdIKbeCRzgG8ak7uJ93wCLdZuvTxYiJxiH1bJ18vsAbksqOIWjyKyu2nK+OHCOzEbfG
         KqSfrTpszWf7WbkdSYtTf53gumq+8LjBMJ3xYJbiGSe1d0VpUvFZeJxAuQIPn9csBn4N
         KplwchmM5u6AcA4peZQg7CdJ24a6yIitlzKaSS8wzI4zEfxQOX5n2rPf4n6q6E3mPkt7
         DjUvy3bGp6nij26tXdWPSnS368W0JsmVC5Q0zI3XM2w0pnniBAAu6C6xjguF/AVjJrPe
         6Tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=vy1MaS5vQ4KIZ9Yd27+AZpCt2fRYzc7XNnrRwMIeOh4=;
        b=UMxnX14R4ErjONUpSMU5P2D2/oxvYCKtI8gSE9gswPfAwK5i4RyNr+CnMqJXvjTgTy
         fYx5uyNEeB4QfoDXDbFvM1qM5VsAeCbBsIpyQjwAGB3BRgQscnhCLz/zW6t7i/kE1SJJ
         jhie59DvaWiUPipHCGTR2w2PUCodIJf7qpyoHVNHdNGDqd6eFHrdFHGSAuQy10ZiWMAs
         yqkGoPcQz8v0zlVH1UI5KgtChS5qCPjL/OdFuX13Ukt5qcqWQpYJFkJI95duYjMClgLT
         70vfiF9/SuYgvnFsshgLgVZURy13Ob+P4ruGVGRT1iz/qxuMD/nHhM5V+8wxxzTqyrLw
         9LCQ==
X-Gm-Message-State: APjAAAVNGeSXvrreN64m6f9ic0MMQ52MLUxx8TkiqFQmh4O8EWZ+HBtQ
        Kff73hjG6ImUdE45YkXf4UUNdhge
X-Google-Smtp-Source: APXvYqzMEsbi7TGDDdG+8QshLww3IG+vBOW/mPD3krEDx+nTOpja2/WUu3vOENDbZljNTFncYWYKyA==
X-Received: by 2002:aca:3256:: with SMTP id y83mr491oiy.55.1574703340957;
        Mon, 25 Nov 2019 09:35:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l18sm2609550oti.11.2019.11.25.09.35.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2019 09:35:40 -0800 (PST)
Date:   Mon, 25 Nov 2019 09:35:38 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Message-ID: <20191125173538.GA21072@roeck-us.net>
References: <5DDBD386.4070408@kontron.com>
 <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
 <5DDC04FB.1030705@kontron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5DDC04FB.1030705@kontron.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Nov 25, 2019 at 04:44:44PM +0000, Gilles Buloz wrote:
> Le 25/11/2019 15:31, Guenter Roeck a écrit :
> > On 11/25/19 5:13 AM, Gilles Buloz wrote:
> >> Hi Guenter,
> >>
> >> According to the NCT7802Y datasheet, the REG_VOLTAGE_LIMIT_LSB definition is wrong and leads to wrong threshold registers used. It
> >> should be :
> >> static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
> >>           { 0x46, 0x00, 0x40, 0x42, 0x44 },
> >>           { 0x45, 0x00, 0x3f, 0x41, 0x43 },
> >> };
> >> With this definition, the right bit is set in "Voltage SMI Status Register @0x1e" for each threshold reached (using i2cget to check)
> >>
> >
> > Good catch. Care to send a patch ?
> As a fix for this is only useful with a fix for the problem below, maybe a single patch for both would be better.

Not really. Those are two separate issues. The reported and selected
limits are wrong, period. This will require two patches.

> >> But I'm unable to get any "ALARM" reported by the command "sensors" for VSEN1/2/3 = in2,in3,in4 because status for in0 is read
> >> before (unless I set "ignore in0" in sensors file). The problem is that status bits in "Voltage SMI Status Register @0x1e" are
> >> cleared when reading, and a read is done for each inX processed, so only the first inX has a chance to get its alarm bit set.
> >> For this problem I don't see how to fix this easily; just to let you know ...
> >>
> > One possible fix would be to cache each alarm register and to clear the cache
> > either after reading it (bitwise) or after a timeout. The latter is probably
> > better to avoid stale information.
> As we have status registers cleared at byte level and we want them to be cleared at bit level when each bit is read, I think a cache 
> would be better. I suggest this :
> - have a cached value for each status register, by default at 0x00
> - when reading a register to get a bit, "OR" its byte value with its cached value, then use its cached value for processing.
> - then clear the bit that has been processed from the cached value.
> 
Both methods I suggested would have to involve a cache. The question is
when to clear the cache - either clear a bit after reporting it, or
clear it after a timeout.

> I think a timeout would not be obvious to set : at least the time for sensors to read all info (including when terminal is a serial 
> line and output is slower) and to deal with possible latencies, but not too long...

The timeout would be determined by the chip's conversion rate (register 0x26),
or, for simplicity, just be set to one second. I don't immediately see why
that would be difficult to implement. Not that it matters much, really;
I would accept patches with and without timeout. 

Guenter
