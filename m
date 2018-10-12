Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43797 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbeJLUQy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Oct 2018 16:16:54 -0400
Date: Fri, 12 Oct 2018 05:44:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robh@kernel.org>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, joel@jms.id.au
Subject: Re: [PATCH v5 01/10] dt-bindings: fsi: Add P9 OCC device
 documentation
Message-ID: <20181012124434.GA11386@roeck-us.net>
References: <1535664761-86018-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535664761-86018-2-git-send-email-eajames@linux.vnet.ibm.com>
 <20180910181610.GA5907@bogus>
 <c002018d3765280e135d673f7c731784a90a260d.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c002018d3765280e135d673f7c731784a90a260d.camel@kernel.crashing.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 12, 2018 at 09:56:33AM +0200, Benjamin Herrenschmidt wrote:
> On Mon, 2018-09-10 at 13:16 -0500, Rob Herring wrote:
> > On Thu, Aug 30, 2018 at 04:32:32PM -0500, Eddie James wrote:
> > > Document the bindings for the FSI-attached POWER9 On-Chip Controller.
> > > 
> > > Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> > > ---
> > >  Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > > new file mode 100644
> > > index 0000000..46372f6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
> > > @@ -0,0 +1,15 @@
> > > +Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
> > > +---------------------------------------------------------------------
> > > +
> > > +This is the binding for the P9 On-Chip Controller accessed over FSI from a
> > > +service processor. See fsi.txt for details on bindings for FSI slave and CFAM
> > > +nodes.
> > > +
> > > +Required properties:
> > > + - compatible = "ibm,p9-occ"
> > > +
> > > +Examples:
> > > +
> > > +    occ {
> > 
> > FSI slave devices are supposed to have an address according to the 
> > binding doc.
> 
> This isn't the FSI device per-se actually. This is a node below the
> "sbefifo" FSI device. The SBE fifo is the mechanism by which we
> communicate with the OCC. The sbefifo doesn't really define a "bus",
> it's mostly used from userspace directly via /dev/sbefifo* to perform
> various tasks in the chip, but it happens to also provide the in-kernel 
> transport for the OCC commands.
> 

What is the conclusion here ? Is it ok as-is, or does it have to be changed ?

Thanks,
Guenter

> Cheers,
> Ben.
> 
> > > +        compatible = "ibm,p9-occ";
> > > +    };
> > > -- 
> > > 1.8.3.1
> > > 
> 
