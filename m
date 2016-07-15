Return-path: <michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Jul 2016 11:16:18 +0200
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, Rini
 <rini@arvoo.nl>, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: adt7411: add rev5 workaround
In-Reply-To: <20160714223755.GA18295@roeck-us.net>
References: <1468497127-6325-1-git-send-email-michael@walle.cc>
 <20160714205611.GB13933@roeck-us.net>
 <136b2f5f223ea8460edf3c2024f710d3@walle.cc>
 <20160714223755.GA18295@roeck-us.net>
Message-ID: <ac55e7337e3a039e8cd72613c7ed1ebb@walle.cc>
List-ID: <linux-hwmon@vger.kernel.org>

Am 2016-07-15 00:37, schrieb Guenter Roeck:
> The latter. Strictly speaking, each write to CR1 should explicitly set 
> bit 3
> and clear bit 4, but that would be a bit too invasive. And the same 
> really
> applies to the reserved bits in CR3.

Should I address this issue, too? If so, I would like to provide a 
second patch, which isn't flagged for stable.

-michael
