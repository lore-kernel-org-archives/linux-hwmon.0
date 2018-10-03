Return-Path: <cv-dong@jinso.co.jp>
Return-path: <cv-dong@jinso.co.jp>
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Brown
 <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-hwmon@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6ug==?=
 =?UTF-8?B?44K9?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
 <CAMuHMdXOQdJL14xNj3AHL6RC-fu=SWReXmh1JOS4s9cc-ZL5iQ@mail.gmail.com>
 <4ed65427-ce94-5586-82ef-f73d7ff413ed@jinso.co.jp>
 <3fd89cff-4e3f-b4b5-6f45-6a6363003646@roeck-us.net>
From: Cao Van Dong <cv-dong@jinso.co.jp>
Message-ID: <f8a0d9cf-826a-6fae-e675-5dc24007c00c@jinso.co.jp>
Date: Wed, 3 Oct 2018 10:17:58 +0900
MIME-Version: 1.0
In-Reply-To: <3fd89cff-4e3f-b4b5-6f45-6a6363003646@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-ID: <linux-hwmon@vger.kernel.org>

Dear Guente-san,

Thanks for your comment!
>>>> In __hwmon_device_register() function of hwmon.c, we have assigned 
>>>> 'dev' directly to 'hdev->parent'.
>>>> Formerly, when registering the hwmon device, we pass NULL as the 
>>>> device. This is not affected.
>>>> Recently, the developer has replaced the parameter NULL as the 
>>>> device by the actual device.
>>> Do you know the commit ID of this recent change?
>>> It's useful for review of your change, and to know to which versions 
>>> your
>>> patch should be backported.
>>
>> The commit ID of this recent change is"f6b6b52 thermal_hwmon: Pass 
>> the originating device down to hwmon_device_register_with_info".
>>
> If thermal doesn't want hwmon to use the thermal zone device, it 
> should pass
> the parent of that device as parameter.

I will see the feedback from Marc-san.
>
>>>> This causes the "No sensors found" error. This patch is to fix this 
>>>> error.
>>> On which platform do you see this failure?
>>> Thanks again!
>>
>> This error is found on Gen2 Lager board v4.19-rc2 by RVC team.
>>
>
> Some more details about the error would be useful.

Below are some information about confirm the error:

- Before the commit "f6b6b52ef7a54160c0a4d2b56a58f84a2e5b33c5" (pass 
NULL as the device):
"root@linaro-nano:~# sensors
  cpu_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +30.0�°C  (crit = +95.0�°C)

  root@linaro-nano:~# "


- After the commit "f6b6b52ef7a54160c0a4d2b56a58f84a2e5b33c5" (pass the 
actual device):
"root@linaro-nano:~# sensors
  No sensors found!
  Make sure you loaded all the kernel drivers you need.
  Try sensors-detect to find out which these are.
  root@linaro-nano:~#"


- At my patch (change dev to dev->parent):
"root@linaro-nano:~# sensors
  cpu_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +30.0�°C  (crit = +95.0�°C)

  root@linaro-nano:~#"


Regards,
Dong/Jinso
