Return-Path: <SRS0=A7RS=DB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DD7C2D0E2
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 08:51:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A8AB2395B
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 08:51:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Z/Sek5yX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgIXIvU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727343AbgIXIvU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Sep 2020 04:51:20 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C337C0613D3
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2020 01:51:20 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9666B806B5;
        Thu, 24 Sep 2020 20:51:14 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1600937474;
        bh=cGQgT+foXO9rdoajnUJ4vhaw14UrG68XOS3fCr7CShU=;
        h=From:To:Cc:Subject:Date;
        b=Z/Sek5yXPWBfbSv6MIUDIrw8AUQkfuJ3B3n1zItV7T6Fl4ptjfqZ08njFX18CIiwx
         c36Yr8PWLJmeWDp53NY2D+9+cFSjpc57pjATx4tWe8W/xFmAm2qyIDXvPqGIzz0EIz
         Sy4vGUqDvkOcM5avI5LNW7HsLZ04Yc/JM5fi197hGnXTiIfWGnnEw205QVc3KGOrgR
         ams6ZqfaCK3O6DmWUANBIFBFy4Dl2H+LWBsZ2MgHQzvDqyGETlAORQyWNlTwORJqes
         27wMf4spPFxZs5iEGdKJOeo2kIrumBhBNOabIIUfJp1FYulZos9X48I0NcIqbzyeJQ
         bFMEbn7kJylww==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f6c5e010000>; Thu, 24 Sep 2020 20:51:15 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id CB7C813EEBA;
        Thu, 24 Sep 2020 20:51:11 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9AFB628005C; Thu, 24 Sep 2020 20:51:12 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/3] hwmon: (adm9240) driver updates
Date:   Thu, 24 Sep 2020 20:50:59 +1200
Message-Id: <20200924085102.15219-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series makes some improvements to the adm9240 driver. The main benef=
it is
the addition of error handling (courtesy of regmap) so that i2c bus error=
s can
be distinguished from sensor values.

Chris Packham (3):
  hwmon: (adm9240) Use loops to avoid duplicated code
  hwmon: (adm9240) Create functions for updating measure and config
  hwmon: (adm9240) Convert to regmap

 drivers/hwmon/adm9240.c | 351 +++++++++++++++++++++++++++-------------
 1 file changed, 241 insertions(+), 110 deletions(-)

--=20
2.28.0

