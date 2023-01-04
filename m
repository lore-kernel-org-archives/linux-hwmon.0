Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A60C46467
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 06:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjADGKZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Jan 2023 01:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbjADGKG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jan 2023 01:10:06 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E2A41839B
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 22:09:58 -0800 (PST)
IronPort-SDR: 6JStRmBMcNBpyF/nFkIUGLoOI70G1bVJ9bC0E+2I/iZ9uDMKP0wU34OWkAePq6paoW63WVugve
 yrd5JPY1q+cDrRrUZOHday92YrO6DoV7kbzHQtvvuDutkjNpUxoKeh8BqOVROSeuNm8NgOPyfo
 SLPwfxB1vkPa+K6tK8YkYCYdq8eFI2MvJCnCcinfb/U136O/zlP4O31rZcQ5WM2GGUfGD3CVHY
 ik/DozzhcATxiVvtW+fx6kcdpXTsFGHthO//Aai8FMFs7L354/5p6SFO/cEkCHyniEVk8wW2F+
 FSDi9Za0KO0BAsBxXWVjF3Su
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ArBgDfFrVjjPQc8jxaHQEBAQEJARIBBQUBSYFGgi2CX?=
 =?us-ascii?q?5VtnzoPAQ8BAUQEAQGFBQKFESY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBA?=
 =?us-ascii?q?QEBBgQUAQEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlcCAQMyAQ0BATcBDxk4V?=
 =?us-ascii?q?wYBEoJ+gyOvQIEBgggBAQaCYppmgV4JgUCLYIESgzd6Qz+BToEVgnpug3yHB?=
 =?us-ascii?q?pkVCoE9fIEnDkxXAwkDBwVJQAMLGA0WMgoTLTULC0sQGxobB4EKKigVAwQEA?=
 =?us-ascii?q?wIGEwMiAg0oMRQEKRMNJyZrCQIDImEFAwMEKC0JQAcmJDwHVjcFAwIPHzcGA?=
 =?us-ascii?q?wkDAh5PcS8SEgUDCxUqRwQINgUGHDYSAggPEg8sQw5CNzYTBlwBKgsOEwNQR?=
 =?us-ascii?q?hlvBIIMCgYpKJwAgQgfb4FxgQOhNqFYg3iBUJ52TIFEp2CXRiChdYEYhCgCC?=
 =?us-ascii?q?gcWgXmBfk0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dGYITjDhhOwIHC?=
 =?us-ascii?q?wEBAwmJW4JIAQE?=
IronPort-PHdr: A9a23:7sbX0ReptwFHZJyOL3Uv7qhhlGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23:u9DX36wb4zR9b0EijIV6t+cFwCrEfRIJ4+MujC+fZmUNrF6WrkUGm
 DcfDGiBP/rZNGrxKN0lbo+woB4G68TVztMxTgQ+/y89FHxB9ZrLDoyUIhmrZi3JI8OSQkhs5
 M4SOoiRJpk+Z3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 PRRmraSQlYbApPnnuIUQxVxMzhnIqITrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWE+M0ycMkYRUrsRILYemdiYiFTZSQN/rVa6uLY66Gz6lTUkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt/L1KhZNu+yndUy28LGdvT+bGTEMMmBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WHiQM8W2e57sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab4P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8TrwJtdiONbKih6Sdkifdo0mCgmbKgQjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8+hkEv/j+DBPCHFIVvgDLdoRr5ohE9jiFuOm
 +uzy+PRkn2zrcWkPXKMqt5LRbz0BSRlXcuuwyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAr3T6iMyg5AI4DqL4j9RrXywRwZAj0s5XiCK7zhJoim2wfJ+V8pbY4kaYpJ
 xTHEu3Zaslypv3802x1RfHAQEZKLnxHXCqCYHioZiYRZZllS1Cb89PoZFK/piIUBzW5stEy5
 bCly0XaTdwKWl06XsrRbfuuyXK3vGQcwbwtBxGSeoQCJEi8opJ3LyHRj+MsJ59eIxv0xgyci
 1ScDyAH9LvErIIC+dXUgbyJ8tWyGOxkE0sEQ2TWtO7kNSTT8me575VHVeKEIWLUWG/uofXwb
 v9c0P/7KvFBkVNX9YtwVb92lPps69zqrr5c7wJlAHSSMQvzUOk4fyja0JAW5KNXx7JftQ+nY
 W61+4FXaeeTJcfoMF8NPw57PO6N4vEjnGWA5/oCPxSo7SB6y7OLTEFOMkTekydaNrZ0bt8oz
 Op96s4b7wuz1kgjPtqc1HsG/WWQNToLSaw4uJYADMnmjxdty10EaIGFUn3655SGatNtNEg2I
 2bK2/KY3ewBlxbPIygpCHzA/etBnpBQ6hpE+181IQjbkNTyma5l1RJcxj07UwBJw0gVyOl0I
 GVqaRF4KPnc5Ttun8QfDWmgFxsaXk/HogmrlwFMzj2cFRX0EHfRJXE8MqCR5E8YtWlbe35S4
 ejAmmriVD/reuD33zczABA686a5FYEgqgCSytq6G8mlHoUhZWa3iKGZYztaohTqNso9mUnbq
 LQ45+13c6D6a3IdrqBT51N2DljMpM1o/FB/fMw=
