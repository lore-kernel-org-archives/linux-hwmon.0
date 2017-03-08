Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58700 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754645AbdCIAX5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 8 Mar 2017 19:23:57 -0500
Date: Wed, 8 Mar 2017 23:01:42 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
Message-ID: <20170308230142.52905281@endymion>
In-Reply-To: <CAHZJmOxFc_c1B7Qtkqj3d-1NqW+OZ7a=ZFQaC526L3oqNhkOdA@mail.gmail.com>
References: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
        <CAHp75Ve4NxQ8=GQGOdwnURRzvgDOGYs1LAwd_NQE=qzWnUVMEg@mail.gmail.com>
        <CAHZJmOzdDhnts6-HUKBMoYC6FSj-Hkz=jpcfwV4gFTTEWdB7kg@mail.gmail.com>
        <20170306123318.00d46184@endymion>
        <CAHZJmOxFc_c1B7Qtkqj3d-1NqW+OZ7a=ZFQaC526L3oqNhkOdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, 8 Mar 2017 20:25:33 +0100, Vasile Dumitrescu wrote:
> sudo sensors
> =>

Note that you don't need to be root to run "sensors".

> (...)
> dell_smm-virtual-0
> Adapter: Virtual device
> Processor Fan: 2490 RPM
> Video Fan:     2493 RPM
> CPU:            +48.0°C
> Ambient:        +48.0°C
> Ambient:        +44.0°C
> Other:          +40.0°C
> 
> sudo pwmconfig
> => fans definitely stop and restart as the script indicates they should
> 
> Conclusion: works for me (TM) - without force or any special options
> 
> Thanks Jean, that was easy.

You're welcome, glad I could help :-)

> Looking forward to see it in some future kernel.

-- 
Jean Delvare
SUSE L3 Support
