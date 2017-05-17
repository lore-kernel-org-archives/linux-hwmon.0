Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34650 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbdEQD0Z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 May 2017 23:26:25 -0400
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Ye Xiaolong <xiaolong.ye@intel.com>
CC: kbuild test robot <lkp@intel.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
Subject: Re: [kbuild-all] [PATCH v4 2/3] hwmon: (adt7475) temperature
 smoothing
Date: Wed, 17 May 2017 03:26:21 +0000
Message-ID: <c571900e0f534ca892cc3e374183a0f0@svr-chch-ex1.atlnz.lc>
References: <201705161614.nmuA5Qiv%fengguang.wu@intel.com>
 <247018ef273f4af9bedd77e63417daf0@svr-chch-ex1.atlnz.lc>
 <20170517030640.GD568@yexl-desktop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 17/05/17 15:09, Ye Xiaolong wrote:=0A=
> On 05/16, Chris Packham wrote:=0A=
>> On 16/05/17 20:23, kbuild test robot wrote:=0A=
>>> Hi Chris,=0A=
>>>=0A=
>>> [auto build test ERROR on hwmon/hwmon-next]=0A=
>>> [also build test ERROR on v4.12-rc1 next-20170516]=0A=
>>> [if your patch is applied to the wrong git tree, please drop us a note =
to help improve the system]=0A=
>>>=0A=
>>> url:    https://github.com/0day-ci/linux/commits/Chris-Packham/hwmon-ad=
t7475-fan-stall-prevention/20170515-093530=0A=
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git hwmon-next=0A=
>>> config: x86_64-rhel (attached as .config)=0A=
>>> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901=0A=
>>> reproduce:=0A=
>>>         # save the attached .config to linux build tree=0A=
>>>         make ARCH=3Dx86_64=0A=
>>>=0A=
>>> All errors (new ones prefixed by >>):=0A=
>>>=0A=
>>>    drivers/hwmon/adt7475.c: In function 'set_temp_st':=0A=
>>>>> drivers/hwmon/adt7475.c:622:9: error: implicit declaration of functio=
n 'find_closest_descending' [-Werror=3Dimplicit-function-declaration]=0A=
>>>       val =3D find_closest_descending(val, ad7475_st_map,=0A=
>>>             ^~~~~~~~~~~~~~~~~~~~~~~=0A=
>>>    cc1: some warnings being treated as errors=0A=
>>>=0A=
>>> vim +/find_closest_descending +622 drivers/hwmon/adt7475.c=0A=
>>>=0A=
>>>    616			shift =3D 4;=0A=
>>>    617			idx =3D 1;=0A=
>>>    618			break;=0A=
>>>    619		}=0A=
>>>    620	=0A=
>>>    621		if (val > 0) {=0A=
>>>  > 622			val =3D find_closest_descending(val, ad7475_st_map,=0A=
>>>    623						      ARRAY_SIZE(ad7475_st_map));=0A=
>>>    624			val |=3D 0x8;=0A=
>>>    625		}=0A=
>>>=0A=
>>> ---=0A=
>>> 0-DAY kernel test infrastructure                Open Source Technology =
Center=0A=
>>> https://lists.01.org/pipermail/kbuild-all                   Intel Corpo=
ration=0A=
>>>=0A=
>>=0A=
>> I'm not sure how this is failing. find_closest_descending() is a macro=
=0A=
>> defined in linux/util_macros.h which is explicitly included in=0A=
>> drivers/hwmon/adt7475.c. Aside from the include guards there's nothing=
=0A=
>> conditional about it.=0A=
>=0A=
> Hi,=0A=
>=0A=
> 0day bot applied your patchset on top of commit 6eaaea1 ("hwmon: (pmbus) =
Add client driver for IR35221"),=0A=
> is it wrong or you have some prerequisite patches?=0A=
>=0A=
=0A=
Looks like it's missing =0A=
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/co=
mmit/?h=3Dhwmon-next&id=3Dbbb4dd0ff =0A=
which was part of the series but was applied after v3 so I didn't send =0A=
it out with v4.=0A=
