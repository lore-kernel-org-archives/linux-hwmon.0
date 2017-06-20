Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59162 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751144AbdFTUx1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Jun 2017 16:53:27 -0400
Date: Tue, 20 Jun 2017 13:53:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Cc: clg@kaod.org, stewart@linux.vnet.ibm.com, jdelvare@suse.com,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        svaidy@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH V2 0/2] hwmon: (ibmpowernv) Add support for current(A)
 sensors
Message-ID: <20170620205324.GA28761@roeck-us.net>
References: <1497935293-31618-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1497935293-31618-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jun 20, 2017 at 10:38:11AM +0530, Shilpasri G Bhat wrote:
> The first patch from Cedric in the patchset cleans up the driver to
> provide a neater way to define new sensor types. The second patch adds
> current sensor.
> 
> Cédric Le Goater (1):
>   hwmon: (ibmpowernv) introduce a legacy_compatibles array
> 
> Shilpasri G Bhat (1):
>   hwmon: (ibmpowernv) Add current(A) sensor
> 

Series applied to hwmon-next.

Thanks,
Guenter
