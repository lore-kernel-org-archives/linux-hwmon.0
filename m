Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49491 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751187AbdEREJe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 May 2017 00:09:34 -0400
Subject: Re: [kbuild-all] [PATCH v4 2/3] hwmon: (adt7475) temperature
 smoothing
To: Ye Xiaolong <xiaolong.ye@intel.com>
References: <201705161614.nmuA5Qiv%fengguang.wu@intel.com>
 <247018ef273f4af9bedd77e63417daf0@svr-chch-ex1.atlnz.lc>
 <20170517030640.GD568@yexl-desktop>
 <c571900e0f534ca892cc3e374183a0f0@svr-chch-ex1.atlnz.lc>
 <20170517043917.GG568@yexl-desktop>
 <9dfdd004-a2cd-7aae-ada5-28517665c681@roeck-us.net>
 <20170518030536.GM568@yexl-desktop>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        kbuild test robot <lkp@intel.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3beb0636-b7e4-7aee-27b9-a7297fd753de@roeck-us.net>
Date: Wed, 17 May 2017 21:09:28 -0700
MIME-Version: 1.0
In-Reply-To: <20170518030536.GM568@yexl-desktop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/17/2017 08:05 PM, Ye Xiaolong wrote:
> On 05/16, Guenter Roeck wrote:
>>>>> 0day bot applied your patchset on top of commit 6eaaea1 ("hwmon: (pmbus) Add client driver for IR35221"),
>>>>> is it wrong or you have some prerequisite patches?
>>>
>>> Thanks for the info, seems we need to improve the kbuild bot by pulling the
>>> latest tree before applying new patches.
>>>
>>
>> No worries. I don't mind the occasional false positive. Better a false positive than a missed bug.
>>
>
> Just curiosity, I noticed you committed the missing patch bbb4dd0fff ("hwmon:
> (adt7475) replace find_nearest() with find_closest()") at May 14, did you push
> it to git.kernel.org immediately or sometime after that? Since 0day makes
> mirror based on repos in git.kernel.org in this case.
>

I don't recall, sorry. Most likely I didn't push it immediately.

Guenter

