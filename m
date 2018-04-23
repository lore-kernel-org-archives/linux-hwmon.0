Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:26648 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932166AbeDWRkz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Apr 2018 13:40:55 -0400
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
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
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
 <20180423105224.GA1444@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <09b1a8af-4d47-0714-8f68-d7fe35cc7a72@linux.intel.com>
Date: Mon, 23 Apr 2018 10:40:53 -0700
MIME-Version: 1.0
In-Reply-To: <20180423105224.GA1444@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 4/23/2018 3:52 AM, Greg KH wrote:
> On Tue, Apr 10, 2018 at 11:32:05AM -0700, Jae Hyun Yoo wrote:
>> +static void peci_adapter_dev_release(struct device *dev)
>> +{
>> +	/* do nothing */
>> +}
> 
> As per the in-kernel documentation, I am now allowed to make fun of you.
> 
> You are trying to "out smart" the kernel by getting rid of a warning
> message that was explicitly put there for you to do something.  To think
> that by just providing an "empty" function you are somehow fulfilling
> the API requirement is quite bold, don't you think?
> 
> This has to be fixed.  I didn't put that warning in there for no good
> reason.  Please go read the documentation again...
> 
> greg k-h
> 

Hi Greg,

Thanks a lot for your review.

I think, it should contain actual device resource release code which is
being done by peci_del_adapter(), or a coupling logic should be added
between peci_adapter_dev_release() and peci_del_adapter().

As you suggested, I'll check it again after reading documentation and
understanding core.c code more deeply.

Jae
