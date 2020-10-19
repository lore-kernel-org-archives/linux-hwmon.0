Return-Path: <SRS0=tuU4=D2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FD3C433E7
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Oct 2020 22:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DC2422284
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Oct 2020 22:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="TcGONhUU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388243AbgJSWed (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388214AbgJSWed (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Oct 2020 18:34:33 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B2FC0613D1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2020 15:34:32 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E15BD806B5;
        Tue, 20 Oct 2020 11:34:27 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1603146867;
        bh=Agves5U+ubCgP0FKT8aF6/zpHp5isWfipr7MJkw6vH8=;
        h=From:To:Cc:Subject:Date;
        b=TcGONhUUeLkgY4dM9KJc1he5tvNRoNUQoBTyAJTbzn1quDrNMGTSAokzMANRyUlGs
         jqViivxMnsjRhJsCRora0+NDbidqzHiyu/Km53hosurZf+99XTYoGTs+MxYB3Enart
         BrBEhaZJ6TsVEyeiXmwe1C1Dn4wTy+SUK31TbHhd9E/UapwVA5MXqKQuwMLbszSLE2
         I70/aBLm1I8en94/lHiRevBDJcq4VfxH0hfrwM+sbmydNuU/PW79w3/DfyKZKXZ2dg
         92QpH7YCF32g4mFmzKLOa7rGhkOvl2HfgLAtMPkDLQ9GXOaxyGsolavCwkwa3pg+Lq
         XHcNXQomj/y6w==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f8e14730000>; Tue, 20 Oct 2020 11:34:27 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 79E6713EEBB;
        Tue, 20 Oct 2020 11:34:27 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id A8013283A9C; Tue, 20 Oct 2020 11:34:27 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net,
        Tobi Wulff <tobi.wulff@alliedtelesis.co.nz>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] hwmon: (adt7470) driver updates
Date:   Tue, 20 Oct 2020 11:34:21 +1300
Message-Id: <20201019223423.31488-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series updates the adt7470 driver to add error handling by using reg=
map.

Chris Packham (2):
  hwmon: (adt7470) Create functions for updating readings and limits
  hwmon: (adt7470) Convert to regmap

 drivers/hwmon/adt7470.c | 538 +++++++++++++++++++++++++++-------------
 1 file changed, 366 insertions(+), 172 deletions(-)

--=20
2.28.0

