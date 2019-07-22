Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAD8C76196
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 09:12:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9A9422322
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 09:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="TcKFPTOl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfGVJMz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 05:12:55 -0400
Received: from mail.skyhub.de ([5.9.137.197]:51220 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727797AbfGVJMz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 05:12:55 -0400
Received: from nazgul.tnic (87-126-252-198.ip.btc-net.bg [87.126.252.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A29FD1EC0BED;
        Mon, 22 Jul 2019 11:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1563786774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=FjGxKThtP9zHEnA4HhkC20MsNqqgUUGVANPSAgauy10=;
        b=TcKFPTOldisgk5rL5fDRSGCZf59TbNb4FzGmJDDSI8AcDU416FRm+FnopjwJVBQCtHH1x5
        DeEwn1uxw2uPaK6nUdEPwWjlIWKhEMmsOcjTy55Krs1Ulfun0VC6sqrznssbk/10NcbI21
        kAQIu1MCpeyChE+sRPBvCpAaWo09MRI=
Date:   Mon, 22 Jul 2019 11:12:45 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Thomas Gleixner <tglx@linutronix.de>,
        "Woods, Brian" <Brian.Woods@amd.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Marcel Bocu <marcel.p.bocu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Message-ID: <20190722091245.GA23240@nazgul.tnic>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 10:59:32AM +0200, Thomas Gleixner wrote:
> On Fri, 19 Jul 2019, Guenter Roeck wrote:
> > > We could merge his patches (if he contacted the x86 crew), make a v2 of
> > > mine (71h -> 70h, add his Signed-off-by?) and merge, or some other option?
> > > 
> > Either case, we'll need feedback from x86 maintainers. They are not exactly
> > happy if anyone pushes a patch into arch/x86 without their approval.
> 
> Adding those PCI ids looks straight forward. So feel free to route them
> through hwmon with:

... but before you do that, let's wait for Brian to confirm the proper
model range.

Thx.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
