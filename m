Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D34DC05027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjAZEDC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjAZEDB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:03:01 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E78501EFC9
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:02:59 -0800 (PST)
IronPort-SDR: MZj+GfMCPsurV3sP7bBvVEmZCwW3gKIzqJUiEtcIxWInBGSpg+Cj3/acKfIOVEfHHrS39KF/DV
 A3qNWbmYfunhwvO9uUq4Yh7X7JJBbICoBNxAOTbQnW7OZREvAyGofZAiyphH4+xh73jXkIfgh1
 owyiz6AsMmZTyknxUMPs2YzX86VDly6tkiMhs2Enpm4Eqd8huxvV1uBO5434CXMV9UCLLUCtVO
 zSDRc33KkPcYISJjcTzTfuQY842g1geXygFiDfBLXBavNEtUohoJFZc9jKIEL5qVAI6rTNggoN
 gjadn24aR3jSkIa7I6NRNaAA
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C5AACK+tFjjPQc8jxaHQEBAQEJARIBBQUBSYE0BgELA?=
 =?us-ascii?q?YIsgmCVbZ1AgX4PAQ8BAUQEAQGFBgKFIyY2Bw4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEFAEBAQFAUgcLUgcLWAcHgUELgWETCwMxDYZWAgEDMgENA?=
 =?us-ascii?q?QE3AQ8ZOFcGARKCfoMjrRaBAYIIAQEGgmKaZ4FeCYFAAYtggRSDN3pDP4FOg?=
 =?us-ascii?q?RWBPIIsiwOOCI02CoE5eIElDkx6gQ8CCQIRgSwDCQMHBUlAAwsYDRYyChMsN?=
 =?us-ascii?q?QsLShAbGhsHgQYqKBUDBAQDAgYTAyACDSgxFAQpEw0nJmkJAgMhXwUDAwQoL?=
 =?us-ascii?q?Qk/ByYkPAdWNwYCDx83BgMJAwIfT3EvEhIFAwsVKkcECDYFBhw2EgIIDxIPL?=
 =?us-ascii?q?EQOQjc0EwZcASkLDhEDUEcZbgSCEQYpJp4cawYBLSY7MHfEcIN8gVKefUyBR?=
 =?us-ascii?q?KZcgQotlyAgoxyEKwIKBxaBaQyCAk0fGYMiTwECAQEBDQECAQEDAQIBAQEJA?=
 =?us-ascii?q?QEBAY4dDA0JggqMOGE7AgcLAQEDCYwjAQE?=
IronPort-PHdr: A9a23:QdrHbxfKc0WbODtYH3yurkY+lGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23:OZBkxawMa+9tS1WfGBh6t+cDwCrEfRIJ4+MujC+fZmUNrF6WrkUEn
 2FMDW6CPauOMWSjedkkO43l/B8D65CHn9MxSgY6/Ck2ES4X+JLMCIzFcRqqNHLMIMacHRpq4
 5pDZISaIco6Z3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 PRM6LP3VgglBKjRtt5EdyNpKwNwG7ITrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWY3PEWcOUYQUrsRIKkvtsW4nCnNSjMG8gqQ+bUs/Vj50hMkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt/LoWBMor7KZc3eA2I3NiQmDAQobC3BXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WniQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8SbwJtdiONbKih6SdkyfdoklTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH9imzyKGcqkl0T8uVZ7WJJzYelcWLdpRr5khJ5oXC2Po
 r6zyuPQlE4GC7WuCsUp2dNDcwlSRZTEOXwGg5cPLb7ZeFsO9JAJF+feibInZ4F/malJ/tokD
 VnjMnK0PGHX3CWdQThmn1g/MNsDq74j9CxnVcHtVH70s0UejXGHs/pPLMdnLOF5nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NvERdaRuK0amgxygJS2gbGRtdpJsXVWZqNT+dxTh8zMCSCeyqI0/r
 /upy1qDE5YEQg1jCufQae6ulg3u5yFEw70tAUaYcMNOfEjM8ZRxL3KjhPEAI/YKdUfJyAyFh
 lSfDhovrOXQp5M4rYvSjqeeoob3T+ZzRxIIH2TS4busGzPd+26vnd1JXOqSJGCPX3n956ulf
 +kTwvThdvwL2l9X6tIuH7FuxKM4xt3uu74DkFs+RSyQMAv1B+o5cHec3MRJuqlc/ZNjuFO7C
 hCV591XGbSVI8e7QlQfEwoSaLjR3/8jhWiA5Ps4F0z2+Str8efVSk5VJRSN1nBQIbYpYoMox
 eAt5Jwf5wCl0EF4ONealWZf7W2TIHsaX+Mqs4xcAYOtgxdykgNOZpnVCynX5pCTaowSbRNze
 2TL2/TP1+ZG207PU3svDnyTj+BTspQ5vkwYxlE1OAXbk9XIsfY7wRlN/GllVQ9S1BhGjb5+N
 zQ5LUFzPqnSrT5kiNIYBTLyQ0QbWEfcoBy0kQdV0nbFRlWpXSrRNGI8f+2K+QYQ7jsELDRc+
 biZzkfjUCrrJZ+uhHJrAhE69fGzH8Zs8gDimdy8G5jXFZcNZ2u3i6CjUmMEth/7DJ5jn0bAv
 +Rrorp9ZKCT2fT8eEHn51R2DYgtdS0=
