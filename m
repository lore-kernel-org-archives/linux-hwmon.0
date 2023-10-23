Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB42C25B45
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Oct 2023 18:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbjJWSZU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Oct 2023 14:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbjJWSZS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Oct 2023 14:25:18 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEDD9D
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Oct 2023 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
        s=protonmail3; t=1698085513; x=1698344713;
        bh=4iRr4pmPyiK7PXOq5lEVHSsAowR8y3tSSRWEoK3qR5o=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=Y3PloUFVFoyJ8WnVZIWKRkx49jEVnjLBXlwjpbnzcgDLq0KYu6uLeToDM+IGDe4wF
         Bed5ufRrPhdq3gsOEszmqk1rRYikwtj3wZyH9Wy+KQIe+WeqBya9UC2GPetxTx24rM
         pE4IEnLUPcOAyOSj9rsOidGHBh3hwK4bMkjA/C2sLKfoRrb5qF/Vzw5dipmexzJDbR
         XwOKRSov7uGxY3HzEJxjW++DQs3g3410TNKRJZvv8bxSwWyZUvmQgLIsU4r2uTygG4
         G4ZjUDJv5C9rKlw8E6jBP+LKTmH0IcHWACb5BBDY3qpL+cJ4jlr4NgSlhlMBQcztPo
         E57yR6zAgCHqg==
Date:   Mon, 23 Oct 2023 18:24:59 +0000
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
From:   Alexander Koskovich <AKoskovich@pm.me>
Cc:     Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/1] hwmon: (nct6683) Add another customer ID for ASRock X670E Taichi
Message-ID: <20231023182442.21943-1-akoskovich@pm.me>
Feedback-ID: 37836894:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This value was found on an ASRock X670E Taichi with an
NCT6686D chip.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.=
rst
index 2e1408d174bd..3e7f6ee779c2 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -62,5 +62,6 @@ Intel DH87RL=09NCT6683D EC firmware version 1.0 build 04/=
03/13
 Intel DH87MC=09NCT6683D EC firmware version 1.0 build 04/03/13
 Intel DB85FL=09NCT6683D EC firmware version 1.0 build 04/03/13
 ASRock X570=09NCT6683D EC firmware version 1.0 build 06/28/19
+ASRock X670E=09NCT6686D EC firmware version 1.0 build 05/19/22
 MSI B550=09NCT6687D EC firmware version 1.0 build 05/07/20
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index f673f7d07941..3f3f7a88413e 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -176,6 +176,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MSI2=090x200
 #define NCT6683_CUSTOMER_ID_ASROCK=09=090xe2c
 #define NCT6683_CUSTOMER_ID_ASROCK2=090xe1b
+#define NCT6683_CUSTOMER_ID_ASROCK3=090x1631
=20
 #define NCT6683_REG_BUILD_YEAR=09=090x604
 #define NCT6683_REG_BUILD_MONTH=09=090x605
@@ -1227,6 +1228,8 @@ static int nct6683_probe(struct platform_device *pdev=
)
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK2:
 =09=09break;
+=09case NCT6683_CUSTOMER_ID_ASROCK3:
+=09=09break;
 =09default:
 =09=09if (!force)
 =09=09=09return -ENODEV;
--=20
2.41.0


