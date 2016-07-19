Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36795 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751990AbcGSDkz (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Mon, 18 Jul 2016 23:40:55 -0400
Subject: Re: [PATCH v7] hwmon: added kernel module for FTS BMC chip "Teutates"
To: Thilo Cestonaro <thilo@cestona.ro>,
	Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
References: <1468842689-31582-1-git-send-email-thilo.cestonaro@ts.fujitsu.com>
 <578CEA7D.6000704@roeck-us.net> <578CF7CC.7070904@cestona.ro>
Cc: linux-hwmon <linux-hwmon@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <578DA13D.4090701@roeck-us.net>
Date: Mon, 18 Jul 2016 20:40:45 -0700
MIME-Version: 1.0
In-Reply-To: <578CF7CC.7070904@cestona.ro>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/18/2016 08:37 AM, Thilo Cestonaro wrote:
> Am 18.07.2016 um 16:41 schrieb Guenter Roeck:
>> On 07/18/2016 04:51 AM, Thilo Cestonaro wrote:
>>> From: Thilo Cestonaro <thilo@cestona.ro>
>>>
>>> This driver implements support for the FTS BMC Chip "Teutates".
>>>
>>> Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
>>> ---
>>
>> [ ... ]
>>
>>> +
>>> +/*****************************************************************************/
>>>
>>> +/* Module initialization / remove functions                     */
>>> +/*****************************************************************************/
>>>
>>> +static int fts_remove(struct i2c_client *client)
>>> +{
>>> +    struct fts_data *data = dev_get_drvdata(&client->dev);
>>> +
>>> +    watchdog_unregister_device(&data->wdd);
>>> +    return 0;
>>> +}
>>> +
>>> +static int fts_probe(struct i2c_client *client, const struct
>>> i2c_device_id *id)
>>> +{
>>> +    u8 revision;
>>> +    struct fts_data *data;
>>> +    int err;
>>> +    s8 deviceid;
>>
>> One (hopefully) last question: Effectively this means that any device
>> ID >=0x80
>> will be identified as error. Is this on purpose ? It is quite unusual.
> The driver looks especially for 0x11, which means 0x10 - Baseboard
> Management Controller and 0x01 Teutates. (spec. page 8, Page 0 Offset 0)
> So anything not 1Xh will be an error ENODEV and then the switch filters
> for X1h and all not 01h will be an error ENODEV, as this driver isn't
> written for anything different to 0x11.
> So "s8" is ok here.
>

Hmmm ... I don't really see the point of using s8 instead of int,
but I'll accept it.

Applied to -next.

Guenter

