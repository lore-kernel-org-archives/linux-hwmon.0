Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBA2C38A02
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 03:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJ3DYg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 23:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJ3DYf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 23:24:35 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0666443;
        Sat, 29 Oct 2022 20:24:32 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id y67so10018207oiy.1;
        Sat, 29 Oct 2022 20:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O7IC7whYi3z3pDiQ/EJXNWjejto+qn7lkMDLvNlHlqQ=;
        b=XaS6Ls9kDcOtRMBU9/U1yCEYqkgLfcjuqLT4EDXRN2dzK3ZjVOsuXNXWj16CgRGARt
         eguP614TOt19A581RjNcjv+1xwQSFu8cKxymHQ5ZdYShHYMvH6N4nmL8T6iweus8pPAI
         waNMyjEMVci05dleQqTtV5QawwIGxhANcD8PhCSASg4eVnMK1cNWwI0jJcbmMgwS7t0q
         XZf+KPqUCQ8Y4+CCMMthJxRnDcGs3d3/fEx6uthoShbIjXgHtMlF0XUev8Yogh9WDA+V
         ITEIQzcXhHQ74OpEBzH0RnkDbnyPagfgxA3Ey2cx4M2gl+zlfJY1YE8Sno1+nIBGIfJf
         LaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7IC7whYi3z3pDiQ/EJXNWjejto+qn7lkMDLvNlHlqQ=;
        b=YnCS3vhmEA9xAhavi6jM3pS1/PA1/+/5mOj6B+wYQjnq7T1RXbP9Fkd4WxKf7mWhDK
         OR0pYUCPzjrMgmT+JFUNbiQIbGUgfrJXj4geIqefHXuq21cqNc284ZCmlB/IKPABZxNc
         sUqtiVriiXDV1w++DhSxSSi0iA3anfNJ9iPkTqs3L7gqmAaDFOkNcdY6UJ7HAEeFty5h
         qVrTNbZVj5cWctyy8mPZzlSilwq7qdsRj93gAYTPAJeLunwwRwAv/Q8ykQMroKLNAlhw
         QXLQleDAFwdl8QSZA2ty36/yNa/CQDT3yJGS1s97rKZf6yUiCvB0KWvAUPeCiFYfBNac
         gipw==
X-Gm-Message-State: ACrzQf3B/WKJcxfvRubrK7ufeikC78ayATz6FPnz2iu9pkX/xEGGpNDx
        8MRorQuJBFwLMfI/ltzbzVV/gPNVj6M=
X-Google-Smtp-Source: AMsMyM5KxI3u6cAKA6g7+w/HG8hxOpxcS3lmewgxrroPrtYAjOjChBDn4uSVAXEAxqCPkJMaW16l5A==
X-Received: by 2002:a05:6808:f8e:b0:355:3c72:f9ff with SMTP id o14-20020a0568080f8e00b003553c72f9ffmr11413278oiw.280.1667100271945;
        Sat, 29 Oct 2022 20:24:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o19-20020a056871079300b0013b911d5960sm1357484oap.49.2022.10.29.20.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 20:24:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c6c16bc6-d86b-84ca-e49a-0788f9c80006@roeck-us.net>
Date:   Sat, 29 Oct 2022 20:24:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Joaquin Aramendia <samsagax@gmail.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20221029225051.1171795-1-samsagax@gmail.com>
 <506a6e7f-4566-2dcf-37f3-0f41f4ce983b@roeck-us.net>
 <CABgtM3jk4wuEMA1NL+WTySowokRD3XqzdSAUbkQCuLreSrvaJg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Add OneXPlayer mini AMD board driver
In-Reply-To: <CABgtM3jk4wuEMA1NL+WTySowokRD3XqzdSAUbkQCuLreSrvaJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/29/22 17:29, Joaquin Aramendia wrote:
> Hello, thanks so much to take the time for the feedback!
> Maybe this one needs some clarification as for some design choices in
> regards to some  of the structures you see. I know there is only one
> board supported at the moment, but those structures are meant to be
> the boilerplate for possibly more boards. I'm aware that these devices
> are a mess and the EC registers are all over the place. I wanted to
> make it easier for myself. That said I'll try to address some of the
> concerns and redo the patcha according to standards :)
> 

Please introduce such details when they are needed, not for a possible
which may never happen.

