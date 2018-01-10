Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:52810 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752755AbeAJXp7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jan 2018 18:45:59 -0500
Subject: Re: [PATCH linux dev-4.10 6/6] drivers/hwmon: Add a driver for a
 generic PECI hwmon
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        gregkh <gregkh@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-7-jae.hyun.yoo@linux.intel.com>
 <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <bdc0375d-c379-6c2e-b350-76741afe151d@linux.intel.com>
Date: Wed, 10 Jan 2018 15:45:58 -0800
MIME-Version: 1.0
In-Reply-To: <CAK8P3a31+9HGQ=fQby5Zi1RZ671hKraZP_2ggLTMX3qvOiTx0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 1/10/2018 4:29 AM, Arnd Bergmann wrote:
> On Tue, Jan 9, 2018 at 11:31 PM, Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit adds driver implementation for a generic PECI hwmon.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
>> +static int xfer_peci_msg(int cmd, void *pmsg)
>> +{
>> +       int rc;
>> +
>> +       mutex_lock(&peci_hwmon_lock);
>> +       rc = peci_ioctl(NULL, cmd, (unsigned long)pmsg);
>> +       mutex_unlock(&peci_hwmon_lock);
>> +
>> +       return rc;
>> +}
> 
> I said earlier that peci_ioctl() looked unused, that was obviously
> wrong, but what you have here
> is not a proper way to abstract a bus.
> 
> Maybe this can be done more like an i2c bus: make the peci controller
> a bus device
> and register all known target/index pairs as devices with the peci bus
> type, and have
> them probed from DT. The driver can then bind to each of those individually.
> Not sure if that is getting to granular at that point, I'd have to
> understand better
> how it is expected to get used, and what the variances are between
> implementations.
> 
>         Arnd
> 

Thanks for sharing your opinion. In fact, this was also suggested by 
openbmc community so I should consider of redesigning it. I'm currently 
thinking about adding a new PECI device class as an abstract layer and 
any BMC chipset specific driver could be attached to the PECI class 
driver. Then, each CPU client could be registered as an individual 
device as you suggested. Will consider your suggestion.

Thanks a lot!
Jae
