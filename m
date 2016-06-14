Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59139 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161306AbcFNCCb (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 13 Jun 2016 22:02:31 -0400
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <5740FB24.80709@roeck-us.net> <201605220228.00665@pali>
 <201606132052.22116@pali>
Cc: Jan C Peters <jcpeters89@gmail.com>,
	Thorsten Leemhuis <fedora@leemhuis.info>,
	=?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <575F65A6.5070700@roeck-us.net>
Date: Mon, 13 Jun 2016 19:02:14 -0700
MIME-Version: 1.0
In-Reply-To: <201606132052.22116@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/13/2016 11:52 AM, Pali Rohár wrote:
> On Sunday 22 May 2016 02:28:00 Pali Rohár wrote:
>> On Sunday 22 May 2016 02:19:48 Guenter Roeck wrote:
>>> On 05/21/2016 07:46 AM, Pali Rohár wrote:
>>>> On more Dell machines (e.g. Dell Precision M3800)
>>>> I8K_SMM_GET_FAN_TYPE call is too expensive (CPU is too long in
>>>> SMM mode) and cause kernel to hang. This patch cache type for
>>>> each fan (as it should not change) and change the way how fan
>>>> presense is detected. It revert and use function fan_status() as
>>>> was before commit f989e55452c7 ("i8k: Add support for fan
>>>> labels").
>>>>
>>>> Moreover, kernel hangs for 2 - 3 seconds only sometimes and only
>>>> on some Dell machines. When kernel hangs fan speed is at max. So
>>>> it was hard to debug and bisect where is root of this problem.
>>>> It looks like this is bug in Dell BIOS which implement fan type
>>>> SMM code... and there is no way how to fix it in kernel.
>>>>
>>>> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
>>>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>>> Reported-and-tested-by: Tolga Cakir <cevelnet@gmail.com>
>>>> Fixes: f989e55452c7 ("i8k: Add support for fan labels")
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=112021
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=100121
>>>> Cc: stable@vger.kernel.org # v4.0+, will need backport
>>>
>>> Should this patch be applied, or do you wait for more testing ?
>>
>> I would like to hear some confirmation from people with affected
>> machine.
>>
>
> Ok, now after testing we know that kernel should prevent calling
> I8K_SMM_GET_FAN_TYPE on affected buggy Dell machines.
>
> Looks like there are two different bugs in Dell SMM with
> I8K_SMM_GET_FAN_TYPE call.
>
> First bug cause that kernel freeze for 2 - 3 seconds when
> I8K_SMM_GET_FAN_TYPE is issued.
>
> Second bug cause that fan goes randomly up and down (that is controlled
> by Dell SMM) when I8K_SMM_GET_FAN_TYPE is issued. Normal behaviour is
> returned after machine reboots.
>
> Some Dell machines are affected by first bug, some by second bug. And
> there are Dell machines without both bugs.
>
> This my patch just partially fix first bug and prevent calling that call
> at boot time. But can be issued by sysfs (+value is cached, so it is
> called only once).
>
> So question is: is my patch enough for fixing first bug?
>
> And second question: how to fix second bug? I see only one option:
> Create machine blacklist with broken Dell SMM firmware and disallow
> calling I8K_SMM_GET_FAN_TYPE for them.
>
Or maybe a whitelist with known working systems ?

Guenter

