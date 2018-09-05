Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43574 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbeIFChN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Sep 2018 22:37:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id j26-v6so4156352pfi.10
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Sep 2018 15:05:02 -0700 (PDT)
Subject: Re: [bug report] hwmon: (nct6775) Add support for weighted fan
 control
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-hwmon@vger.kernel.org
References: <20180904124054.qabt7iqu7nkarlq4@kili.mountain>
 <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
 <20180905075711.c7mcegjcq45gburb@mwanda>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <f0049a5e-d7b3-7072-29a1-7a5c40d87697@roeck-us.net>
Date: Wed, 5 Sep 2018 15:05:00 -0700
MIME-Version: 1.0
In-Reply-To: <20180905075711.c7mcegjcq45gburb@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Dan,

On 09/05/2018 12:57 AM, Dan Carpenter wrote:
> Done.  Btw, I saw another that looks legit.
> 
Thanks ...

> drivers/hwmon/nct6775.c:1687 nct6775_update_device()
> error: buffer overflow 'data->FAN_PULSE_SHIFT' 6 <= 6
> 
> drivers/hwmon/nct6775.c
>    1667                          data->in[i][2] = nct6775_read_value(data,
>    1668                                            data->REG_IN_MINMAX[1][i]);
>    1669                  }
>    1670
>    1671                  /* Measured fan speeds and limits */
>    1672                  for (i = 0; i < ARRAY_SIZE(data->rpm); i++) {
>                                      ^^^^^^^^^^^^^^^^^^^^^^^^
> This is a 7 element array.
> 
>    1673                          u16 reg;
>    1674
>    1675                          if (!(data->has_fan & BIT(i)))
>                                        ^^^^^^^^^^^^^^^^^^^^^^
> 
> I probably wouldn't have reported this originally because Smatch is bad
> at these checks.  (I just haven't gotten around to it yet).  But we do
> have fan7pin so it looks like BIT(6) can be set.
> 
>    1676                                  continue;
>    1677
>    1678                          reg = nct6775_read_value(data, data->REG_FAN[i]);
>    1679                          data->rpm[i] = data->fan_from_reg(reg,
>    1680                                                            data->fan_div[i]);
>    1681
>    1682                          if (data->has_fan_min & BIT(i))
>    1683                                  data->fan_min[i] = nct6775_read_value(data,
>    1684                                             data->REG_FAN_MIN[i]);
>    1685                          data->fan_pulses[i] =
>    1686                            (nct6775_read_value(data, data->REG_FAN_PULSES[i])
>    1687                                  >> data->FAN_PULSE_SHIFT[i]) & 0x03;
>                                             ^^^^^^^^^^^^^^^^^^^^^^^^
> FAN_PULSE_SHIFT is either 5 or 6 elements.
> 

Array size of xxx_REG_FAN_PULSES[] and xxx_FAN_PULSE_SHIFT[] should probably
be NUM_FAN to be on the safe side. There is a slight secondary problem, though:
data->REG_FAN_PULSES[i] should not be read if it is 0. It doesn't matter much -
it results in an unnecessary read from register 0 - but it is still undesirable.

Care to send another patch ?

Thanks,
Guenter

>    1688
>    1689                          nct6775_select_fan_div(dev, data, i, reg);
>    1690                  }
>    1691
>    1692                  nct6775_update_pwm(dev);
>    1693                  nct6775_update_pwm_limits(dev);
>    1694
> 
> regards,
> dan carpenter
> 
