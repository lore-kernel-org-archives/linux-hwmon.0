Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32583C76188
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 09:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D33C22296
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 09:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbfGVJAC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 05:00:02 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:35974 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGVJAC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 05:00:02 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos.glx-home)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hpUAU-00024S-6N; Mon, 22 Jul 2019 10:59:38 +0200
Date:   Mon, 22 Jul 2019 10:59:32 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Marcel Bocu <marcel.p.bocu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
In-Reply-To: <20190719160840.GA26100@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com> <20190718193330.GA23809@roeck-us.net> <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com> <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net> <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 19 Jul 2019, Guenter Roeck wrote:
> > We could merge his patches (if he contacted the x86 crew), make a v2 of
> > mine (71h -> 70h, add his Signed-off-by?) and merge, or some other option?
> > 
> Either case, we'll need feedback from x86 maintainers. They are not exactly
> happy if anyone pushes a patch into arch/x86 without their approval.

Adding those PCI ids looks straight forward. So feel free to route them
through hwmon with:

Acked-by: Thomas Gleixner <tglx@linutronix.de>
