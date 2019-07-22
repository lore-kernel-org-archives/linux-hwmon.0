Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618C8C76190
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 16:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3652C21901
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 16:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="usmW5MU8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbfGVQvI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 12:51:08 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38570 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730559AbfGVQvH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 12:51:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id f5so9111036pgu.5
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GB/O5Uy9Z+kkQuqM68Pl6wptb/RVZJW+0hv39oSuHDo=;
        b=usmW5MU8bMH1X0/72oJdvJU2tG+EbZHXBAzu6VWt0V56R6mV+T9DFYKxNRAK29tZPJ
         +e8IoQhgE3nYBEF5uysCTaBtT3ktC4BCaqA8WX24mS0U51HQdOE9kzPpNGVM9jHZ/bvI
         VYv/HzcMAwwY6f6CxpoBZcouk16MdfDoHnwEmGGjqydpGpUohuT3S4yuM2IQvuXa9Zb+
         DAA/PSd7ntBHfOCCulDN8FC2q+vNxRUzHsdLyijCs6OD99weFaBwlJVfv3+sGY2Y3Hds
         YiWOeUI2r7fr6jWNIxV5Cc6vGVk4T3zpw678/E+hTFxdJsFtob0JyCBFee5xv3wFcMDG
         Svlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=GB/O5Uy9Z+kkQuqM68Pl6wptb/RVZJW+0hv39oSuHDo=;
        b=VOYCZhgx6OHovZ9s9iJICfPmlzFR9WT2tJWh13kfQoXjzt9+TM8dIsUM6UIAA/4QuN
         Om4X8CKZNAlM8nBxbOCfnGj8EoATc5B0sYb1Hsmw+WjfB8IBt4EqtdyPmiR0mho+EKL5
         hDr9p/1lGaYUhmPikLXkGSLnFZu1yIMrZ/lYe3fURbkyvyN4ev3N9OTeH7d2qTHY9T/q
         Cmp7Zv4+o7ILc/ajjz6dVRy1M3+kExaN6i2zJQeddrO1fPNC3TcF342Lu5/LLJxXjnkw
         x7uQ25m7EpV8unhOAIBqtTO08OVaZX9rkB32T/FRjoNq/l/ybLlQHafYLvI1Cvm1jYDg
         xtOw==
X-Gm-Message-State: APjAAAUYWddjyRs7UV0TQDADNQxrKLwe2jghi0ngKEyi+JzBkpkkAEwc
        799zuf47ttIBF2rJTP3w4p0=
X-Google-Smtp-Source: APXvYqwYfe7UKDo00Ykg+fVYkY0CfrlKitCA7G5mxP1BiCrNElGxRnvY7cIZFVtn9SQCiuOg9COXjw==
X-Received: by 2002:a17:90a:3ae8:: with SMTP id b95mr76132151pjc.68.1563814267132;
        Mon, 22 Jul 2019 09:51:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t11sm47020649pgb.33.2019.07.22.09.51.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 09:51:06 -0700 (PDT)
Date:   Mon, 22 Jul 2019 09:51:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Woods, Brian" <Brian.Woods@amd.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marcel Bocu <marcel.p.bocu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Message-ID: <20190722165105.GA9336@roeck-us.net>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
 <20190722091245.GA23240@nazgul.tnic>
 <20190722160420.GA16162@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722160420.GA16162@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 04:04:24PM +0000, Woods, Brian wrote:
> On Mon, Jul 22, 2019 at 11:12:45AM +0200, Borislav Petkov wrote:
> > On Mon, Jul 22, 2019 at 10:59:32AM +0200, Thomas Gleixner wrote:
> > > On Fri, 19 Jul 2019, Guenter Roeck wrote:
> > > > > We could merge his patches (if he contacted the x86 crew), make a v2 of
> > > > > mine (71h -> 70h, add his Signed-off-by?) and merge, or some other option?
> > > > > 
> > > > Either case, we'll need feedback from x86 maintainers. They are not exactly
> > > > happy if anyone pushes a patch into arch/x86 without their approval.
> > > 
> > > Adding those PCI ids looks straight forward. So feel free to route them
> > > through hwmon with:
> > 
> > ... but before you do that, let's wait for Brian to confirm the proper
> > model range.
> > 
> > Thx.
> > 
> > -- 
> > Regards/Gruss,
> >     Boris.
> > 
> > ECO tip #101: Trim your mails when you reply.
> > --
> 
> Generally we use X0-XF for a model of processors.  Starting at 70h would
> be preferred.
> 
> The PCI devices match our internal documentation for what it's worth.  I
> was going to test these patches but the system I borrowed was
> requisitioned and hasn't been returned yet so I can't test them now, but
> I don't want to delay these anymore.

With 3900X, and the series applied, I get:

k10temp-pci-00c3
Adapter: PCI adapter
Tdie:         +45.1°C  (high = +70.0°C)
Tctl:         +45.1°C  

which looks about right.

Interesting, though. I thought there are two CPU dies on this chip.
I guess the temperature sensor is on the IO block ? If so, are there
additional sensors on the CPU dies ?

Guenter

> 
> Assuming the change from 71h -> 70h, feel free to add:
> Acked-by: Brian Woods <brian.woods@amd.com>
> 
> -- 
> Brian Woods
