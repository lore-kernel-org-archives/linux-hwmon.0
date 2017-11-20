Return-Path: <d@videhug.ch>
Return-path: <d@videhug.ch>
Date: Tue, 21 Nov 2017 00:18:43 +0100
From: Davide Hug <d@videhug.ch>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, arm@kernel.org, Marco Franchi
 <marco.franchi@nxp.com>, Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Message-Id: <20171121001843.86071879e49ab6ae997d7873@videhug.ch>
In-Reply-To: <20170910172349.41659340@archlinux>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
	<20170910160528.81ac76b96943ff262a61434a@videhug.ch>
	<20170910172349.41659340@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Sorry for the huge delay.

On Sun, 10 Sep 2017 17:23:49 +0100
Jonathan Cameron <jic23@kernel.org> wrote:
> Thanks to you.  It's always nice when people fix issues with / update a
> driver you've ignored for perhaps 8 years ;)

Thank you for first implementing it. It's amazing how one can take any strange
sensor and then discover that there is already a driver for it in Linux.

> As you know this particular part has a truely horrendous custom bus.
> I'm always amazed these old sensiron parts work at all.

Yes, strange.

> I'm also really surprised to see they are still readily available.

I originally bought it to play with a pic16f84. That's really long ago. But I
checked now and they still can be ordered but "Last order date: 31.12.2018 /
Last delivery date: 31.12.2019"[1]

Best,
Davide

[1]: https://www.sensirion.com/en/environmental-sensors/humidity-sensors/digital-humidity-sensors-for-accurate-measurements/
