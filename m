Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:56908 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750716AbdKAG7y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2017 02:59:54 -0400
MIME-Version: 1.0
In-Reply-To: <1331f460-d34b-02b2-d41a-3d0ec9543bb5@roeck-us.net>
References: <20171101013421.8488-1-joel@jms.id.au> <d70eef8b-385e-4591-17b4-6fde3907df0f@roeck-us.net>
 <20171101020433.GF29237@lianli.shorne-pla.net> <1331f460-d34b-02b2-d41a-3d0ec9543bb5@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Nov 2017 17:29:31 +1030
Message-ID: <CACPK8Xcffkh5mXrCyXuDkFWPMPETb5OS2B61x1Oj7FiXhMFi9Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stafford Horne <shorne@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 1, 2017 at 12:44 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 10/31/2017 07:04 PM, Stafford Horne wrote:
>>
>> On Tue, Oct 31, 2017 at 06:53:15PM -0700, Guenter Roeck wrote:
>>>
>>> On 10/31/2017 06:34 PM, Joel Stanley wrote:
>>>>
>>>> The ASPEED SoC must deassert a reset in order to use the PWM/tach
>>>> peripheral.
>>>>
>>>> The device tree bindings are updated to document the resets phandle, and
>>>> the example is updated to match what is expected for both the reset and
>>>> clock phandle. Note that the bindings should have always had the reset
>>>> controller, as the hardware is unusable without it.
>>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>
>>>
>>> Presumably the driver is being used. This change makes it incompatible
>>> with
>>> existing users. This is unacceptable; after all, it is possible that the
>>> device is taken out of reset by ROMMON or BIOS.
>>>
>>> On top of that, the reset controller code is quite strict and issues a
>>> backtrace if CONFIG_RESET_CONTROLLER is not enabled. Yet, there is no
>>> dependency added on RESET_CONTROLLER. You might want to consider making
>>> the new control optional and using
>>> devm_reset_control_get_optional_exclusive().
>>>
>>> The DT change should be a separate patch.
>>>
>>> More comments below.
>>
>>
>> [..]
>>
>>>>         return PTR_ERR_OR_ZERO(hwmon);
>>>>    }
>>>> +static int aspeed_pwm_tacho_remove(struct platform_device *pdev)
>>>> +{
>>>> +       struct aspeed_pwm_tacho_data *priv = platform_get_drvdata(pdev);
>>>> +
>>>> +       reset_control_deassert(priv->rst);
>>>
>>>
>>> This seems to be quite pointless. Also, did you test this code ?
>>>
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>>    static const struct of_device_id of_pwm_tacho_match_table[] = {
>>>>         { .compatible = "aspeed,ast2400-pwm-tacho", },
>>>>         { .compatible = "aspeed,ast2500-pwm-tacho", },
>>>> @@ -969,6 +989,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
>>>>    static struct platform_driver aspeed_pwm_tacho_driver = {
>>>>         .probe          = aspeed_pwm_tacho_probe,
>>>> +       .probe          = aspeed_pwm_tacho_remove,
>>
>>
>> Also, this cant be right (should be .remove)?
>>
>
> Nice. Makes me really wonder what this code would do. Does this even compile
> ?

It compiled. And booted, but it didn't do much :) I rushed sending out
the patch a bit, sorry.

I've spent today I did some closer testing with a fixed v2 and I do
get values out of the device. I don't have access to a machine that I
can see the fans spinning on, so it's hard to know if the values are
correct. I'll send it out tomorrow with a request for testing.

Cheers,

Joel
