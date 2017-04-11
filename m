Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58428 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752862AbdDKU1T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Apr 2017 16:27:19 -0400
Date: Tue, 11 Apr 2017 13:27:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Pawel Moll <pawel.moll@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Anatol Pomazau <anatol@google.com>,
        Mark Segal <segal@google.com>
Subject: Re: [PATCH 2/2] devicetree: Document the max31760 device binding.
Message-ID: <20170411202715.GA22970@roeck-us.net>
References: <20170404192034.158901-1-john@jmuir.com>
 <20170404192034.158901-3-john@jmuir.com>
 <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
 <996F9836-F468-4FB5-A16E-2E1FAE8752AD@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <996F9836-F468-4FB5-A16E-2E1FAE8752AD@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Apr 11, 2017 at 06:47:28AM -0700, John Muir wrote:
> > On Apr 10, 2017, at 8:42 AM, Rob Herring <robh@kernel.org> wrote:
> > 
> > On Tue, Apr 04, 2017 at 12:20:34PM -0700, John Muir wrote:
> >> +MAX31760 fan controller
> >> +-----------------------
> >> +
> >> +This device supports I2C only. Many properties of this device are configurable
> >> +thorugh the hwmon interface. See also Documentation/hwmon/max31760.
> > 
> > I really think we need to describe the fans as separate nodes and 
> > preferably with a common binding. This is the second fan controller 
> > binding recently[1].
> > 
> > Features of the "hwmon interface" are not relevant to the binding. 
> > Bindings describe h/w.
> 
> It seems to me that referring to the hwmon interface is only helpful. You are suggesting removing those sentences? If so, can I add a link to the data sheet?
> 

Devicetree properties are supposed to be operating system independent.
Any mention of how access to the device is implemented on a given
operating system is out of scope for this document.

Guenter

> > 
> >> +Optional node properties:
> >> +- maxim,fan1-enabled		- 1 to enable, 0 to disable. Default: 1.
> >> +- maxim,fan2-enabled		- 1 to enable, 0 to disable. Default: 1.
> >> +- maxim,fan1-label		- String: Hwmon fan1_label.
> >> +- maxim,fan2-label		- String: Hwmon fan2_label.
> > 
> > Perhaps 2 fan sub nodes. reg for fan number, status for enabled, and 
> > label for label.
> 
> OK.
> 
> Right now a fan’s number of pulses and the PWM frequency are configured using the hwmon sysfs interface (which defines standard controls for those), but as those are characteristics of the hardware, should they also be configured via the device tree binding?
> 
> >> +- maxim,pwm-zero-fan-can-fail	- 0: Fan failure detection disabled when PWM is
> >> +				     ramping to 0%.
> >> +				  1: Fan failure detection enabled for all PWM
> >> +				     values.
> >> +				  Default: 0.
> > 
> > All these can be boolean…
> 
> OK. The only issue I see is when the default is ‘true’ in the device, but I’ll try to avoid that. Sometimes I wish that you could set a boolean to false in DTS files.
> 
> > 
> >> +- maxim,temp1-label		- String: Hwmon temp1_label.
> >> +- maxim,temp2-label		- String: Hwmon temp2_label.
> >> +- maxim,temp2-ideality		- Set ideality factor for the remote temperature
> >> +				  sensor. Integer with range 0 to 63,
> >> +				  representing a multiplication factor of 0.9844
> >> +				  to 1.0489. Default: 24 (1.0080).
> > 
> > No maxim,temp1-ideality?
> No - the device only lets you set the ideality of the ‘external' temperature sensor. I guess if there is an ideality for the internal temperature sensor, it would be hard-wired as a characteristic of the part that was used.
> 
> > Not sure what to do with these, but perhaps 
> > also as sub-nodes. Surely we have some bindings already for devices with 
> > multiple temp sensors. Don't invent something custom here.
> 
> I’ll look into it.
> 
> What is the best way to distinguish between ‘fan’ and ‘temp’ sub-nodes? Do I require a ‘compatible’ string?
> 
> Thanks!
> 
> John.
> 
> 
