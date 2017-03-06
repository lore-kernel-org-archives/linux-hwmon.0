Return-path: <PeterHuewe@gmx.de>
From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
To: linux-hwmon@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Question about hwmon_attr_show_string
Date: Mon, 6 Mar 2017 21:48:35 +0100
Cc: Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org
References: <201703030133.01363.PeterHuewe@gmx.de>
In-Reply-To: <201703030133.01363.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201703062148.36101.PeterHuewe@gmx.de>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

I was wondering whether there was a particular reason why 
hwmon_attr_show_string passes only an "empty" pointer(pointer) to the ops-
>read_string function rather than the buffer itself?

Wouldn't this mean that in ops->read_string I'd have to reserve some space for 
the value on the heap (and taking care to free it somewhere, since returning 
an address on the stack is bad idea), instead of calling sprintf(buf, "%s\n", 
s) directly?

With the current implementation I have to sprintf it into my local buffer and 
you sprintf it again into the final buffer.


Unfortunately there are no other callers, where you show the intended usage.



Thanks,
Peter
