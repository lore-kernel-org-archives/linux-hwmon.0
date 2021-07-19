Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FD7C12002
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 16:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA14F6121F
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 16:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbhGSQD2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Jul 2021 12:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352388AbhGSQBf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Jul 2021 12:01:35 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22C5C0533BA
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Jul 2021 08:57:19 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso18751364ota.6
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Jul 2021 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jMY4Q9FTmStAsc6QWutfoz472vd58WgbcMMa9l8dack=;
        b=mj7HpxnHseUKP774l5RcZDiV3fcinDar1y0VTi/HCg/0lXn4EY8yoB3xTTC9jN+4je
         zK/qErAuYTyz12pLOYw2e3op6sgAzAgo5twwDF+ccGSsOYuEvMtNja3NhKFwZbDCByeU
         dwQ8RMASg6MOexYCHO/S7DQgmFe6Drcv9/1j1MJRp5saFOVGv5iCEPoTQd02NUUSivsx
         4+MMMvynszV47/Hp6T0swYTz5x+7DIXVcpey8h96W+JK3cS/I0UR2/5eN3uHZQ1GGPhF
         X4fpdI1J2ztgTMcL8gFlS+NMQC+v/IEsjE8IQRLBuKMB/rZnSBWT8yIn3PuaIml7Ew4C
         VF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jMY4Q9FTmStAsc6QWutfoz472vd58WgbcMMa9l8dack=;
        b=a58BBIlp2CRgSnk7uap55fCyvzlOc2ssYMX30EhdVbIS92hZJKhhksKjjeMD5VAuje
         qyTV5isT00g0cz7e8FkMbADraI1OtvHo2KXbX/6Mj1jNgrB2yld/xn9orL2LZTusgXF0
         4bkruIdwoBYqcLB4EKS8A/eSuoSq0GmvuW5wFGG3fIWJLWp0u7KCLpasQdVR9Ry5ZEkQ
         JM3WDvtLNSBsE32gXmI25lWAosEmF5YAnNij3weSdishtFYXeC3lBN1EZ8qX2c+5Q1Jn
         QQmGKTJ02GGs5j9WZI/Rw5T4/U1a/HucxBbdOPMa6uAOhlZX+d0siFdU5mN+OH2VJJhq
         TmbQ==
X-Gm-Message-State: AOAM533jQXxxHrLN/k5shPsIeMPybd/tIcTzJf6fw7+AVd5/0+5LenEM
        Ry6KHinZME92nZhpM3VP/JI=
X-Google-Smtp-Source: ABdhPJyqq5n/bC7iQmaK3cQ5Cyk+8shE1aXCybi8zH1P/4v0YZfScs0MZ0Yw/OsppQXpBkFTp/EZxA==
X-Received: by 2002:a05:6830:2470:: with SMTP id x48mr7316526otr.358.1626711695730;
        Mon, 19 Jul 2021 09:21:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t64sm3914402oig.48.2021.07.19.09.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 09:21:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 1/3] hwmon: sbrmi: Add support for sbrmi power module
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Gupta, Akshay" <Akshay.Gupta@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210707155859.86240-1-nchatrad@amd.com>
 <20210716055812.GA717674@roeck-us.net>
 <BL1PR12MB5286E348111D26A45421EF4DE8E19@BL1PR12MB5286.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5c03c9c3-39b7-19bc-cca0-df4a5a9c222f@roeck-us.net>
