Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C87C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 14:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244825AbiEKOiB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 10:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244794AbiEKOiA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 10:38:00 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14334F46C
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652279878; x=1683815878;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yw1hPl7dtvyOC/4mofNhdqyQu1HSkgTlH3+a1XtHfbg=;
  b=PM6bB4klFrI4gF0R+ZsR8X79Z1V3uxs+5EXFpsDCU9NKE5G1ZE8ORjIZ
   GGaBbLtV/Vr/dLprApnwvOSKW5Ch+ot/I3svbFm55RSV0pNI9We73KG3T
   bqE7qy6YA/SrgYzv2On9v89SRYThJvo30PfIkd9KtgahFrmyu5+VGGkMS
   3lm7vKEXO+622QeqQuOCwEpzMhbgtaM/swuEVveoA+MNY1N5xYlUshAPA
   FJOrtVQr2idNzir2F0G253h7ylB71YLpWXq+feaPxtJiLgeLftY6Hoy+h
   uDYoOjmMOOlhuqUlLlNjWec701KZuJ6Hfhzs1fq2JxRIgsO6e4dr798JQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="356139872"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="356139872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 07:37:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="594163254"
Received: from zpan5-mobl1.ccr.corp.intel.com ([10.249.171.208])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 07:37:56 -0700
Message-ID: <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
From:   Zhang Rui <rui.zhang@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
Date:   Wed, 11 May 2022 22:37:53 +0800
In-Reply-To: <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
         <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi, Guenter,

On Wed, 2022-05-11 at 06:12 -0700, Guenter Roeck wrote:
> On 5/11/22 00:54, Zhang Rui wrote:
> > The acpi_power_meter driver doesn't create any standard hwmon sysfs
> > attributes under its hwmon device node, but instead, the driver has
> > its
> > own code to create the hwmon style sysfs attributes in the ACPI
> > device
> > node of the ACPI Power Meter device.
> > I'm not clear why it was designed in that way.
> > 
> > In order to elimite
> > [   79.960333] power_meter ACPI000D:00: hwmon_device_register() is
> > deprecated. Please convert the driver to use
> > hwmon_device_register_with_info().
> > convert the driver to use the new API, no chip_info or sysfs_groups
> > parameter needed.
> > 
> > The only difference brought by this patch is that the "name"
> > attribute
> > will be created under the hwmon device node. Not sure if this
> > matters or
> > not.
> > 
> > Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> 
> No, this is not a conversion and not acceptable. Corentin Labbe is
> working on the real thing. See
> 
https://patchwork.kernel.org/project/linux-hwmon/patch/20220509063010.3878134-3-clabbe@baylibre.com/
> 
> 
Thanks for the pointer. And this was my original intension about how to
do the conversion.

But then I realized that, just like I described in the changelog,
the original sysfs attributes in this driver, although they're hwmon
style, but they are actually located under the ACPI device node.
And the patch above will move them to the hwmon device node, right?

With any patch, this is what I got under the hwmon device node
# ls /sys/class/hwmon/hwmon0/        
device  power  subsystem  uevent

and this is what I got under the ACPI device node
# ls /sys/class/hwmon/hwmon0/device/
driver  hid  hwmon  measures  modalias  name  path  physical_node  powe
r  power1_model_number  power1_oem_info  power1_serial_number  status  
subsystem  uevent  uid

Plus, in that patch, I don't see how to handle the power meter
capabilities change, i.e. METER_NOTIFY_CONFIG event, in
acpi_power_meter_notify().
According to the previous logic, we may need to remove/add different
attributes based on the new capabilities.

In section 10.4.1 of ACPI Spec 6.4, it says that the _PMC information
"remains constant unless either the power meter's firmware or the BMC
hardware changes, at which time the platform is required to send
Notify(power_meter, 0x80) for the OSPM to re-evaluate _PMC"

If this could happen in real life, we cannot rely on a fixed
hwmon_chip_info and attribute_groups at driver registration phase.

thanks,
rui

> Guenter


> 
> > ---
> >   drivers/hwmon/acpi_power_meter.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/acpi_power_meter.c
> > b/drivers/hwmon/acpi_power_meter.c
> > index c405a5869581..81a982dda5af 100644
> > --- a/drivers/hwmon/acpi_power_meter.c
> > +++ b/drivers/hwmon/acpi_power_meter.c
> > @@ -890,7 +890,8 @@ static int acpi_power_meter_add(struct
> > acpi_device *device)
> >   	if (res)
> >   		goto exit_free_capability;
> >   
> > -	resource->hwmon_dev = hwmon_device_register(&device->dev);
> > +	resource->hwmon_dev = hwmon_device_register_with_info(&device-
> > >dev,
> > +				ACPI_POWER_METER_NAME, NULL, NULL,
> > NULL);
> >   	if (IS_ERR(resource->hwmon_dev)) {
> >   		res = PTR_ERR(resource->hwmon_dev);
> >   		goto exit_remove;
> 
> 

