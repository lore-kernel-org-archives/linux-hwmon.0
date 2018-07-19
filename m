Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35964 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbeGSODD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Jul 2018 10:03:03 -0400
Subject: Re: [PATCH v6 2/2] hwmon: ibmpowernv: Add attributes to
 enable/disable sensor groups
To: Stewart Smith <stewart@linux.ibm.com>,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
        mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ego@linux.vnet.ibm.com
References: <1531937610-6454-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
 <1531937610-6454-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
 <87lga7r9rq.fsf@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <06548ca9-8bc9-f0ec-7e75-1dd675972d13@roeck-us.net>
Date: Thu, 19 Jul 2018 06:19:53 -0700
MIME-Version: 1.0
In-Reply-To: <87lga7r9rq.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/18/2018 11:59 PM, Stewart Smith wrote:
> Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com> writes:
>> On-Chip-Controller(OCC) is an embedded micro-processor in POWER9 chip
>> which measures various system and chip level sensors. These sensors
>> comprises of environmental sensors (like power, temperature, current
>> and voltage) and performance sensors (like utilization, frequency).
>> All these sensors are copied to main memory at a regular interval of
>> 100ms. OCC provides a way to select a group of sensors that is copied
>> to the main memory to increase the update frequency of selected sensor
>> groups. When a sensor-group is disabled, OCC will not copy it to main
>> memory and those sensors read 0 values.
> 
> OCC is an implementation detail rather than a core part of this firmware
> API.
> 
> Why not something like this:
> 
> OPAL firmware provides the facility for some groups of sensors to be
> enabled/disabled at runtime to give the user the option of using the
> system resources for collecting these sensors or not.
> 
> For example, on POWER9 systems, the On Chip Controller (OCC) gathers
> various system and chip level sensors and maintains their values in main
> memory.
> 
> 
>> +static int init_sensor_group_data(struct platform_device *pdev,
>> +				  struct platform_data *pdata)
>> +{
>> +	struct sensor_group_data *sgrp_data;
>> +	struct device_node *groups, *sgrp;
>> +	enum sensors type;
>> +	int count = 0, ret = 0;
>> +
>> +	groups = of_find_node_by_path("/ibm,opal/sensor-groups");
>> +	if (!groups)
>> +		return ret;
> 
> Why not look for the compatible property?
> 
> 

For both, I don't really care either way. Can you folks get to an agreement
and let me know after you decided ?

Thanks,
Guenter
