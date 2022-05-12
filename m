Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1040C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 01:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349787AbiELBEh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 21:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiELBEg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 21:04:36 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300D86FD23
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 18:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652317475; x=1683853475;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sKM0IYyaq0Z7PXfn4gtX16HbSgKvTSJH8rO9GQc4Hus=;
  b=dhXtq9Fvya7/jZIU52rKfwTKe5c3BTGFPWpJ1cHOYOwVL503COO9yV2l
   VSaUjVnMujn7T0L4i5xRpiQgyes04Zb7w8kQY4IS9qzDv/xzy39QeRo8V
   RZLUsH99KdOD0VJIdym2VROwvDhjjClyM4tZTLJICwaWVlQXfzkfbHkwI
   Itwc5rEE+UfJukynelAX+VYGS+i7UWUSd1FGUjucQxt011vQ9ml3hPavw
   EBPUYVzWz4+Y99ycYSsTcBtY/k2w+4EpbhAC7o1KcPPI8x+bCA6yt1BDi
   WDUhaAxZpC14Ixm7GXCPZRc9Cht3/QNCQiu0yT7Vvv+9Vu3PkMcfGxiL6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269984598"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="269984598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 18:04:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="739462625"
Received: from hshen9-mobl1.ccr.corp.intel.com ([10.249.175.117])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 18:04:30 -0700
Message-ID: <43abbaa52f116c30f93f51d1d9f86a958c64f3c8.camel@intel.com>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
From:   Zhang Rui <rui.zhang@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
Date:   Thu, 12 May 2022 09:04:27 +0800
In-Reply-To: <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
         <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
         <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
         <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 2022-05-11 at 09:53 -0700, Guenter Roeck wrote:
> On 5/11/22 07:37, Zhang Rui wrote:
> > Hi, Guenter,
> > 
> > On Wed, 2022-05-11 at 06:12 -0700, Guenter Roeck wrote:
> > > On 5/11/22 00:54, Zhang Rui wrote:
> > > > The acpi_power_meter driver doesn't create any standard hwmon
> > > > sysfs
> > > > attributes under its hwmon device node, but instead, the driver
> > > > has
> > > > its
> > > > own code to create the hwmon style sysfs attributes in the ACPI
> > > > device
> > > > node of the ACPI Power Meter device.
> > > > I'm not clear why it was designed in that way.
> > > > 
> > > > In order to elimite
> > > > [   79.960333] power_meter ACPI000D:00: hwmon_device_register()
> > > > is
> > > > deprecated. Please convert the driver to use
> > > > hwmon_device_register_with_info().
> > > > convert the driver to use the new API, no chip_info or
> > > > sysfs_groups
> > > > parameter needed.
> > > > 
> > > > The only difference brought by this patch is that the "name"
> > > > attribute
> > > > will be created under the hwmon device node. Not sure if this
> > > > matters or
> > > > not.
> > > > 
> > > > Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> > > 
> > > No, this is not a conversion and not acceptable. Corentin Labbe
> > > is
> > > working on the real thing. See
> > > 
> > 
> > 
https://patchwork.kernel.org/project/linux-hwmon/patch/20220509063010.3878134-3-clabbe@baylibre.com/
> > > 
> > > 
> > 
> > Thanks for the pointer. And this was my original intension about
> > how to
> > do the conversion.
> > 
> > But then I realized that, just like I described in the changelog,
> > the original sysfs attributes in this driver, although they're
> > hwmon
> > style, but they are actually located under the ACPI device node.
> > And the patch above will move them to the hwmon device node, right?
> > 
> > With any patch, this is what I got under the hwmon device node
> > # ls /sys/class/hwmon/hwmon0/
> > device  power  subsystem  uevent
> > 
> > and this is what I got under the ACPI device node
> > # ls /sys/class/hwmon/hwmon0/device/
> > driver  hid  hwmon  measures  modalias  name  path  physical_node  
> > powe
> > r  power1_model_number  power1_oem_info  power1_serial_number  stat
> > us
> > subsystem  uevent  uid
> > 
> 
> That is part of the conversion to any of the new APIs, and
> intentional.
> If that is unacceptable for some reason, you'll have to stick with
> the old
> API and accept the warning. Abusing the new APIs is not acceptable.
> 

I don't know why these attributes were put under the ACPI device node,
and if it is okay to move the location. This is part of the reason that
I'm sending this as RFC.
But if moving them back to hwmon device node doesn't break anything,
surely I'd vote for this.

thanks,
rui


