Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B4EC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 23:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbiEBXZj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 19:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbiEBXYG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 19:24:06 -0400
Received: from skyrocket.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C76819C11
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 16:20:29 -0700 (PDT)
Received: from mail.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
        by skyrocket.fabmicro.ru (8.14.9/8.14.9) with ESMTP id 242NK3ij032574;
        Mon, 2 May 2022 23:20:03 GMT
        (envelope-from rz@fabmicro.ru)
MIME-Version: 1.0
Date:   Tue, 03 May 2022 04:20:03 +0500
From:   Ruslan Zalata <rz@fabmicro.ru>
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on
 Allwinner A13/A20 SoC
In-Reply-To: <20220429142412.00001e43@Huawei.com>
References: <20220428210906.29527-1-rz@fabmicro.ru>
 <f79a8edf-36d4-02af-da8f-32b4e491bd47@roeck-us.net>
 <20220429142412.00001e43@Huawei.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d3d69373480f95ec7976055b7bb988a4@fabmicro.ru>
X-Sender: rz@fabmicro.ru
Organization: Fabmicro, LLC.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Jonathan,

Thank you for pointing to DEFINE_SIMPLE_DEV_PM_OPS macros, will use it.

---
Regards,
Ruslan.

Fabmicro, LLC.

On 2022-04-29 18:24, Jonathan Cameron wrote:
> On Thu, 28 Apr 2022 14:30:06 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 4/28/22 14:09, Ruslan Zalata wrote:
>> > Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
>> > low rate (6 bit) ADC that is often used for extra keys. There's a driver
>> > for that already implementing standard input device, but it has these
>> > limitations: 1) it cannot be used for general ADC data equisition, and
>> 
>> acquisition
>> 
>> > 2) it uses only one LRADC channel of two available.
>> >
>> > This driver provides basic hwmon interface to both channels of LRADC on
>> > such Allwinner SoCs.
>> >
>> > Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
>> 
>> Ok, next phase of review.
>> 
> 
> One thing noticed whilst randomly glancing at this patch.
> 
> 
>> > +#ifdef CONFIG_PM
>> > +static int sun4i_lradc_resume(struct device *dev)
>> > +{
>> > +	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
>> > +
>> > +	return sun4i_lradc_start(lradc);
>> > +}
>> > +
>> > +static int sun4i_lradc_suspend(struct device *dev)
>> > +{
>> > +	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
>> > +
>> > +	sun4i_lradc_stop(lradc);
>> > +	return 0;
>> > +}
>> > +
>> > +#define SUN4I_LRADC_DEV_PM_OPS	(&sun4i_lradc_dev_pm_ops)
>> > +#else
>> > +#define SUN4I_LRADC_DEV_PM_OPS	NULL
>> > +#endif /* CONFIG_PM */
>> > +
>> > +static const struct dev_pm_ops sun4i_lradc_dev_pm_ops = {
> 
> We have much better infrastructure for this these days.
> 
> Take a look at DEFINE_SIMPLE_DEV_PM_OPS()
> and pm_sleep_ptr()
> 
> Those two in combination will let you get rid of all the ifdef stuff
> here by letting the compiler remove the unused code automatically.
> 
>> > +	.suspend = sun4i_lradc_suspend,
>> > +	.resume = sun4i_lradc_resume,
>> > +};
>> > +
>> > +static const struct of_device_id sun4i_lradc_of_match[] = {
>> > +	{ .compatible = "allwinner,sun4i-a10-lradc-keys", .data = &variant_sun4i_a10_lradc},
>> > +	{ /* sentinel */ }
>> > +};
>> > +MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);
>> > +
>> > +static struct platform_driver sun4i_lradc_driver = {
>> > +	.driver = {
>> > +		.name	= "sun4i-lradc-hwmon",
>> > +		.of_match_table = of_match_ptr(sun4i_lradc_of_match),
>> > +		.pm = SUN4I_LRADC_DEV_PM_OPS,
>> > +	},
>> > +	.probe	= sun4i_lradc_probe,
>> > +};
>> > +
>> > +module_platform_driver(sun4i_lradc_driver);
>> > +
>> > +MODULE_DESCRIPTION("Allwinner A13/A20 LRADC hwmon driver");
>> > +MODULE_AUTHOR("Ruslan Zalata <rz@fabmicro.ru>");
>> > +MODULE_LICENSE("GPL");
>> > +No empty line at end, please
>> 
>> 
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
