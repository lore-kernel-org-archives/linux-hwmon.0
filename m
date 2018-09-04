Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41767 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbeIDSxH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Sep 2018 14:53:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id s15-v6so1753576pgv.8
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Sep 2018 07:27:47 -0700 (PDT)
Subject: Re: [bug report] hwmon: (nct6775) Add support for weighted fan
 control
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-hwmon@vger.kernel.org
References: <20180904124054.qabt7iqu7nkarlq4@kili.mountain>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
Date: Tue, 4 Sep 2018 07:27:44 -0700
MIME-Version: 1.0
In-Reply-To: <20180904124054.qabt7iqu7nkarlq4@kili.mountain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Dan,

On 09/04/2018 05:40 AM, Dan Carpenter wrote:
> Hello Guenter Roeck,
> 
> The patch bbd8decd4123: "hwmon: (nct6775) Add support for weighted
> fan control" from Dec 4, 2012, leads to the following static checker
> warning:
> 
> 	drivers/hwmon/nct6775.c:1562 nct6775_update_pwm()
> 	warn: dead code because of 'j == 1' and 'j < (56 / 8 + 0)'
> 
> drivers/hwmon/nct6775.c
>    1503  static void nct6775_update_pwm(struct device *dev)
>    1504  {
>    1505          struct nct6775_data *data = dev_get_drvdata(dev);
>    1506          int i, j;
>    1507          int fanmodecfg, reg;
>    1508          bool duty_is_dc;
>    1509
>    1510          for (i = 0; i < data->pwm_num; i++) {
>    1511                  if (!(data->has_pwm & BIT(i)))
>    1512                          continue;
>    1513
>    1514                  duty_is_dc = data->REG_PWM_MODE[i] &&
>    1515                    (nct6775_read_value(data, data->REG_PWM_MODE[i])
>    1516                     & data->PWM_MODE_MASK[i]);
>    1517                  data->pwm_mode[i] = !duty_is_dc;
>    1518
>    1519                  fanmodecfg = nct6775_read_value(data, data->REG_FAN_MODE[i]);
>    1520                  for (j = 0; j < ARRAY_SIZE(data->REG_PWM); j++) {
>                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> j is set to ARRAY_SIZE(data->REG_PWM) which is 7 at the end of this
> loop.
> 
>    1521                          if (data->REG_PWM[j] && data->REG_PWM[j][i]) {
>    1522                                  data->pwm[j][i]
>    1523                                    = nct6775_read_value(data,
>    1524                                                         data->REG_PWM[j][i]);
>    1525                          }
>    1526                  }
>    1527
>    1528                  data->pwm_enable[i] = reg_to_pwm_enable(data->pwm[0][i],
>    1529                                                          (fanmodecfg >> 4) & 7);
>    1530
>    1531                  if (!data->temp_tolerance[0][i] ||
>    1532                      data->pwm_enable[i] != speed_cruise)
>    1533                          data->temp_tolerance[0][i] = fanmodecfg & 0x0f;
>    1534                  if (!data->target_speed_tolerance[i] ||
>    1535                      data->pwm_enable[i] == speed_cruise) {
>    1536                          u8 t = fanmodecfg & 0x0f;
>    1537
>    1538                          if (data->REG_TOLERANCE_H) {
>    1539                                  t |= (nct6775_read_value(data,
>    1540                                        data->REG_TOLERANCE_H[i]) & 0x70) >> 1;
>    1541                          }
>    1542                          data->target_speed_tolerance[i] = t;
>    1543                  }
>    1544
>    1545                  data->temp_tolerance[1][i] =
>    1546                          nct6775_read_value(data,
>    1547                                          data->REG_CRITICAL_TEMP_TOLERANCE[i]);
>    1548
>    1549                  reg = nct6775_read_value(data, data->REG_TEMP_SEL[i]);
>    1550                  data->pwm_temp_sel[i] = reg & 0x1f;
>    1551                  /* If fan can stop, report floor as 0 */
>    1552                  if (reg & 0x80)
>    1553                          data->pwm[2][i] = 0;
>    1554
>    1555                  if (!data->REG_WEIGHT_TEMP_SEL[i])
>    1556                          continue;
>    1557
>    1558                  reg = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[i]);
>    1559                  data->pwm_weight_temp_sel[i] = reg & 0x1f;
>    1560                  /* If weight is disabled, report weight source as 0 */
>    1561                  if (j == 1 && !(reg & 0x80))
>                              ^^^^^^
> So it can't be 1 here.  Did you intend to say "i == 1"?
> 

Nice catch. No, the condition does not depend on an index and should simply be
			if (!(reg & 0x80))
No idea what if anything I was thinking when I wrote the code.

It would be great if you can send a patch.

Thanks,
Guenter

>    1562                          data->pwm_weight_temp_sel[i] = 0;
>    1563
>    1564                  /* Weight temp data */
>    1565                  for (j = 0; j < ARRAY_SIZE(data->weight_temp); j++) {
>    1566                          data->weight_temp[j][i]
>    1567                            = nct6775_read_value(data,
>    1568                                                 data->REG_WEIGHT_TEMP[j][i]);
>    1569                  }
>    1570          }
>    1571  }
> 
> regards,
> dan carpenter
> 
