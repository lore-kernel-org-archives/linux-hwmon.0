Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6F2C47087
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 21:10:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54C1661378
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 21:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhE1VMQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 17:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:52384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhE1VMQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 17:12:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8A286135F;
        Fri, 28 May 2021 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622236240;
        bh=tx2umF6VdeBuQF/vmjtZNIWlHOVomeoBoB1YfMXQjXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZQh7fmeLG1fLD0NjrhPVc0/nf5AflXWxxdqos1yvK4i+ARcC1gRhRyVuQHK8sNSax
         jiw4wFfPP/EIOxACNt4S9PS0E0xGxFgU3y4hTwz0zLqHO6GMwdHvk+ch4wWCMe0HhJ
         PYcUJpJRMw3Xu1CAyX2b5HjgwRiDJt60T0r4yhpA7zxZKwqsjyOSMb3gTwrPea3mLI
         Jp8nye5VlCjmW/+0yLdRbkF/CG53AksL3WhmkdYPWG8h2zt4AZcc52uWwX4j9A0ETJ
         mb+s3eQjP12chDMWWklYvHpMJ/73Beyr+PQC9Tog24Qj1TvmCVk03JwECLlMBHaPIg
         aSAq7hAKYKy3w==
Received: by pali.im (Postfix)
        id 13F3BB0B; Fri, 28 May 2021 23:10:37 +0200 (CEST)
Date:   Fri, 28 May 2021 23:10:37 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 6/6] hwmon: (dell-smm-hwmon) Update docs
Message-ID: <20210528211037.2tnblovgb3rkcwnq@pali>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-7-W_Armin@gmx.de>
 <20210528175310.53ey6xq5ttpfkod6@pali>
 <90260e4f-7e3f-20af-7706-add965ae9192@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90260e4f-7e3f-20af-7706-add965ae9192@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Friday 28 May 2021 22:37:06 Armin Wolf wrote:
> Am 28.05.21 um 19:53 schrieb Pali Rohár:
> > On Friday 28 May 2021 19:37:16 W_Armin@gmx.de wrote:
> > > From: Armin Wolf <W_Armin@gmx.de>
> > > 
> > > pwm1_enable is now readable too.
> > Hello! pwm1_enable cannot be readable. It is write-only node. See also:
> > https://lore.kernel.org/linux-hwmon/201605221717.26604@pali/
> > 
> Hello,
> 
> in Documentation/hwmon/sysfs-interface, pwmX_enable is marked as RW, and the document also states that
> "Read/write values may be read-only for some chips, depending on the hardware implementation", so i
> thought that pwm1_enable being WO is a violation of that rule.

I know that hwmon sysfs are rw but if driver cannot provide correct read
value then it is better to do not report it.

> Also i belive the i8kutils are not calling SMM anymore, so can we just leave a note saying something like
> "this value is cached and is not correct when using certain userspace tools which disable/enable BIOS fan control"?

Well, maybe state changed in time (it is 5 years since that email) but
there are still more older versions of i8k userspace tools and some of
them used to issue SMM calls. Personally, I have used them (prior
introducing kernel support) and I can expect that other people who wrote
other scripts may have them in their inittab (or converted to systemd
equivalent). So it is better to not expect that something is not used.

Whole SMM stuff is fragile for various reasons...

Also another issue is that initial value is unknown. Because we do not
know if BIOS fan control is enabled or disabled.

I was told that in past BIOS fan control was old Dell laptops was
disabled, so if people adds old laptops into whilelist it would mean
that we even do not guess state of BIOS fan control status.

> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   Documentation/hwmon/dell-smm-hwmon.rst | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/dell-smm-hwmon.rst
> > > index 3bf77a5df995..d6fe9b8a2c40 100644
> > > --- a/Documentation/hwmon/dell-smm-hwmon.rst
> > > +++ b/Documentation/hwmon/dell-smm-hwmon.rst
> > > @@ -35,7 +35,7 @@ Name				Perm	Description
> > >   fan[1-3]_input                  RO      Fan speed in RPM.
> > >   fan[1-3]_label                  RO      Fan label.
> > >   pwm[1-3]                        RW      Control the fan PWM duty-cycle.
> > > -pwm1_enable                     WO      Enable or disable automatic BIOS fan
> > > +pwm1_enable                     RW      Enable or disable automatic BIOS fan
> > >                                           control (not supported on all laptops,
> > >                                           see below for details).
> > >   temp[1-10]_input                RO      Temperature reading in milli-degrees
> > > --
> > > 2.20.1
> > > 
> 
