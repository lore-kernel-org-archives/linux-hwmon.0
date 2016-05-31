Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53462 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750956AbcEaR0l (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 31 May 2016 13:26:41 -0400
Date: Tue, 31 May 2016 10:26:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pascal Sachs <pascalsachs@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, pascal.sachs@sensirion.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Frey <david.frey@sensirion.com>
Subject: Re: [PATCH 1/1 v4] hwmon: add support for Sensirion SHT3x sensors
Message-ID: <20160531172626.GC14007@roeck-us.net>
References: <1464619588-3354-1-git-send-email-pascalsachs@gmail.com>
 <574C602E.1070702@roeck-us.net>
 <574D386B.8020805@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <574D386B.8020805@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, May 31, 2016 at 09:08:27AM +0200, Pascal Sachs wrote:
> Hi Guenter
> 
> I want to thank you again for the fast and detailed code review.
> I really appreciate it.
> 

Sorry it took so long.

[ ... ]

> >>+static struct sht3x_data *sht3x_update_client(struct device *dev)
> >>+{
> >>+    struct sht3x_data *data = dev_get_drvdata(dev);
> >>+    struct i2c_client *client = data->client;
> >>+    u16 interval_ms = mode_to_update_interval[data->mode];
> >
> >If data->mode == 0, interval_ms == 0,
> >
> >>+    unsigned long interval_jiffies = msecs_to_jiffies(interval_ms);
> >
> >... interval_jiffies == 1,
> >
> >>+    unsigned char buf[SHT3X_RESPONSE_LENGTH];
> >>+    u16 val;
> >>+    int ret = 0;
> >>+
> >>+    mutex_lock(&data->data_lock);
> >>+    /* only update once per interval in periodic mode */
> >>+    if (time_after(jiffies, data->last_update + interval_jiffies)) {
> >
> >... and the command is executed every other timer tick. Is that
> >intentional ?
> Yes, this is how it should behave. In single shot mode the sensor measures
> values on demand, which means every time the sysfs interface is called, a
> measurement is triggered. In periodic mode however the measurement process
> is handled internally by the sensor and read out only makes sense if a new
> reading is available.

Please add the explanation as comment into the code.

[ ... ]

> >>+    commands = &limit_commands[index];
> >>+
> >>+    memcpy(position, commands->write_command, SHT3X_CMD_LENGTH);
> >>+    position += SHT3X_CMD_LENGTH;
> >>+    /*
> >>+     * ST = (T + 45) / 175 * 2^16
> >>+     * SRH = RH / 100 * 2^16
> >>+     * adapted for fixed point arithmetic and packed the same as
> >>+     * in limit_show()
> >>+     */
> >>+    raw = ((u32)(temperature + 45000) * 24543) >> (16 + 7);
> >>+    raw |= ((humidity * 42950) >> 16) & 0xfe00;
> >>+
> >>+    *((__be16 *)position) = cpu_to_be16(raw);
> >>+    position += SHT3X_WORD_LEN;
> >>+    *position = crc8(sht3x_crc8_table,
> >>+             position - SHT3X_WORD_LEN,
> >>+             SHT3X_WORD_LEN,
> >>+             SHT3X_CRC8_INIT);
> >>+
> >>+    mutex_lock(&data->data_lock);
> >>+    mutex_lock(&data->i2c_lock);
> >>+    ret = i2c_master_send(client, buffer, sizeof(buffer));
> >>+    mutex_unlock(&data->i2c_lock);
> >>+
> >>+    if (ret != sizeof(buffer))
> >>+        goto out;
> >>+
> >>+    data->temperature_limits[index] = temperature;
> >>+    data->humidity_limits[index] = humidity;
> >>+
> >>+out:
> >>+    mutex_unlock(&data->data_lock);
> >>+    if (ret != sizeof(buffer))
> >>+        return  ret < 0 ? ret : -EIO;
> >>+
> >>+    return count;
> >
> >I would prefer something like
> >
> >        if (ret != sizeof(buffer)) {
> >                if (ret >= 0)
> >                        ret = -EIO;
> >                goto out;
> >        }
> >
> >        ret = count;
> >        data->temperature_limits[index] = temperature;
> >        data->humidity_limits[index] = humidity;
> >out:
> >        mutex_unlock(&data->data_lock);
> >        return ret;
> >
> >which I think would be cleaner. See below though for locking issues.
> OK, wasn't sure if it is appropriate to handle error and valid return in the
> same variable

Done all over the place.

[ ... ]

> >
> >>+    mutex_lock(&data->i2c_lock);
> >>+    mutex_lock(&data->data_lock);
> >>+    /* abort periodic measure */
> >>+    ret = i2c_master_send(client, sht3x_cmd_break, SHT3X_CMD_LENGTH);
> >>+    if (ret != SHT3X_CMD_LENGTH)
> >>+        goto out;
> >>+    data->mode = 0;
> >>+
> >
> >Can you explain why you set data->mode = 0 here ?
> To do any changes to the configuration while in periodic mode we have to
> send a break command to the sensor, which then falls back to single shot
> mode (mode = 0). Therefore for consistency reasons we set the mode to
> the value it actually is at this point.
> If setting the new mode fails, we are still in single shot mode. Like this
> we
> ensure that the data->mode is always correct.

Ok; please add the explanation as comment into the code.

Thanks,
Guenter
