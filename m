Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF0C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5450B60FE8
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhJUTIP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:08:15 -0400
Received: from mout.gmx.net ([212.227.15.18]:41815 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230434AbhJUTIO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634843142;
        bh=X2Z7JBMRebfJyZk9XZ+QOd/fBckyw9ZXpHUlRUiLvCg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=UFDnTHapNrMTp3IgU41eU0tunhF//OU2igPuZY5M9jOihKHiEPy4sjoyClShTT2U4
         fuAohnOz/lOzRokCHs2JKSIaHBQnqtA1Rb/KAaZVZ7oeTJW31Ylib36+nClYEolgPn
         OqN+y44ApWdpwAFKCmW/rqGnmiOPowqV0y3lnKvM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MxUnz-1msfKm3g1B-00xowb; Thu, 21 Oct 2021 21:05:41 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 4/5] hwmon: (dell-smm) Add comment explaining usage of i8k_config_data[]
Date:   Thu, 21 Oct 2021 21:05:30 +0200
Message-Id: <20211021190531.17379-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021190531.17379-1-W_Armin@gmx.de>
References: <20211021190531.17379-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ficeM1naa/9cH27nSjykQEVJeLf75Nu96jIy1MX0ZusD0wEp2Xz
 e0yBm6ZLS+52QVArBGD+fh1dHcdgRXA9ZykS5UYwHHDnUHxvkTyCxC36/QU/+0Tc3tp/rlm
 r5iMpx+EqUfrKW0tEoM09Epa9mSWm6McxQ351zyibr2A/oIEQeCxetlXepyB86hzt6FR+Tj
 w0nQgk/mkAHlVWq2g/P5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E8DeV3m7p1Y=:y8kAXYHOyQUeGESWciDJdi
 NrXjSdjAnz8DkmHA2LfcaNR8o2DRkvPNBeganF0zq7+7ybeeAMlEQuzMH8OFCNFjQ2qWBwI/A
 0sWOPfmym7cZfOvI3KiaW5ldBqOuLSj66oc7GWTyBroqxE4bzikQltZHzjomDlv2W/I60UaU6
 3ymrTwJA/VkAxIo54lCjAFGqpWZNEYf1JX1mTqR1gb6ICsxq00aMx6WC/SAaSt45YclB2/wz4
 hJSmzkfu3U8afudWulPtXIzq5bKBgs2PNlhY4I891q6sgF5qSmNFCJWCJxYVzlb2wyWoN8YOL
 610rfB5UbPrDrb/hREklvbDL1b4Do9XbWTJYy6n9sZPCPVRmV5bo5MhYog8QdYHOp496WMckp
 yZk3yP1YX53VgZ1MLDuRdovI/wBtCPHAFeMV0FfZMbH/iam4p77JLO8JUxjEddAY5+kF2ixP4
 kQ8vnfB6P5XAiEfatbkRyGecXw+pRNWtBnKT5syxVGZJtgG39sk4bGkZ0yls5lN/Sckz1w0em
 dxyVtFopzkUGEcqKd7wx5JRUsOeQ5tTKjQHEAQJPahzvJZpSIlYNLlP0Stcen49bLaJROXhTK
 l6XMfkVI3zdxtI6QOWySrxWNu+0rHqWMcqO/9gndpldrUboKE25cQsbjs3unB5rIYSfdiTO+T
 IbWNtk8Kd3dwExGiq1kRxPBbi5EiYKvLUgexc+EqfaMnVqhW+0Pe4PPMjY+/eW0KZGWictlZ4
 Pwmqza/wGC3YAXCv+2QFJ9F/t5+wLUTEYOLZlDaIJ2bMmyXQFidxMss6WkFGmZXR1tHbg9/Rp
 PWWInT8Oy+Uvzca8ZQDJL8vYj1TKSe4BwupyYdjoApgi5MsHxt8TB7Jc06XB48vbg1VMb1Lli
 +CNzGl5k7XacBaWoycgREbFZBkrwFzEdSFowSyKiAWLlOERRlcMs0k5c+fSu4TeCCaXgQNafF
 O60m5xA8LXlw2jU35VrxLGJwBi0clEK3c/mFC6Getxdr5CThFqz0+1/RIdMCUXwmjQoLlcKAF
 gsqqjmAxftyv9b6mYr01N39gD3gwHBPUp9As2kpNxJ1is3uz/fhW5RrL8xVaRj0sdrReYsVsH
 hJZM4A8/WN1fvY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

i8k_config_data[] should only be used for applying device specific
quirks in case autoconfig does not work properly on certain
devices.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 5f0338b4a717..0e1bc3a2dd12 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -996,6 +996,11 @@ enum i8k_configs {
 	DELL_XPS,
 };

+/*
+ * Only use for machines which need some special configuration
+ * in order to work correctly (e.g. if autoconfig fails on this machines)=
.
+ */
+
 static const struct i8k_config_data i8k_config_data[] __initconst =3D {
 	[DELL_LATITUDE_D520] =3D {
 		.fan_mult =3D 1,
=2D-
2.20.1

