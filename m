Return-path: <jdelvare@suse.de>
Date: Fri, 9 Dec 2016 16:25:48 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 09/17] hwmon: (nct7802) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209162548.7841e144@endymion>
In-Reply-To: <d7e6a458-3194-4230-7862-c15a1e6790d0@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
	<1480913740-5678-9-git-send-email-linux@roeck-us.net>
	<20161209104931.0f8ad01f@endymion>
	<d7e6a458-3194-4230-7862-c15a1e6790d0@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, 9 Dec 2016 06:22:43 -0800, Guenter Roeck wrote:
> On 12/09/2016 01:49 AM, Jean Delvare wrote:
> > Looking at function nct7802_write_fan_min() I think an overflow can
> > happen here too, as DIV_ROUND_CLOSEST() is called before clamp_val().
> > Any reason why you did not fix that one?
> >
> Not really. The call is
> 	DIV_ROUND_CLOSEST(1350000U, limit);
> and thus won't overflow.

Limit is originally parsed by kstrtoul into an unsigned long, however
the nct7802_write_fan_min function parameter is an unsigned int, so it
is implicitly cast to an unsigned int. On a 32-bit system, that may not
fit?

-- 
Jean Delvare
SUSE L3 Support
