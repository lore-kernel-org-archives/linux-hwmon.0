Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAB0C433ED
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 May 2021 18:34:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 591746135F
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 May 2021 18:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhEOSfu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 May 2021 14:35:50 -0400
Received: from mout.gmx.net ([212.227.17.22]:40521 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231558AbhEOSft (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 May 2021 14:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621103659;
        bh=/85Iw3pygjgtysAoY4S0Gx3mlsrQ+URf+Ox/cgVWAZc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=krPAbETkZid1mfvwL+x8AD1r108EuLnxJGXXehl8exWl/qJcSY0aHrkM1JPZlqRxL
         QZDsuzLBeS/u0EP9qV2g/iTtZ0QwtsOwoiTa2qE/Y6ZgFl6rJbQJNyw2tFgTPsSeA2
         S1RQbTAQ6irodY4O4D30m2fceBsK5q8FnIshsOWo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.97.49]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel3t-1lAISU1YfN-00alO0; Sat, 15
 May 2021 20:34:19 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [RFC 0/3] hwmon: (dell-smm-hwmon) Use platform device
Date:   Sat, 15 May 2021 20:34:06 +0200
Message-Id: <20210515183409.682-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XWIA2WdASwj3cVJnIkp1hM8n2PsA/MCHxNRMfFlyif5+zVSairL
 uAvrVDCDdt1Hc9/YMNuJwPbPAEn5VWX2crBSNh6LxNGCVd4qxlccIvUDRrnPU6/LzAbH5WA
 FfyBRb0lvO55/I/UbDqT538Mr8ImepNNEnbj/IzaKyADe3CweYfk4hp0CyDEMsw41Jun4Eo
 kNTR/olD2UdgobKcHv3HQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GvNYmgZvJh8=:2qb+XaioaWKfqzSnTSq0SY
 OkvQwq/hxmw5BXH6ZcRr6wnWJVPMVQvDqGa3IWLRvG/XfFYrszxzqZ3MbXppXuIwnkc2xuj1T
 zb7QeM4W1Rsh+77DjWtttMM+3Y1d301vwsNJUrQcQsjwrweB4gxUdbL9XoSGuZCHcNfaPR6oc
 JJd3PCAzFw51MxYV7dqqtJvgYtdDzlplHXP/eDReSwf8aEy7vQCwy7B+a8he4PxvonXCydqHs
 ItWKAUkIoVRY+9fWHsAue3sBRW/998nL6z3g8vSQMP7oaIzSIrd9C2dN6pY8H6AHkikf1VFJT
 xmu9kxM+mkj4++XRUjojBllWCt2c9Atx9ObCkxr7Cx+6j5vDbOjigD34Oc8xVmGB0kAIRl0VO
 CMcdimiybSvB4A/O3XFqeVOHDmOKFbXX71EOKWrDclm4gXDLAC97UmS0JOxgp0v8b6mgmDgTS
 cBRR6FBQ1iQxExodQjVdV7l9URdF4Xl/4HpGSynsqehPqocqHuWSihiAYTr/oB5HYP0emv/WC
 Rpeev3Lyyy3LmeiWLNZL7fCNbfvJynwxoT/7EsLxbIqV+bR+/m3/myZVYUVNk8O8RrKuiN3gv
 RARR0EeBI0T09aWMjIDLDeyECck3wo/1QCVNezPkjWKLXlEU4XvAEq42jXU8PRq18HDeqQM2t
 dJmIhMGzFEF41eeYDzUNWDjgY4gykyty9humxSkURGNnxnmwt9jFjgNFqIISEsPY8PGSuap41
 q1DEPLOB2Z1WYqB6Bagd+oUVu6Icr4/xaurgzp+kqjc8vO28qNuKRXBDVFlWm6S8cF9HKcGXx
 NZR1yUa0jGhtTUzMvcyvEyFGQNhCG8JuK1AHGht8OLuDZwxmdeJ2drVLYuQaLLH2vupZI+Rtu
 0gLJCxeb+07ZuMx3r7Eqgk5t4wCobc355C8IdmY3/aiNKm7EGNXAr855gTKmGjDbIXN5SG1qB
 DlqlTX2qrkNqX3cx3yZwG7w80FZ4SkKPE1ZZyHsWdRj3kx3F/QgHOAJiiAkF2ShJSU9PJKQyR
 p0TpwcsF9dlG6SPBWAZIMifTKcp/nLEDltUkunHqcjN1/sOVM5vkOxg9CD4nRGKab0W4/XGdF
 +r64uBEMI73aqCFU65M7lAaMv27NX5+N08Osdpqom+dqKB/jM/zc5veJR7FoEN9G2C5UCH8SO
 bAFD5ch0H8zBfun7i4UZcM5MVBp3CftgzpQqCaLPqsrU4+zmUGeQ3hLXo+96857kHMLv4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use a platform device in order to use devres functions.
Also a future rewrite of the driver requieres a device.

Are the patches for introducing the platform driver/device
ok for serving as the basis for the conversion to
hwmon_device_register_with_info()?

They work on my Dell Latitude C600 just fine, but i whould
appreciate someone testing the code on another model too.

Armin Wolf (3):
  hwmon: (dell-smm-hwmon) Use platform device
  hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
  hwmon: (dell-smm-hwmon) Move variables into a driver private data
    structure

 drivers/hwmon/dell-smm-hwmon.c | 392 ++++++++++++++++++---------------
 1 file changed, 210 insertions(+), 182 deletions(-)

=2D-
2.20.1

