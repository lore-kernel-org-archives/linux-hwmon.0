Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54279 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932641AbcKQS5F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Nov 2016 13:57:05 -0500
Date: Thu, 17 Nov 2016 10:56:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Tom Levens <tom.levens@cern.ch>, jdelvare@suse.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: ltc2990: support all measurement modes
Message-ID: <20161117185654.GA19338@roeck-us.net>
References: <1479384616-12479-1-git-send-email-tom.levens@cern.ch>
 <1479384616-12479-3-git-send-email-tom.levens@cern.ch>
 <410de6c9-a13e-51f7-4d66-6f4e2537c574@roeck-us.net>
 <582DEB81.6050806@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <582DEB81.6050806@topic.nl>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 17, 2016 at 06:40:17PM +0100, Mike Looijmans wrote:
> ﻿On 17-11-16 17:56, Guenter Roeck wrote:
> >On 11/17/2016 04:10 AM, Tom Levens wrote:
> >>Updated version of the ltc2990 driver which supports all measurement
> >>modes available in the chip. The mode can be set through a devicetree
> >>attribute.
> >
[ ... ] 

> >>
> >> static int ltc2990_i2c_probe(struct i2c_client *i2c,
> >>                  const struct i2c_device_id *id)
> >> {
> >>     int ret;
> >>     struct device *hwmon_dev;
> >>+    struct ltc2990_data *data;
> >>+    struct device_node *of_node = i2c->dev.of_node;
> >>
> >>     if (!i2c_check_functionality(i2c->adapter,
> >>I2C_FUNC_SMBUS_BYTE_DATA |
> >>                      I2C_FUNC_SMBUS_WORD_DATA))
> >>         return -ENODEV;
> >>
> >>-    /* Setup continuous mode, current monitor */
> >>+    data = devm_kzalloc(&i2c->dev, sizeof(struct ltc2990_data),
> >>GFP_KERNEL);
> >>+    if (unlikely(!data))
> >>+        return -ENOMEM;
> >>+    data->i2c = i2c;
> >>+
> >>+    if (!of_node || of_property_read_u32(of_node, "lltc,mode",
> >>&data->mode))
> >>+        data->mode = LTC2990_CONTROL_MODE_DEFAULT;
> >
> >Iam arguing with myself if we should still do this or if we should read
> >the mode
> >from the chip instead if it isn't provided (after all, it may have been
> >initialized
> >by the BIOS/ROMMON).
> 
> I think the mode should be explicitly set, without default. There's no way
> to tell whether the BIOS or bootloader has really set it up or whether the
> chip is just reporting whatever it happened to default to. And given the
> chip's function, it's unlikely a bootloader would want to initialize it.
> 
Unlikely but possible. Even if we all agree that the chip should be configured
by the driver, I don't like imposing that view on everyone else.

> My advice would be to make it a required property. If not set, display an
> error and bail out.
> 
It is not that easy, unfortunately. It also has to work on a non-devicetree
system. I would not object to making the property mandatory, but we would
still need to provide non-DT support.

My "use case" for taking the current mode from the chip if not specified
is that it would enable me to run a module test with all modes. I consider
this extremely valuable.

> >Mike, would that break your application, or can you specify the mode in
> >devicetree ?
> 
> I'm fine with specifying this in the devicetree. It will break things for
> me, but I've been warned and willing to bow for the greater good :)
> 
I should have asked if your system uses devicetree. If it does, the problem
should be easy to fix for you. If not, we'll need to find a solution
for your use case.

Thanks,
Guenter
