Return-Path: <dan.carpenter@oracle.com>
Return-path: <dan.carpenter@oracle.com>
Date: Wed, 5 Sep 2018 10:57:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: (nct6775) Add support for weighted fan
 control
Message-ID: <20180905075711.c7mcegjcq45gburb@mwanda>
References: <20180904124054.qabt7iqu7nkarlq4@kili.mountain>
 <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Done.  Btw, I saw another that looks legit.

drivers/hwmon/nct6775.c:1687 nct6775_update_device()
error: buffer overflow 'data->FAN_PULSE_SHIFT' 6 <= 6

drivers/hwmon/nct6775.c
  1667                          data->in[i][2] = nct6775_read_value(data,
  1668                                            data->REG_IN_MINMAX[1][i]);
  1669                  }
  1670  
  1671                  /* Measured fan speeds and limits */
  1672                  for (i = 0; i < ARRAY_SIZE(data->rpm); i++) {
                                    ^^^^^^^^^^^^^^^^^^^^^^^^
This is a 7 element array.

  1673                          u16 reg;
  1674  
  1675                          if (!(data->has_fan & BIT(i)))
                                      ^^^^^^^^^^^^^^^^^^^^^^

I probably wouldn't have reported this originally because Smatch is bad
at these checks.  (I just haven't gotten around to it yet).  But we do
have fan7pin so it looks like BIT(6) can be set.

  1676                                  continue;
  1677  
  1678                          reg = nct6775_read_value(data, data->REG_FAN[i]);
  1679                          data->rpm[i] = data->fan_from_reg(reg,
  1680                                                            data->fan_div[i]);
  1681  
  1682                          if (data->has_fan_min & BIT(i))
  1683                                  data->fan_min[i] = nct6775_read_value(data,
  1684                                             data->REG_FAN_MIN[i]);
  1685                          data->fan_pulses[i] =
  1686                            (nct6775_read_value(data, data->REG_FAN_PULSES[i])
  1687                                  >> data->FAN_PULSE_SHIFT[i]) & 0x03;
                                           ^^^^^^^^^^^^^^^^^^^^^^^^
FAN_PULSE_SHIFT is either 5 or 6 elements.

  1688  
  1689                          nct6775_select_fan_div(dev, data, i, reg);
  1690                  }
  1691  
  1692                  nct6775_update_pwm(dev);
  1693                  nct6775_update_pwm_limits(dev);
  1694  

regards,
dan carpenter
