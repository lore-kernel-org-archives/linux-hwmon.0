Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48189 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752668AbcK1Xd0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2016 18:33:26 -0500
Date: Mon, 28 Nov 2016 15:33:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
Message-ID: <20161128233323.GA15459@roeck-us.net>
References: <1480223737-82080-2-git-send-email-john@jmuir.com>
 <c0f07695-e823-5974-829c-6fd64bd97a5b@roeck-us.net>
 <EDC5A938-C5F5-45A4-85BD-C19996BA6460@jmuir.com>
 <20161128195825.GA10709@roeck-us.net>
 <BA794672-F2A5-4C18-96B2-7BEA53ECECCD@jmuir.com>
 <20161128221916.GA13689@roeck-us.net>
 <1398C020-EF5A-42F2-8A1A-7F6782DC3E4A@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1398C020-EF5A-42F2-8A1A-7F6782DC3E4A@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 28, 2016 at 03:10:38PM -0800, John Muir wrote:
> On Nov 28, 2016, at 2:19 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > The tmp102 driver adds the timeout if the device was in shutdown mode (SD=1).
> > 
> > 	if (tmp102->config_orig & TMP102_CONF_SD) {
> > 		...
> > 		tmp102->ready_time += msecs_to_jiffies(CONVERSION_TIME_MS);
> > 	}
> > 
> > Your code adds the timeout if the device was in continuous operation mode (M1=1).
> > 
> > 	if ((tmp108->config & TMP108_CONF_MODE_MASK)
> > 	    == TMP108_MODE_CONTINUOUS) {
> > 		tmp108->ready_time +=
> > 		msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
> > 	}
> > 
> > Unless I am missing something, that is exactly the opposite.
> 
> Note that the TMP102 code is looking at ‘config_orig’ which was the initial device state, whereas in my proposed driver the code looks at the current configuration.
> 
Ah, yes. Your code also uses tmp108->config in tmp108_restore_config(),
which I guess confused me.

Not sure I understand why you would want to add the wait time even if M1
was set before (and the tmp102 driver doesn't do that). Really, if that
is what you want, it would be much simpler if you just unconditionally
set ready_time to 30 ms after the current time after setting the M1 bit,
no matter if it was set before or not. I personally don't think that would
be such a good idea, but it would at least be less obfuscating than the
current code. Also, I would suggest to either drop tmp108_restore_config(),
or to have it restore the real original state.

Thanks,
Guenter
