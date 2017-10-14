Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:50291 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751602AbdJNEy5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Oct 2017 00:54:57 -0400
Subject: Re: [PATCH v3] hwmon: xgene: Support hwmon v2
To: Hoan Tran <hotran@apm.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>,
        patches <patches@apm.com>
References: <1507936219-23893-1-git-send-email-hotran@apm.com>
 <5dabd070-5c10-26fd-d6b3-56cce385e5af@roeck-us.net>
 <CAFHUOYw6ynSxbxrEPJ3DthKG9idjn2GLOcuBhDY-aaVPxk+6fQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c2fc7da0-8254-583b-def0-5e261193078a@roeck-us.net>
Date: Fri, 13 Oct 2017 21:54:51 -0700
MIME-Version: 1.0
In-Reply-To: <CAFHUOYw6ynSxbxrEPJ3DthKG9idjn2GLOcuBhDY-aaVPxk+6fQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/13/2017 09:38 PM, Hoan Tran wrote:
> Hi Guenter,
> 
> On Fri, Oct 13, 2017 at 9:28 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 10/13/2017 04:10 PM, Hoan Tran wrote:
>>>
>>> This patch supports xgene-hwmon v2 which uses the non-cachable memory
>>> as the PCC shared memory.
>>>
>>> Signed-off-by: Hoan Tran <hotran@apm.com>
>>> ---
>>> v3
>>>    - Use local version variable
>>>    - Use inline calls instead of the private map function
>>>
>>> v2
>>>    - Map PCC shared mem by ioremap() in case hwmon is v2
>>>
>>>    drivers/hwmon/xgene-hwmon.c | 40
>>> +++++++++++++++++++++++++++++++---------
>>>    1 file changed, 31 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
>>> index 9c0dbb8..6b6c732 100644
>>> --- a/drivers/hwmon/xgene-hwmon.c
>>> +++ b/drivers/hwmon/xgene-hwmon.c
>>> @@ -91,6 +91,11 @@
>>>    #define to_xgene_hwmon_dev(cl)                \
>>>          container_of(cl, struct xgene_hwmon_dev, mbox_client)
>>>    +enum xgene_hwmon_version {
>>> +       XGENE_HWMON_V1 = 0,
>>> +       XGENE_HWMON_V2 = 1,
>>> +};
>>> +
>>>    struct slimpro_resp_msg {
>>>          u32 msg;
>>>          u32 param1;
>>> @@ -609,6 +614,15 @@ static void xgene_hwmon_tx_done(struct mbox_client
>>> *cl, void *msg, int ret)
>>>          }
>>>    }
>>>    +#ifdef CONFIG_ACPI
>>> +static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>>> +       {"APMC0D29", XGENE_HWMON_V1},
>>> +       {"APMC0D8A", XGENE_HWMON_V2},
>>> +       {},
>>> +};
>>> +MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>>> +#endif
>>> +
>>>    static int xgene_hwmon_probe(struct platform_device *pdev)
>>>    {
>>>          struct xgene_hwmon_dev *ctx;
>>> @@ -650,6 +664,16 @@ static int xgene_hwmon_probe(struct platform_device
>>> *pdev)
>>>                  }
>>>          } else {
>>>                  struct acpi_pcct_hw_reduced *cppc_ss;
>>> +               const struct acpi_device_id *acpi_id;
>>> +               int version;
>>> +
>>> +#ifdef CONFIG_ACPI
>>> +               acpi_id = acpi_match_device(xgene_hwmon_acpi_match,
>>> &pdev->dev);
>>> +               if (!acpi_id)
>>> +                       return -EINVAL;
>>> +
>>> +               version = (int)acpi_id->driver_data;
>>> +#endif
>>>
>>
>> This leaves "version" uninitialized if CONFIG_ACPI is not defined.
> 
> If CONFIG_ACPI is not defined, "acpi_disabled" is true. So this piece
> of code is not executed
> 

Then why do you need the ifdef in code that isn't executed anyway
if CONFIG_ACPI is not defined ? Because xgene_hwmon_acpi_match is
conditional ? Not an argument, because that doesn't have to be.

Also, the compiler doesn't know that, and I am quite sure that
it is going to complain that version may be used uninitialized if
CONFIG_ACPI is not defined.

Sorry, I won't accept that code.

Guenter

> Thanks
> Hoan
> 
>>
>> Guenter
>>
>>
>>>                  if (device_property_read_u32(&pdev->dev, "pcc-channel",
>>>                                               &ctx->mbox_idx)) {
>>> @@ -690,7 +714,13 @@ static int xgene_hwmon_probe(struct platform_device
>>> *pdev)
>>>                   */
>>>                  ctx->comm_base_addr = cppc_ss->base_address;
>>>                  if (ctx->comm_base_addr) {
>>> -                       ctx->pcc_comm_addr = memremap(ctx->comm_base_addr,
>>> +                       if (version == XGENE_HWMON_V2)
>>> +                               ctx->pcc_comm_addr = (void __force
>>> *)ioremap(
>>> +
>>> ctx->comm_base_addr,
>>> +                                                       cppc_ss->length);
>>> +                       else
>>> +                               ctx->pcc_comm_addr = memremap(
>>> +
>>> ctx->comm_base_addr,
>>>                                                          cppc_ss->length,
>>>                                                          MEMREMAP_WB);
>>>                  } else {
>>> @@ -758,14 +788,6 @@ static int xgene_hwmon_remove(struct platform_device
>>> *pdev)
>>>          return 0;
>>>    }
>>>    -#ifdef CONFIG_ACPI
>>> -static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
>>> -       {"APMC0D29", 0},
>>> -       {},
>>> -};
>>> -MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>>> -#endif
>>> -
>>>    static const struct of_device_id xgene_hwmon_of_match[] = {
>>>          {.compatible = "apm,xgene-slimpro-hwmon"},
>>>          {}
>>>
>>
> 

