Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5036C07E95
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 14:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC1C161CBF
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 14:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhGGOYa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Jul 2021 10:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhGGOYa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Jul 2021 10:24:30 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE69C061574
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Jul 2021 07:21:49 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 65so1552340oie.11
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jul 2021 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pCSF7byImoGXy2YfiuMlER12vWVsAzuF/7ysFFp2H7g=;
        b=HjS0n5fggPau8LDUAp8iGxJgHIInMNV9prab/2t+knfpJ6hcIJmAJqHRG3gnTyt+Oh
         no5h7fbB8OaaMfezukjTPbIUqT8TR2IdRJVOkb/0vz3eDRzWGjG8b/ZynjhFRbK7QzzZ
         DPr+FvbD9hjGwkrTpvCE4WNCRm9Z4Evxl2GyHxQAtVrN9yOx9rKzI8782IAWUd4EpKi/
         2FBEmbmtBCtFUeI9DTal2fyRAafhpvxQ394pRjBUyIixIaQjXqYHv7NKgAPUfzQ16nQO
         0p5TqrA5ulOqQSVH4Rd8PWCPTTaPx9fwOsigEDa9DlvljjBtgI0yd9iFrBa7hjFppAYw
         ZbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pCSF7byImoGXy2YfiuMlER12vWVsAzuF/7ysFFp2H7g=;
        b=sJN8vYDuRJxKaKoxJ2xoZe4Te2GpyIlpRKRKnYDC8+4xcGdrWg2yjfY4VMpvsy04Ic
         v8maQA8uigAS0kcLgciLkoNhdU77XM51/eqkYoc2x6NYqGHoqKe5O14RL7Ma4uZ6Z73b
         oW02DD0uWHb/o00cc5t2ZnH1q92wiTNRYf8hqf0J8vB2DY7VNQam/nz74jLWaOnv02DY
         WSlBEZUfc9AsQB3i7T0GemYRLiB9ZDIpBYsT8fA6ioExG/sApQArdOkbzGTbxChoLYo6
         Q9sUtRJo2nBZB1dW+LC1TYCjes17fjy4/Mq8oLEbUmWPQirsbMMofqK5V/dkxSSGvEJ6
         rEDg==
X-Gm-Message-State: AOAM53010jwS35quOVE1l4tQARuRk2Ku/g6Jz6DK3h9S8S/QOuHF42QP
        Mh5a0mWY012u9VFLQMddTr0=
X-Google-Smtp-Source: ABdhPJzA3fOKY30mCULafky5bGeS05IA4qZyd8/7I6GFOhJT4ptPoBobLJLshCSTYZkol8ZqPg21TA==
X-Received: by 2002:a05:6808:d51:: with SMTP id w17mr5027341oik.104.1625667709225;
        Wed, 07 Jul 2021 07:21:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i25sm4115584oik.29.2021.07.07.07.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 07:21:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] hwmon: sbrmi: Add support for sbrmi power module
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     "Gupta, Akshay" <Akshay.Gupta@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <26e0f4b6-5a5d-bf79-7691-b9e3a8c7ec43@roeck-us.net>
 <BL1PR12MB52864BA540FD375E61344693E8029@BL1PR12MB5286.namprd12.prod.outlook.com>
 <BL1PR12MB52861E5DA8F4A9931E3E3BC3E81A9@BL1PR12MB5286.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <34a69f1d-7e79-9813-3e02-0d830d8baabb@roeck-us.net>
