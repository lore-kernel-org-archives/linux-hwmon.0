Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42472 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754090AbcLRWCP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Dec 2016 17:02:15 -0500
Subject: Re: [PATCH] hwmon: (sht21) Add Electronic Identification Code
 retrieval
To: "Peter A. Bigot" <pab@pabigot.com>, linux-hwmon@vger.kernel.org
References: <1482064465-9674-1-git-send-email-pab@pabigot.com>
 <4deb3188-af81-fde5-7b23-28efe7fe8725@roeck-us.net>
 <dfcf75f0-4786-648a-dd28-6bbe138456c6@pabigot.com>
Cc: urs.fleisch@sensirion.com
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <00c9d380-369a-c186-00c5-2ef2fdeca3c2@roeck-us.net>
Date: Sun, 18 Dec 2016 14:02:10 -0800
MIME-Version: 1.0
In-Reply-To: <dfcf75f0-4786-648a-dd28-6bbe138456c6@pabigot.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/18/2016 10:35 AM, Peter A. Bigot wrote:
> Thanks for the very clear and helpful feedback.  I'll rework the patch, but have two style questions below.
>
> On 12/18/2016 11:53 AM, Guenter Roeck wrote:
>> On 12/18/2016 04:34 AM, Peter A. Bigot wrote:
>>> @@ -165,15 +173,95 @@ static ssize_t sht21_show_humidity(struct device *dev,
>>>      return sprintf(buf, "%d\n", sht21->humidity);
>>>  }
>>>
>>> +/**
>>> + * sht21_show_eic() - show Electronic Identification Code in sysfs
>>> + * @dev: device
>>> + * @attr: device attribute
>>> + * @buf: sysfs buffer (PAGE_SIZE) where measurement values are written to
>>> + *
>>> + * Will be called on read access to eic1_input sysfs attribute.
>>> + * Returns number of bytes written into buffer, negative errno on error.
>>> + */
>>> +static ssize_t sht21_show_eic(struct device *dev,
>>> +    struct device_attribute *attr,
>>> +    char *buf)
>>
>> Please follow multi-line alignment rules, and do not add unnecessary line breaks.
>>
>
> I was intentionally matching the single-tab before one-parameter-per-line style present in the existing code.  Do you prefer that I do that, or that I change only my code, or that I change the style in the whole file?  If the latter, should that be a separate style-only commit?
>
Ah, yes. Grumble. That is what one gets for accepting such code in the first place.
Keep it as is.

>>> +{
>>> +    struct sht21 *sht21 = dev_get_drvdata(dev);
>>> +    struct i2c_client *client = sht21->client;
>>> +    int ret = 0;
>>> +    int i;
>>> +    char *bp = buf;
>>
>> Please consider passing your patch through checkpatch and fix reported warnings and errors.
>
> Apologies.  There's one I introduced which I'll fix, but there's also the warning about symbolic permissions S_IRUGO which matched pre-existing style.  May I ignore that warning, or should I change the old uses as well?
>
Another grumble. I knew this change in preferences would hit us big time :-(.

Keep the original code, use octals for yours. I plan to submit a patch to
change all permissions in all files to get rid of that warning once and
for all.

Thanks,
Guenter

