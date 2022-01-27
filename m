Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5F2C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 09:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbiA0Jr2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 04:47:28 -0500
Received: from aposti.net ([89.234.176.197]:54256 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbiA0Jr1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 04:47:27 -0500
Date:   Thu, 27 Jan 2022 09:47:17 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [bug report] hwmon: Add "label" attribute
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-hwmon@vger.kernel.org
Message-Id: <TI4D6R.WEHYEPI3R49G3@crapouillou.net>
In-Reply-To: <20220127085245.GF25644@kili>
References: <20220127085245.GF25644@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Le jeu., janv. 27 2022 at 11:52:45 +0300, Dan Carpenter 
<dan.carpenter@oracle.com> a écrit :
> Hello Paul Cercueil,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 073c3ea6c530: "hwmon: Add "label" attribute" from Jan 10,
> 2022, leads to the following Smatch complaint:
> 
>     drivers/hwmon/hwmon.c:825 __hwmon_device_register()
>     warn: variable dereferenced before check 'dev' (see line 810)
> 
> drivers/hwmon/hwmon.c
>    809
>    810		if (device_property_present(dev, "label")) {
>                                             ^^^
> The patch adds a new unchecked dereference

I will send a patch to address that.

I'm surprised that this function can be called with dev == NULL in the 
first place, though.

Cheers,
-Paul

>    811			err = device_property_read_string(dev, "label", &label);
>    812			if (err < 0)
>    813				goto free_hwmon;
>    814
>    815			hwdev->label = kstrdup(label, GFP_KERNEL);
>    816			if (hwdev->label == NULL) {
>    817				err = -ENOMEM;
>    818				goto free_hwmon;
>    819			}
>    820		}
>    821
>    822		hwdev->name = name;
>    823		hdev->class = &hwmon_class;
>    824		hdev->parent = dev;
>    825		hdev->of_node = dev ? dev->of_node : NULL;
>                                 ^^^
> Existing code checked for NULL
> 
>    826		hwdev->chip = chip;
>    827		dev_set_drvdata(hdev, drvdata);
> 
> regards,
> dan carpenter


