Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34471 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758471AbcDAIOb (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Apr 2016 04:14:31 -0400
Received: by mail-wm0-f47.google.com with SMTP id p65so15256596wmp.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 Apr 2016 01:14:30 -0700 (PDT)
Date: Fri, 1 Apr 2016 09:14:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
Message-ID: <20160401081426.GS3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1>
 <56FD6A8E.7030208@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56FD6A8E.7030208@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 31 Mar 2016, Thor Thayer wrote:
> On 03/30/2016 06:35 AM, Lee Jones wrote:
> >On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
> >
> >>From: Thor Thayer <tthayer@opensource.altera.com>

[...]

> >>+The A10SR consists of this varied group of sub-devices:
> >>+
> >>+Device                   Description
> >>+------                   ----------
> >>+altr_a10sr_gpio          GPIO Controller
> >>+altr_a10sr_hwmon         Hardware Monitor
> >>+
> >>+The LEDs are implemented entirely in the device tree using
> >>+the gpio-led framework.
> >
> >This is a Linuxisum and should not live in DT bindings.
> 
> I was following the format of other mfd binding documents such as
> Documentation/devicetree/bindings/mfd/da9055.txt so I'll need your
> help understanding this.
> 
> I'm not familiar with the phrase Linuxisum. A Google search turns up
> several threads referencing Linuxisum but I can't seem to find the
> definition. One thread seems to imply that an existing driver such
> as GPIO is a Linuxisum and should not be re-defined. Am I
> understanding correctly?

Linuxisum is a made up word.  Actually, it looks like I placed a
superfluous 'u' in there, but I assume most people would get the gist.
Some examples ending in "ism" which might push the point across are
"colloquialism" and "feminism", where the "ism" can probably be taken
to mean "pertaining to".  So in the example above, we might reasonably
conclude that I meant "pertaining to Linux", which I did.

In other words "the gpio-led framework" is something we have in Linux,
but might not exist in other OSes.  And considering DT is supposed to
be OS agnostic and the documentation relevant to all OSes, you can not
and should not document Linuxisms.

> >>+Example:
> >>+
> >>+        a10-sr: a10-sr@0 {
> >
> >Nodes should be named after their device 'type'.
> >
> >Does this device really start a address 0?
> 
> OK. If I understand, this should be named after mfd then?

MFDs are usually a little tougher, but in your case I think it should
be "resource-manager" or similar.

> >>+		compatible = "altr,altr-a10sr";
> >>+		reg = <0>;
> >>+		spi-max-frequency = <100000>;
> >>+
> >>+		a10sr_gpio: a10sr_gpio {
> >
> >Device type only please.
> 
> And this would be a gpio?

Exactly.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
