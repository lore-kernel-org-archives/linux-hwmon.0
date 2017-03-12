Return-path: <linux+linux=roeck-us.net@armlinux.org.uk>
Date: Sun, 12 Mar 2017 14:15:22 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: it87 causes VIA hardware to lockup
Message-ID: <20170312141522.GL21222@n2100.armlinux.org.uk>
References: <20170312103413.GJ21222@n2100.armlinux.org.uk>
 <20170312132544.GA17687@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170312132544.GA17687@roeck-us.net>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Mar 12, 2017 at 06:25:44AM -0700, Guenter Roeck wrote:
> I found some reference suggesting that The IT8705F may respond on
> both SIO addresses. Can you try the following patch ?

Thanks for the patch - it'll take about a week or so for me to test,
as I can only risk testing it when I'm physically at the machine.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
