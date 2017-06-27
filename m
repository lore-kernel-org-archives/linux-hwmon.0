Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49282 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752841AbdF0Mwr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2017 08:52:47 -0400
Subject: Re: userspace regression with hwmon
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>, linux-kernel@vger.kernel.org,
        Fenghua Yu <fenghua.yu@intel.com>, linux-hwmon@vger.kernel.org
References: <20170626143320.GA1976@sudip-tp>
 <20170626170611.GC20491@roeck-us.net> <20170627122300.GA14227@sudip-tp>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5ce4bea5-008a-8a86-cdf4-83d0f427126c@roeck-us.net>
Date: Tue, 27 Jun 2017 05:52:39 -0700
MIME-Version: 1.0
In-Reply-To: <20170627122300.GA14227@sudip-tp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/27/2017 05:23 AM, Sudip Mukherjee wrote:
> On Mon, Jun 26, 2017 at 10:06:11AM -0700, Guenter Roeck wrote:
>> On Mon, Jun 26, 2017 at 03:33:20PM +0100, Sudip Mukherjee wrote:
>>> Hi Guenter, Jean,
>>>
>>> The patch d72d19c26c41 ("hwmon: (coretemp) Convert to use
>>> devm_hwmon_device_register_with_groups") has changed the location of the
>>> sysfs nodes from /sys/devices/platform/coretemp.0/ to
>>> /sys/devices/platform/coretemp.0/hwmon/hwmon0/ and that has broken
>>> some of our usespace applications when we have updated the kernel from
>>> v3.8 to v4.4. For now I am reverting that said patch in our production
>>> kernel (based on v4.4) but that is not an elegant solution.
>>> Do you have any other reports like this? I am sure changing the paths
>>> upstream will now break some other userspace. So, what can be an elegant
>>> solution to our problem? or do we always need to carry an out-of-tree
>>> patch for our production kernel?
>>>
>>
>> The problem only occurs if attributes are accessed using the raw path,
>> and if user space does not take into account that attributes may reside
>> in the hwmon directory (/sys/class/hwmon/hwmonX) _or_ in the device
>> directory (/sys/class/hwmon/hwmonX/device). There is no guarantee that
>> the raw path doesn't change from release to release; that is what the
>> symlinks are for. Actually, I have seen the raw platform device path
>> change over time, so I am surprised that this never affected you.
> 
> Well, using the raw platform device path was a bad design decision.
> But I still see a difference. In v3.8 all the temp* nodes were in
> /sys/class/hwmon/hwmon0/device/ but in v4.4 I can see that they are in
> /sys/class/hwmon/hwmon0/. So if we do modify the code, then we still
> need to have two versions of userspace code based on the kernel.
> 

Your code should check for the 'name' attribute in both locations.

Guenter

