Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751800AbdIMP0O (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Sep 2017 11:26:14 -0400
MIME-Version: 1.0
In-Reply-To: <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
References: <20170901065818.2037-1-fe@dev.tdt.de> <20170901065818.2037-2-fe@dev.tdt.de>
 <20170901142622.GC599@roeck-us.net> <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
 <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 13 Sep 2017 10:25:51 -0500
Message-ID: <CAL_Jsq+udc2p_jqQN+m4R69zW=7RBfJCDrQgNXOiMycErP43LQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings documentation
To: Florian Eckert <fe@dev.tdt.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 13, 2017 at 12:36 AM, Florian Eckert <fe@dev.tdt.de> wrote:
> Hello Rob
>
>>> > --- /dev/null
>>> > +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
>>> > @@ -0,0 +1,10 @@
>>> > +Lantiq cpu temperatur sensor
>>
>>
>> s/temperatur/temperature/
>
>
> Will update this in a follow up page based on the old one. So no v4?
>
>>
>>> > +
>>> > +Requires node properties:
>>> > +- compatible value :
>>> > +     "lantiq,cputemp"
>>
>>
>> Kind of non-specific. How is this device even accessed without any other
>> property?
>
>
> It does not need any further properties. If this is set in the device tree
> then the driver is loaded.

DT is not the only way to instantiate drivers.

What I meant is how do you access the hardware? That should be evident
from the binding and it is not.

Looking at the driver, you have some memory mapped system control
registers which get ioremapped in arch/mips/lantiq/xway/sysctrl.c and
accesses thru some platform specific macros. That is not the ideal way
to do things as we use syscon and regmap for such things. But that's
all mostly kernel details not so relevant to the DT binding.

For DT, I'd expect this is a child node of the sysctrl block with a
reg property value of <0x40 4> (along with any other child devices).
You could also not even put this in DT and the system controller can
have it's own driver that instantiates the child device for this
driver.

Rob
