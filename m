Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:59448 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751773AbeCLOSF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Mar 2018 10:18:05 -0400
Date: Mon, 12 Mar 2018 17:17:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: sudeep.holla@arm.com
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: add support for sensors exported via ARM SCMI
Message-ID: <20180312141750.GA10360@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello Sudeep Holla,

The patch b23688aefb8b: "hwmon: add support for sensors exported via
ARM SCMI" from Jun 15, 2017, leads to the following static checker
warning:

	drivers/hwmon/scmi-hwmon.c:141 scmi_hwmon_probe()
	warn: passing zero to 'PTR_ERR'

drivers/hwmon/scmi-hwmon.c
   111  static int scmi_hwmon_probe(struct scmi_device *sdev)
   112  {
   113          int i, idx;
   114          u16 nr_sensors;
   115          enum hwmon_sensor_types type;
   116          struct scmi_sensors *scmi_sensors;
   117          const struct scmi_sensor_info *sensor;
   118          int nr_count[hwmon_max] = {0}, nr_types = 0;
   119          const struct hwmon_chip_info *chip_info;
   120          struct device *hwdev, *dev = &sdev->dev;
   121          struct hwmon_channel_info *scmi_hwmon_chan;
   122          const struct hwmon_channel_info **ptr_scmi_ci;
   123          const struct scmi_handle *handle = sdev->handle;
   124  
   125          if (!handle || !handle->sensor_ops)
   126                  return -ENODEV;
   127  
   128          nr_sensors = handle->sensor_ops->count_get(handle);
   129          if (!nr_sensors)
   130                  return -EIO;
   131  
   132          scmi_sensors = devm_kzalloc(dev, sizeof(*scmi_sensors), GFP_KERNEL);
   133          if (!scmi_sensors)
   134                  return -ENOMEM;
   135  
   136          scmi_sensors->handle = handle;
   137  
   138          for (i = 0; i < nr_sensors; i++) {
   139                  sensor = handle->sensor_ops->info_get(handle, i);
   140                  if (!sensor)
   141                          return PTR_ERR(sensor);
                                               ^^^^^^
This means "return 0;" which obviously isn't right, but I don't know the
currect error code to return.

   142  
   143                  switch (sensor->type) {
   144                  case TEMPERATURE_C:
   145                  case VOLTAGE:
   146                  case CURRENT:
   147                  case POWER:
   148                  case ENERGY:
   149                          type = scmi_types[sensor->type];
   150                          if (!nr_count[type])
   151                                  nr_types++;
   152                          nr_count[type]++;
   153                          break;
   154                  }

regards,
dan carpenter
