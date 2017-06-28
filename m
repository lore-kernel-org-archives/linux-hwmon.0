Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46413 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752271AbdF1QAw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2017 12:00:52 -0400
Date: Wed, 28 Jun 2017 09:00:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tom Levens <tom.levens@cern.ch>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
Message-ID: <20170628160048.GA8915@roeck-us.net>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <1479384616-12479-3-git-send-email-tom.levens@cern.ch>
 <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net>
 <97eb089f-e0e2-1146-6e17-8f9f790433d8@topic.nl>
 <20170628150130.GC30968@roeck-us.net>
 <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.20.1706281723170.31209@lxplus022.cern.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 28, 2017 at 05:29:38PM +0200, Tom Levens wrote:
> 
[ ... ]

> >
> >>Whatever happened to this patch though? It didn't make it to mainline,
> >>otherwise I'd have found it sooner...
> >>
> >I'll have to look it up, but I guess I didn't get an updated version.
> 
> As far as I remember I had a working V3 of this patch, but it is entirely
> possible that it was never submitted as I have been busy with other projects
> recently. I'll dig it out and check that it is complete.
> 
FWIW, I don't see it at
https://patchwork.kernel.org/project/linux-hwmon/list/?submitter=171225&state=*

Maybe you were waiting for a reply from Rob. Either case, it might make
sense to only provide valid modes, ie to abstract the mode bits from the
hardware, such as

0 - internal temp only
1 - Tr1
2 - V1
3 - V1-V2
4 - Tr2
5 - V3
6 - V3-V4
7 to 14 - per bit 0..2

Guenter