IronPort-HdrOrdr: A9a23:igPjWqGxs6i4lOq6pLqEMseALOsnbusQ8zAXPiBKIyC9vPb4qy
 nIpoVj6feX4Ax9ZJhEo7y90ca7MBDhHPJOjrX5eI3SODUO21HYSr2Kk7GSoQEIcheWnoVgPO
 VbAs9D4bbLbWSS4/yV3OE2fuxQuOVviJrY4Ns2100dMT2CdZsQkjuR1TzraXGflWF9dOAEKK
 Y=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:32:56 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5Y1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:52 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5Y1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705773; bh=BiiMcgP26Vs6FZg97hrCL0vSKFwCY4LST4qXAGKxIG8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uh/wmD1bQ9+vAsdCnS2cRlyLdf4TAtTm1yI+2MKm9gtLSYQZEqLCkj57X+uUNu+9u
         QN7v+uaA2wRfAmRxYlVAFBxJ927e2k9ZVVgDJxtLdAcCwlL6FwWNpK3Qwk3ZjSbnaS
         Yx59MWf+Dg9s76g2sIh/uyurRS+vHYFnIuGjmMfgaf/imm7A/MR9VA32gfwk4Q9dVd
         L2PuTH171qVc9ONx1J0wMJld2ljdt5r8coSztw96QH3vq2ZR5fQmirXyjfDm72TF+e
         6/Fb/EEWBCkh4APHhZlECbuYO6UNehk0O+OZaAarFLqlMzD57vwkXZmkzZKSgm++FW
         HU3MUzWImlzVQ==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 5/7] hwmon: (it87) Allow multiple chip IDs for force_id
Date:   Thu, 26 Jan 2023 15:02:21 +1100
Message-Id: <20230126040223.986189-6-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:02:53 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend the force_id module parameter to allow specifying one or both
chip IDs separately.  If only a single parameter is given it defaults
to using that value for all chips, similar to previous usage.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5ca8449887da..e8eeedd23bee 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -175,8 +175,9 @@ static inline void superio_exit(int ioreg, bool doexit)
 #define IT87_SIO_VID_REG	0xfc	/* VID value */
 #define IT87_SIO_BEEP_PIN_REG	0xf6	/* Beep pin mapping */
 
-/* Force chip ID to specified value. Should only be used for testing */
-static unsigned short force_id;
+/* Force chip IDs to specified values. Should only be used for testing */
+static unsigned short force_id[2];
+static unsigned int force_id_cnt;
 
 /* ACPI resource conflicts are ignored if this parameter is set to 1 */
 static bool ignore_resource_conflict;
@@ -2405,7 +2406,7 @@ static const struct attribute_group it87_group_auto_pwm = {
 
 /* SuperIO detection - will change isa_address if a chip is found */
 static int __init it87_find(int sioaddr, unsigned short *address,
-			    struct it87_sio_data *sio_data)
+			    struct it87_sio_data *sio_data, int chip_cnt)
 {
 	int err;
 	u16 chip_type;
@@ -2422,8 +2423,12 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (chip_type == 0xffff)
 		goto exit;
 
-	if (force_id)
-		chip_type = force_id;
+	if (force_id_cnt == 1) {
+		/* If only one value given use for all chips */
+		if (force_id[0])
+			chip_type = force_id[0];
+	} else if (force_id[chip_cnt])
+		chip_type = force_id[chip_cnt];
 
 	switch (chip_type) {
 	case IT8705F_DEVID:
@@ -3426,7 +3431,7 @@ static int __init sm_it87_init(void)
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
 		isa_address[i] = 0;
-		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
+		err = it87_find(sioaddr[i], &isa_address[i], &sio_data, i);
 		if (err || isa_address[i] == 0)
 			continue;
 		/*
@@ -3475,8 +3480,8 @@ static void __exit sm_it87_exit(void)
 MODULE_AUTHOR("Chris Gauthron, Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("IT8705F/IT871xF/IT872xF hardware monitoring driver");
 
-module_param(force_id, ushort, 0);
-MODULE_PARM_DESC(force_id, "Override the detected device ID");
+module_param_array(force_id, ushort, &force_id_cnt, 0);
+MODULE_PARM_DESC(force_id, "Override one or more detected device ID(s)");
 
 module_param(ignore_resource_conflict, bool, 0);
 MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
-- 
2.39.1

