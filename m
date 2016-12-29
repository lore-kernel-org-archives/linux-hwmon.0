Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:60069 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750826AbcL2Tqt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 29 Dec 2016 14:46:49 -0500
Date: Thu, 29 Dec 2016 11:46:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, trivial@kernel.org
Subject: Re: [RFC PATCH v2 3/4] hwmon: adc128d818: Trivial code style fixup
Message-ID: <20161229194646.GA1575@roeck-us.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-4-mail@alexanderkoch.net>
 <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
 <3b34c8aa-9d9a-cf88-0d84-8e0d47f9bf44@alexanderkoch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b34c8aa-9d9a-cf88-0d84-8e0d47f9bf44@alexanderkoch.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 29, 2016 at 07:22:12PM +0100, Alexander Koch wrote:
> On 12/26/2016 11:47 AM, Guenter Roeck wrote:
> > On 12/23/2016 02:12 PM, Alexander Koch wrote:
> >> Replace sysfs symbolic file permissions, e.g. 'S_IRUGO', by octal
> >> permissions. This fixes checkpatch.pl warnings.
> >>
> >> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
> >
> > Please do not bother with those warnings and ignore checkpatch.
> > We are in the process of doing an automated conversion.
> 
> Okay, so I shall create v3 of the patchset, without these changes. I've
> found a typo in the 4th patch so I thought about going v3 anyways.
> 
> I've tested operation modes 1-3 on real hardware today and found no
> issues so far, so I hope v3 will have good chances of getting accepted.
> 
Pretty much. One request, though: If there is no configuration data
from DT, I would like the driver to read the mode from the chip - if for
nothing else, this will let me test all modes, but it also supports the
case where the chip is configured by BIOS/ROMMON.

Thanks,
Guenter
