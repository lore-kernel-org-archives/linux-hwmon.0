Return-path: <jdelvare@suse.de>
Date: Thu, 4 May 2017 13:33:49 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (it87) Remove useless test during device
 detection
Message-ID: <20170504133349.3874ae71@endymion>
In-Reply-To: <20170504113506.1665ecd7@endymion>
References: <20170504113506.1665ecd7@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, 4 May 2017 11:35:06 +0200, Jean Delvare wrote:
> There is no reason to treat the IT8705F differently during device
> detection. If a single IT8705F chip indeed answers to both Super-IO
> addresses, we have code in place to detect the duplicate device
> address and skip the second one.
> (...)

Bah, scratch this. I can't even convince myself that this is a good
idea. Sure, the rest of the code is enough to deal with the situation,
but why keep looking for something when we already know we will find and
discard a duplicate...

Sorry for the noise,
-- 
Jean Delvare
SUSE L3 Support
