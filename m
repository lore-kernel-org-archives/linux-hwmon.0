Return-path: <moritz.fischer.private@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170413210354.GA17134@roeck-us.net>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com> <20170413210354.GA17134@roeck-us.net>
From: Moritz Fischer <moritz.fischer.private@gmail.com>
Date: Thu, 13 Apr 2017 15:53:38 -0700
Message-ID: <CAJYdmeNXJgzgM3uTi-DjA1B10wSipqSPZ20qhboysqKY_tvVLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mfd: cros-ec: Add functions to read mapped memory
To: Guenter Roeck <linux@roeck-us.net>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-hwmon@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>,
	Lee Jones <lee.jones@linaro.org>, olof@lixom.net, jdelvare@suse.com,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

On Thu, Apr 13, 2017 at 2:03 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Apr 07, 2017 at 03:00:08PM -0700, Moritz Fischer wrote:
>> From: Moritz Fischer <mdf@kernel.org>
>>
>> The ChromeOS EC has mapped memory regions where things like temperature
>> sensors and fan speed are stored. Provide access to those from the
>> cros-ec mfd device.
>>
>
> Turns out struct cros_ec_device already provides a cmd_readmem callback,
> which is widely used by other drivers. Why don't you just use it ?

This is only actually set by the lpc version of the cros_ec. I2C and
SPI connected ECs
emulate it. I can most certainly hook it up in the (spi,i2c) drivers,
but the implementation
for SPI and I2C needs to live somewhere. drivers/platform/chrome/cros_ec_proto.c
seemed to be a good place.

Thanks for the feedback!

Moritz
