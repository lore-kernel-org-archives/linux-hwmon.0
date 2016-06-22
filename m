Return-path: <kernel@kempniu.pl>
Date: Wed, 22 Jun 2016 08:53:19 +0200
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Lutomirski <luto@kernel.org>, Jethro <xtompok@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Experimental PATCH] dell-smm-hwmon: Add support for disabling
 automatic BIOS fan control
Message-ID: <20160622065319.GA3056@eudyptula.hq.kempniu.pl>
References: <1463917836-12985-1-git-send-email-pali.rohar@gmail.com>
 <830c86c9-af25-b31a-0526-4c1bc0232c53@gmail.com>
 <20160530093204.GR29844@pali>
 <a7c67a4d-b234-d772-2035-9f854851608b@gmail.com>
 <20160602130951.GQ29844@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160602130951.GQ29844@pali>
List-ID: <linux-hwmon@vger.kernel.org>

> > >> Tested on a Dell XPS13 9333. Changing the value of pwm1_enable appears
> > >> to have no effect here.
> > > 
> > > Can you check what i8k_enable_fan_auto_mode() returns? Error code or not?
> > 
> > No error. However, independently on the value I set, the BIOS always
> > overrides the speed of the fan.
> 
> Ok, looks like this is model or platform specific call...
> 
> If you want, you can try to play with dellfan source code [1]. There is
> e.g. in comment specified two methods for disabling that BIOS thermal
> automode [2]. Looks like second method is that which I implemented in
> patch...
> 
> [1] - https://github.com/clopez/dellfan
> [2] - https://github.com/clopez/dellfan/blob/master/dellfan.c#L64

Pali, I played around with your patch a bit on my Vostro V131 (BIOS A04)
and the results are similar to Gabriele's:

  * I can write values 1 and 2 to pwm{1,2}_enable, which causes
    i8k_enable_fan_auto_mode() to return 0, but the desired speed set
    using pwm{1,2} is quickly overridden by the BIOS, no matter which
    thermal control mode is set,
    
  * trying to set the BIOS thermal control mode to the same value it was
    already set to causes i8k_enable_fan_auto_mode() to return -22:
    
        # echo 1 > /sys/class/hwmon/hwmon1/pwm1_enable
        # echo 1 > /sys/class/hwmon/hwmon1/pwm1_enable
        bash: echo: write error: Input/output error
        # echo 2 > /sys/class/hwmon/hwmon1/pwm2_enable
        # echo 2 > /sys/class/hwmon/hwmon1/pwm2_enable
        bash: echo: write error: Input/output error
        # echo 1 > /sys/class/hwmon/hwmon1/pwm1_enable
        # echo 2 > /sys/class/hwmon/hwmon1/pwm2_enable
        #
    
  * I tried changing I8K_SMM_MANUAL_FAN and I8K_SMM_AUTO_FAN to 0x30a3
    and 0x31a3, respectively (according to [2]), but it hasn't changed
    anything, i.e. BIOS is taking over shortly after any value is
    written to pwm{1,2}.

-- 
Best regards,
Michał Kępień
