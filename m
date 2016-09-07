Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51054 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751244AbcIGWhH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2016 18:37:07 -0400
Date: Wed, 7 Sep 2016 15:37:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Ashwin Chaugule <ashwin.chaugule@linaro.org>,
        Duc Dang <dhdang@apm.com>, lho@apm.com,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Message-ID: <20160907223705.GA31582@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <1469134557-26869-3-git-send-email-hotran@apm.com>
 <13081573.BbD3TmEU5Y@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13081573.BbD3TmEU5Y@wuerfel>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 07, 2016 at 11:41:44PM +0200, Arnd Bergmann wrote:
> On Thursday, July 21, 2016 1:55:56 PM CEST Hoan Tran wrote:
> > +               ctx->comm_base_addr = cppc_ss->base_address;
> > +               if (ctx->comm_base_addr) {
> > +                       ctx->pcc_comm_addr =
> > +                                       acpi_os_ioremap(ctx->comm_base_addr,
> > +                                                       cppc_ss->length);
> > 
> 
> This causes the arm64 allmodconfig build to fail now, according to
> kernelci:
> 
>       1  ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
> 
> Should this perhaps call ioremap() or memremap() instead?
> 
Hmmm ... almost sounds to me like blaming the messenger. e7cd190385d1 ("arm64:
mark reserved memblock regions explicitly in iomem") starts using a function
in acpi_os_ioremap() which is not exported. On top of that, memblock_is_memory()
is declared as __init_memblock, which makes me really uncomfortable.
If acpi_os_ioremap() must not be used by modules, and possibly only during
early (?) initialization, maybe its declaration should state those limitations ?

Thanks,
Guenter
