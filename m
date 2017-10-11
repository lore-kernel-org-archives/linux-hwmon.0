Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:48666 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752250AbdJKRXs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Oct 2017 13:23:48 -0400
Received: by mail-oi0-f47.google.com with SMTP id m198so4267475oig.5
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Oct 2017 10:23:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0961849d-c5e3-36d8-a157-d3a5652fa582@roeck-us.net>
References: <1507680631-4472-1-git-send-email-hotran@apm.com> <0961849d-c5e3-36d8-a157-d3a5652fa582@roeck-us.net>
From: Hoan Tran <hotran@apm.com>
Date: Wed, 11 Oct 2017 10:23:46 -0700
Message-ID: <CAFHUOYz2UvKKDPXBia_fZjTYEPdw7XuCEjM=C5Zzjj5LtQ=SXw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: xgene: Support hwmon v2
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>,
        Khuong Dinh <kdinh@apm.com>, patches <patches@apm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Tue, Oct 10, 2017 at 8:54 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 10/10/2017 05:10 PM, Hoan Tran wrote:
>>
>> This patch supports xgene-hwmon v2 which uses the non-cachable memory
>> as the PCC shared memory.
>>
>> Signed-off-by: Hoan Tran <hotran@apm.com>
>> ---
>>
>> v2
>>   - Map PCC shared mem by ioremap() in case hwmon is v2
>>
>
> So I assume you expect me to replace the (already accepted) v1
> of this patch with this one ?

Yes, it's intended to replace the v1.

>
> Assuming the change is needed, I really have to ask: Has this version
> of the patch been tested ?

Yes

>
>
>>   drivers/hwmon/xgene-hwmon.c | 52
>> +++++++++++++++++++++++++++++++++++----------
>>   1 file changed, 41 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
>> index 9c0dbb8..52be7cd 100644
>> --- a/drivers/hwmon/xgene-hwmon.c
>> +++ b/drivers/hwmon/xgene-hwmon.c
>> @@ -91,6 +91,11 @@
>>   #define to_xgene_hwmon_dev(cl)                \
>>         container_of(cl, struct xgene_hwmon_dev, mbox_client)
>>   +enum xgene_hwmon_version {
>> +       XGENE_HWMON_V1 = 0,
>> +       XGENE_HWMON_V2 = 1,
>> +};
>> +
>>   struct slimpro_resp_msg {
>>         u32 msg;
>>         u32 param1;
>> @@ -99,6 +104,7 @@ struct slimpro_resp_msg {
>>     struct xgene_hwmon_dev {
>>         struct device           *dev;
>> +       int                     version;
>>         struct mbox_chan        *mbox_chan;
>>         struct mbox_client      mbox_client;
>>         int                     mbox_idx;
>> @@ -135,6 +141,15 @@ static u16 xgene_word_tst_and_clr(u16 *addr, u16
>> mask)
>>         return ret;
>>   }
>>   +static void *xgene_pcc_ioremap(struct xgene_hwmon_dev *ctx,
>> +                              phys_addr_t phys, size_t size)
>> +{
>> +       if (ctx->version == XGENE_HWMON_V2)
>> +               return (void __force *)ioremap(phys, size);
>> +
>
> Is that typecast really necessary ?

This typecast is used to prevent warning by sparse.

>
>
>> +       return memremap(phys, size, MEMREMAP_WB);
>> +}
>> +
>>   static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev *ctx, u32 *msg)
>>   {
>>         struct acpi_pcct_shared_memory *generic_comm_base =
>> ctx->pcc_comm_addr;
>> @@ -609,6 +624,15 @@ static void xgene_hwmon_tx_done(struct mbox_client
>> *cl, void *msg, int ret)
>>         }
>>   }
>>   +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>> +       {"APMC0D29", XGENE_HWMON_V1},
>> +       {"APMC0D8A", XGENE_HWMON_V2},
>> +       {},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>> +#endif
>> +
>>   static int xgene_hwmon_probe(struct platform_device *pdev)
>>   {
>>         struct xgene_hwmon_dev *ctx;
>> @@ -623,6 +647,20 @@ static int xgene_hwmon_probe(struct platform_device
>> *pdev)
>>         platform_set_drvdata(pdev, ctx);
>>         cl = &ctx->mbox_client;
>>   +#ifdef CONFIG_ACPI
>> +       ctx->version = -EINVAL;
>> +       if (ACPI_COMPANION(&pdev->dev)) {
>> +               const struct acpi_device_id *acpi_id;
>> +
>> +               acpi_id = acpi_match_device(xgene_hwmon_acpi_match,
>> &pdev->dev);
>> +               if (acpi_id)
>> +                       ctx->version = (int)acpi_id->driver_data;
>> +       }
>> +
>> +       if (ctx->version < 0)
>> +               return -ENODEV;
>
>
> This doesn't make sense. Just return EINVAL if acpi_id is 0 above. There
> is no need to assign a negative value to ctx->version.
>
> I also don't see why ctx->version is necessary in the first place. In
> reality
> it is just a parameter to xgene_pcc_ioremap(). Which I think should be
> inline
> and not a separate function.

Yes, let me move version variable into prove() function and use inline calls.

>
>> +#endif
>
 >
> What if ACPI is enabled in the build but the system is running on HW which
> does not support ACPI ? Is that guaranteed to never happen ? Why not use
> acpi_disabled instead ?

It's because xgene_hwmon_acpi_match is only available with
CONFIG_ACPI. I'll move this logic into acpi_disabled below right
before parsing the PCC channel information.

>
>> +
>>         spin_lock_init(&ctx->kfifo_lock);
>>         mutex_init(&ctx->rd_mutex);
>>   @@ -690,9 +728,9 @@ static int xgene_hwmon_probe(struct platform_device
>> *pdev)
>>                  */
>>                 ctx->comm_base_addr = cppc_ss->base_address;
>>                 if (ctx->comm_base_addr) {
>> -                       ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
>> -                                                       cppc_ss->length,
>> -                                                       MEMREMAP_WB);
>> +                       ctx->pcc_comm_addr = xgene_pcc_ioremap(ctx,
>> +                                               ctx->comm_base_addr,
>> +                                               cppc_ss->length);
>
>
> Inline, please. The extra function adds more complexity than it is worth.

Yes,


Thanks for your comments!

Hoan

>
>
>>                 } else {
>>                         dev_err(&pdev->dev, "Failed to get PCC comm
>> region\n");
>>                         rc = -ENODEV;
>> @@ -758,14 +796,6 @@ static int xgene_hwmon_remove(struct platform_device
>> *pdev)
>>         return 0;
>>   }
>>   -#ifdef CONFIG_ACPI
>> -static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>> -       {"APMC0D29", 0},
>> -       {},
>> -};
>> -MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>> -#endif
>> -
>>   static const struct of_device_id xgene_hwmon_of_match[] = {
>>         {.compatible = "apm,xgene-slimpro-hwmon"},
>>         {}
>>
>
