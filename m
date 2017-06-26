Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38763 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751101AbdFZRGO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2017 13:06:14 -0400
Date: Mon, 26 Jun 2017 10:06:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>, linux-kernel@vger.kernel.org,
        Fenghua Yu <fenghua.yu@intel.com>, linux-hwmon@vger.kernel.org
Subject: Re: userspace regression with hwmon
Message-ID: <20170626170611.GC20491@roeck-us.net>
References: <20170626143320.GA1976@sudip-tp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170626143320.GA1976@sudip-tp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jun 26, 2017 at 03:33:20PM +0100, Sudip Mukherjee wrote:
> Hi Guenter, Jean,
> 
> The patch d72d19c26c41 ("hwmon: (coretemp) Convert to use
> devm_hwmon_device_register_with_groups") has changed the location of the
> sysfs nodes from /sys/devices/platform/coretemp.0/ to
> /sys/devices/platform/coretemp.0/hwmon/hwmon0/ and that has broken
> some of our usespace applications when we have updated the kernel from
> v3.8 to v4.4. For now I am reverting that said patch in our production
> kernel (based on v4.4) but that is not an elegant solution.
> Do you have any other reports like this? I am sure changing the paths
> upstream will now break some other userspace. So, what can be an elegant
> solution to our problem? or do we always need to carry an out-of-tree
> patch for our production kernel?
> 

The problem only occurs if attributes are accessed using the raw path,
and if user space does not take into account that attributes may reside
in the hwmon directory (/sys/class/hwmon/hwmonX) _or_ in the device
directory (/sys/class/hwmon/hwmonX/device). There is no guarantee that
the raw path doesn't change from release to release; that is what the
symlinks are for. Actually, I have seen the raw platform device path
change over time, so I am surprised that this never affected you.

You might consider using libsensors to access the attributes.

Thanks,
Guenter
