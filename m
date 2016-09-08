Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53091 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932500AbcIHOzs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Sep 2016 10:55:48 -0400
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
To: Arnd Bergmann <arnd@arndb.de>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <13081573.BbD3TmEU5Y@wuerfel> <20160907222754.GA31475@roeck-us.net>
 <8664936.LICyesLN7G@wuerfel>
Cc: Hoan Tran <hotran@apm.com>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Ashwin Chaugule <ashwin.chaugule@linaro.org>,
        Duc Dang <dhdang@apm.com>, lho@apm.com,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6c6118cf-f9cf-d5f2-dde0-afea0143687c@roeck-us.net>
Date: Thu, 8 Sep 2016 07:55:44 -0700
MIME-Version: 1.0
In-Reply-To: <8664936.LICyesLN7G@wuerfel>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/08/2016 01:15 AM, Arnd Bergmann wrote:
> On Wednesday, September 7, 2016 3:27:54 PM CEST Guenter Roeck wrote:
>> On Wed, Sep 07, 2016 at 11:41:44PM +0200, Arnd Bergmann wrote:
>>> On Thursday, July 21, 2016 1:55:56 PM CEST Hoan Tran wrote:
>>>> +               ctx->comm_base_addr = cppc_ss->base_address;
>>>> +               if (ctx->comm_base_addr) {
>>>> +                       ctx->pcc_comm_addr =
>>>> +                                       acpi_os_ioremap(ctx->comm_base_addr,
>>>> +                                                       cppc_ss->length);
>>>>
>>>
>>> This causes the arm64 allmodconfig build to fail now, according to
>>> kernelci:
>>>
>>>       1  ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
>>>
>> How do you even get there ? arm64:allmodconfig fails for me in -next with
>>
>> drivers/pwm/pwm-berlin.c: In function ‘berlin_pwm_suspend’:
>> drivers/pwm/pwm-berlin.c:245:35: error: ‘struct berlin_pwm_chip’ has no member named ‘chips’
>
> That was fixed in yesterday's linux-next.
>

Maybe, but now I get

Building arm:allmodconfig ... failed
--------------
Error log:
crypto/crypto_engine.c: In function 'crypto_transfer_hash_request':
crypto/crypto_engine.c:234:3: error: implicit declaration of function 'queue_kthread_work'

Building arm64:allmodconfig ... failed
--------------
Error log:
arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c: In function ‘kvm_timer_hyp_init’:
arch/arm64/kvm/../../../virt/kvm/arm/arch_timer.c:457:1: warning: label ‘out_free’ defined but not used

Guenter

