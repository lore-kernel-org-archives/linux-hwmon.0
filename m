Return-path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Hoan Tran <hotran@apm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Devicetree List <devicetree@vger.kernel.org>
Subject: Re: [PATCH] hwmon: xgene: access mailbox as RAM
Date: Fri, 09 Sep 2016 21:58:49 +0200
Message-ID: <2852054.37zytD0HIa@wuerfel>
In-Reply-To: <CAFHUOYzm4VH1fc3D0fLVv3bCU=2SHx7tZM4nFnCvWeuY+QfEFw@mail.gmail.com>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <2529114.aAikiSWl11@wuerfel> <CAFHUOYzm4VH1fc3D0fLVv3bCU=2SHx7tZM4nFnCvWeuY+QfEFw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-hwmon@vger.kernel.org>

On Friday, September 9, 2016 12:24:32 PM CEST Hoan Tran wrote:
> On Fri, Sep 9, 2016 at 8:38 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > The newly added hwmon driver fails to build in an allmodconfig
> > index bc78a5d10182..e834dfb3acca 100644
> > --- a/drivers/hwmon/xgene-hwmon.c
> > +++ b/drivers/hwmon/xgene-hwmon.c
> > @@ -34,7 +34,8 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > -#include <acpi/acpi_io.h>
> > +#include <linux/io.h>
> 
> Alphabetical order.
> 
> >         struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
> > -       void *ptr = generic_comm_base + 1;
> > +       u32 *ptr = (void*)(generic_comm_base + 1);
> 
> Space before "*".

Ok.

> > @@ -652,9 +653,9 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
> >                  */
> >                 ctx->comm_base_addr = cppc_ss->base_address;
> >                 if (ctx->comm_base_addr) {
> > -                       ctx->pcc_comm_addr =
> > -                                       acpi_os_ioremap(ctx->comm_base_addr,
> > -                                                       cppc_ss->length);
> > +                       ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
> > +                                                       cppc_ss->length,
> > +                                                       MEMREMAP_WT);
> 
> It should be MEMREMAP_WB. As mailbox shared memory is on RAM and our
> co-processor is also in the coherency domain.

Right, I was wondering about this, since I could not figure out what
the other side is (hardware, service processor or firmware).
So MEMREMAP_WB makes sense here.

Two more questions:

* Any comment on the byte ordering of the data in this line:

        /* Copy the message to the PCC comm space */
        for (i = 0; i < sizeof(struct slimpro_resp_msg) / 4; i++)
-               writel_relaxed(msg[i], ptr + i * 4);
+               WRITE_ONCE(ptr[i], cpu_to_le32(msg[i]));

This assumes that the old code was correct even when running on
big-endian kernels and the message data consists of 32-bit data words.
If the message has some other format instead, we would need to treat
this as a byte stream and not do swapping here but instead do it
(if any) in the code that reads or writes the actual data here.

* Are you sure you don't need any smp_rmb()/smp_wmb() barriers
between the accesses?

	Arnd
