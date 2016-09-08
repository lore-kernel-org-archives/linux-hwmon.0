Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:53007 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756878AbcIHIRJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Sep 2016 04:17:09 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Guenter Roeck <linux@roeck-us.net>
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
Date: Thu, 08 Sep 2016 10:15:25 +0200
Message-ID: <8664936.LICyesLN7G@wuerfel>
In-Reply-To: <20160907222754.GA31475@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <13081573.BbD3TmEU5Y@wuerfel> <20160907222754.GA31475@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wednesday, September 7, 2016 3:27:54 PM CEST Guenter Roeck wrote:
> On Wed, Sep 07, 2016 at 11:41:44PM +0200, Arnd Bergmann wrote:
> > On Thursday, July 21, 2016 1:55:56 PM CEST Hoan Tran wrote:
> > > +               ctx->comm_base_addr = cppc_ss->base_address;
> > > +               if (ctx->comm_base_addr) {
> > > +                       ctx->pcc_comm_addr =
> > > +                                       acpi_os_ioremap(ctx->comm_base_addr,
> > > +                                                       cppc_ss->length);
> > > 
> > 
> > This causes the arm64 allmodconfig build to fail now, according to
> > kernelci:
> > 
> >       1  ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
> > 
> How do you even get there ? arm64:allmodconfig fails for me in -next with
> 
> drivers/pwm/pwm-berlin.c: In function ‘berlin_pwm_suspend’:
> drivers/pwm/pwm-berlin.c:245:35: error: ‘struct berlin_pwm_chip’ has no member named ‘chips’

That was fixed in yesterday's linux-next.

	Arnd

