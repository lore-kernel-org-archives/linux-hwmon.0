Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.tdt.de ([195.243.126.94]:39797 "EHLO mail.dev.tdt.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751056AbdIMFgT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Sep 2017 01:36:19 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 07:36:16 +0200
From: Florian Eckert <fe@dev.tdt.de>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings
 documentation
In-Reply-To: <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
References: <20170901065818.2037-1-fe@dev.tdt.de>
 <20170901065818.2037-2-fe@dev.tdt.de> <20170901142622.GC599@roeck-us.net>
 <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
Message-ID: <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello Rob

>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
>> > @@ -0,0 +1,10 @@
>> > +Lantiq cpu temperatur sensor
> 
> s/temperatur/temperature/

Will update this in a follow up page based on the old one. So no v4?

> 
>> > +
>> > +Requires node properties:
>> > +- compatible value :
>> > +	"lantiq,cputemp"
> 
> Kind of non-specific. How is this device even accessed without any 
> other
> property?

It does not need any further properties. If this is set in the device 
tree then the driver is loaded.
After loading the temperature could be read from "/sys/class/hwmon".

Let me know what should i do to get this fixed?

Thanks for feedback

Florian