Date:   Mon, 19 Jul 2021 09:21:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BL1PR12MB5286E348111D26A45421EF4DE8E19@BL1PR12MB5286.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/19/21 8:50 AM, Chatradhi, Naveen Krishna wrote:
> [AMD Official Use Only]
> 
> Hi Guenter,
> 
> Thank you for your review, will submit revised version shortly.
> 
> Regards,
> Naveenk
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, July 16, 2021 11:28 AM
> To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>
> Cc: linux-hwmon@vger.kernel.org; Gupta, Akshay <Akshay.Gupta@amd.com>
> Subject: Re: [PATCH v2 1/3] hwmon: sbrmi: Add support for sbrmi power module
> 
> [CAUTION: External Email]
> 
> On Wed, Jul 07, 2021 at 09:28:57PM +0530, Naveen Krishna Chatradhi wrote:
>> From: Akshay Gupta <Akshay.Gupta@amd.com>
>>
>> On AMD platforms the Out-of-band access is provided by Advanced
>> Platform Management Link (APML), APML is a SMBus v2.0 compatible
>> 2-wire processor client interface.
>> APML is also referred as the sideband interface (SBI).
>>
>> APML is used to communicate with the
>> Side-Band Remote Management Interface (SB-RMI) which provides Soft
>> Mailbox messages to manage power consumption and power limits of the
>> CPU socket.
>>
>> - This module add support to read power consumption,
>>    power limit & max power limit and write power limit.
>> - To instantiate this driver on a Board Management Controller (BMC)
>>    connected to an AMD CPU with SB-RMI support, the i2c bus number
>>    would be the bus connected from the BMC to the CPU.
>>
>> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>>
>> Changes since v1:
>> 1. remove header file and move in alphabetical order 2. make all
>> comments multiline 3. remove the pr_err, needed for debugging only 4.
>> fix #define tab issue 5. uninitailize err,
>>    - correct spelling & remove extra ()
>>    - remove extra i2c functionality check 6. reduce call to
>> data->client 7. remove usage of union
>>
>>   drivers/hwmon/Kconfig  |  10 ++
>>   drivers/hwmon/Makefile |   1 +
>>   drivers/hwmon/sbrmi.c  | 341
>> +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 352 insertions(+)
>>   create mode 100644 drivers/hwmon/sbrmi.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
>> 87624902ea80..f489972a6309 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -1551,6 +1551,16 @@ config SENSORS_SBTSI
>>          This driver can also be built as a module. If so, the module will
>>          be called sbtsi_temp.
>>
>> +config SENSORS_SBRMI
>> +     tristate "Emulated SB-RMI sensor"
>> +     depends on I2C
>> +     help
>> +       If you say yes here you get support for emulated RMI
>> +       sensors on AMD SoCs with APML interface connected to a BMC device.
>> +
>> +       This driver can also be built as a module. If so, the module will
>> +       be called sbrmi.
>> +
>>   config SENSORS_SHT15
>>        tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
>>        depends on GPIOLIB || COMPILE_TEST diff --git
>> a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
>> 59e78bc212cf..8031acf58936 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -164,6 +164,7 @@ obj-$(CONFIG_SENSORS_PWM_FAN)     += pwm-fan.o
>>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)      += raspberrypi-hwmon.o
>>   obj-$(CONFIG_SENSORS_S3C)    += s3c-hwmon.o
>>   obj-$(CONFIG_SENSORS_SBTSI)  += sbtsi_temp.o
>> +obj-$(CONFIG_SENSORS_SBRMI)  += sbrmi.o
>>   obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>>   obj-$(CONFIG_SENSORS_SCH5627)        += sch5627.o
>>   obj-$(CONFIG_SENSORS_SCH5636)        += sch5636.o
>> diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c new file
>> mode 100644 index 000000000000..10622b1f23f2
>> --- /dev/null
>> +++ b/drivers/hwmon/sbrmi.c
>> @@ -0,0 +1,341 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * sbrmi.c - hwmon driver for a SB-RMI mailbox
>> + *           compliant AMD SoC device.
>> + *
>> + * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +
>> +/* Do not allow setting negative power limit */
>> +#define SBRMI_PWR_MIN        0
>> +/* Mask for Status Register bit[1] */
>> +#define SW_ALERT_MASK        0x2
>> +
>> +/* Software Interrupt for triggering */
>> +#define START_CMD    0x80
>> +#define TRIGGER_MAILBOX      0x01
>> +
>> +/*
>> + * SB-RMI supports soft mailbox service request to MP1 (power
>> +management
>> + * firmware) through SBRMI inbound/outbound message registers.
>> + * SB-RMI message IDs
>> + */
>> +enum sbrmi_msg_id {
>> +     SBRMI_READ_PKG_PWR_CONSUMPTION = 0x1,
>> +     SBRMI_WRITE_PKG_PWR_LIMIT,
>> +     SBRMI_READ_PKG_PWR_LIMIT,
>> +     SBRMI_READ_PKG_MAX_PWR_LIMIT,
>> +};
>> +
>> +/* SB-RMI registers */
>> +enum sbrmi_reg {
>> +     SBRMI_CTRL              = 0x01,
>> +     SBRMI_STATUS,
>> +     SBRMI_OUTBNDMSG0        = 0x30,
>> +     SBRMI_OUTBNDMSG1,
>> +     SBRMI_OUTBNDMSG2,
>> +     SBRMI_OUTBNDMSG3,
>> +     SBRMI_OUTBNDMSG4,
>> +     SBRMI_OUTBNDMSG5,
>> +     SBRMI_OUTBNDMSG6,
>> +     SBRMI_OUTBNDMSG7,
>> +     SBRMI_INBNDMSG0,
>> +     SBRMI_INBNDMSG1,
>> +     SBRMI_INBNDMSG2,
>> +     SBRMI_INBNDMSG3,
>> +     SBRMI_INBNDMSG4,
>> +     SBRMI_INBNDMSG5,
>> +     SBRMI_INBNDMSG6,
>> +     SBRMI_INBNDMSG7,
>> +     SBRMI_SW_INTERRUPT,
>> +};
>> +
>> +/* Each client has this additional data */ struct sbrmi_data {
>> +     struct i2c_client *client;
>> +     struct mutex lock;
>> +};
>> +
>> +struct sbrmi_mailbox_msg {
>> +     u8 cmd;
>> +     bool read;
>> +     u32 data_in;
>> +     u32 data_out;
>> +};
>> +
>> +static int sbrmi_enable_alert(struct i2c_client *client) {
>> +     int ctrl;
>> +
>> +     /*
>> +      * Enable the SB-RMI Software alert status
>> +      * by writing 0 to bit 4 of Control register(0x1)
>> +      */
>> +     ctrl = i2c_smbus_read_byte_data(client, SBRMI_CTRL);
>> +     if (ctrl < 0)
>> +             return ctrl;
>> +
>> +     if (ctrl & 0x10) {
>> +             ctrl &= ~0x10;
>> +             return i2c_smbus_write_byte_data(client,
>> +                                              SBRMI_CTRL, ctrl);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int rmi_mailbox_xfer(struct sbrmi_data *data,
>> +                         struct sbrmi_mailbox_msg *msg) {
>> +     int i, ret, retry = 10;
>> +     int sw_status;
>> +     u8 byte;
>> +
>> +     mutex_lock(&data->lock);
>> +
>> +     ret = sbrmi_enable_alert(data->client);
>> +     if (ret < 0)
>> +             goto exit_unlock;
>> +
> 
> Is it really necessary to call this for every command (instead of once during probe) ?
> [naveenk:] Will move it
> 
>> +     /* Indicate firmware a command is to be serviced */
>> +     ret = i2c_smbus_write_byte_data(data->client,
>> +                                     SBRMI_INBNDMSG7, START_CMD);
>> +     if (ret < 0)
>> +             goto exit_unlock;
>> +
>> +     /* Write the command to SBRMI::InBndMsg_inst0 */
>> +     ret = i2c_smbus_write_byte_data(data->client,
>> +                                     SBRMI_INBNDMSG0, msg->cmd);
>> +     if (ret < 0)
>> +             goto exit_unlock;
>> +
>> +     /*
>> +      * For both read and write the initiator (BMC) writes
>> +      * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
>> +      * SBRMI_x3C(MSB):SBRMI_x39(LSB)
>> +      */
>> +     for (i = 0; i < 4; i++) {
>> +             byte = (msg->data_in >> i * 8) & 0xff;
>> +             ret = i2c_smbus_write_byte_data(data->client,
>> +                                             SBRMI_INBNDMSG1 + i, byte);
>> +             if (ret < 0)
>> +                     goto exit_unlock;
>> +     }
>> +
>> +     /*
>> +      * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
>> +      * perform the requested read or write command
>> +      */
>> +     ret = i2c_smbus_write_byte_data(data->client,
>> +                                     SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
>> +     if (ret < 0)
>> +             goto exit_unlock;
>> +
>> +     /*
>> +      * Firmware will write SBRMI::Status[SwAlertSts]=1 to generate
>> +      * an ALERT (if enabled) to initiator (BMC) to indicate completion
>> +      * of the requested command
>> +      */
>> +     do {
>> +             sw_status = i2c_smbus_read_byte_data(data->client,
>> +                                                  SBRMI_STATUS);
>> +             if (sw_status < 0) {
>> +                     ret = sw_status;
>> +                     goto exit_unlock;
>> +             }
>> +             if (sw_status & SW_ALERT_MASK)
>> +                     break;
>> +             usleep_range(50, 100);
> 
> I don't have the interface specification, but is ~600 uS guaranteed to be sufficient time for the firmware to respond ?
> [naveenk:] The SB-RMI is explained in the APML chapter of the reference manual available https://www.amd.com/en/support/tech-docs?keyword=55898
> I did not find any mention of the response time, we ran several times and never seen the loop execute twice. Do you have any recommendation here ?
> 
Not really. The code is good enough for me if it is good enough for you,
especially if the timeout is not well defined.

>> +     } while (retry--);
>> +
>> +     if (retry < 0) {
>> +             pr_err("Firmware fail to indicate command
>> + completion\n");
> 
> Please use dev_err(). Also, does this really warrant an error message ?
> I am concerned that it may fill up the log if there is an issue with the client, eg if it hangs. On top of that, there is already an error message below. Please no more than one message per error.
> [naveenk:] Sure will change to dev_err and remove one of the prints
> 
>> +             ret = -1;
> 
> Please use standard error codes (-ETIMEDOUT ? -EIO ? -EPROTO ?).
> -1 translates to -EPERM which is presumably not what you want.
> [naveenk:] Will use -EIO
> 
>> +             goto exit_unlock;
>> +     }
>> +
>> +     /*
>> +      * For a read operation, the initiator (BMC) reads the firmware
>> +      * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
>> +      * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
>> +      */
>> +     if (msg->read) {
>> +             for (i = 0; i < 4; i++) {
>> +                     ret = i2c_smbus_read_byte_data(data->client,
>> +                                                    SBRMI_OUTBNDMSG1 + i);
>> +                     if (ret < 0)
>> +                             goto exit_unlock;
> 
> This is a concern in conjunction with the ignored error in sbrmi_write().
> If there is an error after reading a number of bytes, the returned value will be partial/random.
> [naveenk:] Will address the return value
> 
>> +                     msg->data_out |= (ret & 0xff) << i * 8;
> 
> The mask is unnecessary here. A byte read will never return a value > 0xff.
> [naveenk:] Sure will remove
> 
>> +             }
>> +     }
>> +
>> +     /*
>> +      * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
>> +      * ALERT to initiator
>> +      */
>> +     ret = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
>> +                                     sw_status | SW_ALERT_MASK);
>> +
>> +exit_unlock:
>> +     if (ret < 0)
>> +             pr_err("SMBUS translation failed\n");
> 
> dev_err(). Also, please consider that this may fill the log if the client or the i2c controller/bus has a problem.
> [naveenk:] Will remove this print
> 
>> +
>> +     mutex_unlock(&data->lock);
>> +     return ret;
>> +}
>> +
>> +static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
>> +                   u32 attr, int channel, long *val) {
>> +     struct sbrmi_data *data = dev_get_drvdata(dev);
>> +     struct sbrmi_mailbox_msg msg = { 0 };
>> +     int ret;
>> +
>> +     if (type != hwmon_power)
>> +             return -EINVAL;
>> +
>> +     msg.read = true;
>> +     switch (attr) {
>> +     case hwmon_power_input:
>> +             msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
>> +             ret = rmi_mailbox_xfer(data, &msg);
>> +             break;
>> +     case hwmon_power_cap:
>> +             msg.cmd = SBRMI_READ_PKG_PWR_LIMIT;
>> +             ret = rmi_mailbox_xfer(data, &msg);
>> +             break;
>> +     case hwmon_power_cap_max:
>> +             msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
>> +             ret = rmi_mailbox_xfer(data, &msg);
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +     /* hwmon power attributes are in microWatt */
>> +     *val = (long)msg.data_out * 1000;
>> +     return ret;
>> +}
>> +
>> +static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
>> +                    u32 attr, int channel, long val) {
>> +     struct sbrmi_data *data = dev_get_drvdata(dev);
>> +     struct sbrmi_mailbox_msg msg = { 0 };
>> +
>> +     if (type != hwmon_power && attr != hwmon_power_cap)
>> +             return -EINVAL;
>> +     /*
>> +      * hwmon power attributes are in microWatt
>> +      * mailbox read/write is in mWatt
>> +      */
>> +     val /= 1000;
>> +
>> +     msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
>> +     msg.data_in = 0;
> 
> Unnecessary (already initialized above).
> 
>> +     msg.read = true;
>> +     rmi_mailbox_xfer(data, &msg);
> 
> Not sure if it is a good idea to ignore an error return here.
> As far as I can see in rmi_mailbox_xfer(), the returned value is more or less random if there is an error.
> 
> If the maximum power limit is static, it might make sense to read it only once in the prob function and cache the limit in struct sbrmi_data instead of reading it repeatedly.
> [naveenk:] The maximum limit is fixed, will cache during probe.
> If the limit is not static and it is indeed necessary to re-read the limit, isn't this racy if there are multiple write requests in parallel ?
> [naveenk:] the operating limit value can be set to a value below the max_limit
> 

Yes, I understand. My concern was potential race if the first mailbox transfer
would not return a constant. This is not an issue if there is only one
mailbox transfer.

Thanks,
Guenter
