Return-Path: <linux-kernel-owner@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
        ALKML <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
        Roy Franz <roy.franz@cavium.com>,
        Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, Loc Ho <lho@apm.com>,
        Alexey Klimov <alexey.klimov@arm.com>,
        Ryan Harkin <Ryan.Harkin@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: [v3,20/22] hwmon: add support for sensors exported via ARM SCMI
To: Guenter Roeck <linux@roeck-us.net>
References: <1506604306-20739-21-git-send-email-sudeep.holla@arm.com>
 <20171001142605.GA340@roeck-us.net>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <7bd07042-895b-a4c2-ec58-f941f07883f0@arm.com>
Date: Mon, 2 Oct 2017 10:25:24 +0100
MIME-Version: 1.0
In-Reply-To: <20171001142605.GA340@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>



On 01/10/17 15:26, Guenter Roeck wrote:
> On Thu, Sep 28, 2017 at 02:11:44PM +0100, Sudeep Holla wrote:
>> Create a driver to add support for SoC sensors exported by the System
>> Control Processor (SCP) via the System Control and Management Interface
>> (SCMI). The supported sensor types is one of voltage, temperature,
>> current, and power.
>>
>> The sensor labels and values provided by the SCP are exported via the
>> hwmon sysfs interface.
>>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: linux-hwmon@vger.kernel.org
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> Couple of minor comments. With those addressed,
> 

Yes, I have fixed them locally now.

> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks.

-- 
Regards,
Sudeep
