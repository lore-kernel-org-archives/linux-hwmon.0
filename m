Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:8884 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727319AbeJZAtb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Oct 2018 20:49:31 -0400
Subject: Re: [PATCH v8 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-9-jae.hyun.yoo@linux.intel.com>
 <20181024105903.GB4939@dell>
 <db7570cb-8f63-b551-d119-c54270ce6139@linux.intel.com>
 <20181025053030.GD4939@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <509c4c0e-eabb-2276-3ffd-3fc675801142@linux.intel.com>
Date: Thu, 25 Oct 2018 09:16:01 -0700
MIME-Version: 1.0
In-Reply-To: <20181025053030.GD4939@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/24/2018 10:30 PM, Lee Jones wrote:
> On Wed, 24 Oct 2018, Jae Hyun Yoo wrote:
>> On 10/24/2018 3:59 AM, Lee Jones wrote:
>>> On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:
>>>
>>>> This commit adds PECI client MFD driver.
>>>>
>>
>> <snip>
> 
> [...]
> 
>>>> +bool peci_temp_need_update(struct temp_data *temp)
>>>> +{
>>>> +	if (temp->valid &&
>>>> +	    time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
>>>> +		return false;
>>>> +
>>>> +	return true;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(peci_temp_need_update);
>>>> +
>>>> +void peci_temp_mark_updated(struct temp_data *temp)
>>>> +{
>>>> +	temp->valid = 1;
>>>> +	temp->last_updated = jiffies;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(peci_temp_mark_updated);
>>>
>>> These are probably better suited as inline functions to be placed in
>>> a header file.  No need to export them, since they only use their own
>>> data.
> 
> Also move them into the HWMON header file.
> 
> They have no business in MFD.
> 

Agreed. I'll move them into the HWMON header.

> [...]
> 
>>>> +int peci_client_rd_pkg_cfg_cmd(struct peci_mfd *priv, u8 mbx_idx,
>>>
>>> This is gobbledegook.  What's rd?  Read?
>>>
>>
>> Yes, the 'rd' means 'read'. I intended to keep command names as listed
>> in the PECI specification such as RdPkgConfig, WrPkgConfig and so on.
>> Should I change it to 'peci_client_read_package_config_command' ?
> 
> I looks/reads a lot nicer, don't you think?
> 

Okay. I'll change it too.

Thanks again for your review, Lee!

Jae

> [...]
> 
