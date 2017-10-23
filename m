Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:53095 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932143AbdJWRwW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2017 13:52:22 -0400
Received: by mail-oi0-f68.google.com with SMTP id c202so32236718oih.9
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Oct 2017 10:52:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171021155644.GA11487@roeck-us.net>
References: <1508264914-4614-1-git-send-email-hotran@apm.com> <20171021155644.GA11487@roeck-us.net>
From: Hoan Tran <hotran@apm.com>
Date: Mon, 23 Oct 2017 10:52:21 -0700
Message-ID: <CAFHUOYwyrr56J0ZadsBeojkquK40-8S1Dd3bxpWZNOgrSX30-A@mail.gmail.com>
Subject: Re: [v4] hwmon: xgene: Support hwmon v2
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>,
        patches <patches@apm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

On Sat, Oct 21, 2017 at 8:56 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Oct 17, 2017 at 11:28:34AM -0700, hotran wrote:
>> This patch supports xgene-hwmon v2 which uses the non-cachable memory
>> as the PCC shared memory.
>>
>> Signed-off-by: Hoan Tran <hotran@apm.com>
>> ---
>> v4
>>  - Initialize version variable
>
> I would have preferred for you to drop the #ifdefs, but this shall do.
> Subsequent patches please on top of this one.

Sure,

>
> Applied to hwmon-next.

Thanks, Guenter.

Regards
Hoan

>
> Guenter
>
>>
>> v3
>>  - Use local version variable
>>  - Use inline calls instead of the private map function
>>
>> v2
>>  - Map PCC shared mem by ioremap() in case hwmon is v2
>>
>>  drivers/hwmon/xgene-hwmon.c | 40 +++++++++++++++++++++++++++++++---------
>>  1 file changed, 31 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
>> index 9c0dbb8..b4e3f11 100644
>> --- a/drivers/hwmon/xgene-hwmon.c
>> +++ b/drivers/hwmon/xgene-hwmon.c
>> @@ -91,6 +91,11 @@
>>  #define to_xgene_hwmon_dev(cl)               \
>>       container_of(cl, struct xgene_hwmon_dev, mbox_client)
>>
>> +enum xgene_hwmon_version {
>> +     XGENE_HWMON_V1 = 0,
>> +     XGENE_HWMON_V2 = 1,
>> +};
>> +
>>  struct slimpro_resp_msg {
>>       u32 msg;
>>       u32 param1;
>> @@ -609,6 +614,15 @@ static void xgene_hwmon_tx_done(struct mbox_client *cl, void *msg, int ret)
>>       }
>>  }
>>
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>> +     {"APMC0D29", XGENE_HWMON_V1},
>> +     {"APMC0D8A", XGENE_HWMON_V2},
>> +     {},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>> +#endif
>> +
>>  static int xgene_hwmon_probe(struct platform_device *pdev)
>>  {
>>       struct xgene_hwmon_dev *ctx;
>> @@ -650,6 +664,16 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>>               }
>>       } else {
>>               struct acpi_pcct_hw_reduced *cppc_ss;
>> +             int version = XGENE_HWMON_V1;
>> +#ifdef CONFIG_ACPI
>> +             const struct acpi_device_id *acpi_id;
>> +
>> +             acpi_id = acpi_match_device(xgene_hwmon_acpi_match, &pdev->dev);
>> +             if (!acpi_id)
>> +                     return -EINVAL;
>> +
>> +             version = (int)acpi_id->driver_data;
>> +#endif
>>
>>               if (device_property_read_u32(&pdev->dev, "pcc-channel",
>>                                            &ctx->mbox_idx)) {
>> @@ -690,7 +714,13 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
>>                */
>>               ctx->comm_base_addr = cppc_ss->base_address;
>>               if (ctx->comm_base_addr) {
>> -                     ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
>> +                     if (version == XGENE_HWMON_V2)
>> +                             ctx->pcc_comm_addr = (void __force *)ioremap(
>> +                                                     ctx->comm_base_addr,
>> +                                                     cppc_ss->length);
>> +                     else
>> +                             ctx->pcc_comm_addr = memremap(
>> +                                                     ctx->comm_base_addr,
>>                                                       cppc_ss->length,
>>                                                       MEMREMAP_WB);
>>               } else {
>> @@ -758,14 +788,6 @@ static int xgene_hwmon_remove(struct platform_device *pdev)
>>       return 0;
>>  }
>>
>> -#ifdef CONFIG_ACPI
>> -static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>> -     {"APMC0D29", 0},
>> -     {},
>> -};
>> -MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>> -#endif
>> -
>>  static const struct of_device_id xgene_hwmon_of_match[] = {
>>       {.compatible = "apm,xgene-slimpro-hwmon"},
>>       {}
