Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52160 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753554AbcIIV45 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2016 17:56:57 -0400
Date: Fri, 9 Sep 2016 14:56:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Ashwin Chaugule <ashwin.chaugule@linaro.org>,
        Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Devicetree List <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: xgene: access mailbox as RAM
Message-ID: <20160909215653.GA2362@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <CAFHUOYzm4VH1fc3D0fLVv3bCU=2SHx7tZM4nFnCvWeuY+QfEFw@mail.gmail.com>
 <2852054.37zytD0HIa@wuerfel>
 <3475893.910N1IvcYZ@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3475893.910N1IvcYZ@wuerfel>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 09, 2016 at 10:10:45PM +0200, Arnd Bergmann wrote:
> The newly added hwmon driver fails to build in an allmodconfig
> kernel:
> 
>       ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
> 
> According to comments in the code, the mailbox is a shared memory region,
> not a set of MMIO registers, so we should use memremap() for mapping it
> instead of ioremap or acpi_os_ioremap, and pointer dereferences instead
> of readl/writel.
> 
> The driver already uses plain kernel pointers, so it's a bit unusual
> to work with functions that operate on __iomem pointers, and this
> fixes that part too.
> 
> I'm using READ_ONCE/WRITE_ONCE here to keep the existing behavior
> regarding the ordering of the accesses from the CPU, but note that
> there are no barriers (also unchanged from before).
> 
> I'm also keeping the endianess behavior, though I'm unsure whether
> the message data was supposed to be in LE32 format in the first
> place, it's possible this was meant to be interpreted as a byte
> stream instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied after 's/endianess/endianness/' to make checkpatch happy.

Thanks,
Guenter
