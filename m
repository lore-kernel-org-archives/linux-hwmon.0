Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35060 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752059AbdIMPMh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Sep 2017 11:12:37 -0400
Date: Wed, 13 Sep 2017 08:12:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Rob Herring <robh@kernel.org>, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings
 documentation
Message-ID: <20170913151234.GH27765@roeck-us.net>
References: <20170901065818.2037-1-fe@dev.tdt.de>
 <20170901065818.2037-2-fe@dev.tdt.de>
 <20170901142622.GC599@roeck-us.net>
 <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
 <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de>
 <20170913141258.GB27765@roeck-us.net>
 <5da3b25f6eec79f103ef880100a403f7@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5da3b25f6eec79f103ef880100a403f7@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Sep 13, 2017 at 04:42:33PM +0200, Florian Eckert wrote:
> >>>
> >>>>> +
> >>>>> +Requires node properties:
> >>>>> +- compatible value :
> >>>>> +	"lantiq,cputemp"
> >>>
> >>>Kind of non-specific. How is this device even accessed without any other
> >>>property?
> >>
> >>It does not need any further properties. If this is set in the device
> >>tree
> >>then the driver is loaded.
> >>After loading the temperature could be read from "/sys/class/hwmon".
> >>Let me know what should i do to get this fixed?
> >>
> 
> What about with this is this OK from your side or do I have do to something?
> So I only update "s/temperatur/temperature/" with an follow-up patch based
> the current linux-next tree?
> 

Also s/cputemp@0/cputemp/ if I understand Rob's comment correctly.

Question for Rob: The driver checks the SOC version and bails out
if the version is not vr9 v1.2. Should that be expressed in DT ?

Guenter

> Thanks
> 
> Florian
> 
> 