Date:   Wed, 7 Jul 2021 07:21:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BL1PR12MB52861E5DA8F4A9931E3E3BC3E81A9@BL1PR12MB5286.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/7/21 7:14 AM, Chatradhi, Naveen Krishna wrote:
> [Public]
> 
> Hi Guenter,
> 
> Couple of questions inline before we submit the next version. Could you answer them.
> 
> Regards,
> Naveenk
> 
> -----Original Message-----
> From: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>
> Sent: Tuesday, June 29, 2021 8:36 PM
> To: Guenter Roeck <linux@roeck-us.net>; linux-hwmon@vger.kernel.org
> Cc: Gupta, Akshay <Akshay.Gupta@amd.com>
> Subject: RE: [PATCH 1/3] hwmon: sbrmi: Add support for sbrmi power module
> 
> [CAUTION: External Email]
> 
> [AMD Official Use Only]
> 
> Hi Guenter,
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, June 28, 2021 8:29 PM
> To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; linux-hwmon@vger.kernel.org
> Cc: Gupta, Akshay <Akshay.Gupta@amd.com>
> Subject: Re: [PATCH 1/3] hwmon: sbrmi: Add support for sbrmi power module
> 
> [CAUTION: External Email]
> 
> On 6/25/21 6:25 AM, Naveen Krishna Chatradhi wrote:
>> From: Akshay Gupta <Akshay.Gupta@amd.com>
>>
>> On AMD platforms the Out-of-band access is provided by Advanced
>> Platform Management
> 
> This is a bit too long for checkpatch.
> [naveenk:] Sure
> 
>> Link (APML), APML is a SMBus v2.0 compatible 2-wire processor client interface.
>> APML is also referred as the sideband interface (SBI).
>>
>> APML is used to communicate with the Remote Management Interface
>> (SB-Remote Management Interface (SB-RMI) which provides Soft Mailbox
>> messages to report power consumption and power limits of the CPU socket.
>>
>> - This module add support to read power consumption,
>>     power limit & max power limit and write power limit.
>> - To instantiate this driver on an AMD CPU with SB-RMI support,
>>     the i2c bus number would be the bus connected from the board
>>     management controller (BMC) to the CPU.
>>
> 
> This is a bit vague. Would this driver be instantiated on the host CPU or on the BMC ?
> [naveenk:] This driver is to be instantiated on a BMC connected to AMD CPU. Will correct the comment.
> 
>> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>>    drivers/hwmon/Kconfig  |  10 ++
>>    drivers/hwmon/Makefile |   1 +
>>    drivers/hwmon/sbrmi.c  | 394 +++++++++++++++++++++++++++++++++++++++++
>>    3 files changed, 405 insertions(+)
>>    create mode 100644 drivers/hwmon/sbrmi.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
>> 87624902ea80..d1813ea8382c 100644
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
>>    config SENSORS_SHT15
>>        tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
>>        depends on GPIOLIB || COMPILE_TEST diff --git
>> a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
>> 59e78bc212cf..8031acf58936 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -164,6 +164,7 @@ obj-$(CONFIG_SENSORS_PWM_FAN)     += pwm-fan.o
>>    obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)     += raspberrypi-hwmon.o
>>    obj-$(CONFIG_SENSORS_S3C)   += s3c-hwmon.o
>>    obj-$(CONFIG_SENSORS_SBTSI) += sbtsi_temp.o
>> +obj-$(CONFIG_SENSORS_SBRMI)  += sbrmi.o
>>    obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>>    obj-$(CONFIG_SENSORS_SCH5627)       += sch5627.o
>>    obj-$(CONFIG_SENSORS_SCH5636)       += sch5636.o
>> diff --git a/drivers/hwmon/sbrmi.c b/drivers/hwmon/sbrmi.c new file
>> mode 100644 index 000000000000..c35829513459
>> --- /dev/null
>> +++ b/drivers/hwmon/sbrmi.c
>> @@ -0,0 +1,394 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * sbrmi.c - hwmon driver for a SB-RMI mailbox
>> + *           compliant AMD SoC device.
>> + *
>> + * Copyright (C) 2020-2021 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
> 
> I don't immediately see why this include is needed.
> 
>> +#include <asm-generic/ioctl.h>
> 
> This looks wrong, and I don't immediately see why it would be needed.
> 
>> +#include <linux/delay.h>
> 
> Alphabetic include file order, please.
> [naveenk:] Sure
>> +
>> +/* Do not allow setting negative power limit */ #define SBRMI_PWR_MIN
>> +0
>> +/* Mask for Status Register bit[1] */ #define SW_ALERT_MASK 0x2
>> +
> 
> Please always use
> 
> #define<space>DEFINITION<tab>value
>                           ^^^^^
> 
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
>> +/*
>> + * Each client has this additional data  */
> 
> Please be consistent with comments: This does not really need to be a multi-line comment. While that does not really matter, you use a single-line comment to describe the next structure. Please make it both either single-line or multi-line.
> 
>> +struct sbrmi_data {
>> +     struct i2c_client *client;
>> +     struct mutex lock;
>> +};
>> +
>> +/* Mailbox message data format */
>> +union mailbox_word {
>> +     u8 bytes[4];
>> +     u32 value;
> 
> That strongly suggests that the driver will only work on either little-endian or big-endian systems, depending on the byte order of transfers. Please restrict it accordingly.
> 
>> +};
>> +
>> +struct sbrmi_mailbox_msg {
>> +     u8 cmd;
>> +     bool read;
>> +     union mailbox_word data_in;
>> +     union mailbox_word data_out;
>> +};
>> +
>> +static int print_mailbox_error(struct sbrmi_data *data) {
> 
> Nit> Many functions only use data>client and, in some cases, dereference
> Nit> it
> several times. It might be easier to just pass 'client'.
> [naveenk:] Sure
> 
>> +     int status;
>> +
>> +     /* Mailbox error code will be written by Firmware in
>> +      * SBRMI::OutBndMsg_inst7 (SBRMI_x37)
>> +      */
> 
> /*
>    * Please use standard multi-line comments. Applies to entire driver.
>    */
> [naveenk:] Sure
> 
>> +     status = i2c_smbus_read_byte_data(data->client, SBRMI_OUTBNDMSG7);
>> +     if (status < 0) {
>> +             pr_err("SMBUS translation failed\n");
>> +             return status;
>> +     }
>> +
>> +     switch (status) {
>> +     case 0x0:       /* Success */
>> +             break;
>> +     case 0x1:
>> +             pr_err("Mailbox message command is aborted\n");
>> +             break;
>> +     case 0x2:
>> +             pr_err("Unknown mailbox message\n");
>> +             break;
>> +     case 0x3:
>> +             pr_err("Invalid core is specified in mailbox message parameters\n");
>> +             break;
>> +     default:
>> +             pr_err("Unknown Error\n");
>> +     }
> 
> Is this noise necessary ? I am concerned that, if it occurs, it would be persistent and fill up the kernel log with noise.
> [naveenk:] These are firmware defined error codes, can we change them to pr_debug and keep them ?
> 

pr_debug is ok, but ...

>> +
>> +     return status;
> 
> Error codes are supposed to be negative and standard Linux error codes.
> Please convert the above errors to standard Linux error codes.
> 
you'll still need to convert the error codes to standard
error codes.

This is the only question I found. Please let me know if I missed something.

Thanks,
Guenter

>> +}
>> +
>> +static int sbrmi_enable_alert(struct sbrmi_data *data) {
>> +     int ctrl;
>> +
>> +     /* Enable the SB-RMI Software alert status
>> +      * by writing 0 to bit 4 of Control register(0x1)
>> +      */
>> +     ctrl = i2c_smbus_read_byte_data(data->client, SBRMI_CTRL);
>> +     if (ctrl < 0)
>> +             return ctrl;
>> +
>> +     if (ctrl & 0x10) {
>> +             ctrl &= ~0x10;
>> +             return i2c_smbus_write_byte_data(data->client,
>> +                                              SBRMI_CTRL, ctrl);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int rmi_mailbox_xfer(struct sbrmi_data *data,
>> +                         struct sbrmi_mailbox_msg *msg) {
>> +     union mailbox_word output, input;
>> +     int i, err = 0, retry = 10;
> 
> Initializing 'err' is unnecessary.
> 
>> +     int sw_status;
>> +
>> +     mutex_lock(&data->lock);
>> +
>> +     err = sbrmi_enable_alert(data);
>> +     if (err < 0)
>> +             goto exit_unlock;
>> +
>> +     /* Indicate firmware a command is to be serviced */
>> +     err = i2c_smbus_write_byte_data(data->client,
>> +                                     SBRMI_INBNDMSG7, START_CMD);
>> +     if (err < 0)
>> +             goto exit_unlock;
>> +
>> +     /* Write the command to SBRMI::InBndMsg_inst0 */
>> +     err = i2c_smbus_write_byte_data(data->client,
>> +                                     SBRMI_INBNDMSG0, msg->cmd);
>> +     if (err < 0)
>> +             goto exit_mod;
>> +
>> +     /*
>> +      * For both read and write the initiator (BMC) writes
>> +      * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
>> +      * SBRMI_x3C(MSB):SBRMI_x39(LSB)
>> +      */
>> +     input = msg->data_in;
>> +     for (i = 0; i < 3; i++) {
> 
> This writes 3 bytes. Is that on purpose ? If so please explain since the above suggests that 4 bytes should be written.
> [naveenk:] this was a mistake, it has to be 4.
> 
>> +             err = i2c_smbus_write_byte_data(data->client,
>> +                                             (SBRMI_INBNDMSG1 + i),
> 
> Unnecessary ( )
> 
>> +                                             input.bytes[i]);
>> +             if (err < 0)
>> +                     goto exit_mod;
>> +     }
>> +
>> +     /*
>> +      * Write 0x01 to SBRMI::SoftwareInterrupt to notify firmware to
>> +      * perform the requested read or write command
>> +      */
>> +     err = i2c_smbus_write_byte_data(data->client,
>> +                                     SBRMI_SW_INTERRUPT, TRIGGER_MAILBOX);
>> +     if (err < 0)
>> +             goto exit_mod;
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
>> +                     err = sw_status;
>> +                     goto exit_mod;
>> +             }
>> +             if (sw_status & SW_ALERT_MASK)
>> +                     break;
>> +             usleep_range(50, 100);
>> +     } while (retry--);
>> +
>> +     if (retry < 0) {
>> +             pr_err("Firmware fail to indicate command
>> + colmpletion\n");
> 
> completion
> 
>> +             err = -1;
>> +             goto exit_mod;
>> +     }
>> +
>> +     /*
>> +      * For a read operation, the initiator (BMC) reads the firmware response
>> +      * Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
>> +      * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
>> +      */
>> +     if (msg->read) {
>> +             for (i = 0; i < 4; i++) {
>> +                     output.bytes[i] =
>> + i2c_smbus_read_byte_data(data->client,
>> +
>> + (SBRMI_OUTBNDMSG1 + i));
> 
> Unnecessary ().
> 
>> +                     if (output.bytes[i] < 0) {
> 
> output.bytes is defined as u8. This will not catch errors.
> 
>> +                             err = output.bytes[i];
>> +                             goto exit_mod;
>> +                     }
>> +             }
>> +     }
>> +     msg->data_out = output;
>> +
>> +     /*
>> +      * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
>> +      * ALERT to initiator
>> +      */
>> +     err = i2c_smbus_write_byte_data(data->client, SBRMI_STATUS,
>> +                                     (sw_status | SW_ALERT_MASK));
> 
> Unnecessary ().
> 
>> +
>> +exit_mod:
>> +     if (err < 0)
>> +             pr_err("SMBUS translation failed\n");
>> +     else
>> +             err = print_mailbox_error(data);
>> +exit_unlock:
>> +     mutex_unlock(&data->lock);
>> +     return err;
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
>> +     /*
>> +      * hwmon power attributes are in microWatt
>> +      */
>> +     *val = (long)msg.data_out.value * 1000;
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
>> +     msg.data_in.value = 0;
>> +     msg.read = true;
>> +     rmi_mailbox_xfer(data, &msg);
>> +
>> +     val = clamp_val(val, SBRMI_PWR_MIN, msg.data_out.value);
>> +
>> +     msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
>> +     msg.data_in.value = val;
>> +     msg.read = false;
>> +
>> +     return rmi_mailbox_xfer(data, &msg); }
>> +
>> +static umode_t sbrmi_is_visible(const void *data,
>> +                             enum hwmon_sensor_types type,
>> +                             u32 attr, int channel) {
>> +     switch (type) {
>> +     case hwmon_power:
>> +             switch (attr) {
>> +             case hwmon_power_input:
>> +             case hwmon_power_cap_max:
>> +                     return 0444;
>> +             case hwmon_power_cap:
>> +                     return 0644;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +     return 0;
>> +}
>> +
>> +static const struct hwmon_channel_info *sbrmi_info[] = {
>> +     HWMON_CHANNEL_INFO(power,
>> +                        HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
>> +     NULL
>> +};
>> +
>> +static const struct hwmon_ops sbrmi_hwmon_ops = {
>> +     .is_visible = sbrmi_is_visible,
>> +     .read = sbrmi_read,
>> +     .write = sbrmi_write,
>> +};
>> +
>> +static const struct hwmon_chip_info sbrmi_chip_info = {
>> +     .ops = &sbrmi_hwmon_ops,
>> +     .info = sbrmi_info,
>> +};
>> +
>> +static int sbrmi_probe(struct i2c_client *client,
>> +                    const struct i2c_device_id *id) {
>> +     struct device *dev = &client->dev;
>> +     struct device *hwmon_dev;
>> +     struct sbrmi_data *data;
>> +
>> +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>> +             dev_err(&client->dev, "adapter does not support true
>> + I2C\n");
> 
> Why would that matter? It only uses SMBus functions.
> [naveenk:] yes, will remove this.
> 
>> +             return -ENODEV;
>> +     }
>> +
>> +     data = devm_kzalloc(dev, sizeof(struct sbrmi_data), GFP_KERNEL);
>> +     if (!data)
>> +             return -ENOMEM;
>> +
>> +     data->client = client;
>> +     mutex_init(&data->lock);
>> +
>> +     hwmon_dev = devm_hwmon_device_register_with_info(dev,
>> + client->name, data,
>> +
>> + &sbrmi_chip_info, NULL);
>> +
>> +     return PTR_ERR_OR_ZERO(hwmon_dev); }
>> +
>> +static const struct i2c_device_id sbrmi_id[] = {
>> +     {"sbrmi", 0},
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, sbrmi_id);
>> +
>> +static const struct of_device_id __maybe_unused sbrmi_of_match[] = {
>> +     {
>> +             .compatible = "amd,sbrmi",
>> +     },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, sbrmi_of_match);
>> +
>> +static struct i2c_driver sbrmi_driver = {
>> +     .class = I2C_CLASS_HWMON,
>> +     .driver = {
>> +             .name = "sbrmi",
>> +             .of_match_table = of_match_ptr(sbrmi_of_match),
>> +     },
>> +     .probe = sbrmi_probe,
>> +     .id_table = sbrmi_id,
>> +};
>> +
>> +module_i2c_driver(sbrmi_driver);
>> +
>> +MODULE_AUTHOR("Akshay Gupta <akshay.gupta@amd.com>");
>> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-RMI emulated sensor");
>> +MODULE_LICENSE("GPL");
> [naveenk:] Thank you for your comments, we will address your comments and submit v2 soon.
>>
> [naveenk:]
> Regards,
> Naveenk
> 

