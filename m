Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from [110.188.70.11] ([110.188.70.11]:39828 "EHLO spam2.hygon.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726066AbeLIGkE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 9 Dec 2018 01:40:04 -0500
From: Pu Wen <puwen@hygon.cn>
Subject: Re: [RFC PATCH] hwmon/k10temp: Add Hygon Dhyana support
To: Guenter Roeck <linux@roeck-us.net>
CC: <clemens@ladisch.de>, <jdelvare@suse.com>, <bp@alien8.de>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1544250808-20462-1-git-send-email-puwen@hygon.cn>
 <20181208155559.GA27489@roeck-us.net>
Message-ID: <d91c04e9-71c2-3045-1e31-f2f4cc076e87@hygon.cn>
Date: Sun, 9 Dec 2018 14:39:15 +0800
MIME-Version: 1.0
In-Reply-To: <20181208155559.GA27489@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 2018/12/8 23:56, Guenter Roeck wrote:
> On Sat, Dec 08, 2018 at 02:33:28PM +0800, Pu Wen wrote:
>> Add support for Hygon Dhyana family 18h processor for k10temp to get the
>> temperature. As Hygon Dhyana shares the same function interface with AMD
>> family 17h, so add Hygon PCI Vendor ID and reuse the code path of AMD.
>>
>> Signed-off-by: Pu Wen <puwen@hygon.cn>
>> Acked-by: Borislav Petkov <bp@suse.de>
> 
> Applied to hwmon-next.

Thanks a lot.

> If the Hygon CPUs have Tctl/Tdie temperature offsets similar to some
> of the AMD CPUs, please submit follow-up patches as necessary to add
> support for it.

Right now Hygon Dhyana CPUs do not have temperature offsets. Of course
I'll submit follow-up patches if necessary in the future.

-- 
Regards,
Pu Wen
