Return-Path: <natechancellor@gmail.com>
Return-path: <natechancellor@gmail.com>
Date: Fri, 14 Sep 2018 22:10:32 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Clang warning in drivers/hwmon/scmi-hwmon.c
Message-ID: <20180915051032.GA23900@flashbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <linux-hwmon@vger.kernel.org>

Hi Sundeep and others,

A group of us are trying to clean up all the warnings we see with an
'allyesconfig' arm64 build done with Clang and this one came up:

drivers/hwmon/scmi-hwmon.c:59:24: warning: address of array 'sensor->name' will always evaluate to 'true' [-Wpointer-bool-conversion]
        if (sensor && sensor->name)
                   ~~ ~~~~~~~~^~~~
1 warning generated.

Would it be appropriate to just delete that check or does the check
need to be adjusted in some way (such as checking for the first value
'sensor->name[0]')? Either option technically solves the warning but I
don't have the hardware to check if this breaks the driver.

Thanks,
Nathan
