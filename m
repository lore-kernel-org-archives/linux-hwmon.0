Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:3208 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753211AbdEQElc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 May 2017 00:41:32 -0400
Date: Wed, 17 May 2017 12:39:17 +0800
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: kbuild test robot <lkp@intel.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
Subject: Re: [kbuild-all] [PATCH v4 2/3] hwmon: (adt7475) temperature
 smoothing
Message-ID: <20170517043917.GG568@yexl-desktop>
References: <201705161614.nmuA5Qiv%fengguang.wu@intel.com>
 <247018ef273f4af9bedd77e63417daf0@svr-chch-ex1.atlnz.lc>
 <20170517030640.GD568@yexl-desktop>
 <c571900e0f534ca892cc3e374183a0f0@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c571900e0f534ca892cc3e374183a0f0@svr-chch-ex1.atlnz.lc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/17, Chris Packham wrote:
>On 17/05/17 15:09, Ye Xiaolong wrote:
>> On 05/16, Chris Packham wrote:
>>> On 16/05/17 20:23, kbuild test robot wrote:
>>>> Hi Chris,
>>>>
>>>> [auto build test ERROR on hwmon/hwmon-next]
>>>> [also build test ERROR on v4.12-rc1 next-20170516]
>>>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>>>
>>>> url:    https://github.com/0day-ci/linux/commits/Chris-Packham/hwmon-adt7475-fan-stall-prevention/20170515-093530
>>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
>>>> config: x86_64-rhel (attached as .config)
>>>> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
>>>> reproduce:
>>>>         # save the attached .config to linux build tree
>>>>         make ARCH=x86_64
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>    drivers/hwmon/adt7475.c: In function 'set_temp_st':
>>>>>> drivers/hwmon/adt7475.c:622:9: error: implicit declaration of function 'find_closest_descending' [-Werror=implicit-function-declaration]
>>>>       val = find_closest_descending(val, ad7475_st_map,
>>>>             ^~~~~~~~~~~~~~~~~~~~~~~
>>>>    cc1: some warnings being treated as errors
>>>>
>>>> vim +/find_closest_descending +622 drivers/hwmon/adt7475.c
>>>>
>>>>    616			shift = 4;
>>>>    617			idx = 1;
>>>>    618			break;
>>>>    619		}
>>>>    620	
>>>>    621		if (val > 0) {
>>>>  > 622			val = find_closest_descending(val, ad7475_st_map,
>>>>    623						      ARRAY_SIZE(ad7475_st_map));
>>>>    624			val |= 0x8;
>>>>    625		}
>>>>
>>>> ---
>>>> 0-DAY kernel test infrastructure                Open Source Technology Center
>>>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>>>
>>>
>>> I'm not sure how this is failing. find_closest_descending() is a macro
>>> defined in linux/util_macros.h which is explicitly included in
>>> drivers/hwmon/adt7475.c. Aside from the include guards there's nothing
>>> conditional about it.
>>
>> Hi,
>>
>> 0day bot applied your patchset on top of commit 6eaaea1 ("hwmon: (pmbus) Add client driver for IR35221"),
>> is it wrong or you have some prerequisite patches?

Thanks for the info, seems we need to improve the kbuild bot by pulling the
latest tree before applying new patches.

Thanks,
Xiaolong
>>
>
>Looks like it's missing 
>https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=hwmon-next&id=bbb4dd0ff 
>which was part of the series but was applied after v3 so I didn't send 
>it out with v4.
