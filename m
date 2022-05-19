Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF59C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 May 2022 23:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343666AbiESXoI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 May 2022 19:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbiESXoH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 May 2022 19:44:07 -0400
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD4DB042E
        for <linux-hwmon@vger.kernel.org>; Thu, 19 May 2022 16:44:05 -0700 (PDT)
Date:   Thu, 19 May 2022 23:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wujek.eu;
        s=protonmail2; t=1653003843; x=1653263043;
        bh=lPrxtgyGbqzHKGsEAjyQEVN37SrtZOBlF6GrEMqQqa4=;
        h=Date:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=xKJykPBBx/L5Vr1t7xUnI5x9TGXgE8IgXjj4CPVLrIdChu1VQn3ZH82SI2oW0PGSZ
         0oYhG5ZxgtbNwK0EhUoDwMGqxdizlMseFdG/PSHw+duBPymJIBbbSBJI7A4vBAIBEV
         iovnmzSL/nrfMGQLhd73LoECz/qmmqiNYzPiOmPeUv44l/B/NuOmxHh/Co6c94N519
         fr9JYm8hFWS1iI2ROz8D/BnuSHjswIx9CAjSV6npxOSkS+QsHy+MpqTYueTM14+ShH
         mIAdN1jFBaM+QSMh3nVSzbGAv/Utwu3pw8916kbMp5bc5Bjs4xR1pftuhMspj0ztmp
         zIeBuSsCDUynA==
From:   Adam Wujek <dev_public@wujek.eu>
Cc:     Adam Wujek <dev_public@wujek.eu>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Adam Wujek <dev_public@wujek.eu>
Subject: [PATCH 1/3] hwmon: (pmbus) add a function to check the presence of a block register
Message-ID: <20220519234346.440398-1-dev_public@wujek.eu>
Feedback-ID: 23425257:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Other functions (like pmbus_check_byte_register) cannot be used to check
the presence of a block register, because it will generate error when PEC
is used.

Signed-off-by: Adam Wujek <dev_public@wujek.eu>
---
 drivers/hwmon/pmbus/pmbus_core.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_c=
ore.c
index 55153a71c170..2634ac1fa3d5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -421,6 +421,18 @@ static int _pmbus_read_byte_data(struct i2c_client *cl=
ient, int page, int reg)
 =09return pmbus_read_byte_data(client, page, reg);
 }

+static int pmbus_read_block_data(struct i2c_client *client, int page, u8 r=
eg,
+=09=09=09=09 char *data_buf)
+{
+=09int rv;
+
+=09rv =3D pmbus_set_page(client, page);
+=09if (rv < 0)
+=09=09return rv;
+
+=09return i2c_smbus_read_block_data(client, reg, data_buf);
+}
+
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int=
 page,
 =09=09=09=09=09      int reg)
 {
@@ -558,6 +570,20 @@ bool pmbus_check_word_register(struct i2c_client *clie=
nt, int page, int reg)
 }
 EXPORT_SYMBOL_NS_GPL(pmbus_check_word_register, PMBUS);

+static bool pmbus_check_block_register(struct i2c_client *client, int page=
,
+=09=09=09=09       int reg)
+{
+=09int rv;
+=09struct pmbus_data *data =3D i2c_get_clientdata(client);
+=09char data_buf[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };
+
+=09rv =3D pmbus_read_block_data(client, page, reg, data_buf);
+=09if (rv >=3D 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
+=09=09rv =3D pmbus_check_status_cml(client);
+=09pmbus_clear_fault_page(client, -1);
+=09return rv >=3D 0;
+}
+
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *c=
lient)
 {
 =09struct pmbus_data *data =3D i2c_get_clientdata(client);
--
2.17.1


