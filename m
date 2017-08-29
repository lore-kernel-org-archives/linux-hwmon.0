Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:37733 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751297AbdH2Nen (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 09:34:43 -0400
Subject: Re: [GIT PULL] Immutable branch between MFD and HWMON due for the
 v4.14 merge window
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>,
        Lee Jones <lee.jones@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20170821145404.18902-1-sebastian.reichel@collabora.co.uk>
 <20170822074741.jjynyudbfgzsl7ju@dell>
 <20170829125113.g74twfnahomtdr2x@earth>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a61ad063-07a2-c24c-45b8-c3bdfe630a0c@roeck-us.net>
Date: Tue, 29 Aug 2017 06:34:39 -0700
MIME-Version: 1.0
In-Reply-To: <20170829125113.g74twfnahomtdr2x@earth>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/29/2017 05:51 AM, Sebastian Reichel wrote:
> Hi Lee,
> 
> I noticed, that you did not yet push out your for-mfd-next branch,
> so the patches did not yet appear in linux-next. Was this
> intentional?
> 
The immutable branch referenced below doesn't exist either.

Guenter

> -- Sebastian
> 
> On Tue, Aug 22, 2017 at 08:47:41AM +0100, Lee Jones wrote:
>> Enjoy!
>>
>> The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:
>>
>>    Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-hwmon-v4.14
>>
>> for you to fetch changes up to 4f16cab19a3d57638dd5d962ff6e87c154a6cab2:
>>
>>    hwmon: da9052: Add support for TSI channel (2017-08-22 08:45:02 +0100)
>>
>> ----------------------------------------------------------------
>> Immutable branch between MFD and HWMON due for the v4.14 merge window
>>
>> ----------------------------------------------------------------
>> Sebastian Reichel (4):
>>        mfd: da9052: Add register details for TSI
>>        hwmon: da9052: Replace S_IRUGO with 0444
>>        mfd: da9052: Make touchscreen registration optional
>>        hwmon: da9052: Add support for TSI channel
>>
>>   drivers/hwmon/da9052-hwmon.c      | 285 +++++++++++++++++++++++++++++++++++---
>>   drivers/mfd/da9052-core.c         |  26 +++-
>>   include/linux/mfd/da9052/da9052.h |   6 +
>>   include/linux/mfd/da9052/reg.h    |  11 +-
>>   4 files changed, 302 insertions(+), 26 deletions(-)
>>   
>> -- 
>> Lee Jones
>> Linaro STMicroelectronics Landing Team Lead
>> Linaro.org │ Open source software for ARM SoCs
>> Follow Linaro: Facebook | Twitter | Blog

