Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34192 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdIMONA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Sep 2017 10:13:00 -0400
Date: Wed, 13 Sep 2017 07:12:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Rob Herring <robh@kernel.org>, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings
 documentation
Message-ID: <20170913141258.GB27765@roeck-us.net>
References: <20170901065818.2037-1-fe@dev.tdt.de>
 <20170901065818.2037-2-fe@dev.tdt.de>
 <20170901142622.GC599@roeck-us.net>
 <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
 <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 13, 2017 at 07:36:16AM +0200, Florian Eckert wrote:
> Hello Rob
> 
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
> >>> @@ -0,0 +1,10 @@
> >>> +Lantiq cpu temperatur sensor
> >
> >s/temperatur/temperature/
> 
> Will update this in a follow up page based on the old one. So no v4?
> 
Please send a follow-up patch.

Thanks,
Guenter

> >
> >>> +
> >>> +Requires node properties:
> >>> +- compatible value :
> >>> +	"lantiq,cputemp"
> >
> >Kind of non-specific. How is this device even accessed without any other
> >property?
> 
> It does not need any further properties. If this is set in the device tree
> then the driver is loaded.
> After loading the temperature could be read from "/sys/class/hwmon".
> 
> Let me know what should i do to get this fixed?
> 
> Thanks for feedback
> 
> Florian
> 