> El sáb, 29 oct 2022 a la(s) 20:30, Guenter Roeck (linux@roeck-us.net) escribió:
>>
>> On 10/29/22 15:50, Joaquín Ignacio Aramendía wrote:
>>> +
>>> +static bool fan_control;
>>> +module_param_hw(fan_control, bool, other, 0644);
>>
>> Runtime writeable parameter is unacceptable. Why would this be needed anyway ?
>> What is it supposed to accomplish that can not be done with a sysfs attribute ?
> 
> Is meant for safety, I suppose, but you are right that it is better to
> have the parameter non-writable at runtime.
> The goal is to be able to use the fan readings without allowing the
> pwm to be used unless you really know what you are doing, but I guess
> there is no point in having this if already is the pwm_enable
> attribute.
> 
Exactly. I do not see the pont of the attribute in the first place since
it just adds complexity and duplicates pwm_enable.

>>> +struct oxp_ec_sensor_addr {
>>> +     enum hwmon_sensor_types type;
>>> +     u8 reg;
>>> +     short size;
>>> +     union {
>>> +             struct {
>>> +                     u8 enable;
>>> +                     u8 val_enable;
>>> +                     u8 val_disable;
>>> +             };
>>> +             struct {
>>> +               int max_speed;
>>> +             };
>>> +     };
>>> +};
>>> +
>>> +
>>
>> Extra empty line.
> 
> Removed. Thanks.
> 
>>> +/* AMD board EC addresses */
>>> +static const struct oxp_ec_sensor_addr amd_sensors[] = {
>>> +     [oxp_sensor_fan] = {
>>> +             .type = hwmon_fan,
>>> +             .reg = 0x76,
>>> +             .size = 2,
>>> +             .max_speed = 5000,
>>> +     },
>>> +     [oxp_sensor_pwm] = {
>>> +             .type = hwmon_pwm,
>>> +             .reg = 0x4B,
>>> +             .size = 1,
>>> +             .enable = 0x4A,
>>> +             .val_enable = 0x01,
>>> +             .val_disable = 0x00,
>>> +     },
>>
>> I don't see the point of this data structure. There is just one
>> entry. Why not use defines ?
> 
> It is one entry now, but i figured in a while there will be other
> boards to support with different values. Having this structure seems
> easier for future updates.
> I can remove it and only use defines for now.
> 
Please do.

>>> +     {},
>>> +};
>>> +
>>> +struct ec_board_info {
>>> +     const char *board_names[MAX_IDENTICAL_BOARD_VARIATIONS];
>>> +     enum board_family family;
>>> +     const struct oxp_ec_sensor_addr *sensors;
>>> +};
>>> +
>>> +static const struct ec_board_info board_info[] = {
>>> +     {
>>> +             .board_names = {"ONE XPLAYER", "ONEXPLAYER mini A07"},
>>> +             .family = family_mini_amd,
>>> +             .sensors = amd_sensors,
>>> +     },
>>
>> There is just one family. What is the point of this data structure ?
> 
> It is meant for expansion on other boards. I only own a OXP mini AMD,
> but others exist with their own quirks. For example, the same device
> but with Intel CPU has completely different EC registers, values and
> ranges.
> I guess i can remove the whole "family" thing and bring it back when
> it is appropriate.
> 
Without knowing those boards it may well be that a separate driver would
be appropriate, and/or that the here introduced flexibility is insufficient.
It does not make sense to introduce such complexity unless it is known
that it is needed, and that it meets the requirements of additional boards.

>>> +     {}
>>> +};
>>> +
>>> +struct oxp_status {
>>> +     struct ec_board_info board;
>>> +     struct lock_data lock_data;
>>> +};
>>> +
>>> +/* Helper functions */
>>> +static int read_from_ec(u8 reg, int size, long *val)
>>> +{
>>> +     int i;
>>> +     int ret;
>>> +     u8 buffer;
>>> +
>>> +     *val = 0;
>>> +     for (i = 0; i < size; i++) {
>>> +             ret = ec_read(reg + i, &buffer);
>>> +             if (ret)
>>> +                     return ret;
>>> +             (*val) <<= i*8;
>>
>> space between i and 8
> 
> Ok. Will remove.
> 
>>> +             *val += buffer;
>>> +     }
>>> +     return ret;
>>
>>          return 0;
>>
>>> +}
>>> +
>>> +static int write_to_ec(const struct device *dev, u8 reg, u8 value)
>>> +{
>>> +     struct oxp_status *state = dev_get_drvdata(dev);
>>> +     int ret = -1;
>>
>> unnecessary (and bad) variable initialization
> 
> Ok. Will improve on this.
> 
>>> +
>>> +     if (!state->lock_data.lock(&state->lock_data)) {
>>> +             dev_warn(dev, "Failed to acquire mutex");
>>> +             return -EBUSY;
>>> +     }
>>> +
>>> +     ret = ec_write(reg, value);
>>> +
>>> +     if (!state->lock_data.unlock(&state->lock_data))
>>> +             dev_err(dev, "Failed to release mutex");
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +/* Callbacks for hwmon interface */
>>> +static umode_t oxp_ec_hwmon_is_visible(const void *drvdata,
>>> +                                     enum hwmon_sensor_types type, u32 attr, int channel)
>>> +{
>>> +     switch (type) {
>>> +             case hwmon_fan:
>>> +                     return S_IRUGO;
>>> +             case hwmon_pwm:
>>> +                     return S_IRUGO | S_IWUSR;
>>
>> Please use 0444 and 0644 directly. Checkpatch will tell.
> 
> Oh. I did as the documentation suggested. I must confess I didn't run
> checkpatch, will don in the next submission.
> 

That is long ago. Octal values are and have been preferred for
several years.

>>> +             default:
>>> +                     return 0;
>>> +     }
>>> +     return 0;
>>> +}
>>> +
>>> +static int oxp_platform_read(struct device *dev, enum hwmon_sensor_types type,
>>> +             u32 attr, int channel, long *val)
>>
>> Align continuation line with '('. Checkpatch will tell.
> 
> Will do. I guess my vim settings are messed up.
> 
>>> +{
>>> +     int ret = -1;
>>> +     const struct oxp_status *state = dev_get_drvdata(dev);
>>> +     const struct ec_board_info *board = &state->board;
>>> +
>>> +     switch(type) {
>>> +             case hwmon_fan:
>>> +                     switch(attr) {
>>> +                             case hwmon_fan_input:
>>> +                                     ret = read_from_ec(board->sensors[oxp_sensor_fan].reg,
>>> +                                                     board->sensors[oxp_sensor_fan].size, val);
>>> +                                     break;
>>> +                             case hwmon_fan_max:
>>> +                                     ret = 0;
>>> +                                     *val = board->sensors[oxp_sensor_fan].max_speed;
>>> +                                     break;
>>> +                             case hwmon_fan_min:
>>> +                                     ret = 0;
>>> +                                     *val = 0;
>>> +                                     break;
>>
>> If fan_max and fan_min are not sent to/from the EC, do not provide the attributes.
> 
> They are not, but they are in the spec of the fan (in the attached
> sticker, that is). Should I keep it if it's not read directly but has
> a known value?
> 

No. That is not the purpose of hwmon sysfs attributes.

>>> +                             default:
>>> +                                     dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
>>
>> missing break;
> Ooops, sorry. Will improve on this one.
> 
>>> +                     }
>>> +                     return ret;
>>> +             case hwmon_pwm:
>>> +                     switch(attr) {
>>> +                             case hwmon_pwm_input:
>>> +                                     ret = read_from_ec(board->sensors[oxp_sensor_pwm].reg,
>>> +                                                     board->sensors[oxp_sensor_pwm].size, val);
>>> +                                     if (board->family == family_mini_amd) {
>>> +                                             *val = (*val * 255) / 100;
>>> +                                     }
>>> +                                     break;
>>> +                             case hwmon_pwm_enable:
>>> +                                     ret = read_from_ec(board->sensors[oxp_sensor_pwm].enable, 1, val);
>>> +                                     if (*val == board->sensors[oxp_sensor_pwm].val_enable) {
>>> +                                             *val = 1;
>>> +                                     } else {
>>> +                                             *val = 0;
>>> +                                     }
>>
>> Unnecessary { }. Checkpatch would tell.
>>
>> I don't see the point of this code. Why have board->sensors[oxp_sensor_pwm].val_enable
>> to start with ? It is 1. Can the EC return something else ? If so, what is the
>> rationale to map it to 0 ?
>>
> The enable/disable values are configurable, since they can vary from
> board to board. AMD happens to be just 1 and 0, so it fits in this
> case. My goal is to map them to 1 and 0 to be exposed in the same way
> across all devices. That way userspace tools like fancontrold can use
> this interface as is.
> 
Again, that is not known at this time. Unless there are such boards
it is impossible to predict how they are programmed, and if that
programming even remotely fits into the scheme used by this driver.

>>> +                                     break;
>>> +                             default:
>>> +                                     dev_dbg(dev, "Unknown attribute for type %d: %d\n", type, attr);
>>
>> missing break;
> Oops, will correct. Thanks
> 
>>> +                     }
>>> +                     return ret;
>>> +             default:
>>> +                     dev_dbg(dev, "Unknown sensor type %d.\n", type);
>>> +                     return -1;
>>
>> bad error code.
> Should I return EINVAL in this case? Seems appropriate reading error
> code headers.
> 
-EOPNOTSUPP

>>> +     }
>>> +}
>>> +
>>> +static int oxp_pwm_enable(const struct device *dev)
>>> +{
>>> +     int ret = -1;
>>
>> Unnecessary (and bad) variable initialization.
> 
> Ok. Will improve.
> 
>>> +     struct oxp_status *state = dev_get_drvdata(dev);
>>> +     const struct ec_board_info *board = &state->board;
>>> +
>>> +     if (!fan_control) {
>>> +             dev_info(dev, "Can't enable pwm, fan_control=0");
>>> +             return -EPERM;
>>> +     }
>>> +
>>> +     ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
>>> +             board->sensors[oxp_sensor_pwm].val_enable);
>>> +
>>> +     return ret;
>>
>> ... and unnecessary variable.
> Then I would just  do
>      return write_to_ec():
> as stated below.
> 
>>> +}
>>> +
>>> +static int oxp_pwm_disable(const struct device *dev)
>>> +{
>>> +     int ret = -1;
>>
>> Unnecessary initialization, and bad error code.
> 
> Seems like I really like to mess this up, really... Sorry.
> 
>>> +     struct oxp_status *state = dev_get_drvdata(dev);
>>> +     const struct ec_board_info *board = &state->board;
>>> +
>>> +     if (!fan_control) {
>>> +             dev_info(dev, "Can't disable pwm, fan_control=0");
>>> +             return -EPERM;
>>> +     }
>>
>> I really don't see the point of the "fan_control" module parameter.
>> One can set it to 1 (or true) to enable the pwm_enable attribute,
>> or set it to 0 to disable it. It is effectively the same as just
>> another attribute, forcing users to write two attributes instead
>> of one. That really doesn't make sense.
>>
> Ok. I can remove the `fan_control` parameter entirely and just leave
> it to the userspace to handle pwm_enable without any other safeguards.
> 
>>> +
>>> +     ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].enable,
>>> +             board->sensors[oxp_sensor_pwm].val_disable);
>>> +
>>> +     return ret;
>>
>> Just
>>          return write_to_ec(...);
>>
>> would do. There is no need for the ret variable. Same elsewhere.
>>
> Same as above, so I'll just do this.
> 
>>> +}
>>> +
>>> +static int oxp_platform_write(struct device *dev, enum hwmon_sensor_types type,
>>> +             u32 attr, int channel, long val)
>>> +{
>>> +     int ret = -1;
>>
>> bad error code.
> Ok. Will improve on this.
> 
>>> +     struct oxp_status *state = dev_get_drvdata(dev);
>>> +     const struct ec_board_info *board = &state->board;
>>> +
>>> +     switch(type) {
>>> +             case hwmon_pwm:
>>> +                     if (!fan_control) {
>>> +                             dev_info(dev, "Can't control fans, fan_control=0");
>>> +                             return -EPERM;
>>> +                     }
>>> +                     switch(attr) {
>>> +                             case hwmon_pwm_enable:
>>> +                                     if (val == 1) {
>>> +                                             ret = oxp_pwm_enable(dev);
>>> +                                     } else if (val == 0) {
>>> +                                             ret = oxp_pwm_disable(dev);
>>> +                                     } else {
>>> +                                             return -EINVAL;
>>> +                                     }
>>
>> Unnecessary { }, and the single return on error instead of
>>                                                  ret = -EINVAL;
>> is inconsistent.
> Ok. Will improve on this one.
> 
>>> +                                     return ret;
>>> +                             case hwmon_pwm_input:
>>> +                                     if (val < 0 || val > 255)
>>> +                                             return -EINVAL;
>>> +                                     if (board->family == family_mini_amd)
>>> +                                             val = (val * 100) / 255;
>>> +                                     ret = write_to_ec(dev, board->sensors[oxp_sensor_pwm].reg, val);
>>> +                                     return ret;
>>> +                             default:
>>> +                                     dev_dbg(dev, "Unknown attribute for type %d: %d", type, attr);
>>> +                                     return ret;
>>> +                     }
>>> +             default:
>>> +                     dev_dbg(dev, "Unknown sensor type: %d", type);
>>
>> break missing
> Oops... noted.
> 
>>> +     }
>>> +     return ret;
>>> +}
>>> +
>>> +/* Known sensors in the OXP EC controllers */
>>> +static const struct hwmon_channel_info *oxp_platform_sensors[] = {
>>> +     HWMON_CHANNEL_INFO(fan,
>>> +             HWMON_F_INPUT | HWMON_F_MAX | HWMON_F_MIN),
>>> +     HWMON_CHANNEL_INFO(pwm,
>>> +             HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>>
>> bad alignment. Please use checkpatch --strict and fix what it reports.
> Will do, sorry.
> 
>>> +     NULL
>>> +};
>>> +
>>> +static const struct hwmon_ops oxp_ec_hwmon_ops = {
>>> +     .is_visible = oxp_ec_hwmon_is_visible,
>>> +     .read = oxp_platform_read,
>>> +     .write = oxp_platform_write,
>>> +};
>>> +
>>> +static const struct hwmon_chip_info oxp_ec_chip_info = {
>>> +     .ops = &oxp_ec_hwmon_ops,
>>> +     .info = oxp_platform_sensors,
>>> +};
>>> +
>>> +/* Initialization logic */
>>> +static const struct ec_board_info * __init get_board_info(struct device *dev)
>>> +{
>>> +     const char *dmi_board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
>>> +     const char *dmi_board_name = dmi_get_system_info(DMI_BOARD_NAME);
>>> +     const struct ec_board_info *board;
>>> +
>>> +     if (!dmi_board_vendor || !dmi_board_name ||
>>> +         (strcasecmp(dmi_board_vendor, "ONE-NETBOOK TECHNOLOGY CO., LTD.") &&
>>> +          strcasecmp(dmi_board_vendor, "ONE-NETBOOK")))
>>> +             return NULL;
>>> +
>>> +     /* Match our known boards */
>>> +     /* Need to check for AMD/Intel here */
>>> +     for (board = board_info; board->sensors; board++) {
>>> +             if (match_string(board->board_names,
>>> +                              MAX_IDENTICAL_BOARD_VARIATIONS,
>>> +                              dmi_board_name) >= 0) {
>>> +                     if (board->family == family_mini_amd &&
>>> +                                     boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
>>> +                             return board;
>>> +                     }
>>> +             }
>>> +     }
>>> +     return NULL;
>>
>> Why not use a dmi match table for the above code ?
> I could use a dmi match table.
> 

Please do.

>>> +}
>>> +
>>> +static int __init oxp_platform_probe(struct platform_device *pdev)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct device *hwdev;
>>> +     const struct ec_board_info *pboard_info;
>>> +     struct oxp_status *state;
>>> +
>>> +     pboard_info = get_board_info(dev);
>>> +     if (!pboard_info)
>>> +             return -ENODEV;
>>> +
>>> +     state = devm_kzalloc(dev, sizeof(struct oxp_status), GFP_KERNEL);
>>> +     if (!state)
>>> +             return -ENOMEM;
>>> +
>>> +     state->board = *pboard_info;
>>> +
>>> +     state->lock_data.mutex = 0;
>>> +     state->lock_data.lock = lock_global_acpi_lock;
>>> +     state->lock_data.unlock = unlock_global_acpi_lock;
>>> +
>>> +     hwdev = devm_hwmon_device_register_with_info(dev, "oxpec", state,
>>> +                                                     &oxp_ec_chip_info, NULL);
>>> +
>>> +     return PTR_ERR_OR_ZERO(hwdev);
>>
>> This only configures a hwmon driver and thus should reside in the hwmon
>> subsystem/directory.
> 
> For now yes, it only provides hwmon. I'll move to it then.
> 
>>> +}
>>> +
>>> +static const struct acpi_device_id acpi_ec_ids[] = {
>>> +     /* Embedded Controller Device */
>>> +     { "PNP0C09", 0 },
>>> +     {}
>>> +};
>>
>> I am not sure if this works. There are other drivers mapping to the same ACPI ID;
>> those may refuse to load if this driver is in the system. We had problems with
>> this before, so I am very concerned about side effects.
> 
> So should I just remove this and go for the DMI match table instead?
> 

Yes, and a platform driver. Look at drivers/hwmon/asus-ec-sensors.c and its
history (specifically commit 88700d1396b) for problems with PNP0C09.

Thanks,
Guenter

