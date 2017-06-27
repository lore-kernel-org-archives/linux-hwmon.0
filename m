Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Tue, 27 Jun 2017 15:34:03 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-hwmon@vger.kernel.org
Subject: Re: userspace regression with hwmon
Message-ID: <20170627153403.18f1f09e@endymion>
In-Reply-To: <5ce4bea5-008a-8a86-cdf4-83d0f427126c@roeck-us.net>
References: <20170626143320.GA1976@sudip-tp>
	<20170626170611.GC20491@roeck-us.net>
	<20170627122300.GA14227@sudip-tp>
	<5ce4bea5-008a-8a86-cdf4-83d0f427126c@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 27 Jun 2017 05:52:39 -0700, Guenter Roeck wrote:
> On 06/27/2017 05:23 AM, Sudip Mukherjee wrote:
> > Well, using the raw platform device path was a bad design decision.
> > But I still see a difference. In v3.8 all the temp* nodes were in
> > /sys/class/hwmon/hwmon0/device/ but in v4.4 I can see that they are in
> > /sys/class/hwmon/hwmon0/. So if we do modify the code, then we still
> > need to have two versions of userspace code based on the kernel.
> 
> Your code should check for the 'name' attribute in both locations.

... as libsensors does. If you just do what libsensors does, you'll be
on the safe side.

-- 
Jean Delvare
SUSE L3 Support
