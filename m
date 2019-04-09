Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A83C10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 19:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94AA020833
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 19:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYICGdt6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfDIT6q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 15:58:46 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33121 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbfDIT6q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Apr 2019 15:58:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id k19so24972pgh.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wwGxM87dVvMDjDsBvgq6f9UPpm/EqLsFGkZmvyEgnBw=;
        b=bYICGdt6veAPmbmekI1wqHZyWeX9LVV16Z52efZ2HW+j9GhOjiDZqPr1EFab8f4Gp0
         yUEHQCU6V0M0qgxANc2ScMVOxgVUOb1eEgzIBolgsRIpDKExrLTpkzXGwyuPKhdsx8tM
         O5AdAeUny2LQlIeV98LB8BqVGJBomgPLQ/fyXDt9+Cftc2i/MsyUXxqveIL/WQz5R3Mi
         t4e1iI9OsG12X2JY5EmJevnP++iDH5Um41zhC7sVrezsRo+SOLdTdfIx5xCR1bFhbwOV
         zG708jiOG+f+AD0NKW7xr5meHB8UGDuZKJGv90Z3bXGzdyleAp9qh4wUa58Rk6qrKMFf
         aneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wwGxM87dVvMDjDsBvgq6f9UPpm/EqLsFGkZmvyEgnBw=;
        b=hFyAl8FtAKfyzRjqitflWI+EPQRHIem6mfWqWwRfOR8vwR8nTVd+Afv2P5o6KtQCTh
         G6WFYUwOVOfLTXA/4tqBCz5IYb/QXpaPwcSHpoG0SpHJHzzTlafy0745I7BvteQ12UDT
         Dygi1vlBqk8rK7CvRPJrPWyOF3OoA+jT5w9i+/XlEipl0rgQN9jPE19JnvT5kkcE3Q/F
         jgxKIgpH91JrEyvtwOpBH+qjWBvKO4ATcaPMDhs94h+aDTrH0guqoI9hmiaSG8vd7S5l
         0F0hjDlCT6ACoZrsUlBZkFFOKoxjJBH0EmXpi2kryLMqY7ZM56BeWtdRfbIM2Hnro//3
         pEYw==
X-Gm-Message-State: APjAAAX7NHuR04RWEGxv+AXo4bTytVVZT3ywRLPSb7CRCYVrrEBipefq
        vutKLozlEQW7i4Qoy96QTLE=
X-Google-Smtp-Source: APXvYqzLCrycFREChXWXfsmaf4iX/Q8qh7rHdYnZxYYojE73W3G9rzcghnIGHyEoCRbRDwE+8FTjSQ==
X-Received: by 2002:a62:70c6:: with SMTP id l189mr39284732pfc.139.1554839925310;
        Tue, 09 Apr 2019 12:58:45 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s19sm47563101pfe.74.2019.04.09.12.58.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 12:58:44 -0700 (PDT)
Date:   Tue, 9 Apr 2019 12:58:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Eddie James <eajames@linux.vnet.ibm.com>,
        linux-hwmon@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH] hwmon: OCC drivers are PowerPC-only
Message-ID: <20190409195842.GA21424@roeck-us.net>
References: <20190409144509.19da00c4@endymion>
 <a07ecf9c-2ad2-70f6-0f2f-1c438be3acdc@linux.vnet.ibm.com>
 <20190409214433.2b96cd8c@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409214433.2b96cd8c@endymion>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 09, 2019 at 09:44:33PM +0200, Jean Delvare wrote:
> Hi Eddie,
> 
> Thanks for the quick answer.
> 
> On Tue, 9 Apr 2019 10:20:22 -0500, Eddie James wrote:
> > On 4/9/19 7:45 AM, Jean Delvare wrote:
> > > Don't propose PowerPC-only drivers on other architectures, unless
> > > build-testing.  
> > 
> > This driver does NOT only run on PowerPC; rather it runs on a BMC 
> > processor connected to a PowerPC processor. BMC will most likely be ARM, 
> 
> Thanks for clarifying. So, you have a server with one or more PowerPC
> processors, running any operating system decided by the customer, and
> in the same system, is a BMC, running a Linux operating system provided
> by IBM? Do I understand it correctly?
> 
> > but shouldn't be restricted to that arch only.
> 
> Why not? Restricting drivers to the architectures or platforms where
> they make sense significantly eases the work of the maintainers of
> distribution kernels. Each new kernel version comes with several dozens
> of new options. Without hints, they have no idea what is needed on
> which architecture, and they either select everything, resulting in an
> overweight kernel forever, or nothing, resulting in missing features
> until someone complains.
> 
> Regardless of any dependency at the Kconfig level, the help text of
> these drivers should explain exactly what you wrote above. At the
> moment, the reader has no way to guess that the drivers only make sense
> for an embedded Linux running on a BMC. As I understand it now, general
> purpose distributions do not need these drivers, right? But for example
> SUSE kernels included them on all architectures. I just restricted them
> to ppc64, but apparently I was wrong and it should be disabled there
> too.
> 
> A good Kconfig help text should help the user decide whether they need
> the driver or not.
> 
> > > Also drop configuration symbol SENSORS_OCC which serves no purpose
> > > that I can see.
> > >
> > > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > > Cc: Eddie James <eajames@linux.ibm.com>
> > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > ---
> > > SENSORS_OCC *would* serve a purpose if the common code between the
> > > POWER8 driver and the POWER9 driver would go in a separate, shared
> > > module, and occ-p8-hwmon and occ-p9-hwmon would only contain the
> > > specific code. This would avoid packaging the same code twice in 2
> > > separate modules, therefore saving some storage space for ppc
> > > distributions.  
> > 
> > Well you'd never have both P8 and P9 enabled at once, so space shouldn't 
> > be an issue. I agree this could be cleaner but I think I was getting 
> 
> Where "you" is IBM, provider of the embedded Linux running on the BMC?
> 
> > duplicate symbol errors for the compile test and so I did it this way. 
> > If this doesn't lead to errors in the compile test, I'm fine with this 
> > (without the change for PPC only though).
> 
> Dropping SENSORS_OCC can't result in duplicate symbols because it is a
> no-op. But while this is the easiest solution, it it not the cleanest
> in my opinion. OTOH, if you are certain that both modules will never be

I suspect that referred to symbols in common.c and sysfs.c, but I may
be wrong.

> shipped at the same time, then it indeed doesn't matter that much. I
> can provide a patch going in either direction. Guenter, any preference?
> 
The one I suggested in my other in my reply. Of course, I didn't test it,
so it may not work as suggested and require some additional tweaks.

Guenter
