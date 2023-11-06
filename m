Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64452C41535
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Nov 2023 06:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjKFGo2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Nov 2023 01:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbjKFGo1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Nov 2023 01:44:27 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9191B100;
        Sun,  5 Nov 2023 22:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699253034; x=1699857834; i=w_armin@gmx.de;
        bh=GJm6EGWgF7nplKUEamq2/TnBRYeNAl2+Z6eHcmlB6Ew=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=kZUzptcF33Xi0SLRAfK/YpUBUKLrkGHob+Sy6B19MFf1iXW9N8yMqG3CNVjj4yBE
         doZ3BSYhHCFAetzfcFpCUM08e7DiEmD6Tc+FVDRW69dm7sDL0nYrnc3xcRPU941Dt
         jG5W44LFzvGsUQYs+n5tiZLFnCTEhJNxgDW+HJQqHHHlzy5iLR6X9NRr39JiPovIT
         t5b7/nqA//TKBTcpaT2RDFowI5IOlprmaxVIBPRAxRtf6Vs7sxmeitIBxHg52RHCM
         XHbHwZpoeltZXLk3wepVXRTKhjpk+w74m0LK10a25nvpFkPb3hv6ZtZNDNUlRqeV1
         y52cH1EAzGjmRWTPIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MOA3P-1qkqOZ0dNh-00OVUE; Mon, 06 Nov 2023 07:43:54 +0100
From:   Armin Wolf <W_Armin@gmx.de>
To:     pali@kernel.org
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] hwmon: (dell-smm) Add support for WMI SMM interface
Date:   Mon,  6 Nov 2023 07:43:42 +0100
Message-Id: <20231106064351.42347-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oNrrf78V2MqRmvGMF40W72gkDjNB8P7x1bRxTZXNEZKX5n6XZcm
 CXAga+4uPEaGX91pCBbP/0HLc3OLbgyAfXXk3g+PjdSSGNWVGTvFzw1KjKfxxnU/1U/SRWT
 /GmJZ0LsrHEb9kSiR/Wi0inylFr6cvW5gvtWwGHXEhwrGngS8FaivN0FuNugu1aLMzz2x9x
 yOBOkvUsHl00iSWrpW4AA==
UI-OutboundReport: notjunk:1;M01:P0:v6UDOQkmiLk=;JSaCrS0Cc6s5z4yOiQB3628dqh3
 GOrQpefCiaLVVatuUIEhYjaPa3m2CpQjp+++XqFh9u2yRBuUwjpTu2gjenvQqdHr5expaWjSn
 O9NGFjmQ/AYFU/q6roTTGLdzN/CAU/QEfm65Hx2c0PHMCNXONLUOxhqUXWorqxZzolfZXLOKF
 ddswLCSIk7DSgJ+CzdszzDLhd56YQ2TRQpd/stD4VPqd5NEp4Tyj8K7MUu3vBr9vQfxzC2rcp
 0DWo3kOE4t6AkJy5K2uYdAYBqhtvyPw8913ocgSfJ1fkOkbV0pK2pSyaDBbSJ8RZ7IWNeFPdd
 az6EeZjv/COthumUWLdcmy31kumqlJp5If80o+tYrzrj09t+6GR2RYWemasHZnYVQQVUee+Fg
 edlGUBzmkzM2IUSSOq3iRsFY3mSYzT5h9rUNidAIgPY4D3IpV8vIlvUffonkhOvKzeWjeWiDv
 l1o70TGv60w/BJHvHd6yW4ubITfq9I8vz9/sZabkNDyfV9G5Q2hyKmWsfWQajrDNAvQYeUcyd
 SS5+4H3dePZdQJ75/vPBEajtrVvLiPxzbyPvfKxtp24acv/JWGFZYUSxycEIkILIO+r8QP7qm
 PVFAtks3dgW87j+BVkTWIiO3PtZBy4QKmryIyFDKwq+/eyifx/qbV0O48IrTbbcvNOTlzqyfP
 NMI++BhXu8lfmSmDIElAVErf2cDArDKuSAKW1MU/QM0ytvFGXvUREWslP8+26vs0ArqJMBRrp
 Qa50gMtFK8fDBDFXCbllDe1nQIWdu/S9galK2JshdYNQ9raNAF927AE3lcjVtjMePCE7Eotlv
 lLa5VIGUTFwZ4lrUw6xVMGSLzMV2PbYxXujiTWzsw+pGcGWdaaNrHpLbIumRMNXeQ7LcFrmvq
 TcSxYZ6wLzqNqQnm7hPgwePW0b2i4Z709jdCM9qFodjuPc16AljHjf4iFqTuGHcZ9MEi63GTE
 QXvyrWY5Yz31xhepYi+ZSf4ctnY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch series adds support for an alternative SMM calling
backend to the dell-smm-hwmon driver. The reason for this is
that on some modern machines, the legacy SMM calling interface
does not work anymore and the SMM handler can be called over
ACPI WMI instead.

The first four patches prepare the driver by allowing to
specify different SMM calling backends, and by moving most of
the DMI handling into i8k_init() so that the DMI tables can
keep their __initconst attributes (the WMI SMM backend driver
does not probe at module init time). The fifth patch does some
minor cleanup, while the next three patches implement the new
WMI SMM calling backend. The last patch adds the machine of
the user who requested and tested the changes to the fan control
whitelist.

If the driver does not detect the legacy SMM interface, either
because the machine is not whitelisted or because the SMM handler
does not react, it registers an WMI driver which will then bound
to the WMI SMM interface and do the remaining initialization.

The deprecated procfs interface is not supported when using the
WMI SMM calling backend for the following reason: the WMI driver
can potentially be instantiated multiple times while the deprectated
procfs interface cannot. This should not cause any regressions
because on machines supporting only the WMI SMM interface, the
driver would, until now, not load anyway.

All patches where tested on a Dell Inspiron 3505 and a Dell
OptiPlex 7000.

Changes since v2:
- Rework WMI response parsing
- Use #define for method number

Changes since v1:
- Cc platform driver maintainers
- Fix formating inside documentation

Armin Wolf (9):
  hwmon: (dell-smm) Prepare for multiple SMM calling backends
  hwmon: (dell-smm) Move blacklist handling to module init
  hwmon: (dell-smm) Move whitelist handling to module init
  hwmon: (dell-smm) Move DMI config handling to module init
  hwmon: (dell-smm) Move config entries out of i8k_dmi_table
  hwmon: (dell-smm) Introduce helper function for data init
  hwmon: (dell-smm) Add support for WMI SMM interface
  hwmon: (dell-smm) Document the WMI SMM interface
  hwmon: (dell-smm) Add Optiplex 7000 to fan control whitelist

 Documentation/hwmon/dell-smm-hwmon.rst |  38 +-
 drivers/hwmon/Kconfig                  |   1 +
 drivers/hwmon/dell-smm-hwmon.c         | 603 +++++++++++++++++--------
 drivers/platform/x86/wmi.c             |   1 +
 4 files changed, 453 insertions(+), 190 deletions(-)

=2D-
2.39.2

