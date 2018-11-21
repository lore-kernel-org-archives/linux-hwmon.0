Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:60994 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729105AbeKVEEq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Nov 2018 23:04:46 -0500
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-scsi@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Subject: Re: [PATCH v7] scsi: Add hwmon support for SMART temperature sensors
From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20181118193729.25278-1-linus.walleij@linaro.org>
Date: Wed, 21 Nov 2018 12:28:46 -0500
In-Reply-To: <20181118193729.25278-1-linus.walleij@linaro.org> (Linus
        Walleij's message of "Sun, 18 Nov 2018 20:37:29 +0100")
Message-ID: <yq1va4q8hm9.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Hi Linus!

> This driver does not block any simultaneous use of other SMART
> userspace tools, it's a both/and approach, not either/or.

The problem with all this is that the storage topology is largely
undiscoverable for monitoring purposes. We can use heuristics, but in
many cases there is no reliable way to find out that there is an ATA
device behind member #3 of a USB-attached RAID controller's virtual disk
#5.

So while I am sympathetic to providing this type of information inside
the kernel, the complexity of getting it right is mindboggling. Which is
why it currently lives in smartmontools in userland. And why even the
latter defers several of the topology decisions to the administrator.

You could then argue that the kernel should only provide sensors for a
trivial subset of configurations such as direct-attached ATA/SAS/USB
devices that provide sufficient heuristics to ensure we don't
accidentally send commands down that may wedge the device. I.e. repicate
smartmontools' heuristics inside the kernel. That's a valid position but
I remain unconvinced that it's worth it. Do you have specific user cases
other than this particular RAID box without enclosure sensors? (It's
also worth noting that HDD temperature sensors are notoriously
unreliable).

And finally, from an implementation perspective, both James and Doug
pointed you to SAT and the SCSI Temperature Log Page. libata is our
SAT. And thus the S.M.A.R.T. bits should be located in a libsmart
library that libata and USB can use to fill out the SCSI Temperature Log
Page. The hwmon-facing code would then use that log page instead of
dissecting S.M.A.R.T. information directly.

-- 
Martin K. Petersen	Oracle Linux Engineering
