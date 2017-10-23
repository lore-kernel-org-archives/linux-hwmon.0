Return-Path: <romain.porte@nokia.com>
Return-path: <romain.porte@nokia.com>
Subject: Re: [1/2] pmbus: added tps544c20 driver with trimming support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20171020103916.3309-2-romain.porte@nokia.com>
 <20171021162048.GA13173@roeck-us.net>
From: Romain Porte <romain.porte@nokia.com>
Message-ID: <47c2dd13-c357-56fa-6886-08ce6e2b9d92@nokia.com>
Date: Mon, 23 Oct 2017 15:34:24 +0200
MIME-Version: 1.0
In-Reply-To: <20171021162048.GA13173@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-ID: <linux-hwmon@vger.kernel.org>

On 21/10/2017 18:20, Guenter Roeck wrote:
> This should be part of device programming in manufacturing, just like,
> say, current calibration. It should not be user programmable, even less so
> runtime programmable. On top of that, we definitely don't want to make
> STORE_USER_ALL available to user space. Both can too easily result in
> a bricked device (bad enough that the register values are writable using
> i2cset).
After some work, I have tested accessing these registers using i2cget 
and i2cset and I can reproduce all the features I have implemented in 
this driver. I think am going to re-implement my calibration procedure 
using i2cget and i2cset in userspace.

I thought it could be a good idea to make this accessible by sysfs 
entries. Since one must read the datasheet for calibrating the 
component, I guess it is not a big deal to have users to find register 
addresses/sizes and write to them using userspace commands instead of 
(over?)simplifying it by providing dedicated sysfs entries.

Romain.
