Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6FEC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Apr 2022 21:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358091AbiDSVzE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Apr 2022 17:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358064AbiDSVzD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Apr 2022 17:55:03 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BE43C49B
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Apr 2022 14:52:19 -0700 (PDT)
Date:   Tue, 19 Apr 2022 21:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wujek.eu;
        s=protonmail2; t=1650405135;
        bh=ZCGA+da2eKfzdh/6+bASkS3nDbrqU7QzyvwVPI4RhN4=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=Hh28cAfvCNUARCszokwDrJ7izoNxpP7R9RyTFqSCnOcCiRO2PbZiq2fCjO+lskFD3
         zrxHNwbWqla9QV7iFUN/7LFKFQ9WQ/IuRSA8xVwdOdYjt3Qe4qsGbA3Fqpf2YA0pqp
         +0cgakeNg5TSYtnEhn9VYVfLkuHBsL1y9FQ2ToyxNlpcTAU0pLISbu0f3onAH7HFqq
         08Vkxrwl7Jxw3OSDBcRbL4TY81DjkkkGdMhETXct2JxkVzJCzxWRjYW9l4s/S5yrVL
         I462HVlpOQMiZyYc2O8D4BuAmKYN1QQn2xzL8KYSzTA5QAlj2di5ZF9P/KmaJxdUWV
         DcStHqqLDTutw==
From:   Adam Wujek <dev_public@wujek.eu>
Cc:     Adam Wujek <dev_public@wujek.eu>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Adam Wujek <dev_public@wujek.eu>
Subject: [PATCH] hwmon: (pmbus) allow to use a custom read_byte_data function for PMBUS_CAPABILITY
Message-ID: <20220419215149.309760-1-dev_public@wujek.eu>
Feedback-ID: 23425257:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some devices returns a wrong value in PMBUS_CAPABILITY register.
Allow the use of read_byte_data function defined in a driver for
a specific device.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index f8ca36759b0a..ef9989be8f89 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2011,7 +2011,7 @@ static int pmbus_init_common(struct i2c_client *clien=
t, struct pmbus_data *data,
 =09}

 =09/* Enable PEC if the controller supports it */
-=09ret =3D i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
+=09ret =3D _pmbus_read_byte_data(client, -1, PMBUS_CAPABILITY);
 =09if (ret >=3D 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
 =09=09client->flags |=3D I2C_CLIENT_PEC;
 =09else
--
2.17.1


