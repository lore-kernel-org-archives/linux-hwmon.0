Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:45485 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750868AbeDXQ3w (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Apr 2018 12:29:52 -0400
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alan Cox <alan@linux.intel.com>,
        Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
 <1524585717.21176.504.camel@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <af70513f-a827-9aaa-1acf-629ae1692d7c@linux.intel.com>
Date: Tue, 24 Apr 2018 09:29:48 -0700
MIME-Version: 1.0
In-Reply-To: <1524585717.21176.504.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 4/24/2018 9:01 AM, Andy Shevchenko wrote:
> On Tue, 2018-04-10 at 11:32 -0700, Jae Hyun Yoo wrote:
>> This commit adds driver implementation for PECI bus core into linux
>> driver framework.
>>
> 
> All comments you got for patch 6 are applicable here.
> 
> And perhaps in the rest of the series.
> 
> The rule of thumb: when you get even single comment in a certain place,
> re-check _entire_ series for the same / similar patterns!
> 

Thanks for your advice. I'll keep that in mind.

Jae