IronPort-HdrOrdr: A9a23:iACC8qlDrTKHjhVEAuY0UNW1q1TpDfL23DAbv31ZSRFFG/Fw9/
 rFoB3U737JYVEqKQgdcbLpAsS9qBbnmaKdjrNhXotKMDOIhILsFvAH0WKA+UyHJ8SBzJ8+6U
 4IScEXY+EYT2IK6voSizPZLz9P+re6GC/Ev5an854Ud3AOV0h51XYENu+EKDwKeOCYP+tDKH
 JMjvA33QadRQ==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 04 Jan 2023 16:39:54 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30469VlE3124168
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 4 Jan 2023 17:09:50 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30469VlE3124168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672812590; bh=RypKh8n2yWkPM/jjDRUa4zOwNaMphUmh7ryIuL03reM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u9ddUxfizN5SYv7H3O97heDxnpvRcZ5fAcSfZcez72earqOIoKYaICiWkAwUjSyS4
         VKH7TmqtEthgtfZpQxw16NLqW090JVTNOmhNYO5Za67HjYzpsQEVzWnnWgeSZYFKyO
         sOVgl4sTvcvzpCFRFANjK7LBFNeWsr2vx2MloZsXs7ZtBMamWTdU942fVp4S5MZXfO
         KGgM9GN5lEtWrLvvdaibaIwrxbdHse+aDviVHsfa8PKie0qAZj/9PUHJ/pw/x7/yiw
         IRdwJNCrR5Wzvb91NTwVaskNrqNI4Yu6upN/cJDAOxbYLKmM+EuwBc5WkxufkJ7t35
         HR1DjFEQ+XQDw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/2] hwmon: (it87) Set second Super-IO chip in configuration mode
Date:   Wed,  4 Jan 2023 17:09:26 +1100
Message-Id: <20230104060926.619686-3-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104060926.619686-1-frank@crawford.emu.id.au>
References: <20230104060926.619686-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 04 Jan 2023 17:09:50 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
(IT8792E) needs to be in configuration mode before accessing the first
due to a bug in IT8792E which otherwise results in LPC bus access errors.
This needs to be done before accessing the first Super-IO chip since
the second chip may have been accessed prior to loading this driver.

The problem is also reported to affect IT8795E, which is used on X299 boards
and has the same chip ID as IT8792E (0x8733). It also appears to affect
systems with IT8790E, which is used on some Z97X-Gaming boards as well as
Z87X-OC, and other more recent Gigabyte boards.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Improved description for patch
 * Renamed function from gigabyte_sio_force to it87_sio_force

---
 drivers/hwmon/it87.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 4ebce2c661d7..ee48e238e46f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3315,6 +3315,27 @@ static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
 	return 1;
 }
 
+/*
+ * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
+ * (IT8792E) needs to be in configuration mode before accessing the first
+ * due to a bug in IT8792E which otherwise results in LPC bus access errors.
+ * This needs to be done before accessing the first Super-IO chip since
+ * the second chip may have been accessed prior to loading this driver.
+ *
+ * The problem is also reported to affect IT8795E, which is used on X299 boards
+ * and has the same chip ID as IT8792E (0x8733). It also appears to affect
+ * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
+ * Z87X-OC.
+ * DMI entries for those systems will be added as they become available and
+ * as the problem is confirmed to affect those boards.
+ */
+static int it87_sio_force(const struct dmi_system_id *dmi_entry)
+{
+	__superio_enter(REG_4E);
+
+	return it87_dmi_cb(dmi_entry);
+};
+
 /*
  * On the Shuttle SN68PT, FAN_CTL2 is apparently not
  * connected to a fan, but to something else. One user
@@ -3337,7 +3358,34 @@ static struct it87_dmi_data nvidia_fn68pt = {
 		.driver_data = data, \
 	}
 
+#define IT87_DMI_MATCH_GBT(name, cb, data) \
+	IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.", name, cb, data)
+
 static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	IT87_DMI_MATCH_GBT("AB350", it87_sio_force, NULL),
+		/* ? + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("AX370", it87_sio_force, NULL),
+		/* ? + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z97X-Gaming G1", it87_sio_force, NULL),
+		/* ? + IT8790E */
+	IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME", it87_sio_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF", it87_sio_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("B550 AORUS PRO AC", it87_sio_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 AORUS MASTER", it87_sio_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 AORUS PRO", it87_sio_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI", it87_sio_force, NULL),
+		/* IT8688E + IT8792E/IT8795E */
+	IT87_DMI_MATCH_GBT("X570S AERO G", it87_sio_force, NULL),
+		/* IT8689E + IT87952E */
+	IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4", it87_sio_force, NULL),
+		/* IT8689E + IT87952E */
+	IT87_DMI_MATCH_GBT("Z690 AORUS PRO", it87_sio_force, NULL),
+		/* IT8689E + IT87952E */
 	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
 	{ }
 
-- 
2.38.1

