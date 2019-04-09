Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62D2C282DA
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 19:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79F652077C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 19:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbfDIToi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 15:44:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:36958 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726509AbfDIToh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Apr 2019 15:44:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 60880AE99;
        Tue,  9 Apr 2019 19:44:35 +0000 (UTC)
Date:   Tue, 9 Apr 2019 21:44:33 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Eddie James <eajames@linux.vnet.ibm.com>
Cc:     linux-hwmon@vger.kernel.org, Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: OCC drivers are PowerPC-only
Message-ID: <20190409214433.2b96cd8c@endymion>
In-Reply-To: <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
References: <20190409144509.19da00c4@endymion>
        <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Eddie,

Thanks for the quick answer.

On Tue, 9 Apr 2019 10:20:22 -0500, Eddie James wrote:
> On 4/9/19 7:45 AM, Jean Delvare wrote:
> > Don't propose PowerPC-only drivers on other architectures, unless
> > build-testing.  
> 
> This driver does NOT only run on PowerPC; rather it runs on a BMC 
> processor connected to a PowerPC processor. BMC will most likely be ARM, 

Thanks for clarifying. So, you have a server with one or more PowerPC
processors, running any operating system decided by the customer, and
in the same system, is a BMC, running a Linux operating system provided
by IBM? Do I understand it correctly?

> but shouldn't be restricted to that arch only.

Why not? Restricting drivers to the architectures or platforms where
they make sense significantly eases the work of the maintainers of
distribution kernels. Each new kernel version comes with several dozens
of new options. Without hints, they have no idea what is needed on
which architecture, and they either select everything, resulting in an
overweight kernel forever, or nothing, resulting in missing features
until someone complains.

Regardless of any dependency at the Kconfig level, the help text of
these drivers should explain exactly what you wrote above. At the
moment, the reader has no way to guess that the drivers only make sense
for an embedded Linux running on a BMC. As I understand it now, general
purpose distributions do not need these drivers, right? But for example
SUSE kernels included them on all architectures. I just restricted them
to ppc64, but apparently I was wrong and it should be disabled there
too.

A good Kconfig help text should help the user decide whether they need
the driver or not.

> > Also drop configuration symbol SENSORS_OCC which serves no purpose
> > that I can see.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Eddie James <eajames@linux.ibm.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > ---
> > SENSORS_OCC *would* serve a purpose if the common code between the
> > POWER8 driver and the POWER9 driver would go in a separate, shared
> > module, and occ-p8-hwmon and occ-p9-hwmon would only contain the
> > specific code. This would avoid packaging the same code twice in 2
> > separate modules, therefore saving some storage space for ppc
> > distributions.  
> 
> Well you'd never have both P8 and P9 enabled at once, so space shouldn't 
> be an issue. I agree this could be cleaner but I think I was getting 

Where "you" is IBM, provider of the embedded Linux running on the BMC?

> duplicate symbol errors for the compile test and so I did it this way. 
> If this doesn't lead to errors in the compile test, I'm fine with this 
> (without the change for PPC only though).

Dropping SENSORS_OCC can't result in duplicate symbols because it is a
no-op. But while this is the easiest solution, it it not the cleanest
in my opinion. OTOH, if you are certain that both modules will never be
shipped at the same time, then it indeed doesn't matter that much. I
can provide a patch going in either direction. Guenter, any preference?

-- 
Jean Delvare
SUSE L3 Support
