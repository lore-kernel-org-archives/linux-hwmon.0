Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:45933 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752194AbdKAPdb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2017 11:33:31 -0400
Received: by mail-oi0-f65.google.com with SMTP id f66so5062040oib.2
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Nov 2017 08:33:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171101131553.GA21209@roeck-us.net>
References: <1509483487-10110-1-git-send-email-hotran@apm.com> <20171101131553.GA21209@roeck-us.net>
From: Hoan Tran <hotran@apm.com>
Date: Wed, 1 Nov 2017 08:33:30 -0700
Message-ID: <CAFHUOYxsZLHYYNA62BwRf5q4KPwROUZOZMzWiDHNHveq0DoxwA@mail.gmail.com>
Subject: Re: hwmon: xgene: Minor clean up of ifdef and acpi_match_table reference
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>,
        patches <patches@apm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 1, 2017 at 6:15 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Oct 31, 2017 at 01:58:07PM -0700, hotran wrote:
>> This patch removes the un-necessary ifdef CONFIG_ACPI and directly
>> uses the acpi_match_table from the driver pdev.
>>
>> Signed-off-by: Hoan Tran <hotran@apm.com>
>
> Applied to hwmon-next, with now unnecessary initialization of 'version'
> removed.

Thanks, Guenter

Regards
Hoan

>
> Thanks,
> Guenter
>
>> ---
>>  drivers/hwmon/xgene-hwmon.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
>> index 5783436..85c4e3d 100644
>> --- a/drivers/hwmon/xgene-hwmon.c
>> +++ b/drivers/hwmon/xgene-hwmon.c
>> @@ -665,16 +665,15 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>>               }
>>       } else {
>>               struct acpi_pcct_hw_reduced *cppc_ss;
>> -             int version = XGENE_HWMON_V1;
>> -#ifdef CONFIG_ACPI
>>               const struct acpi_device_id *acpi_id;
>> +             int version = XGENE_HWMON_V1;
>>
>> -             acpi_id = acpi_match_device(xgene_hwmon_acpi_match, &pdev->dev);
>> +             acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
>> +                                         &pdev->dev);
>>               if (!acpi_id)
>>                       return -EINVAL;
>>
>>               version = (int)acpi_id->driver_data;
>> -#endif
>>
>>               if (device_property_read_u32(&pdev->dev, "pcc-channel",
>>                                            &ctx->mbox_idx)) {
