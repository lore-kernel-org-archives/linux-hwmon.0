Return-Path: <sudipm.mukherjee@gmail.com>
Return-path: <sudipm.mukherjee@gmail.com>
Date: Mon, 26 Jun 2017 15:33:20 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	linux-hwmon@vger.kernel.org
Subject: userspace regression with hwmon
Message-ID: <20170626143320.GA1976@sudip-tp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter, Jean,

The patch d72d19c26c41 ("hwmon: (coretemp) Convert to use
devm_hwmon_device_register_with_groups") has changed the location of the
sysfs nodes from /sys/devices/platform/coretemp.0/ to
/sys/devices/platform/coretemp.0/hwmon/hwmon0/ and that has broken
some of our usespace applications when we have updated the kernel from
v3.8 to v4.4. For now I am reverting that said patch in our production
kernel (based on v4.4) but that is not an elegant solution.
Do you have any other reports like this? I am sure changing the paths
upstream will now break some other userspace. So, what can be an elegant
solution to our problem? or do we always need to carry an out-of-tree
patch for our production kernel?

--
Regards
Sudip  
