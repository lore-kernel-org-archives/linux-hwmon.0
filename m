Return-Path: <SRS0=pEIx=2J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B0C43603
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D3EC21582
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="zBOrCjco"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfLSDcT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 22:32:19 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57232 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbfLSDcT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 22:32:19 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 01A08886BF;
        Thu, 19 Dec 2019 16:32:17 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576726337;
        bh=cTIhyvv1snpmP0YCt/clIsCDw+yy0BC3LLePPFB3CAc=;
        h=From:To:Cc:Subject:Date;
        b=zBOrCjcoEgKRIwMd1L0v6svrkFZ9b4XynDXTMz6vRDxlIJu2fhq465UkBCgmj6H4F
         tE2Ec3Zt50xoHl98yyOxPo6Lb3rm08zDWm095Wl4u32cO5Fe8xCnjkvRCIqNf8ONjz
         /UAbjwjPYd2I55EQNBuVGbXdo8ltQsW/DR+2uiXy2QyxHcbb41rBpQ3u3V9h2GjrEV
         2A87M7ME+EVyVSVQgdsT0K1NLUJh3qIkihjKyq3jp+ZYkVI4mji/O2p75kvJ6QriCs
         woXc5qmW4GJb68zmyToZGz67nJ+XzBkmLHzwAwKGoblMbZ/QOO/ynETkIj6+plVkqw
         gUmxkmV7m7yOQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dfaef400000>; Thu, 19 Dec 2019 16:32:16 +1300
Received: from logans-dl.ws.atlnz.lc (logans-dl.ws.atlnz.lc [10.33.25.49])
        by smtp (Postfix) with ESMTP id 73E1D13EEAF;
        Thu, 19 Dec 2019 16:32:15 +1300 (NZDT)
Received: by logans-dl.ws.atlnz.lc (Postfix, from userid 1820)
        id BE3C2C03C3; Thu, 19 Dec 2019 16:32:16 +1300 (NZDT)
From:   Logan Shaw <logan.shaw@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     logan.shaw@alliedtelesis.co.nz, joshua.scott@alliedtelesis.co.nz,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 0/2] hwmon: (adt7475) Added attenuator bypass support
Date:   Thu, 19 Dec 2019 16:32:11 +1300
Message-Id: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The ADT7476 and ADT7490 chips support bypassing voltage input
attenuators on voltage inputs 0, 1, 3, and 4. This can be useful
to improve measurement resolution when measuring voltages 0 V - 2.25 V.

These attenuators can be bypassed in two ways. First, bit 5 of register
0x73, if set, will bypass attenuators on all above mentioned voltage
inputs. Secondly, bits [7:4] control individually bypassing attenuators
on the above mentioned voltage inputs.

This patch adds 5 optional devicetree properties to the adt7475
driver, which if present in the devicetree and the device is one of
{ADT7476, ADT7490} will set the appropriate bits to bypass the attenuator
on the relevant voltage input.

* v2
- removed sysfs changes from patch
- removed adt7475_write macro from patch and replaced it by using
	the i2c_smbus_write_byte_data function directly in code.
- removed config4_attenuate_index function from patch and replaced it
	by modifying the function  load_individual_bypass_attenuators
	to use hard coded bit values.
- modified function load_individual_bypass_attenuators to use 4 if
	statements, one for each voltage input, replacing the for loop.
- modified function adt7475_probe to check the device is a ADT7476 or
	ADT7490 (other devices do not support bypassing all or
	individual attenuators), and only then set the relevant bits.
- added new file adt7475.txt to document the new devicetree properties.
- removed c++ style comments.=20

Logan Shaw (2):
  hwmon: (adt7475) Added attenuator bypass support
  hwmon: (adt7475) Added attenuator bypass support

 .../devicetree/bindings/hwmon/adt7475.txt     | 35 +++++++++
 drivers/hwmon/adt7475.c                       | 73 +++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt

--=20
2.23.0

