Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35653 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755317AbcK1WTV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2016 17:19:21 -0500
Date: Mon, 28 Nov 2016 14:19:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
Message-ID: <20161128221916.GA13689@roeck-us.net>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
 <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
 <20161128195825.GA10709@roeck-us.net>
 <BA794672-F2A5-4C18-96B2-7BEA53ECECCD@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BA794672-F2A5-4C18-96B2-7BEA53ECECCD@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 28, 2016 at 01:25:37PM -0800, John Muir wrote:
> 
> > On Nov 28, 2016, at 11:58 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > On Mon, Nov 28, 2016 at 11:40:42AM -0800, John Muir wrote:
> >>>> +static void tmp108_update_ready_time(struct tmp108 *tmp108)
> >>>> +{
> >>>> +	tmp108->ready_time = jiffies;
> >>>> +	if ((tmp108->config & TMP108_CONF_MODE_MASK)
> >>>> +	    == TMP108_MODE_CONTINUOUS) {
> >>> 
> >>> Don't you want a "!" here ? Presumably the delay is only needed
> >>> if the original configuration was not for continuous mode.
> >>> 
> >>>> +		tmp108->ready_time +=
> >>>> +			msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
> >>>> +	}
> >>>> +}
> >> The delay is required for both really. When the device is set into continuous mode it starts converting and the first temperature is ready (just under) 30ms later.
> >> 
> > 
> > The datasheet states, though, that the chip will start converting as soon
> > as the device powers up. The kernel would have to start really fast after that
> > to have to wait another 30 ms.
> > 
> > The current code ends up waiting if it doesn't have to (because it waits
> > if the chip was originally configured for continuous mode), and not waiting
> > if it has to (because the chip was not configured for continuous mode),
> > which doesn't seem to be such a good idea.
> 
> You are referring to the statement under “Conversion Rate” in the data sheet?
> 
> "After power-up or a general-call reset, the TMP108 immediately starts a conversion, as shown in Figure 9. The first result is available after 27 ms (typical).”
> 
> The datasheet also states that in ’shutdown’ mode, the device is only powering the serial interface (see "Mode Bits”). So, I assumed that the conversions weren’t happening during in that state, and that there would be the delay after moving from the ‘shutdown' state (as is described by the one-shot mode as well where the device state returns to ’shutdown’ when the conversion has taken place).

The device is, after power-on, not in shutdown mode.

> 
> My intention was that the delay is enforced after PM resume, and for convenience I re-used the same function during probe to initialize the ready_time. I was assuming that the device could be in the shutdown state - for example if the module had previously been unloaded. I agree that this is not required at system startup time. Perhaps I should check to see if the previous configuration had the device in the ‘shutdown’ state, and in that instance apply the delay? In my opinion it doesn’t really matter either way.
> 
> FYI, this same logic exists in the TMP102 device driver. The TMP102 device is very similar.
> 

The tmp102 driver adds the timeout if the device was in shutdown mode (SD=1).

	if (tmp102->config_orig & TMP102_CONF_SD) {
		...
		tmp102->ready_time += msecs_to_jiffies(CONVERSION_TIME_MS);
	}

Your code adds the timeout if the device was in continuous operation mode (M1=1).

	if ((tmp108->config & TMP108_CONF_MODE_MASK)
	    == TMP108_MODE_CONTINUOUS) {
		tmp108->ready_time +=
		msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
	}

Unless I am missing something, that is exactly the opposite.

Side note: Per datasheet, M0 is irrelevant if M1=1. The above check does not
match M1=1, M0=1, but that condition would still reflect continuous mode.

Guenter
