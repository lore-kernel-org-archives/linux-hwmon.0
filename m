Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:60889 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752392AbdCWBKD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2017 21:10:03 -0400
From: Peter =?ISO-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: Conversion of w83627ehf to hwmon_device_register_with_info ?
Date: Thu, 23 Mar 2017 02:11:15 +0100
Message-ID: <4092377.1mPM9X2xgo@lamerx>
In-Reply-To: <0163376b-88af-d937-f29b-1d92ac1f87ef@roeck-us.net>
References: <201703030133.01363.PeterHuewe@gmx.de> <201703211146.24674.PeterHuewe@gmx.de> <0163376b-88af-d937-f29b-1d92ac1f87ef@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

> > It saves about 20k in compiled size, so the savings from reduced
> > boilerplate are huge. (and I think it's more readable)
> > 
> >> I would suggest to drop nct6775/nct6776 support to simplify the
> >> code when you do that. Maybe as separate commit, though.
> > 
> > Hehe - I'm testing on a nct6776 :)
> > I'll look into it once the first conversion has been accepted.
> 
> Wondering - why don't you use the nct6775 driver ?

Probably because it got matched by sensors-detect before the nct6775 driver 
(?) or because I hadn't had it turned on in my kernel config.

Both drivers work, but interestingly, they show different values for 
intrusion1 (and fan alarm).


nct6776.c:

nct6776-isa-0290
Adapter: ISA adapter
Vcore:          +1.16 V  (min =  +0.00 V, max =  +1.74 V)
in1:            +1.85 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
AVCC:           +3.36 V  (min =  +2.98 V, max =  +3.63 V)
+3.3V:          +3.36 V  (min =  +2.98 V, max =  +3.63 V)
in4:            +0.26 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in5:            +1.67 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in6:            +0.79 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
3VSB:           +3.44 V  (min =  +2.98 V, max =  +3.63 V)
Vbat:           +3.26 V  (min =  +2.70 V, max =  +3.63 V)
fan1:             0 RPM  (min =    0 RPM)
fan2:          2106 RPM  (min =    0 RPM)
fan3:             0 RPM  (min =    0 RPM)
fan4:             0 RPM  (min =    0 RPM)
fan5:             0 RPM  (min =    0 RPM)
SYSTIN:         +35.0°C  (high =  +0.0°C, hyst =  +0.0°C)  ALARM  sensor = 
thermistor
CPUTIN:         +44.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
AUXTIN:         +43.5°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
PECI Agent 0:   +59.0°C  (high = +80.0°C, hyst = +75.0°C)
                         (crit = +105.0°C)
PCH_CHIP_TEMP:   +0.0°C  
PCH_CPU_TEMP:    +0.0°C  
PCH_MCH_TEMP:    +0.0°C  
intrusion0:    ALARM
intrusion1:    OK
beep_enable:   disabled



w83627ehf.c:
nct6776-isa-0290
Adapter: ISA adapter
Vcore:         +1.14 V  (min =  +0.00 V, max =  +1.74 V)
in1:           +1.85 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
AVCC:          +3.36 V  (min =  +2.98 V, max =  +3.63 V)
+3.3V:         +3.36 V  (min =  +2.98 V, max =  +3.63 V)
in4:           +0.24 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in5:           +1.68 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
3VSB:          +3.44 V  (min =  +2.98 V, max =  +3.63 V)
Vbat:          +3.26 V  (min =  +2.70 V, max =  +3.63 V)
fan1:            0 RPM  (min =    0 RPM)  ALARM
fan2:         2142 RPM  (min =    0 RPM)  ALARM
fan3:            0 RPM  (min =    0 RPM)  ALARM
fan4:            0 RPM  (min =    0 RPM)  ALARM
fan5:            0 RPM  (min =    0 RPM)  ALARM
SYSTIN:        +35.0°C  (high =  +0.0°C, hyst =  +0.0°C)  ALARM  sensor = 
thermistor
CPUTIN:        +46.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
AUXTIN:        +44.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
PECI Agent 0:  +64.0°C  
cpu0_vid:     +0.000 V
intrusion0:   ALARM
intrusion1:   ALARM



Once the other patches have been accepted I'll work on that conversion/removal 
of the nct6775 code from the w83627ehf.


Peter



