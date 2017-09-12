Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34189 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdILQUK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Sep 2017 12:20:10 -0400
Date: Tue, 12 Sep 2017 11:20:08 -0500
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Florian Eckert <fe@dev.tdt.de>, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings
 documentation
Message-ID: <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
References: <20170901065818.2037-1-fe@dev.tdt.de>
 <20170901065818.2037-2-fe@dev.tdt.de>
 <20170901142622.GC599@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170901142622.GC599@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 01, 2017 at 07:26:22AM -0700, Guenter Roeck wrote:
> On Fri, Sep 01, 2017 at 08:58:18AM +0200, Florian Eckert wrote:
> > Document the devicetree bindings for the ltq-cputemp
> > 
> > Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> 
> I see nothing special with the bindings, and they are in line with other lantiq
> bindings, so I am taking the risk of accepting this patch (and the matching
> driver) without waiting for explicit approval from Rob. Rob, scream at me if
> that is not ok.

Perhaps the existing one was not well reviewed.

> 
> Thanks,
> Guenter
> 
> > ---
> >  Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> > new file mode 100644
> > index 000000000000..33fd00a987c7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> > @@ -0,0 +1,10 @@
> > +Lantiq cpu temperatur sensor

s/temperatur/temperature/

> > +
> > +Requires node properties:
> > +- compatible value :
> > +	"lantiq,cputemp"

Kind of non-specific. How is this device even accessed without any other 
property? 

> > +
> > +Example:
> > +	cputemp@0 {

unit-address without reg property is not valid.

> > +		compatible = "lantiq,cputemp";
> > +	};
> > -- 
> > 2.11.0
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
