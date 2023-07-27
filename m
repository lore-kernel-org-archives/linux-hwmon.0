Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C249CC00528
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 18:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjG0SjL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jul 2023 14:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbjG0SjL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 14:39:11 -0400
Received: from mx11.pro-ite.de (ox4u.de [212.118.221.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F26E78
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 11:39:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mx11.pro-ite.de (Postfix) with ESMTP id 8A2EE18FE0D90;
        Thu, 27 Jul 2023 20:39:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at ox4u.de
Received: from mx11.pro-ite.de ([127.0.0.1])
        by localhost (ox4u.de [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id xt4TdylGL16Z; Thu, 27 Jul 2023 20:39:01 +0200 (CEST)
Received: from ws-565760.systec.local (unknown [212.185.67.148])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mx11.pro-ite.de (Postfix) with ESMTPSA id 8E4F018FE0D84;
        Thu, 27 Jul 2023 20:39:00 +0200 (CEST)
Date:   Thu, 27 Jul 2023 20:38:47 +0200 (CEST)
From:   Andre Werner <andre.werner@systec-electronic.com>
Reply-To: Andre Werner <andre.werner@systec-electronic.com>
To:     Guenter Roeck <linux@roeck-us.net>
cc:     =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andre Werner <andre.werner@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: (hs3001) Switch to use i2c_driver's probe
 callback
In-Reply-To: <36f9d274-1272-7360-1885-b57fa3479cec@roeck-us.net>
Message-ID: <9ab97b9c-e7a7-e3d8-77f7-45316dd347c2@systec-electronic.com>
References: <20230727071123.512966-1-u.kleine-koenig@pengutronix.de> <7ab9f3c0-5677-ceb5-b9af-81af12a32cbc@roeck-us.net> <20230727163936.dnhav2mfho3ilubf@pengutronix.de> <36f9d274-1272-7360-1885-b57fa3479cec@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463788022-1322919513-1690483144=:2834"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463788022-1322919513-1690483144=:2834
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Jul 2023, Guenter Roeck wrote:

> On 7/27/23 09:39, Uwe Kleine-K=C3=B6nig wrote:
>>  On Thu, Jul 27, 2023 at 06:34:14AM -0700, Guenter Roeck wrote:
>>>  On 7/27/23 00:11, Uwe Kleine-K=C3=B6nig wrote:
>>>>  The previous mass switch of hwmon drivers done in commit 1975d16786=
9e
>>>>  ("hwmon: Switch i2c drivers back to use .probe()") was based on
>>>>  v6.4-rc1. Since then this driver was added which needs to be conver=
ted
>>>>  back in the same way before eventually .probe_new() can be dropped =
from
>>>>  struct i2c_driver.
>>>>
>>>>  Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e>
>>>>  ---
>>>>  Hello,
>>>>
>>>>  this driver appeared in next today. It would be great if this patch
>>>>  could be added on top to not interfere with the quest to remove
>>>>  .probe_new directly after v6.6-rc1.
>>>>
>>>  I just made the change in the original patch.
>>
>>  fine for me.
>>
>>>  Thanks, and sorry for not noticing.
>>
>>  If that helps: this wasn't the first recent commit reintroducing a
>>  .probe_new :-) Actually I wanted to drop .probe_new already in the la=
st
>>  cycle but didn't pay attention between v6.4 and v6.5-rc1 which
>>  introduced a few more of these. In the current cycle this was already
>>  the fifth.
>>=20
>
> Sorry, I didn't pay attention. I'll try to do better. I may need my own
> version of checkpatch ...
>
> Guenter
>
>

Hello Uwe, hello Guenter,

maybe it's because I needed to test the driver in Linux 5.10 on my custom
embedded device. I compiled the driver also in the new Kernel, always
rebasing on the latest master but testing its behavior was done in 5.10.=20
So thats maybe why the deprecated probe_new function pointer was still in=
 the driver.
So also from my side, sorry for the extra effort.

Regards,

Andre
---1463788022-1322919513-1690483144=:2834--
