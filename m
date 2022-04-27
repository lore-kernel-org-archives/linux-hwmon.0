Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D202FC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 21:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbiD0WCL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 18:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbiD0WCL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 18:02:11 -0400
Received: from skyrocket.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A81114E
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 14:58:58 -0700 (PDT)
Received: from mail.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
        by skyrocket.fabmicro.ru (8.14.9/8.14.9) with ESMTP id 23RLwUxM099932;
        Wed, 27 Apr 2022 21:58:30 GMT
        (envelope-from rz@fabmicro.ru)
MIME-Version: 1.0
Date:   Thu, 28 Apr 2022 02:58:30 +0500
From:   Ruslan Zalata <rz@fabmicro.ru>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-hwmon@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] ARM: Add hwmon driver for LRADC found on Allwinner A13/A20
 SoCs
In-Reply-To: <3fde4708-2775-6383-1652-12e072b4b9c4@roeck-us.net>
References: <202204272007.23RK74Ds021079@devbox.fabmicro.ru>
 <6425291.4vTCxPXJkl@jernej-laptop>
 <3fde4708-2775-6383-1652-12e072b4b9c4@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <77778e4a93d8f7e40b9d614055d05eac@fabmicro.ru>
X-Sender: rz@fabmicro.ru
Organization: Fabmicro, LLC.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter.

sun4i-gpadc-iio.c uses built-in four-channel ADC that is dedicated to 
RTP (resistive touch panel). It also can be used as a general purpose 
10-bit ADC, but it's a different piece of hardware inside SoC along with 
LRADC.

---
Regards,
Ruslan.

Fabmicro, LLC.

On 2022-04-28 02:07, Guenter Roeck wrote:
> On 4/27/22 13:23, Jernej Škrabec wrote:
>> Hi Ruslan!
>> 
>> Dne sreda, 27. april 2022 ob 21:25:12 CEST je Ruslan Zalata 
>> napisal(a):
>>> Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
>>> low rate (6 bit) ADC that is often used for extra keys. There's a 
>>> driver
>>> for that already implementing standard input device, but it has these
>>> limitations: 1) it cannot be used for general ADC data equisition, 
>>> and
>>> 2) it uses only one LRADC channel of two available.
>>> 
>>> This driver provides basic hwmon interface to both channels of LRADC 
>>> on
>>> such Allwinner SoCs.
>>> 
>>> Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
>> 
>> Before even going to check actual driver, please read 
>> https://www.kernel.org/
>> doc/html/latest/process/submitting-patches.html in detail.
>> 
>> Just few basic things to fix first:
>> 1. subject doesn't conform to rules
>> 2. send patch to maintainers and mailing lists (use 
>> scripts/get_maintainer.pl)
> 
> I only got the copy sent directly to me. Anyway, how is this different 
> to
> the driver in drivers/iio/adc/sun4i-gpadc-iio.c ?
> 
> Guenter
