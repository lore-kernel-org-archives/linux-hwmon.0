Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D90C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Apr 2022 14:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379727AbiDTOyT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Apr 2022 10:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379712AbiDTOyS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Apr 2022 10:54:18 -0400
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D891ADB9
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Apr 2022 07:51:31 -0700 (PDT)
Date:   Wed, 20 Apr 2022 14:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wujek.eu;
        s=protonmail2; t=1650466289;
        bh=hc/FXLJWiP6UGpg6+XjwuIc21v+5e2UZD50XsUxhbxM=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=wWl5N6f2jf0Cyy1AB6VJcv/EHm25vPsDZkJvYdCkVKq8Sqr7lqRfmKBrLvG+KFCJy
         4oH6JpCEbvKR6jLE1DsTlxljfGjJ/joqicB6ZjYktsm4Lp1jn4p0jk9rxocgyw8mdJ
         A8bbZvisAICVm0kM7HBg3R6FlGIkif0gFjvYfq5vUgma8UMxdr/WvIz7PrIt1KjW4M
         x8SIyf7LN3RRHvysyHv0OG1+/u52YTdRfGem01Rh0tCRTkcmS3YtlOcDXAwwqCMoKK
         bqYS9VSgQmYzvu6rwmg/bnlSUIGhwSq7aRHBMgYun+U0vXWBWOLnoYsqt05JqrRzGp
         q+PXONr82v88g==
From:   Adam Wujek <dev_public@wujek.eu>
Cc:     Adam Wujek <dev_public@wujek.eu>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Adam Wujek <dev_public@wujek.eu>
Subject: [v3 PATCH] hwmon: (pmbus) disable PEC if not enabled
Message-ID: <20220420145059.431061-1-dev_public@wujek.eu>
In-Reply-To: <3da420df-234e-4701-2182-1f043b9ccc56@roeck-us.net>
References: <20220419205228.303952-1-dev_public@wujek.eu> <d2d09fe1-dada-e844-cafa-da48424855a4@roeck-us.net> <20220420125421.415716-1-dev_public@wujek.eu> <3da420df-234e-4701-2182-1f043b9ccc56@roeck-us.net>
Feedback-ID: 23425257:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Explicitly disable PEC when the client does not support it.
The problematic scenario is the following. A device with enabled PEC
support is up and running and a kernel driver is loaded.
Then the driver is unloaded (or device unbound), the HW device
is reconfigured externally (e.g. by i2cset) to advertise itself as not
supporting PEC. Without a new code, at the second load of the driver
(or bind) the "flags" variable is not updated to avoid PEC usage. As a
consequence the further communication with the device is done with
the PEC enabled, which is wrong and may fail.

The implementation first disable the I2C_CLIENT_PEC flag, then the old
code enable it if needed.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
Notes:
    Changes in v2:
    - Rebase to the latest kernel
    - Update commit message

    Changes in v3:
    - Rework the patch, disable the flag first, then enable if needed.
      Adding three else statements to disable the flag will make the code
      less readable.
    - Update commit message

 drivers/hwmon/pmbus/pmbus_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index b2618b1d529e..d93574d6a1fb 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2326,6 +2326,9 @@ static int pmbus_init_common(struct i2c_client *clien=
t, struct pmbus_data *data,
 =09=09data->has_status_word =3D true;
 =09}

+=09/* Make sure PEC is disabled, will be enabled later if needed */
+=09client->flags &=3D ~I2C_CLIENT_PEC;
+
 =09/* Enable PEC if the controller and bus supports it */
 =09if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 =09=09ret =3D i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
--
2.25.1


